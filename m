From: <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
Subject: [pinmux scripts PATCH] Add Colorado Engineering TK1-SOM board
Date: Tue, 30 Aug 2016 22:06:40 +0000
Message-ID: <20160830220626.7199-1-Peter.Chubb@data61.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.orgPeter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The TK1 SOM from Colorado Engineering is a small form-factor board
similar to the Jetson TK1.

Signed-off-by: Peter Chubb <peter.chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
---
 configs/cei-tk1-som.board | 202 ++++++++++++++++++++++++++++++++++++++++++=
++++
 csv-to-board.py           |   8 ++
 2 files changed, 210 insertions(+)
 create mode 100644 configs/cei-tk1-som.board

diff --git a/configs/cei-tk1-som.board b/configs/cei-tk1-som.board
new file mode 100644
index 0000000..8e0f5e0
--- /dev/null
+++ b/configs/cei-tk1-som.board
@@ -0,0 +1,202 @@
+soc =3D 'tegra124'
+
+pins =3D (
+    #pin,                      mux,           gpio_init, pull,   tri,   e_=
inp, od,    rcv_sel
+    ('dap_mclk1_pw4',          'extperiph1',  None,      'none', False, Fa=
lse, False, False),
+    ('dap_mclk1_req_pee2',     'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap1_din_pn1',           'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap1_dout_pn2',          'i2s0',        None,      'down', True,  Fa=
lse, False, False),
+    ('dap1_fs_pn0',            'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap1_sclk_pn3',          'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap2_din_pa4',           'i2s1',        None,      'none', True,  Tr=
ue,  False, False),
+    ('dap2_dout_pa5',          'i2s1',        None,      'none', False, Fa=
lse, False, False),
+    ('dap2_fs_pa2',            'i2s1',        None,      'none', False, Fa=
lse, False, False),
+    ('dap2_sclk_pa3',          'i2s1',        None,      'none', False, Fa=
lse, False, False),
+    ('gpio_x4_aud_px4',        None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('gpio_x5_aud_px5',        'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('gpio_x6_aud_px6',        'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('gpio_x7_aud_px7',        'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('gpio_w2_aud_pw2',        'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('gpio_w3_aud_pw3',        'spi6',        None,      'down', True,  Fa=
lse, False, False),
+    ('dvfs_pwm_px0',           'cldvfs',      None,      'none', False, Fa=
lse, False, False),
+    ('gpio_x1_aud_px1',        None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('dvfs_clk_px2',           'cldvfs',      None,      'none', False, Fa=
lse, False, False),
+    ('gpio_x3_aud_px3',        'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap3_din_pp1',           'i2s2',        None,      'down', True,  Fa=
lse, False, False),
+    ('dap3_dout_pp2',          'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap3_fs_pp0',            'i2s2',        None,      'down', True,  Fa=
lse, False, False),
+    ('dap3_sclk_pp3',          'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('pv0',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pv1',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('ulpi_clk_py0',           'spi1',        None,      'none', False, Fa=
lse, False, False),
+    ('ulpi_data0_po1',         None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('ulpi_data1_po2',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_data2_po3',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_data3_po4',         None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('ulpi_data4_po5',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_data5_po6',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_data6_po7',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_data7_po0',         'ulpi',        None,      'down', True,  Fa=
lse, False, False),
+    ('ulpi_dir_py1',           'spi1',        None,      'none', True,  Tr=
ue,  False, False),
+    ('ulpi_nxt_py2',           'spi1',        None,      'none', False, Fa=
lse, False, False),
+    ('ulpi_stp_py3',           'spi1',        None,      'none', False, Fa=
lse, False, False),
+    ('cam_i2c_scl_pbb1',       'i2c3',        None,      'none', False, Tr=
ue,  True,  False),
+    ('cam_i2c_sda_pbb2',       'i2c3',        None,      'none', False, Tr=
ue,  True,  False),
+    ('cam_mclk_pcc0',          'vi_alt3',     None,      'none', False, Fa=
lse, False, False),
+    ('pbb0',                   'vimclk2_alt', None,      'none', False, Fa=
lse, False, False),
+    ('pbb3',                   None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('pbb4',                   'vgp4',        None,      'down', True,  Fa=
lse, False, False),
+    ('pbb5',                   'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('pbb6',                   None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('pbb7',                   None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('pcc1',                   None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('pcc2',                   None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('gen2_i2c_scl_pt5',       'i2c2',        None,      'none', False, Tr=
ue,  True,  False),
+    ('gen2_i2c_sda_pt6',       'i2c2',        None,      'none', False, Tr=
ue,  True,  False),
+    ('pj7',                    'uartd',       None,      'none', False, Fa=
lse, False, False),
+    ('pb0',                    'uartd',       None,      'up',   True,  Tr=
ue,  False, False),
+    ('pb1',                    'uartd',       None,      'up',   True,  Tr=
ue,  False, False),
+    ('pk7',                    'uartd',       None,      'none', False, Fa=
lse, False, False),
+    ('pg0',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pg1',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('ph2',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('ph3',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('ph4',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('ph5',                    'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('ph6',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('ph7',                    None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('pg2',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pg3',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pg4',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pg5',                    'spi4',        None,      'none', False, Fa=
lse, False, False),
+    ('pg6',                    'spi4',        None,      'none', False, Fa=
lse, False, False),
+    ('pg7',                    'spi4',        None,      'none', True,  Tr=
ue,  False, False),
+    ('ph0',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('ph1',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pk0',                    'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('pk1',                    'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('pj0',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pj2',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pk3',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pk4',                    'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('pk2',                    None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('pi3',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pi6',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pi2',                    'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('pi5',                    'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('pi1',                    None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('pi4',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pi7',                    'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('pc7',                    'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('pi0',                    None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('pex_l0_clkreq_n_pdd2',   'pe0',         None,      'none', True,  Tr=
ue,  False, False),
+    ('pex_l0_rst_n_pdd1',      'pe0',         None,      'none', False, Fa=
lse, False, False),
+    ('pex_l1_clkreq_n_pdd6',   'pe1',         None,      'none', True,  Tr=
ue,  False, False),
+    ('pex_l1_rst_n_pdd5',      'pe1',         None,      'none', False, Fa=
lse, False, False),
+    ('pex_wake_n_pdd3',        'pe',          None,      'none', True,  Tr=
ue,  False, False),
+    ('usb_vbus_en2_pff1',      'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('pff2',                   'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('clk2_out_pw5',           'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('clk2_req_pcc5',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_wp_n_pv3',        'sdmmc1',      None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_clk_pz0',         'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_cmd_pz1',         'sdmmc1',      None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_dat0_py7',        'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_dat1_py6',        'sdmmc1',      None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_dat2_py5',        'sdmmc1',      None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc1_dat3_py4',        'sdmmc1',      None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none', False, Tr=
ue,  False, False),
+    ('sdmmc3_cmd_pa7',         'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc3_dat0_pb7',        'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc3_dat1_pb6',        'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc3_dat2_pb5',        'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc3_dat3_pb4',        'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none', False, Tr=
ue,  False, False),
+    ('sdmmc3_clk_lb_in_pee5',  'sdmmc3',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_clk_pcc4',        'sdmmc4',      None,      'none', False, Tr=
ue,  False, False),
+    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat0_paa0',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat1_paa1',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat2_paa2',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat3_paa3',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat4_paa4',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat5_paa5',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat6_paa6',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('sdmmc4_dat7_paa7',       'sdmmc4',      None,      'up',   False, Tr=
ue,  False, False),
+    ('kb_col0_pq0',            None,          'in',      'up',   True,  Tr=
ue,  False, False),
+    ('kb_col1_pq1',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_col2_pq2',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_col3_pq3',            None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('kb_col4_pq4',            'kbc',         None,      'down', True,  Fa=
lse, False, False),
+    ('kb_col5_pq5',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_col6_pq6',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_col7_pq7',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row0_pr0',            None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row1_pr1',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row10_ps2',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row11_ps3',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row12_ps4',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row13_ps5',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row14_ps6',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row15_ps7',           None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('kb_row16_pt0',           None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row17_pt1',           None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('kb_row2_pr2',            None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('kb_row3_pr3',            'kbc',         None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row4_pr4',            None,          'in',      'none', True,  Tr=
ue,  False, False),
+    ('kb_row5_pr5',            'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row6_pr6',            None,          'in',      'none', False, Tr=
ue,  False, False),
+    ('kb_row7_pr7',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row8_ps0',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('kb_row9_ps1',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('sdmmc3_cd_n_pv2',        'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('clk_32k_out_pa0',        'soc',         None,      'up',   True,  Tr=
ue,  False, False),
+    ('pwr_i2c_scl_pz6',        'i2cpwr',      None,      'none', False, Tr=
ue,  True,  False),
+    ('pwr_i2c_sda_pz7',        'i2cpwr',      None,      'none', False, Tr=
ue,  True,  False),
+    ('jtag_rtck',              'rtck',        None,      'up',   False, Fa=
lse, False, False),
+    ('clk_32k_in',             'clk',         None,      'none', True,  Tr=
ue,  False, False),
+    ('core_pwr_req',           'pwron',       None,      'none', False, Fa=
lse, False, False),
+    ('cpu_pwr_req',            'cpu',         None,      'none', False, Fa=
lse, False, False),
+    ('pwr_int_n',              'pmi',         None,      'up',   True,  Tr=
ue,  False, False),
+    ('reset_out_n',            'reset_out_n', None,      'none', False, Tr=
ue,  False, False),
+    ('clk3_out_pee0',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('clk3_req_pee1',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap4_din_pp5',           'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap4_dout_pp6',          'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap4_fs_pp4',            'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('dap4_sclk_pp7',          'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('gen1_i2c_scl_pc4',       'i2c1',        None,      'none', False, Tr=
ue,  True,  False),
+    ('gen1_i2c_sda_pc5',       'i2c1',        None,      'none', False, Tr=
ue,  True,  False),
+    ('pu0',                    'rsvd4',       None,      'down', True,  Fa=
lse, False, False),
+    ('pu1',                    'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('pu2',                    'rsvd1',       None,      'down', True,  Fa=
lse, False, False),
+    ('pu3',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pu4',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pu5',                    'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('pu6',                    'rsvd3',       None,      'down', True,  Fa=
lse, False, False),
+    ('uart2_cts_n_pj5',        'uartb',       None,      'up',   True,  Tr=
ue,  False, False),
+    ('uart2_rts_n_pj6',        'uartb',       None,      'none', False, Fa=
lse, False, False),
+    ('uart2_rxd_pc3',          'irda',        None,      'up',   True,  Tr=
ue,  False, False),
+    ('uart2_txd_pc2',          'irda',        None,      'none', False, Fa=
lse, False, False),
+    ('uart3_cts_n_pa1',        'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('uart3_rts_n_pc0',        'gmi',         None,      'down', True,  Fa=
lse, False, False),
+    ('uart3_rxd_pw7',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('uart3_txd_pw6',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('hdmi_cec_pee3',          'cec',         None,      'none', False, Tr=
ue,  False, False),
+    ('hdmi_int_pn7',           None,          'in',      'down', True,  Tr=
ue,  False, False),
+    ('ddc_scl_pv4',            'i2c4',        None,      'none', False, Tr=
ue,  False, False),
+    ('ddc_sda_pv5',            'i2c4',        None,      'none', False, Tr=
ue,  False, False),
+    ('spdif_out_pk5',          'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+    ('spdif_in_pk6',           None,          'out0',    'none', False, Fa=
lse, False, False),
+    ('usb_vbus_en0_pn4',       'usb',         None,      'none', False, Tr=
ue,  False, False),
+    ('usb_vbus_en1_pn5',       'usb',         None,      'none', False, Tr=
ue,  False, False),
+    ('dp_hpd_pff0',            'rsvd2',       None,      'down', True,  Fa=
lse, False, False),
+)
+
+drive_groups =3D (
+)
+
+mipi_pad_ctrl_groups =3D (
+    #pin,     mux
+    ('dsi_b', 'dsi_b'),
+)
diff --git a/csv-to-board.py b/csv-to-board.py
index 2de66c5..ff0fcba 100755
--- a/csv-to-board.py
+++ b/csv-to-board.py
@@ -44,7 +44,15 @@ if args.debug:
     dbg =3D True
 if dbg: print(args)
=20
+# Boards in alphabetical order in this dictionary:
 supported_boards =3D {
+    'cei-tk1-som': {
+        # tk1-som_pinmux_V2.4.xlsm  Colorado TK1-SOM Configuration (1-base=
d rsvd)
+        # updated to version 11 by Peter Chubb
+        'filename': 'csv/cei-tk1-som.csv',
+        'rsvd_base': 1,
+        'soc': 'tegra124',
+    },
     'e2220-1170': {
         # T210_customer_pinmux.xlsm worksheet [elided] (0-based rsvd)
         'filename': 'csv/e2220-1170.csv',
--=20
2.9.3
