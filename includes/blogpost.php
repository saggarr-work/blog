<?php
  $posts = $obj->display_post_public();
?>

<div class="col-lg-8">
  <div class="all-blog-posts">
    <div class="row">

      <?php while($postsdata = mysqli_fetch_assoc($posts)){ ?>

      <div class="col-lg-12">
        <div class="blog-post">
          <div class="blog-thumb">
          <img height = "400px" src="upload/<?php echo $postsdata['post_img']; ?>">
          </div>
          <div class="down-content">
            <span><?php echo $postsdata['cat_name']; ?></span>
            <a href="single_post.php?view=postview&&id=<?php echo $postsdata['post_id']; ?>"><h4><?php echo $postsdata['post_title']; ?></h4></a>
            <ul class="post-info">
              <li><a href="#"><?php echo $postsdata['post_author']; ?></a></li>
              <li><a href="#"><?php echo $postsdata['post_date']; ?></a></li>
              <li><a href="#"><?php echo $postsdata['post_comment_count']; ?></a></li>
            </ul>
            <p><?php echo $postsdata['post_summary']; ?></p>
            <div class="post-options">
              <div class="row">
                <div class="col-6">
                <?php echo $postsdata['post_tag']; ?>
                </div>
                <div class="col-6">
                  <ul class="post-share">
                    <li><i class="fa fa-share-alt"></i></li>
                    <li><a href="#">Facebook</a>,</li>
                    <li><a href="#"> Twitter</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <?php } ?>
      
      <div class="col-lg-12">
        <div class="main-button">
          <a href="blog.html">View All Posts</a>
        </div>
      </div>
    </div>
  </div>
</div>