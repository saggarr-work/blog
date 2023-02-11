<?php
    $posts = $obj->display_post();
?>

<h2>Manage Post Page</h2>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>Thumbnail</th>
                <th>Author</th>
                <th>Date</th>
                <th>Category</th>
                <th>status</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <?php while($postsdata = mysqli_fetch_assoc($posts)) { ?>
            <tr>
                <td> <?php echo $postsdata['post_id']; ?> </td>
                <td> <?php echo $postsdata['post_title']; ?> </td>
                <td> <?php echo $postsdata['post_content']; ?> </td>
                <td> <img height = "30px" src="../upload/<?php echo $postsdata['post_img'];?>"> <br> <a href="edit_img.php?status=editimg&&id=<?php echo $postsdata['post_id']; ?>">Change</a> </td>
                <td> <?php echo $postsdata['post_author']; ?> </td>
                <td> <?php echo $postsdata['post_date']; ?> </td>
                <td> <?php echo $postsdata['cat_name']; ?> </td>
                <td> <?php if($postsdata['post_status'] == 1){
                    echo "Published";
                }
                else{
                    echo "Unpublished";
                } ?> </td>
                <td>
                    <a class="btn btn-primary" href="edit_post.php?status=editpost&&id=<?php echo $postsdata['post_id']; ?>">Edit</a>
                    <a class="btn btn-danger" href="#">Delete</a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>