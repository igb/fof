var points = [{x: 1.0, y: 4.32},{x: 12.456, y: 12.110}, {x: 40.00003, y: 23.32}, {x: 50.3452, y: 400.3}];

function findA(x, points) {
    var  a = null;
    var i;
    
    
    for (i = 0; i < points.length; i++) {
	if (points[i].x > x) {
	    return a;
	} else {
	    a = points[i];
	}

    }
    return a; 
}



function findB(x, points) {
    var i;
    for (i = 0; i < points.length; i++) {
	if (points[i].x > x) {
	    return points[i];
	}

    }
    return null;
}


function interpolate(x, a, b) {

    return a.y + ((b.y - a.y) *   ((x - a.x) / (b.x - a.x)));
}

function getYforX(x) {
    var a = findA(x, points);
    var b = findB(x, points);
    return  interpolate(x, a, b);

}

var x = process.argv[2];
console.log(getYforX(x));