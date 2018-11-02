/**
 * Computes a point on a spirograph curve on the basis of several points.
 * 
 * @author Siddhesh Rajiv Karekar (karekar-at-usc.edu)
 * 
 * @param {number} t - Angle
 * @param {number} R - Large circle radius
 * @param {number} r - Small circle radius
 * @param {number} a - Constant that helps determine height
 * @param {number} center - Central point to draw spirograph around
 * @param {number} scale - How much to shrink the total spirograph
 * @returns {Object} Point object in the format { lat, lng }
 */
function spirograph(t, R = 8, r = 1, a = 4, center = { lat: 0, lng: 0 }, scale = 1) {
    return {
        lat: center.lat + scale * ((R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t)),
        lng: center.lng + scale * ((R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t))
    }
}

const n = 16;
const sgm123 = { lng: -118.289292, lat: 34.021273 };
const spiro = [];

for (let t = 0.00; t < n * Math.PI; t += 0.1) {
    const spiroPoint = spirograph(t, 8, 1, 4, sgm123, 0.001);
    spiro.push(spiroPoint);
    // Prints coordinates that can be pasted directly into the KML
    console.log(`${spiroPoint.lng},${spiroPoint.lat},50`);
}