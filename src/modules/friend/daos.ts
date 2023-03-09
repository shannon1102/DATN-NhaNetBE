import { getRepository } from "typeorm";
import configs from "../../configs";
import { Friend } from "../../entities/friend";
import { User } from "../../entities/user";
import { Pagination } from "../../types/type.pagination";


const createFriend = async (data: Friend) => {
  const friendRepository = getRepository(Friend);
  const friendData = {
    ...data,
    createdAt: new Date(),
    updatedAt: new Date(),
    isDeleted: false,
  };
  const friend = friendRepository.create(friendData);
  return await friendRepository.save(friend);
};

const getFriendById = async (id: number) => {
  const friendRepository = getRepository(Friend);
  const friend = await friendRepository
    .createQueryBuilder("f")
    .where(`f.id = ${id}`)
    .getOne();
  return friend;
};
const deleteFriendById = async (id: number) => {
  const friendRepository = getRepository(Friend);
  const friend = await friendRepository.delete(id);
  return friend;
};

const deleteFriendByFriendId = async (friendId: number, userId: number) => {
  const friendRepository = getRepository(Friend);

  const deletedFriend = await friendRepository.findOne({
    where: {
      friendId: friendId,
      userId: userId
    }
  })

  return await friendRepository.delete(deletedFriend?.id);
};


const getAllFriends = async (params: Pagination, userId: number) => {
  const friendRepository = getRepository(Friend);
  const friends = await friendRepository
    .createQueryBuilder("f")
    .where(`(f.requesterId= ${userId} OR f.addresseeId = ${userId}) AND f.statusCode = 2`)
    // .orderBy("c.createdAt", "DESC")
    .leftJoinAndSelect("f.requester", "requester", "f.requesterId= requester.id")
    .leftJoinAndSelect("f.addressee", "addressee", "f.addresseeId = addressee.id")
    .skip(params.offset)
    .take(params.limit || configs.MAX_RECORDS_PER_REQ)
    .getManyAndCount();
    console.log("friends",friends);
  return friends;
};




const getAllRequestFriends = async (params: Pagination, userId: number) => {
  const friendRepository = getRepository(Friend);
  const friends = await friendRepository
    .createQueryBuilder("f")
    .where(`f.addresseeId= ${userId} and statusCode = 1`)
    .leftJoinAndSelect(`f.requester`, "requester")
    .orderBy("f.createdAt", "DESC")
    .skip(params.offset)
    .take(params.limit || configs.MAX_RECORDS_PER_REQ)
    .getManyAndCount();
    
      let usersWithSameFriend = await Promise.all(friends[0].map(async (e) => {
        const sameFriend = await getSameFriend(userId, e.requester.id);
        return {
          ...e,
          requester: {
            ...e.requester,
            sameFriend: sameFriend
          }
        }
      }));
    console.log("SAmeeeeee",usersWithSameFriend)


  return [usersWithSameFriend,friends[1]];
};
const getAllSuggestFriends = async (params: Pagination, userId: number) => {
  const friendRepository = getRepository(Friend);
  const userRepository = getRepository(User);
  const userFriends = await friendRepository
    .createQueryBuilder("f")
    .where(`f.addresseeId= ${userId} and statusCode = 2`)
    .getMany();
  // console.log("userFriends", userFriends);
  let arr: User[] = [];
  if (userFriends.length > 0) {
    let userFriendIds = [...new Set(userFriends.map(e => [e.requesterId, e.addresseeId]).flat(1).filter(e => e != userId))];
    console.log("useFriendIds", userFriendIds)
    const suggesFriend = await friendRepository
      .createQueryBuilder("f")
      .where(`f.addresseeId IN (:userFriendIds) OR f.requesterId IN (:userFriendIds)`, { userFriendIds: userFriendIds, userId: userId })
      // .AndWhere(`f.statusCode = 1`)
      .leftJoinAndSelect(`f.requester`, "requester")
      .leftJoinAndSelect(`f.addressee`, "addressee")
      .skip(params.offset)
      .take(params.limit || configs.MAX_RECORDS_PER_REQ)
      .getMany();

    let suggestedList = suggesFriend.map(a => {
      if (a?.requester?.id != userId && !userFriendIds.includes(a.requester.id))
        arr.push(a.requester);
      if (a?.addressee?.id != userId && !userFriendIds.includes(a.addressee.id))
        arr.push(a.addressee)
    })
    console.log("Arrr", arr);

  } else {
    const user = await userRepository
      .createQueryBuilder("u")
      .where(`u.Id NOT IN (:userId) and u.role = "user"`, { userId: userId })
      // .orderBy("u.createAt", "DESC")
      .skip(params.offset)
      .take(params.limit || configs.MAX_RECORDS_PER_REQ)
      .getMany();
    arr = user;
    console.log("Arrr Nofriend", arr);

  }
  const userFriendShips = await friendRepository
    .createQueryBuilder("f")
    .where(`f.requesterId= ${userId} OR f.addresseeId= ${userId}`)
    .getMany();
  // console.log("userFriendsCHECKKKKKKKKKKK", userFriendShips);
  let removeIds = userFriendShips.map(fs => [fs.requesterId, fs.addresseeId]).flat(1)
  console.log("remove ID", removeIds);
  // let checkListDup: number[];
  let filterUsers = arr.filter(u => !removeIds.includes(u.id))
  console.log("After remove", filterUsers);
  let filterArr = filterUsers;
  console.log("Finallll", filterArr);


  let usersWithSameFriend = await Promise.all(filterArr.map(async (e) => {
    const sameFriend = await getSameFriend(userId, e.id);
    return {
      ...e,
      sameFriend: sameFriend
    }
  }));
  console.log("SAmeeeeee",usersWithSameFriend)


  return [usersWithSameFriend];
};



const addFriend = async (requesterId: number, addresseeId: number) => {
  const friendRepository = getRepository(Friend);
  const foundFriendShip = await friendRepository.findOne(
    {
      where: [{
        requesterId: requesterId,
        addresseeId: addresseeId
      }, {
        requesterId: requesterId,
        addresseeId: addresseeId
      }
      ]
    }
  );
  if (foundFriendShip) {
    return foundFriendShip;
  }

  const friendData = {
    requesterId: requesterId,
    addresseeId: addresseeId,
    createdAt: new Date(),
    updatedAt: new Date(),
    //Status 1 : request , 2 accecpt , 3 Declined 
    statusCode: 1,
  };
  const friend = friendRepository.create(friendData);
  return await friendRepository.save(friend);

}

const updateFriendStatus = async (currUserId: number, userId: number, statusCode: number) => {
  const friendRepository = getRepository(Friend);
  const foundFriendShip = await friendRepository.findOne(
    {
      where: [{
        requesterId: currUserId,
        addresseeId: userId
      }, {
        requesterId: userId,
        addresseeId: currUserId
      }
      ]
    }
  );
  if(!foundFriendShip) {
    const friendData = {
      requesterId: currUserId,
      addresseeId: userId,
      createdAt: new Date(),
      updatedAt: new Date(),
      //Status 1 : request , 2 accecpt , 0 Declined 
      statusCode: 0,
    };
    const friend = friendRepository.create(friendData);
    return await friendRepository.save(friend);
  }
  console.log("foundFriendShip", foundFriendShip)
  const friendData = {
    ...foundFriendShip,
    createdAt: new Date(),
    updatedAt: new Date(),
    //Status 1 : request , 2 accecpt , 0 Declined Unfriend
    statusCode: statusCode,
  };
  return await friendRepository.save(friendData);


}
const accecptFriend = async (requesterId: number, addresseeId: number) => {

  const friendRepository = getRepository(Friend);
  const foundFriendShip = await friendRepository.findOne(
    {
      where: {
        requesterId: requesterId,
        addresseeId: addresseeId
      }
    }
  );
  console.log("foundFriendShip", foundFriendShip)
  const friendData = {
    ...foundFriendShip,
    createdAt: new Date(),
    updatedAt: new Date(),
    //Status 1 : request , 2 accecpt , 3 Declined 
    statusCode: 2,
  };
  return await friendRepository.save(friendData);
}
const declineRequestFriend = async (requesterId: number, addresseeId: number) => {

  const friendRepository = getRepository(Friend);
  const foundFriendShip = await friendRepository.findOne(
    {
      where: {
        requesterId: requesterId,
        addresseeId: addresseeId
      }
    }
  );
  console.log("foundFriendShip", foundFriendShip)
  const friendData = {
    ...foundFriendShip,
    createdAt: new Date(),
    updatedAt: new Date(),
    //Status 1 : request , 2 accecpt , 3 Declined 
    statusCode: 3,
  };
  return await friendRepository.save(friendData);
}

const getSameFriend = async (currUserId: number, userId: number) => {
  const friendRepository = getRepository(Friend);
  const currUserFriendList = await friendRepository
    .createQueryBuilder("f")
    .where(`(f.requesterId= ${currUserId} OR f.addresseeId = ${currUserId}) AND f.statusCode = 2`)
    .getMany();
  const currUserFriendListIds = currUserFriendList.map(cuf => cuf.id);

  const userFriendList = await friendRepository
    .createQueryBuilder("f")
    .where(`(f.requesterId= ${userId} OR f.addresseeId = ${userId}) AND f.statusCode = 2`)
    .getMany();
  const userFriendListIds = userFriendList.map(uf => uf.id);
  console.log("currUserFriendListcurrUserFriendList", currUserFriendList, userFriendList);

  const intersection = currUserFriendListIds.filter(element => userFriendListIds.includes(element));
  console.log("Intersection", intersection);
  return intersection.length;

}
export default {
  createFriend,
  deleteFriendByFriendId,
  getAllFriends,
  getAllRequestFriends,
  getAllSuggestFriends,
  deleteFriendById,
  getFriendById,
  addFriend,
  accecptFriend,
  declineRequestFriend,
  updateFriendStatus,
  getSameFriend
};
