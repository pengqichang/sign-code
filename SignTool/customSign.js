exports.default = async function(configuration) {
    const { execSync } = require('child_process')
    execSync(`signtool sign /v /a /i “WoSign Code Signing CA” /t http://timestamp.comodoca.com ${configuration.path}`)
    // your custom code
}