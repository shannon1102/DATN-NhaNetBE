import { Friend } from "../../entities/friend";
import { Pagination } from "../../types/type.pagination";
import { sendEmail } from "../../utils/sendEmail";
import friendDao from "./daos";
import conversationDao from "../chat/conversation/daos";

const createFriend = async (friend: Friend) => {
  const newFriend = await friendDao.createFriend(friend);
  

  return newFriend;
};


const addFriend = async (requesterId: number, addresseeId: number) => {
  const newFriend = await friendDao.addFriend(requesterId, addresseeId);
  // await sendEmail {Friend);
  return newFriend;
};

const acceptFriend = async (requesterId: number, addresseeId: number) => {
  const newFriend = await friendDao.accecptFriend(requesterId, addresseeId);
  // await sendEmail {Friend);
  return newFriend;
};

const declineRequestFriend = async (requesterId: number, addresseeId: number) => {
  const newFriend = await friendDao.declineRequestFriend(requesterId, addresseeId);
  // await sendEmail {Friend);
  return newFriend;
};



const getFriendById = async (id: number) => {
  return await friendDao.getFriendById(id);

};

const getAllRequestFriends = async (params: Pagination, userId: number) => {

  return await friendDao.getAllRequestFriends(params, userId);
}

const deleteFriendById = async (id: number) => {
  return await friendDao.deleteFriendById(id);

};
const deleteFriendByFriendId = async (friendId: number, userId: number) => {
  return await friendDao.deleteFriendByFriendId(friendId, userId);

};
const updateFriendStatus = async (currUserId: number, userId: number, statusCode: number) => {
  return await friendDao.updateFriendStatus(currUserId, userId, statusCode);
}


const getAllFriends = async (params: Pagination, userId: number) => {
  let resp = await friendDao.getAllFriends(params, userId);

  const formatResponse = await handleFriendResponse(resp[0], userId);
  return [formatResponse, resp[1]];
};
const getAllFriendMails = async (params: Pagination, userId: number) => {
  let resp = await friendDao.getAllFriends(params, userId);
  const formatResponse = await handleFriendResponse(resp[0], userId);
  let mails = formatResponse?.map(e=>e?.email);
  return mails;
};



const getAllSuggestFriends = async (params: Pagination, userId: number) => {
  return await friendDao.getAllSuggestFriends(params, userId);
};
const handleFriendResponse = async (friendShipList: Friend[], currentUserId: number) => {
  let arr = friendShipList.map(e => {
    return [e.addressee, e.requester]
  }).flat(1);
  let friends = arr.filter(e => e.id != currentUserId)
  console.log("friendShipList", arr, friends);
  let usersWithSameFriend = await Promise.all(friends.map(async (e) => {
    const sameFriend = await friendDao.getSameFriend(currentUserId, e.id);
    return {
      ...e,
      sameFriend: sameFriend
    }
  }));
  console.log("SAmeeeeee", usersWithSameFriend)
  return usersWithSameFriend;
}

export default { getAllFriendMails,updateFriendStatus, getAllRequestFriends, getAllSuggestFriends, declineRequestFriend, createFriend, addFriend, acceptFriend, getFriendById, getAllFriends, deleteFriendById };
