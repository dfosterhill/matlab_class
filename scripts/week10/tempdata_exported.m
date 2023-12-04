classdef tempdata_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        PlotButton             matlab.ui.control.Button
        Slider                 matlab.ui.control.RangeSlider
        SliderLabel            matlab.ui.control.Label
        DayDropDown            matlab.ui.control.DropDown
        DayDropDownLabel       matlab.ui.control.Label
        ColormapDropDown       matlab.ui.control.DropDown
        ColormapDropDownLabel  matlab.ui.control.Label
        UIAxes                 matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: Slider
        function SliderValueChanged(app, event)
            app.UIAxes.CLim=[app.Slider.Value(1) app.Slider.Value(2)];
        end

        % Value changed function: DayDropDown
        function DayDropDownValueChanged(app, event)
            
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            lon=ncread('sample.nc','lon');
            lat=ncread('sample.nc','lat');
            tos=ncread('sample.nc','tos',[1 1 str2num(app.DayDropDown.Value)],[180 170 1]);
            h=pcolor(app.UIAxes,lon,lat,tos');
            h.EdgeColor='none';
            app.UIAxes.Colormap=colormap(app.ColormapDropDown.Value);
            app.UIAxes.CLim=[app.Slider.Value(1) app.Slider.Value(2)];
        end

        % Value changed function: ColormapDropDown
        function ColormapDropDownValueChanged(app, event)
            app.UIAxes.Colormap=colormap(app.ColormapDropDown.Value); 
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Sea Surface Temp (Kelvin)')
            xlabel(app.UIAxes, 'Lon')
            ylabel(app.UIAxes, 'Lat')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XTickLabelRotation = 0;
            app.UIAxes.YTickLabelRotation = 0;
            app.UIAxes.Position = [148 46 461 348];

            % Create ColormapDropDownLabel
            app.ColormapDropDownLabel = uilabel(app.UIFigure);
            app.ColormapDropDownLabel.HorizontalAlignment = 'right';
            app.ColormapDropDownLabel.Position = [14 446 58 22];
            app.ColormapDropDownLabel.Text = 'Colormap';

            % Create ColormapDropDown
            app.ColormapDropDown = uidropdown(app.UIFigure);
            app.ColormapDropDown.Items = {'turbo', 'cool', 'spring', 'summer', 'autumn', 'winter'};
            app.ColormapDropDown.ValueChangedFcn = createCallbackFcn(app, @ColormapDropDownValueChanged, true);
            app.ColormapDropDown.Position = [87 446 100 22];
            app.ColormapDropDown.Value = 'turbo';

            % Create DayDropDownLabel
            app.DayDropDownLabel = uilabel(app.UIFigure);
            app.DayDropDownLabel.HorizontalAlignment = 'right';
            app.DayDropDownLabel.Position = [478 446 26 22];
            app.DayDropDownLabel.Text = 'Day';

            % Create DayDropDown
            app.DayDropDown = uidropdown(app.UIFigure);
            app.DayDropDown.Items = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'};
            app.DayDropDown.ValueChangedFcn = createCallbackFcn(app, @DayDropDownValueChanged, true);
            app.DayDropDown.Position = [514 446 100 22];
            app.DayDropDown.Value = '1';

            % Create SliderLabel
            app.SliderLabel = uilabel(app.UIFigure);
            app.SliderLabel.HorizontalAlignment = 'right';
            app.SliderLabel.Position = [212 453 36 22];
            app.SliderLabel.Text = 'Slider';

            % Create Slider
            app.Slider = uislider(app.UIFigure, 'range');
            app.Slider.Limits = [275 325];
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.Position = [270 462 186 3];
            app.Slider.Value = [275 325];

            % Create PlotButton
            app.PlotButton = uibutton(app.UIFigure, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Position = [27 219 100 23];
            app.PlotButton.Text = 'Plot';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = tempdata_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end