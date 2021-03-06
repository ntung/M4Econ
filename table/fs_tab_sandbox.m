%% Matlab Tables Sort and Order
% *back to *<https://fanwangecon.github.io *Fan*>*'s *<https://fanwangecon.github.io/M4Econ/
% *Reusable Matlab*>* Repository or *<https://fanwangecon.github.io/CodeDynaAsset/
% *Dynamic Asset*>* Repository.*

%% Displays
tb_exe_times = array2table([ar_fl_exe_times', ar_fl_exe_times'*it_z*it_iter]);
tb_exe_times.Properties.RowNames = ar_fl_exe_desc;
tb_exe_times.Properties.VariableNames = {'speedmat', 'speedfull'};
disp(tb_exe_times);


% Generate Table From Two Arrays with Row Labels
ar_fl_abc1 = [0.4 0.1 0.25 0.3 0.4];
ar_fl_abc2 = [0.4 0.1 0.2 0.3 0.4];
number1 = '123';
number2 = '456';
mt_data = [ar_fl_abc1' ar_fl_abc2'];

tb_test = array2table(mt_data);
cl_col_names = {['col' num2str(number1)], ['col' num2str(number2)]};
cl_row_names = strcat('row=', string((1:size(mt_data,1))));

tb_test.Properties.VariableNames = cl_col_names;
tb_test.Properties.RowNames = cl_row_names;
disp(tb_test);


% Generate Table From Two Arrays and One Matrix
tb_valpol_iter = array2table([ar_val_diff_norm(1:it_display_every:it_iter)';...
                              ar_pol_diff_norm(1:it_display_every:it_iter)'; ...
                              ar_pol_perc_change(1:it_display_every:it_iter, :)']');
cl_col_names = ['valgap', 'polgap', strcat('z', string((1:size(mt_val_cur,2))))];
cl_row_names = strcat('iter=', string((1:it_display_every:it_iter)));
tb_valpol_iter.Properties.VariableNames = cl_col_names;
tb_valpol_iter.Properties.RowNames = cl_row_names;
tb_valpol_iter.Properties.VariableDescriptions{'valgap'} = 'norm(mt_val - mt_val_cur)';
tb_valpol_iter.Properties.VariableDescriptions{'valgap'} = 'norm(mt_pol_a - mt_pol_a_cur)';
tb_valpol_iter.Properties.VariableDescriptions{'z1'} = 'z1 perc change: sum((mt_pol_a ~= mt_pol_a_cur))/(it_a_n)';
disp(summary(tb_valpol_iter));
disp(tb_valpol_iter);


%% table with makevalidname
tb_val = array2table(mt_val_print);
tb_val.Properties.RowNames = strcat('a',string(ar_it_rows), '=', string(ar_a(ar_it_rows)));
tb_val.Properties.VariableNames = matlab.lang.makeValidName(strcat('z=', string(ar_z(ar_it_cols))));
disp('tb_val');
summary(tb_val);
disp(tb_val);

%% Generate Table and show
% 2019-07-01 15:50

% Genereate Table
tab_ak_choices = array2table([ar_bwithrplusk_mesha, ar_aplusk_mesha, ...
    ar_k_mesha, b_with_r, ar_a_meshk, ar_a_nobridge_meshk, ar_bridge_a]);
cl_col_names = {'ar_bwithrplusk_mesha', 'ar_aplusk_mesha', ...
    'ar_k_mesha', 'b_with_r', 'ar_a_meshk', 'ar_a_nobridge_meshk', 'ar_bridge_a'};
tab_ak_choices.Properties.VariableNames = cl_col_names;

% Label Table Variables
tab_ak_choices.Properties.VariableDescriptions{'ar_bwithrplusk_mesha'} = ...
    '*ar_coh_today*: cash on hand someone arrives in the period with given debt and current income';
tab_ak_choices.Properties.VariableDescriptions{'ar_aplusk_mesha'} = ...
    '*ar_aprime*: func called during finding optimal aprime, this is the current aprime overall choice';
tab_ak_choices.Properties.VariableDescriptions{'ar_k_mesha'} = ...
    '*ar_b_bridge*: amount of bridge loan required to cover negative coh (includes interest if bl_b_is_principle = false)';
tab_ak_choices.Properties.VariableDescriptions{'b_with_r'} = ...
    '*ar_c_bridge*: consumption gain today from the bridge loan to cover negative coh';
tab_ak_choices.Properties.VariableDescriptions{'ar_a_meshk'} = ...
    '*ar_a_meshk*: ar_aprime_nobridge:';
tab_ak_choices.Properties.VariableDescriptions{'ar_a_nobridge_meshk'} = ...
    '*ar_aprime_nobridge*: ar_aprime_nobridge:';
tab_ak_choices.Properties.VariableDescriptions{'ar_bridge_a'} = ...
    '*ar_bridge_a* :';

cl_var_desc = tab_ak_choices.Properties.VariableDescriptions;
for it_var_name = 1:length(cl_var_desc)
    disp(cl_var_desc{it_var_name});
end

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('mt_w_by_interp_coh_interp_grid');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
it_rows_toshow = length(ar_w_level)*it_ak_perc_n*1;
disp(size(tab_ak_choices));
disp(head(array2table(tab_ak_choices), it_rows_toshow));
disp(tail(array2table(tab_ak_choices), it_rows_toshow));

%% Store and Print Variable Names
% 2019-06-23 10:40

disp(['bl_b_is_principle:', num2str(bl_b_is_principle)]);
disp(['fl_r_bridge:', num2str(fl_r_bridge)]);
disp(['ar_aprime:', num2str(ar_aprime')]);
disp(['ar_b_bridge:', num2str(ar_coh_today')]);
disp(['bl_display_infbridge:', num2str(bl_display_infbridge)]);

tab_aprime_bridge = table(ar_coh_today, ar_aprime, ar_b_bridge, ar_c_bridge, ar_aprime_nobridge);
tab_aprime_bridge.Properties.VariableDescriptions{'ar_coh_today'} = ...
    '*ar_coh_today*: cash on hand someone arrives in the period with given debt and current income';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_aprime'} = ...
    '*ar_aprime*: func called during finding optimal aprime, this is the current aprime overall choice';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_b_bridge'} = ...
    '*ar_b_bridge*: amount of bridge loan required to cover negative coh (includes interest if bl_b_is_principle = false)';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_c_bridge'} = ...
    '*ar_c_bridge*: consumption gain today from the bridge loan to cover negative coh';
tab_aprime_bridge.Properties.VariableDescriptions{'ar_aprime_nobridge'} = ...
    ['ar_aprime_nobridge:' ...
     'aprime = -10, -5 for bridge; -5 left for other borrowing choices;' ...
     'aprime = -10, -11 for bridge (given r), +1 savings left, reduces consumption, back to neg coh, infeasible state;'];

disp(tab_aprime_bridge);
sc_summary = summary(tab_aprime_bridge);
cl_var_name = fieldnames(sc_summary);
for it_var_name = 1:length(cl_var_name)
    disp(sc_summary.(cl_var_name{it_var_name}).Description);
end


%% Named Columns, Shock Rows

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Borrow R Shock: ar_z_r_borr_mesh_wage');
disp('Prod/Wage Shock: mt_z_wage_mesh_r_borr');
disp('show which shock is inner and which is outter');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

tb_two_shocks = array2table([ar_z_r_borr_mesh_wage;...
                              ar_z_wage_mesh_r_borr]');

cl_col_names = ["Borrow R Shock (Meshed)", "Wage R Shock (Meshed)"];
cl_row_names = strcat('zi=', string((1:length(ar_z_r_borr_mesh_wage))));

tb_two_shocks.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_two_shocks.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_two_shocks));
disp(head(tb_two_shocks, 20));
disp(tail(tb_two_shocks, 20));
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

%% More Examples

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Wage Prod Shock Transition Matrix: mt_z_r_borr_prob_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
it_col_n_keep = 15;
it_row_n_keep = 15;
[it_row_n, it_col_n] = size(mt_z_wage_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_wage', 'w%3.2f')]);
tb_z_wage_trans = array2table(round(mt_z_wage_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('zi=', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('zi=', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_rows));
tb_z_wage_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_z_wage_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_z_wage_trans));
disp(tb_z_wage_trans);
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Full Transition Matrix: mt_z_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
it_col_n_keep = it_z_wage_n*3;
it_row_n_keep = it_z_wage_n*3;
[it_row_n, it_col_n] = size(mt_z_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage_w1r2', 'r%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr_w1r2', 'w%3.2f')]);
tb_mt_z_trans = array2table(round(mt_z_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('i', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('i', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_rows));
tb_mt_z_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_mt_z_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_mt_z_trans));
disp(tb_mt_z_trans);
disp(tb_ev_condi_z_max_kp(1:round(it_row_n_keep/2)));
disp(tb_ev_condi_z_max_kp((round(it_row_n_keep/2)+1):it_row_n_keep));

%% Sequence Name Subsetting

disp('----------------------------------------');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
disp('Full Transition Matrix: mt_z_trans');
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

[it_row_n, it_col_n] = size(mt_z_trans);
[ar_it_cols, ar_it_rows] = fft_row_col_subset(it_col_n, it_col_n_keep, it_row_n, it_row_n_keep);
cl_st_full_rowscols = cellstr([num2str(ar_z_r_borr_mesh_wage', 'zr=%3.2f;'), ...
                               num2str(ar_z_wage_mesh_r_borr', 'zw=%3.2f')]);
tb_mt_z_trans = array2table(round(mt_z_trans(ar_it_rows, ar_it_cols),6));
cl_col_names = strcat('zi=', num2str(ar_it_cols'), ':', cl_st_full_rowscols(ar_it_cols));
cl_row_names = strcat('zi=', num2str(ar_it_rows'), ':', cl_st_full_rowscols(ar_it_cols));
tb_mt_z_trans.Properties.VariableNames = matlab.lang.makeValidName(cl_col_names);
tb_mt_z_trans.Properties.RowNames = matlab.lang.makeValidName(cl_row_names);

disp(size(tb_mt_z_trans));
disp(tb_mt_z_trans);
