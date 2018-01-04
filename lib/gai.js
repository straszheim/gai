(function() {
  var hackit;

  hackit = function() {
    var b, i, id, len, ml, ref, results;
    b = get_buffer_for('/home/troy/proj/atom/repos/gai/something.gai');
    console.log(b);
    ref = b.markerLayers;
    results = [];
    for (ml = i = 0, len = ref.length; i < len; ml = ++i) {
      id = ref[ml];
      results.push(console.log(id, ml));
    }
    return results;
  };

}).call(this);
