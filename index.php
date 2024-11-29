
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/global.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/header.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/home.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/about.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/icons.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/reviews.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/contact.css">
    <link rel="stylesheet" href="http://localhost:8080/project/css/footer.css">


    
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <main>
    <section id="home">
        <?php include 'includes/home.php'; ?>
    </section>
    <section id="about">
        <?php include 'includes/about.php'; ?>
    </section>

    <section id="icons">
        <?php include 'includes/icons.php'; ?>
    </section>

    <section id="products">
        <?php include 'includes/products.php'; ?>
    </section>

    <section id="reviews">
        <?php include 'includes/reviews.php'; ?>
    </section>

    <section id="contact">
        <?php include 'includes/contact.php'; ?>
    </section>
</main>


    <?php include 'includes/footer.php'; ?>
</body>
