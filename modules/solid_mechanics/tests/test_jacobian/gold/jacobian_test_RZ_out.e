CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_info  Q         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         jacobian_test_RZ_out.e     maximum_name_length                     
time_whole                            v<   	eb_status                             �   eb_prop1               name      ID              �   	ns_status         	                    	    ns_prop1      	         name      ID              	   	ss_status         
                    	    ss_prop1      
         name      ID              	0   coordx                             	@   coordy                             	`   eb_names                       $      	�   ns_names      	                 �      	�   ss_names      
                 �      
(   
coor_names                         D      
�   node_num_map                          
�   connect1                  	elem_type         QUAD4                   elem_num_map                             elem_ss1                             side_ss1                             elem_ss2                             side_ss2                              elem_ss3                          $   side_ss3                          (   elem_ss4                          ,   side_ss4                          0   node_ns1                          4   node_ns2                          <   node_ns3                          D   node_ns4                          L   vals_nod_var1                                 vD   vals_nod_var2                                 vd   name_nod_var                       D      T   info_records                      j�      �                                                                 ?�      ?�                              ?�      ?�                                          bottom                           right                            top                              left                             bottom                           top                              left                             right                                                                                                                                                                           x_disp                           y_disp                             ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               jacobian_test_RZ.i                                                               --no-gdb-backtrace                                                                                                                                                ### Version Info ###                                                             Framework Information:                                                           MOOSE version:           git commit 0ab2fd1 on 2016-09-07                        PETSc Version:           3.6.3                                                   Current Time:            Thu Sep  8 13:07:06 2016                                Executable Timestamp:    Thu Sep  8 12:59:53 2016                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [BCs]                                                                                                                                                               [./left]                                                                           boundary                     = left                                              control_tags                 = INVALID                                           enable                       = 1                                                 implicit                     = 1                                                 type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = x_disp                                            diag_save_in                 = INVALID                                           save_in                      = INVALID                                           seed                         = 0                                                 value                        = 1                                               [../]                                                                                                                                                             [./right]                                                                          boundary                     = right                                             control_tags                 = INVALID                                           enable                       = 1                                                 implicit                     = 1                                                 type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = x_disp                                            diag_save_in                 = INVALID                                           save_in                      = INVALID                                           seed                         = 0                                                 value                        = 0                                               [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       abort_on_solve_fail            = 0                                               compute_initial_residual_before_preset_bcs = 0                                   control_tags                   =                                                 dt                             = 0.005                                           dtmax                          = 1e+30                                           dtmin                          = 0.005                                           enable                         = 1                                               end_time                       = 0.005                                           l_abs_step_tol                 = -1                                              l_max_its                      = 100                                             l_tol                          = 1e-08                                           line_search                    = default                                         max_xfem_update                = 4294967295                                      n_startup_steps                = 0                                               nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 0.0001                                          nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-09                                           no_fe_reinit                   = 0                                               num_steps                      = 1                                               petsc_options                  = '-SNES_CHECK_JACOBIAN -SNES_CHECK_JACOBIAN... _VIEW'                                                                             petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           reset_dt                       = 0                                               restart_file_base              =                                                 scheme                         = INVALID                                         solve_type                     = NEWTON                                          splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7fce8b014e00                                []                                                                                                                                                                [Materials]                                                                                                                                                         [./elastic]                                                                        type                         = Elastic                                           active_crack_planes          = INVALID                                           appended_property_name       =                                                   block                        = 0                                                 boundary                     = INVALID                                           bulk_modulus                 = INVALID                                           compute                      = 1                                                 compute_InteractionIntegral  = 0                                                 compute_JIntegral            = 0                                                 compute_method               = INVALID                                           constitutive_model           = INVALID                                           control_tags                 = Materials                                         cracking_beta                = 1                                                 cracking_neg_fraction        = INVALID                                           cracking_release             = abrupt                                            cracking_residual_stress     = 0                                                 cracking_stress              = 0                                                 cracking_stress_function     =                                                   dep_matl_props               = INVALID                                           disp_r                       = x_disp                                            disp_x                       = INVALID                                           disp_y                       = INVALID                                           disp_z                       = y_disp                                            enable                       = 1                                                 formulation                  = INVALID                                           implicit                     = 1                                                 increment_calculation        = RashidApprox                                      initial_stress               = INVALID                                           lambda                       = INVALID                                           large_strain                 = 0                                                 max_cracks                   = 3                                                 output_properties            = INVALID                                           outputs                      = none                                              poissons_ratio               = 0.3                                               poissons_ratio_function      = INVALID                                           scalar_strain_zz             = INVALID                                           seed                         = 0                                                 shear_modulus                = INVALID                                           store_stress_older           = 0                                                 strain_zz                    = INVALID                                           stress_free_temperature      = INVALID                                           temp                         = INVALID                                           thermal_expansion            = INVALID                                           thermal_expansion_function   = INVALID                                           thermal_expansion_function_type = INVALID                                        thermal_expansion_reference_temperature = INVALID                                use_displaced_mesh           = 0                                                 volumetric_locking_correction = 1                                                youngs_modulus               = 1e+06                                             youngs_modulus_function      = INVALID                                         [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               skip_partitioning              = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               bias_x                         = 1                                               bias_y                         = 1                                               bias_z                         = 1                                               centroid_partitioner_direction = INVALID                                         construct_node_list_from_side_list = 1                                           control_tags                   =                                                 dim                            = 2                                               distribution                   = DEFAULT                                         elem_type                      = INVALID                                         enable                         = 1                                               nemesis                        = 0                                               nx                             = 1                                               ny                             = 1                                               nz                             = 1                                               parallel_type                  = DEFAULT                                         partitioner                    = default                                         patch_update_strategy          = never                                           xmax                           = 1                                               xmin                           = 0                                               ymax                           = 1                                               ymin                           = 0                                               zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                             []                                                                                                                                                                [Preconditioning]                                                                                                                                                   [./smp]                                                                            type                         = SMP                                               control_tags                 = Preconditioning                                   coupled_groups               = INVALID                                           enable                       = 1                                                 full                         = 1                                                 line_search                  = default                                           off_diag_column              = INVALID                                           off_diag_row                 = INVALID                                           pc_side                      = right                                             petsc_options                = INVALID                                           petsc_options_iname          = INVALID                                           petsc_options_value          = INVALID                                           solve_type                   = INVALID                                         [../]                                                                          []                                                                                                                                                                [Problem]                                                                          block                          = INVALID                                         coord_type                     = RZ                                              fe_cache                       = 0                                               kernel_coverage_check          = 1                                               material_coverage_check        = 1                                               name                           = 'MOOSE Problem'                                 restart_file_base              = INVALID                                         rz_coord_axis                  = Y                                               type                           = FEProblem                                       use_legacy_uo_aux_computation  = INVALID                                         use_legacy_uo_initialization   = INVALID                                         library_path                   =                                                 object_names                   = INVALID                                         register_objects_from          = INVALID                                         control_tags                   =                                                 dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               enable                         = 1                                               error_on_jacobian_nonzero_reallocation = 0                                       force_restart                  = 0                                               petsc_inames                   =                                                 petsc_options                  = INVALID                                         petsc_values                   =                                                 solve                          = 1                                               use_nonlinear                  = 1                                             []                                                                                                                                                                [SolidMechanics]                                                                                                                                                    [./solid]                                                                          alpha                        = 0                                                 appended_property_name       =                                                   block                        = INVALID                                           diag_save_in_disp_r          = INVALID                                           diag_save_in_disp_x          = INVALID                                           diag_save_in_disp_y          = INVALID                                           diag_save_in_disp_z          = INVALID                                           disp_r                       = x_disp                                            disp_x                       =                                                   disp_y                       =                                                   disp_z                       = y_disp                                            save_in_disp_r               = INVALID                                           save_in_disp_x               = INVALID                                           save_in_disp_y               = INVALID                                           save_in_disp_z               = INVALID                                           temp                         =                                                   type                         = undefined                                         use_displaced_mesh           = 1                                                 volumetric_locking_correction = 1                                                zeta                         = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./x_disp]                                                                         block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = INVALID                                           order                        = FIRST                                             outputs                      = INVALID                                           scaling                      = 1                                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                                                                                                             [./y_disp]                                                                         block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = INVALID                                           order                        = FIRST                                             outputs                      = INVALID                                           scaling                      = 1                                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                          ?tz�G�{?�                     ?�     �������ڿ��O��O�������?̒I$�I)