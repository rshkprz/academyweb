<?php  
	include('header.php');
?>

<div class="main-content">
	<div class="wrapper">
		<h1>Add Lesson</h1>
		<br><br>

		<?php  
			if (isset($_SESSION['upload'])) 
			{
				echo $_SESSION['upload'];
				unset($_SESSION['upload']);
			}
		?>

		<form method="POST" enctype="multipart/form-data">
            <table class="tbl-30">
                <tr>
                    <td>Title:</td>
                    <td>
                    <input type="text" name="lesson_name">
                    </td>
                </tr>


               
               
				<tr>
					<td>Course:</td>
					<td>
						<select name="course">

							<?php  
							if(isset($_GET['id'])) {
								$course_id = $_GET['id'];
							
								// Create SQL to get all active categories from db
								$sql = "SELECT title FROM tbl_course WHERE id='$course_id' ";
							
								// Executing query
								$res = mysqli_query($conn, $sql);
							
								// Check if the query was successful
								if($res) {
									while($row = mysqli_fetch_assoc($res)) {
										// Get the details of categories
										$title = $row['title'];
							
										// Display categories in an option tag
										echo "<option value='$course_id'>$title</option>";
									}
								}
							}	
							?>	
						</select>
					</td>
				</tr>

				<tr>
					<td>Active:</td>
					<td>
						<input type="radio" name="active" value="Yes">Yes
						<input type="radio" name="active" value="No">No
					</td>
				</tr>


				<tr>
					<td>Upload Video:</td>
					<td>
						<input type="file" name="lesson-video" required>
					</td>
				</tr>
			
				<tr>
					<td colspan="2">
						<input type="submit" name="submit" value="Add Lesson" class="btn-secondary">
					</td>
				</tr>

			</table>
		</form>

		<?php  
			if(isset($_POST['submit'])&& isset($_FILES['lesson-video'])){
				$filename = $_FILES['lesson-video']['name'];
				$tmpname = $_FILES['lesson-video']['tmp_name'];
				$error = $_FILES['lesson-video']['error'];
				$folder = "videos/". $filename;
				$lesson_name = $_POST['lesson_name'];
				$active = $_POST['active'];
					

				if($error === 0){
					$video_ex = pathinfo($filename, PATHINFO_EXTENSION);
					$video_ex_lc = strtolower($video_ex);
		
					$allowed_exs = array("mp4", 'webm', 'avi', 'flv');
		
					if(in_array($video_ex_lc, $allowed_exs)){
		
						$new_video_name = uniqid("video-",true). '.'.$video_ex_lc;
						$video_upload_path= 'videos/'.$new_video_name;
						move_uploaded_file($tmpname, $video_upload_path);
					}
		
				}
				// move_uploaded_file($tmpname,$folder);
				    // SQL Injection Prevention: Use prepared statements
					$sql = "INSERT INTO tbl_lesson (course_id, lesson_name, video, active) VALUES ('$course_id','$lesson_name','$new_video_name','$active')";
					$res2 = mysqli_query($conn,$sql);

					//check whether data inserted or not
	
					//redirect with msg to manage food page
	
					if ($res2 == true) 
					{
						//data inserted successfully
						$_SESSION['upload'] = "<div class='success'>Lesson added successfully.</div>";
						header('Location: manage-lesson.php?id=' . $course_id);
					}
					else
					{
						//failed to insert data
						$_SESSION['upload'] = "<div class='error'>Failed to add lesson.</div>";
						header('Location: manage-lesson.php?id=' . $course_id);
					}

				
				
			}
			
		?>

	</div>
</div>
