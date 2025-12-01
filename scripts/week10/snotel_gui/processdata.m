function processdata(hb2, ~, station, snoteldata, plothandles)
     I=find(strcmp(station.name,hb2.String(hb2.Value))==1);
     iden=station.id(I)
     ident2=find([snoteldata.id]==iden)
     %now, pick apart data
     numobs=length(snoteldata(ident2).month);
     DATE=datenum(snoteldata(ident2).year,snoteldata(ident2).month,snoteldata(ident2).day);
     % 
    %lets build up vector containing the 'water year day', starting with Oct 1
    %as origin.
    startyear=min(snoteldata(ident2).year);
    endyear=max(snoteldata(ident2).year);
    %numyears=endyear-startyear+1;
    yrs=startyear:endyear;
    for j=1:length(yrs)
        I=find(DATE==datenum(yrs(j),10,1));
        if j~=length(yrs)
            J=find(DATE==datenum(yrs(j)+1,9,30));
        else
            J=length(DATE);
        end
        wateryearday(I:J)=DATE(I:J)-DATE(I)+1;
    end
    wateryearday=wateryearday';
    length(wateryearday)

    %pull out data
    swe=snoteldata(ident2).swe;
    P=snoteldata(ident2).p;
    length(P)
    T=snoteldata(ident2).tave;
    depth=snoteldata(ident2).h;
    dens=swe./depth/10; %div by 10 since the swe is mm, depth cm.

    %average data
    tempdata=[P T swe dens];
    yod=[1:366]';
    for j=1:366
        I=find(wateryearday==j);
        avgdata(j,1:4)=nanmean(tempdata(I,:));
    end

     tmp=max(avgdata);
     maxswe=tmp(3);
     %let's toss density and depth data where the swe is <10% the max.
     I=find(swe<0.1*maxswe);
    % swe(I)=NaN;
     dens(I)=NaN;
     depth(I)=NaN
    %average again...
    tempdata(:,4)=dens;
    yod=[1:366]';
    for j=1:366
        I=find(wateryearday==j);
        avgdata(j,4)=nanmean(tempdata(I,4));
    end
    
    scatter(plothandles(1),wateryearday,P,10,'filled','MarkerFaceColor','red','MarkerFaceAlpha',0.3)
    xlabel(plothandles(1),'Day of Water Year');ylabel(plothandles(1), 'Cumulative P (mm)')
    axis(plothandles(1),[0 365 0 max(P)])
    hold(plothandles(1), 'on')
    plot(plothandles(1), yod,avgdata(:,1),'k','LineWidth',3)
    box(plothandles(1))
    hold(plothandles(1), 'off')
    
    scatter(plothandles(2),wateryearday,T,10,'filled','MarkerFaceColor','blue','MarkerFaceAlpha',0.3)
    xlabel(plothandles(2),'Day of Water Year');ylabel(plothandles(2), 'T_{avg} (deg C)')
    axis(plothandles(2),[0 365 min(T) max(T)])
    hold(plothandles(2), 'on')
    plot(plothandles(2), yod,avgdata(:,2),'k','LineWidth',3)
    box(plothandles(2))
    hold(plothandles(2), 'off')
    
    scatter(plothandles(3),wateryearday,swe,10,'filled','MarkerFaceColor','green','MarkerFaceAlpha',0.3)
    xlabel(plothandles(3),'Day of Water Year');ylabel(plothandles(3), 'SWE (mm)')
    axis(plothandles(3),[0 365 0 max(swe)])
    hold(plothandles(3), 'on')
    plot(plothandles(3), yod,avgdata(:,3),'k','LineWidth',3)
    box(plothandles(3))
    hold(plothandles(3), 'off')
    
    scatter(plothandles(4),wateryearday,dens,10,'filled','MarkerFaceColor','cyan','MarkerFaceAlpha',0.3)
    xlabel(plothandles(4),'Day of Water Year');ylabel(plothandles(4), 'Density (%)')
    axis(plothandles(4),[0 365 0 1])
    hold(plothandles(4), 'on')
    plot(plothandles(4), yod,avgdata(:,4),'k','LineWidth',3)
    box(plothandles(4))
    hold(plothandles(4), 'off')
    
    
end