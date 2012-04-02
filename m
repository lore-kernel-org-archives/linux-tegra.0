From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3 5/6] dt: Document Tegra20/30 pinctrl binding
Date: Sun, 1 Apr 2012 23:49:55 -0700
Message-ID: <CAPnjgZ0KhvPV8oO557i5czebm2J_KF7fmM3RDJoeYRurXu6Prg@mail.gmail.com>
References: <1332440842-1098-1-git-send-email-swarren@wwwdotorg.org>
	<1332440842-1098-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332440842-1098-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Thu, Mar 22, 2012 at 11:27 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> Define a new binding for the Tegra pin controller, which is capable o=
f
> defining all aspects of desired pin multiplexing and pin configuratio=
n.
> This is all based on the new common pinctrl bindings.
>
> Add Tegra30 binding based on Tegra20 binding.
>
> Add some basic stuff that was missing before:
> * How many and what reg property entries must be provided.
> * An example.
>
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> v3: Fix typo in Tegra20 binding example
> ---
> =A0.../bindings/pinctrl/nvidia,tegra20-pinmux.txt =A0 =A0 | =A0131 ++=
+++++++++++++++++-
> =A0.../bindings/pinctrl/nvidia,tegra30-pinmux.txt =A0 =A0 | =A0132 ++=
++++++++++++++++++
> =A02 files changed, 261 insertions(+), 2 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidi=
a,tegra30-pinmux.txt
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20=
-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-=
pinmux.txt
> index 36f82db..c8e5782 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux=
=2Etxt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux=
=2Etxt
> @@ -1,5 +1,132 @@
> -NVIDIA Tegra 2 pinmux controller
> +NVIDIA Tegra20 pinmux controller
>
> =A0Required properties:
> -- compatible : "nvidia,tegra20-pinmux"
> +- compatible: "nvidia,tegra20-pinmux"
> +- reg: Should contain the register physical address and length for e=
ach of
> + =A0the tri-state, mux, pull-up/down, and pad control register sets.
>
> +Please refer to pinctrl-bindings.txt in this directory for details o=
f the
> +common pinctrl bindings used by client devices, including the meanin=
g of the
> +phrase "pin configuration node".
> +
> +Tegra's pin configuration nodes act as a container for an abitrary n=
umber of
> +subnodes. Each of these subnodes represents some desired configurati=
on for a
> +pin, a group, or a list of pins or groups. This configuration can in=
clude the
> +mux function to select on those pin(s)/group(s), and various pin con=
figuration
> +parameters, such as pull-up, tristate, drive strength, etc.
> +
> +The name of each subnode is not important; all subnodes should be en=
umerated
> +and processed purely based on their content.
> +
> +Each subnode only affects those parameters that are explicitly liste=
d. In
> +other words, a subnode that lists a mux function but no pin configur=
ation
> +parameters implies no information about any pin configuration parame=
ters.
> +Similarly, a pin subnode that describes a pullup parameter implies n=
o
> +information about e.g. the mux function or tristate parameter. For t=
his
> +reason, even seemingly boolean values are actually tristates in this=
 binding:
> +unspecified, off, or on. Unspecified is represented as an absent pro=
perty,
> +and off/on are represented as integer values 0 and 1.
> +
> +Required subnode-properties:
> +- nvidia,pins : An array of strings. Each string contains the name o=
f a pin or
> + =A0 =A0group. Valid values for these names are listed below.
> +
> +Optional subnode-properties:
> +- nvidia,function: A string containing the name of the function to m=
ux to the
> + =A0pin or group. Valid values for function names are listed below. =
See the Tegra
> + =A0TRM to determine which are valid for each pin or group.
> +- nvidia,pull: Integer, representing the pull-down/up to apply to th=
e pin.
> + =A0 =A00: none, 1: down, 2: up.
> +- nvidia,tristate: Integer.
> + =A0 =A00: drive, 1: tristate.
> +- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
> + =A0 =A00: no, 1: yes.
> +- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
> + =A0 =A00: no, 1: yes.
> +- nvidia,low-power-mode: Integer. Valid values 0-3. 0 is least power=
, 3 is
> + =A0 =A0most power. Controls the drive power or current. See "Low Po=
wer Mode"
> + =A0 =A0or "LPMD1" and "LPMD0" in the Tegra TRM.
> +- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is =
weakest.
> + =A0 =A0The range of valid values depends on the pingroup. See "CAL_=
DRVDN" in the
> + =A0 =A0Tegra TRM.
> +- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is we=
akest.
> + =A0 =A0The range of valid values depends on the pingroup. See "CAL_=
DRVUP" in the
> + =A0 =A0Tegra TRM.
> +- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate=
=2E 0 is
> + =A0 =A0fastest. The range of valid values depends on the pingroup. =
See
> + =A0 =A0"DRVDN_SLWR" in the Tegra TRM.
> +- nvidia,slew-rate-falling: Integer. Controls falling signal slew ra=
te. 0 is
> + =A0 =A0fastest. The range of valid values depends on the pingroup. =
See
> + =A0 =A0"DRVUP_SLWF" in the Tegra TRM.
> +
> +Note that many of these properties are only valid for certain specif=
ic pins
> +or groups. See the Tegra TRM and various pinmux spreadsheets for com=
plete
> +details regarding which groups support which functionality. The Linu=
x pinctrl
> +driver may also be a useful reference, since it consolidates, disamb=
iguates,
> +and corrects data from all those sources.
> +
> +Valid values for pin and group names are:
> +
> + =A0mux groups:
> +
> + =A0 =A0These all support nvidia,function, nvidia,tristate, and many=
 support
> + =A0 =A0nvidia,pull.
> +
> + =A0 =A0ata, atb, atc, atd, ate, cdev1, cdev2, crtp, csus, dap1, dap=
2, dap3, dap4,
> + =A0 =A0ddc, dta, dtb, dtc, dtd, dte, dtf, gma, gmb, gmc, gmd, gme, =
gpu, gpu7,
> + =A0 =A0gpv, hdint, i2cp, irrx, irtx, kbca, kbcb, kbcc, kbcd, kbce, =
kbcf, lcsn,
> + =A0 =A0ld0, ld1, ld2, ld3, ld4, ld5, ld6, ld7, ld8, ld9, ld10, ld11=
, ld12, ld13,
> + =A0 =A0ld14, ld15, ld16, ld17, ldc, ldi, lhp0, lhp1, lhp2, lhs, lm0=
, lm1, lpp,
> + =A0 =A0lpw0, lpw1, lpw2, lsc0, lsc1, lsck, lsda, lsdi, lspi, lvp0, =
lvp1, lvs,
> + =A0 =A0owc, pmc, pta, rm, sdb, sdc, sdd, sdio1, slxa, slxc, slxd, s=
lxk, spdi,
> + =A0 =A0spdo, spia, spib, spic, spid, spie, spif, spig, spih, uaa, u=
ab, uac, uad,
> + =A0 =A0uca, ucb, uda.
> +
> + =A0tristate groups:
> +
> + =A0 =A0These only support nvidia,pull.
> +
> + =A0 =A0ck32, ddrc, pmca, pmcb, pmcc, pmcd, pmce, xm2c, xm2d, ls, lc=
, ld17_0,
> + =A0 =A0ld19_18, ld21_20, ld23_22.
> +
> + =A0drive groups:
> +
> + =A0 =A0With some exceptions, these support nvidia,high-speed-mode,
> + =A0 =A0nvidia,schmitt, nvidia,low-power-mode, nvidia,pull-down-stre=
ngth,
> + =A0 =A0nvidia,pull-up-strength, nvidia,slew_rate-rising, nvidia,sle=
w_rate-falling.
> +
> + =A0 =A0drive_ao1, drive_ao2, drive_at1, drive_at2, drive_cdev1, dri=
ve_cdev2,
> + =A0 =A0drive_csus, drive_dap1, drive_dap2, drive_dap3, drive_dap4, =
drive_dbg,
> + =A0 =A0drive_lcd1, drive_lcd2, drive_sdmmc2, drive_sdmmc3, drive_sp=
i, drive_uaa,
> + =A0 =A0drive_uab, drive_uart2, drive_uart3, drive_vi1, drive_vi2, d=
rive_xm2a,
> + =A0 =A0drive_xm2c, drive_xm2d, drive_xm2clk, drive_sdio1, drive_crt=
, drive_ddc,
> + =A0 =A0drive_gma, drive_gmb, drive_gmc, drive_gmd, drive_gme, drive=
_owr,
> + =A0 =A0drive_uda.
> +
> +Example:
> +
> + =A0 =A0 =A0 pinctrl@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-pinmux";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 0x70000014 0x10 =A0 =A0/* Tri=
-state registers */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x70000080 0x20 =A0 =A0=
/* Mux registers */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x700000a0 0x14 =A0 =A0=
/* Pull-up/down registers */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x70000868 0xa8 >; /* P=
ad control registers */
> + =A0 =A0 =A0 };
> +
> +Example board file extract:
> +
> + =A0 =A0 =A0 pinctrl@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdio4_default: sdio4_default {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 atb {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pins =3D "atb", "gma", "gme";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
function =3D "sdio4";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pull =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
tristate =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 sdhci@c8000600 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-names =3D "default";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D <&sdio4_default>;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30=
-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-=
pinmux.txt
> new file mode 100644
> index 0000000..c275b70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux=
=2Etxt
> @@ -0,0 +1,132 @@
> +NVIDIA Tegra30 pinmux controller
> +
> +The Tegra30 pinctrl binding is very similar to the Tegra20 pinctrl b=
inding,
> +as described in nvidia,tegra20-pinmux.txt. In fact, this document as=
sumes
> +that binding as a baseline, and only documents the differences betwe=
en the
> +two bindings.
> +
> +Required properties:
> +- compatible: "nvidia,tegra30-pinmux"
> +- reg: Should contain the register physical address and length for e=
ach of
> + =A0the pad control and mux registers.
> +
> +Tegra30 adds the following optional properties for pin configuration=
 subnodes:
> +- nvidia,enable-input: Integer. Enable the pin's input path. 0: no, =
1: yes.
> +- nvidia,open-drain: Integer. Enable open drain mode. 0: no, 1: yes.
> +- nvidia,lock: Integer. Lock the pin configuration against further c=
hanges
> + =A0 =A0until reset. 0: no, 1: yes.
> +- nvidia,io-reset: Integer. Reset the IO path. 0: no, 1: yes.
> +
> +As with Tegra20, see the Tegra TRM for complete details regarding wh=
ich groups
> +support which functionality.
> +
> +Valid values for pin and group names are:
> +
> + =A0per-pin mux groups:
> +
> + =A0 =A0These all support nvidia,function, nvidia,tristate, nvidia,p=
ull,
> + =A0 =A0nvidia,enable-input, nvidia,lock. Some support nvidia,open-d=
rain,
> + =A0 =A0nvidia,io-reset.
> +
> + =A0 =A0clk_32k_out_pa0, uart3_cts_n_pa1, dap2_fs_pa2, dap2_sclk_pa3=
,
> + =A0 =A0dap2_din_pa4, dap2_dout_pa5, sdmmc3_clk_pa6, sdmmc3_cmd_pa7,=
 gmi_a17_pb0,
> + =A0 =A0gmi_a18_pb1, lcd_pwr0_pb2, lcd_pclk_pb3, sdmmc3_dat3_pb4, sd=
mmc3_dat2_pb5,
> + =A0 =A0sdmmc3_dat1_pb6, sdmmc3_dat0_pb7, uart3_rts_n_pc0, lcd_pwr1_=
pc1,
> + =A0 =A0uart2_txd_pc2, uart2_rxd_pc3, gen1_i2c_scl_pc4, gen1_i2c_sda=
_pc5,
> + =A0 =A0lcd_pwr2_pc6, gmi_wp_n_pc7, sdmmc3_dat5_pd0, sdmmc3_dat4_pd1=
, lcd_dc1_pd2,
> + =A0 =A0sdmmc3_dat6_pd3, sdmmc3_dat7_pd4, vi_d1_pd5, vi_vsync_pd6, v=
i_hsync_pd7,
> + =A0 =A0lcd_d0_pe0, lcd_d1_pe1, lcd_d2_pe2, lcd_d3_pe3, lcd_d4_pe4, =
lcd_d5_pe5,
> + =A0 =A0lcd_d6_pe6, lcd_d7_pe7, lcd_d8_pf0, lcd_d9_pf1, lcd_d10_pf2,=
 lcd_d11_pf3,
> + =A0 =A0lcd_d12_pf4, lcd_d13_pf5, lcd_d14_pf6, lcd_d15_pf7, gmi_ad0_=
pg0,
> + =A0 =A0gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_=
pg5,
> + =A0 =A0gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10=
_ph2,
> + =A0 =A0gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6, gmi_=
ad15_ph7,
> + =A0 =A0gmi_wr_n_pi0, gmi_oe_n_pi1, gmi_dqs_pi2, gmi_cs6_n_pi3, gmi_=
rst_n_pi4,
> + =A0 =A0gmi_iordy_pi5, gmi_cs7_n_pi6, gmi_wait_pi7, gmi_cs0_n_pj0, l=
cd_de_pj1,
> + =A0 =A0gmi_cs1_n_pj2, lcd_hsync_pj3, lcd_vsync_pj4, uart2_cts_n_pj5=
,
> + =A0 =A0uart2_rts_n_pj6, gmi_a16_pj7, gmi_adv_n_pk0, gmi_clk_pk1, gm=
i_cs4_n_pk2,
> + =A0 =A0gmi_cs2_n_pk3, gmi_cs3_n_pk4, spdif_out_pk5, spdif_in_pk6, g=
mi_a19_pk7,
> + =A0 =A0vi_d2_pl0, vi_d3_pl1, vi_d4_pl2, vi_d5_pl3, vi_d6_pl4, vi_d7=
_pl5,
> + =A0 =A0vi_d8_pl6, vi_d9_pl7, lcd_d16_pm0, lcd_d17_pm1, lcd_d18_pm2,=
 lcd_d19_pm3,
> + =A0 =A0lcd_d20_pm4, lcd_d21_pm5, lcd_d22_pm6, lcd_d23_pm7, dap1_fs_=
pn0,
> + =A0 =A0dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, lcd_cs0_n_pn4, l=
cd_sdout_pn5,
> + =A0 =A0lcd_dc0_pn6, hdmi_int_pn7, ulpi_data7_po0, ulpi_data0_po1, u=
lpi_data1_po2,
> + =A0 =A0ulpi_data2_po3, ulpi_data3_po4, ulpi_data4_po5, ulpi_data5_p=
o6,
> + =A0 =A0ulpi_data6_po7, dap3_fs_pp0, dap3_din_pp1, dap3_dout_pp2, da=
p3_sclk_pp3,
> + =A0 =A0dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7, kb_=
col0_pq0,
> + =A0 =A0kb_col1_pq1, kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_=
pq5,
> + =A0 =A0kb_col6_pq6, kb_col7_pq7, kb_row0_pr0, kb_row1_pr1, kb_row2_=
pr2,
> + =A0 =A0kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_=
pr7,
> + =A0 =A0kb_row8_ps0, kb_row9_ps1, kb_row10_ps2, kb_row11_ps3, kb_row=
12_ps4,
> + =A0 =A0kb_row13_ps5, kb_row14_ps6, kb_row15_ps7, vi_pclk_pt0, vi_mc=
lk_pt1,
> + =A0 =A0vi_d10_pt2, vi_d11_pt3, vi_d0_pt4, gen2_i2c_scl_pt5, gen2_i2=
c_sda_pt6,
> + =A0 =A0sdmmc4_cmd_pt7, pu0, pu1, pu2, pu3, pu4, pu5, pu6, jtag_rtck=
_pu7, pv0,
> + =A0 =A0pv1, pv2, pv3, ddc_scl_pv4, ddc_sda_pv5, crt_hsync_pv6, crt_=
vsync_pv7,
> + =A0 =A0lcd_cs1_n_pw0, lcd_m1_pw1, spi2_cs1_n_pw2, spi2_cs2_n_pw3, c=
lk1_out_pw4,
> + =A0 =A0clk2_out_pw5, uart3_txd_pw6, uart3_rxd_pw7, spi2_mosi_px0, s=
pi2_miso_px1,
> + =A0 =A0spi2_sck_px2, spi2_cs0_n_px3, spi1_mosi_px4, spi1_sck_px5, s=
pi1_cs0_n_px6,
> + =A0 =A0spi1_miso_px7, ulpi_clk_py0, ulpi_dir_py1, ulpi_nxt_py2, ulp=
i_stp_py3,
> + =A0 =A0sdmmc1_dat3_py4, sdmmc1_dat2_py5, sdmmc1_dat1_py6, sdmmc1_da=
t0_py7,
> + =A0 =A0sdmmc1_clk_pz0, sdmmc1_cmd_pz1, lcd_sdin_pz2, lcd_wr_n_pz3, =
lcd_sck_pz4,
> + =A0 =A0sys_clk_req_pz5, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, sdmmc4_da=
t0_paa0,
> + =A0 =A0sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4=
_dat4_paa4,
> + =A0 =A0sdmmc4_dat5_paa5, sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, pbb0,
> + =A0 =A0cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, =
pbb7,
> + =A0 =A0cam_mclk_pcc0, pcc1, pcc2, sdmmc4_rst_n_pcc3, sdmmc4_clk_pcc=
4,
> + =A0 =A0clk2_req_pcc5, pex_l2_rst_n_pcc6, pex_l2_clkreq_n_pcc7,
> + =A0 =A0pex_l0_prsnt_n_pdd0, pex_l0_rst_n_pdd1, pex_l0_clkreq_n_pdd2=
,
> + =A0 =A0pex_wake_n_pdd3, pex_l1_prsnt_n_pdd4, pex_l1_rst_n_pdd5,
> + =A0 =A0pex_l1_clkreq_n_pdd6, pex_l2_prsnt_n_pdd7, clk3_out_pee0, cl=
k3_req_pee1,
> + =A0 =A0clk1_req_pee2, hdmi_cec_pee3, clk_32k_in, core_pwr_req, cpu_=
pwr_req, owr,
> + =A0 =A0pwr_int_n.
> +
> + =A0drive groups:
> +
> + =A0 =A0These all support nvidia,pull-down-strength, nvidia,pull-up-=
strength,
> + =A0 =A0nvidia,slew_rate-rising, nvidia,slew_rate-falling. Most but =
not all
> + =A0 =A0support nvidia,high-speed-mode, nvidia,schmitt, nvidia,low-p=
ower-mode.
> +
> + =A0 =A0ao1, ao2, at1, at2, at3, at4, at5, cdev1, cdev2, cec, crt, c=
sus, dap1,
> + =A0 =A0dap2, dap3, dap4, dbg, ddc, dev3, gma, gmb, gmc, gmd, gme, g=
mf, gmg,
> + =A0 =A0gmh, gpv, lcd1, lcd2, owr, sdio1, sdio2, sdio3, spi, uaa, ua=
b, uart2,
> + =A0 =A0uart3, uda, vi1.
> +
> +Example:
> +
> + =A0 =A0 =A0 pinctrl@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra30-pinmux";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 0x70000868 0xd0 =A0 =A0 /* Pa=
d control registers */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x70003000 0x3e0 >; /* =
Mux registers */
> + =A0 =A0 =A0 };
> +
> +Example board file extract:
> +
> + =A0 =A0 =A0 pinctrl@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdmmc4_default: pinmux {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdmmc4_clk_pcc4 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pins =3D =A0 "sdmmc4_clk_pcc4",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_rst_n_pcc3";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
function =3D "sdmmc4";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pull =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
tristate =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdmmc4_dat0_paa0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pins =3D =A0 "sdmmc4_dat0_paa0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat1_paa1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat2_paa2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat3_paa3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat4_paa4",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat5_paa5",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat6_paa6",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "sdmmc4_dat7_paa7";

I see that you have done with a hierarchical approach which I like a lo=
t.

However, the large number of strings here (using a string to name a
function and a pin) is going to create quite a bit of overhead, not to
mention FDT space.

Have you given up on the /define/ patch that you created?

If so, I wonder if we could at least provide an alternate binding
using numbering. I have just figured out how to get the C preprocessor
out of U-Boot's FDT path, but if that is the only way, perhaps the
kernel should use that to get numbered symbols?

I would much prefer a parallel property which provides the names, that
can be omitted.

(Similarly for your 'nvidia,pull' property, it would be nice to have a
symbolic name)

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
function =3D "sdmmc4";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
pull =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,=
tristate =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 sdhci@78000400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-names =3D "default";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D <&sdmmc4_default>;
> + =A0 =A0 =A0 };
> --
> 1.7.0.4
>

Regards,
Simon
