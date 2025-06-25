#!/bin/sh

cp ~/eyeballer/prediction_output_template.html .
eyeballer --weights ~/bishop-fox-pretrained-v3.h5 predict screenshots
rm prediction_output_template.html
