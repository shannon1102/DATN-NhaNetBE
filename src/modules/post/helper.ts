import { MediaMap } from "../../entities/mediaMap";
import { Post } from "../../entities/post/post";
import { PostResponse } from "../../types/type.post";


export const formatLikePost = (currUserId:number,post: Post) => {
  const currentPost: Post = JSON.parse(JSON.stringify(post));
  // format options
  let isLiked = false;
  const formatLikes =
    currentPost.likes?.map((like) => {
        
        if(like.userId === currUserId) {
            isLiked = true;
        }
    
    }) || [];

  // format media
  
  return  {
    like:  currentPost.likes.length,
    isLiked: isLiked
  };
};
export const formatLikePosts = (currUserId:number,posts: Post[]) => {
  const currentPosts: Post[] = JSON.parse(JSON.stringify(posts));
  // format options
  const formatPosts =
    currentPosts.map((post) => {
        
        return {
            ...post,
            ...formatLikePost(currUserId,post)
            
        };
    
    }) || [];

  // format media
  console.log("Formatpost",currentPosts,formatPosts)
  return  formatPosts;
};

// const formatMedia = (featureImage: Media, media: Media[]) => {
//   if (featureImage && media) {
//     return [featureImage, ...media.filter((item: Media) => item?.id !== featureImage?.id)];
//   }
//   return media;
// };

/**
 * checkPostMedia check xem featureImage có trong list media hay không
 * @param media list media
 * @param featureImageId  featureImageId
 */
// const checkPostMedia = (media: Media[], featureImageId: number) => {
//   if (!media.find((item) => item.id === featureImageId)) {
//     throw new CustomError(codes.BAD_REQUEST, "Feature image id should have in media list!");
//   }
// };

// const postHelpers = { formatPostResponse, checkPostMedia };

// export default postHelpers;
