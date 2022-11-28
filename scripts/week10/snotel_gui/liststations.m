function liststations(hb, ~, station, hb2)
     I=find(strcmp(station.state,hb.String(hb.Value))==1);
     set(hb2,'Visible','on');
     set(hb2,'String',station.name(I));
end