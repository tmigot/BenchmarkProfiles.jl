function compute_profile_integral(T, logscale=logscale, sampletol=sampletol, drawtol=drawtol)
  (x_plot, y_plot, max_ratio) = performance_profile_data(T, logscale=logscale, sampletol=sampletol, drawtol=drawtol)
  N = size(T, 2)
  int = zeros(N)
  for (xp, yp, j) in zip(x_plot, y_plot, 1:N), i = 1:(length(xp) - 1)
    int[j] += (yp[i] + yp[i+1]) / 2 * (xp[i+1] - xp[i])
  end
  int = int ./ [x_plot[i][end] for i=1N]
  return int
end