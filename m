From: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Mon, 9 Mar 2015 16:40:42 +0000 (UTC)
Message-ID: <loom.20150309T173610-946@post.gmane.org>
References: <1425672435-19031-1-git-send-email-daniels@collabora.com>	<54FA0EBB.3080208@wwwdotorg.org>	<CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew@mail.gmail.com>	<54FA1231.9000709@wwwdotorg.org> <1425915411.12254.0@mail.collabora.com> <54FDC8F5.6060408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Stephen Warren <swarren@...> writes:
> On 03/09/2015 09:36 AM, Daniel Stone wrote:
> > Actually, no, I hadn't. The diff is annoying to produce, as the format
> > used in chromeos-3.10 is totally different (different pin naming scheme,
> > aggregation of one entry to multiple nvidia,pins entries),
> 
> I guess this is roughly what your Perl script does, but in the past I've 
> written one-off scripts to import our downstream DT files into the 
> *.board format that tegra-pinmux-scripts uses, and then diff'd that. The 
> advantage here is that I can then use the output with tegra-pinmux-
scripts.

Fair enough. I came into this hoping to spend rather less time on it than I 
did. ;)

> > And lastly,
> > there are a number of entries in nyan-big.config which aren't present in
> > the downstream config. If these entries are unneeded (presumably unused
> > ... ?), should they be removed?
> 
> Typically I'd hope that every pin had an explicit configuration, so that 
> we know we've actively avoided any conflicting settings. Do you have a 
> list of the pins that aren't configured in the ChromeOS kernel but are 
> in the updated tegra-pinmux-scripts config file?

Sure, I've attached it, after having done Blaze as well (pushed to the same 
tree, totally untested in any way; Big at least boots and gives me 
USB/eMMC/eDP/HDMI). The only difference between the two is that Blaze does 
have a definition for kb_row11_ps[34]. I've not checked to see if these are 
actually required / in use, i.e. whether we do need them or if we're just 
getting lucky with existing/default configuration. I'll do this before I 
post the final patchset.

Thanks for walking me through this!

(Oh and also, just realised: if you want to actually use that horrendous 
script, you need to change board-to-kernel-dt.py to output in conf order 
rather than pin order.)

Cheers,
Daniel


NO DEFINED MAPPING FOR dap_mclk1_req_pee2 (reg 0x3348, cros name 
dap_mclk1_req_pee2)
NO DEFINED MAPPING FOR dap1_din_pn1 (reg 0x333c, cros name dap1_din_pn1)
NO DEFINED MAPPING FOR dap1_dout_pn2 (reg 0x3340, cros name dap1_dout_pn2)
NO DEFINED MAPPING FOR dap1_fs_pn0 (reg 0x3338, cros name dap1_fs_pn0)
NO DEFINED MAPPING FOR dap1_sclk_pn3 (reg 0x3344, cros name dap1_sclk_pn3)
NO DEFINED MAPPING FOR gpio_x4_aud_px4 (reg 0x3378, cros name 
gpio_x4_aud_px4)
NO DEFINED MAPPING FOR gpio_x5_aud_px5 (reg 0x337c, cros name 
gpio_x5_aud_px5)
NO DEFINED MAPPING FOR gpio_x6_aud_px6 (reg 0x3380, cros name 
gpio_x6_aud_px6)
NO DEFINED MAPPING FOR gpio_w2_aud_pw2 (reg 0x33ec, cros name 
gpio_w2_aud_pw2)
NO DEFINED MAPPING FOR gpio_x1_aud_px1 (reg 0x336c, cros name 
gpio_x1_aud_px1)
NO DEFINED MAPPING FOR gpio_x3_aud_px3 (reg 0x3370, cros name 
gpio_x3_aud_px3)
NO DEFINED MAPPING FOR dap3_din_pp1 (reg 0x3034, cros name dap3_din_pp1)
NO DEFINED MAPPING FOR dap3_fs_pp0 (reg 0x3030, cros name dap3_fs_pp0)
NO DEFINED MAPPING FOR dap3_sclk_pp3 (reg 0x303c, cros name dap3_sclk_pp3)
NO DEFINED MAPPING FOR pv0 (reg 0x3040, cros name pv0)
NO DEFINED MAPPING FOR pv1 (reg 0x3044, cros name pv1)
NO DEFINED MAPPING FOR ulpi_data0_po1 (reg 0x3000, cros name ulpi_data0_po1)
NO DEFINED MAPPING FOR ulpi_data1_po2 (reg 0x3004, cros name ulpi_data1_po2)
NO DEFINED MAPPING FOR ulpi_data2_po3 (reg 0x3008, cros name ulpi_data2_po3)
NO DEFINED MAPPING FOR ulpi_data3_po4 (reg 0x300c, cros name ulpi_data3_po4)
NO DEFINED MAPPING FOR ulpi_data4_po5 (reg 0x3010, cros name ulpi_data4_po5)
NO DEFINED MAPPING FOR ulpi_data5_po6 (reg 0x3014, cros name ulpi_data5_po6)
NO DEFINED MAPPING FOR ulpi_data6_po7 (reg 0x3018, cros name ulpi_data6_po7)
NO DEFINED MAPPING FOR ulpi_data7_po0 (reg 0x301c, cros name ulpi_data7_po0)
NO DEFINED MAPPING FOR cam_mclk_pcc0 (reg 0x3284, cros name cam_mclk_pcc0)
NO DEFINED MAPPING FOR pbb0 (reg 0x328c, cros name pbb0)
NO DEFINED MAPPING FOR pbb3 (reg 0x3298, cros name pbb3)
NO DEFINED MAPPING FOR pbb4 (reg 0x329c, cros name pbb4)
NO DEFINED MAPPING FOR pbb5 (reg 0x32a0, cros name pbb5)
NO DEFINED MAPPING FOR pbb6 (reg 0x32a4, cros name pbb6)
NO DEFINED MAPPING FOR pbb7 (reg 0x32a8, cros name pbb7)
NO DEFINED MAPPING FOR pcc1 (reg 0x3288, cros name pcc1)
NO DEFINED MAPPING FOR pcc2 (reg 0x32ac, cros name pcc2)
NO DEFINED MAPPING FOR pb0 (reg 0x3234, cros name pb0)
NO DEFINED MAPPING FOR pb1 (reg 0x3238, cros name pb1)
NO DEFINED MAPPING FOR pg0 (reg 0x31f0, cros name pg0)
NO DEFINED MAPPING FOR pg1 (reg 0x31f4, cros name pg1)
NO DEFINED MAPPING FOR ph3 (reg 0x321c, cros name ph3)
NO DEFINED MAPPING FOR ph5 (reg 0x3224, cros name ph5)
NO DEFINED MAPPING FOR pg2 (reg 0x31f8, cros name pg2)
NO DEFINED MAPPING FOR pg3 (reg 0x31fc, cros name pg3)
NO DEFINED MAPPING FOR ph0 (reg 0x3210, cros name ph0)
NO DEFINED MAPPING FOR pj2 (reg 0x31d8, cros name pj2)
NO DEFINED MAPPING FOR pk3 (reg 0x31dc, cros name pk3)
NO DEFINED MAPPING FOR pi2 (reg 0x3248, cros name pi2)
NO DEFINED MAPPING FOR pi1 (reg 0x3244, cros name pi1)
NO DEFINED MAPPING FOR pi4 (reg 0x324c, cros name pi4)
NO DEFINED MAPPING FOR pc7 (reg 0x31c0, cros name pc7)
NO DEFINED MAPPING FOR pi0 (reg 0x3240, cros name pi0)
NO DEFINED MAPPING FOR pex_l0_clkreq_n_pdd2 (reg 0x33c0, cros name 
pex_l0_clkreq_n_pdd2)
NO DEFINED MAPPING FOR pex_l0_rst_n_pdd1 (reg 0x33bc, cros name 
pex_l0_rst_n_pdd1)
NO DEFINED MAPPING FOR pex_l1_clkreq_n_pdd6 (reg 0x33d0, cros name 
pex_l1_clkreq_n_pdd6)
NO DEFINED MAPPING FOR pex_l1_rst_n_pdd5 (reg 0x33cc, cros name 
pex_l1_rst_n_pdd5)
NO DEFINED MAPPING FOR pex_wake_n_pdd3 (reg 0x33c4, cros name 
pex_wake_n_pdd3)
NO DEFINED MAPPING FOR pff2 (reg 0x3418, cros name pff2)
NO DEFINED MAPPING FOR clk2_out_pw5 (reg 0x3068, cros name clk2_out_pw5)
NO DEFINED MAPPING FOR clk2_req_pcc5 (reg 0x306c, cros name clk2_req_pcc5)
NO DEFINED MAPPING FOR sdmmc1_wp_n_pv3 (reg 0x33e4, cros name 
sdmmc1_wp_n_pv3)
NO DEFINED MAPPING FOR kb_col1_pq1 (reg 0x3300, cros name kb_col1_pq1)
NO DEFINED MAPPING FOR kb_col2_pq2 (reg 0x3304, cros name kb_col2_pq2)
NO DEFINED MAPPING FOR kb_col3_pq3 (reg 0x3308, cros name kb_col3_pq3)
NO DEFINED MAPPING FOR kb_col5_pq5 (reg 0x3310, cros name kb_col5_pq5)
NO DEFINED MAPPING FOR kb_col6_pq6 (reg 0x3314, cros name kb_col6_pq6)
NO DEFINED MAPPING FOR kb_col7_pq7 (reg 0x3318, cros name kb_col7_pq7)
NO DEFINED MAPPING FOR kb_row13_ps5 (reg 0x32f0, cros name kb_row13_ps5)
NO DEFINED MAPPING FOR kb_row14_ps6 (reg 0x32f4, cros name kb_row14_ps6)
NO DEFINED MAPPING FOR kb_row16_pt0 (reg 0x340c, cros name kb_row16_pt0)
NO DEFINED MAPPING FOR kb_row17_pt1 (reg 0x3410, cros name kb_row17_pt1)
NO DEFINED MAPPING FOR kb_row2_pr2 (reg 0x32c4, cros name kb_row2_pr2)
NO DEFINED MAPPING FOR kb_row3_pr3 (reg 0x32c8, cros name kb_row3_pr3)
NO DEFINED MAPPING FOR kb_row5_pr5 (reg 0x32d0, cros name kb_row5_pr5)
NO DEFINED MAPPING FOR kb_row6_pr6 (reg 0x32d4, cros name kb_row6_pr6)
NO DEFINED MAPPING FOR kb_row8_ps0 (reg 0x32dc, cros name kb_row8_ps0)
NO DEFINED MAPPING FOR clk3_req_pee1 (reg 0x31bc, cros name clk3_req_pee1)
NO DEFINED MAPPING FOR dap4_din_pp5 (reg 0x31ac, cros name dap4_din_pp5)
NO DEFINED MAPPING FOR dap4_dout_pp6 (reg 0x31b0, cros name dap4_dout_pp6)
NO DEFINED MAPPING FOR dap4_fs_pp4 (reg 0x31a8, cros name dap4_fs_pp4)
NO DEFINED MAPPING FOR dap4_sclk_pp7 (reg 0x31b4, cros name dap4_sclk_pp7)
NO DEFINED MAPPING FOR pu0 (reg 0x3184, cros name pu0)
NO DEFINED MAPPING FOR pu1 (reg 0x3188, cros name pu1)
NO DEFINED MAPPING FOR pu2 (reg 0x318c, cros name pu2)
NO DEFINED MAPPING FOR pu3 (reg 0x3190, cros name pu3)
NO DEFINED MAPPING FOR pu4 (reg 0x3194, cros name pu4)
NO DEFINED MAPPING FOR pu5 (reg 0x3198, cros name pu5)
NO DEFINED MAPPING FOR pu6 (reg 0x319c, cros name pu6)
NO DEFINED MAPPING FOR uart2_cts_n_pj5 (reg 0x3170, cros name 
uart2_cts_n_pj5)
NO DEFINED MAPPING FOR uart2_rts_n_pj6 (reg 0x316c, cros name 
uart2_rts_n_pj6)
NO DEFINED MAPPING FOR uart2_rxd_pc3 (reg 0x3164, cros name uart2_rxd_pc3)
NO DEFINED MAPPING FOR uart2_txd_pc2 (reg 0x3168, cros name uart2_txd_pc2)
NO DEFINED MAPPING FOR uart3_cts_n_pa1 (reg 0x317c, cros name 
uart3_cts_n_pa1)
NO DEFINED MAPPING FOR uart3_rts_n_pc0 (reg 0x3180, cros name 
uart3_rts_n_pc0)
NO DEFINED MAPPING FOR uart3_rxd_pw7 (reg 0x3178, cros name uart3_rxd_pw7)
NO DEFINED MAPPING FOR uart3_txd_pw6 (reg 0x3174, cros name uart3_txd_pw6)
NO DEFINED MAPPING FOR owr (reg 0x3334, cros name owr)
NO DEFINED MAPPING FOR spdif_out_pk5 (reg 0x3354, cros name spdif_out_pk5)
NO DEFINED MAPPING FOR dp_hpd_pff0 (reg 0x3430, cros name dp_hpd_pff0)
