function AddStimulusText(hfig,pos1)

movieData = get(hfig,'userdata');

movieData.StimulusText = uicontrol(hfig, ...
    'tag', 'STIMULUSTEXT', ...
    'string', '', ...
    'style', 'text', ...
    'Position', pos1);

set(hfig,'userdata', movieData);

end
