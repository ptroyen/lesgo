module defs
!  geometry
integer :: nx,ny,nz
double precision ::L_z, z_i

!  tparam
integer :: nsteps
double precision :: dt

!  coriolis
logical :: coriolis_forcing
double precision :: u_star, Pr

!  io
logical :: output, use_avgslice,read_inflow_file, &
  write_inflow_file
integer :: c_count, p_count, cs_count, jt_start_write

!  ic
logical :: initu, inilag

!  pparam
logical :: use_bldg, molec, sgs, dns_bc
double precision :: nu_molec

!  les
integer :: model,models,nnn, ifilter
double precision ::Co

!  bc
logical :: inflow, use_fringe_forcing
character(15) :: lbc_mom
integer :: ubc

!  Dont forget to recompute nz
nz=(nz-1)/nproc + 1
!  Dont Forget to recompute L_z
L_z=2._rprec*z_i/nproc

namelist/geometry/nx,ny,nz,L_x,L_y,L_z,z_i
namelist/tparam/dt,nsteps
namelist/coriolis/coriolis_forcing,u_star,Pr
namelist/io/output,use_avgslice,read_inflow_file, &
  write_inflow_file, c_count,p_count,cs_count,jt_start_write
namelist/ic/initu,inilag
namelist/pparam/use_bldg,molec,sgs,dns_bc,nu_molec
namelist/les/model,models,nnn,ifilter,Co
namelist/bc/inflow,use_fringe_forcing,lbc_mom,ubc  

end module defs
