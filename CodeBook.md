<h2>CodeBook for the tidy dataset project</h2>
<h3>Purpose</h3>
<p>
The purpose of this project is to collect, work with, and clean a data set. The outcome is a tidy data that can be used for later analysis. The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
</p>
<h3>Script Flow</h3>
<p>
The flow of the script is as follows:
<ol>
<li>Set the working directory</li>
<li>Read the data source files in</li>
<li>Transform the names in the feature data</li>
<li>Combine te Data files</li>
<li>Get the mean and Standard Deviation</li>
<li>Get the facors on activity and subject in the data</li>
<li>Aggregate the data on the factors</li>
<li>Write the data out to disc (tidy_movement_data.txt</li>
</ol>
</p>
<h3>Variables</h3>
<p>
The following variables are used in the script:
<ul>
<li>training  (file data)</li>
<li>testing  (file data)</li>
<li>activityLabels (file data)</li>
<li>features  (features table data)</li>
<li>allData  (all the files data storage)</li>
<li>mean_std  (features file with names (std dev and mean) transformed)</li>
<li>tidy_data (the data set transformed and ready for writing)</li>
</ul>
