return function(s,t, frames)
	s = {s:components()}
	t = {t:components()}
	for i = 1, 12 do
		s[i] = s[i] + (t[i] - s[i]) * frames
	end
	return CFrame.new(unpack(s))
end