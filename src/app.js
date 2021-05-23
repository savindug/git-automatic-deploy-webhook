// Listen on port 9001
var gith = require('gith').create(9035);
// Import execFile, to run our bash script
var execFile = require('child_process').execFile;

const hook = require('../hooks/hook.sh');

var execOptions = {
  maxBuffer: 1024 * 10240, // 10mb
};

gith({
  repo: 'savindug/git-automatic-deploy-webhookfideloper',
}).on('all', function (payload) {
  if (payload.branch === 'master') {
    // Exec a shell script
    execFile(hook, execOptions, function (error, stdout, stderr) {
      // Log success in some manner
      console.log('exec complete');
    });
  }
});
