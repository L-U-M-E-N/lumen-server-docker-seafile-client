global.DEBUG = false;

const config = {
        desktopConfigLocation: '/data/Lumen/resources/app/data/lumen_desktop/modules_config.json',
        subprocessesList: {
                //"example": { init: somefunction, file: somefile, fileopt: [], options: [], onerr: function, onclose: function, onstdout: function, },
                /*subprocessesList.hash = {
                        file: 'node',
                        fileopt: ['/Dev/dehash/server/loadFile.js'],
                        options: {shell: true},
                        onstdout: (data) => { log(yellowText('SYSTEM.SUBPROCESS.hash - ') + (''+data).split('\n').join(' ')); },
                        onerr: (data) => { log('SYSTEM.SUBPROCESS.hash: ' + data, 'error'); }
                };*/
        },
        'database': { // Mandatory
                'user': process.env.PG_USER,
                'host': process.env.PG_HOST,
                'database': process.env.PG_DB,
                'password': process.env.PG_PASSWORD,
                'port': 5432
        },
};

export default config;