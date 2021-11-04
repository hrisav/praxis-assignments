Problem
-

Look at the flowers dataset containing roses and tulips. Run SVD on each image and based on the output of SVD, build a classification model using DL network.

Steps to Solve
-

- Getting data.
- Compressing single image, converting to greyscale, finding optimum "r" value for our problem.
- Using r=30, for all the images and compressing using SVD.
- Saving compressed images in new directory.
- Augment as rescaled images using ImageDataGenerator.
- Building CNN based model on the dataset.
- Validation accuracy lies at around 74%.
