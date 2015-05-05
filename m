From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
Date: Tue, 5 May 2015 16:14:31 -0400
Message-ID: <554924A7.4030900@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>	<1430757460-9478-3-git-send-email-rklein@nvidia.com> <CANLzEkuxPMX2+rq4EkCs6iV4=qRK69u=Ezgy4Zn_KsSh1+oEfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLzEkuxPMX2+rq4EkCs6iV4=qRK69u=Ezgy4Zn_KsSh1+oEfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/4/2015 3:45 PM, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Tegra210 has significant differences in muxes for peripheral clocks.
>> One of the most important changes is that pll_m isn't to be used
>> as a source for peripherals. Therefore, we need to define the new
>> muxes and new clocks to use those muxes for Tegra210 support.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-id.h           |   57 +++++++-
>>  drivers/clk/tegra/clk-tegra-periph.c |  257 +++++++++++++++++++++++++++++++++-
>>  2 files changed, 312 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
>> index 60738cc954cb..ac6eaba5cc6e 100644
>> --- a/drivers/clk/tegra/clk-id.h
>> +++ b/drivers/clk/tegra/clk-id.h
>> @@ -13,6 +13,7 @@ enum clk_id {
>>         tegra_clk_amx1,
>>         tegra_clk_apbdma,
>>         tegra_clk_apbif,
>> +       tegra_clk_ape,
>>         tegra_clk_audio0,
>>         tegra_clk_audio0_2x,
>>         tegra_clk_audio0_mux,
>> @@ -38,6 +39,7 @@ enum clk_id {
>>         tegra_clk_cile,
>>         tegra_clk_clk_32k,
>>         tegra_clk_clk72Mhz,
>> +       tegra_clk_clk72Mhz_8,
>>         tegra_clk_clk_m,
>>         tegra_clk_clk_m_div2,
>>         tegra_clk_clk_m_div4,
>> @@ -51,17 +53,21 @@ enum clk_id {
>>         tegra_clk_cml1,
>>         tegra_clk_csi,
>>         tegra_clk_csite,
>> +       tegra_clk_csite_8,
>>         tegra_clk_csus,
>>         tegra_clk_cve,
>>         tegra_clk_dam0,
>>         tegra_clk_dam1,
>>         tegra_clk_dam2,
>>         tegra_clk_d_audio,
>> +       tegra_clk_dbgapb,
>>         tegra_clk_dds,
>>         tegra_clk_dfll_ref,
>>         tegra_clk_dfll_soc,
>>         tegra_clk_disp1,
>> +       tegra_clk_disp1_8,
>>         tegra_clk_disp2,
>> +       tegra_clk_disp2_8,
>>         tegra_clk_dp2,
>>         tegra_clk_dpaux,
>>         tegra_clk_dsialp,
>> @@ -71,6 +77,7 @@ enum clk_id {
>>         tegra_clk_dtv,
>>         tegra_clk_emc,
>>         tegra_clk_entropy,
>> +       tegra_clk_entropy_8,
>>         tegra_clk_epp,
>>         tegra_clk_epp_8,
>>         tegra_clk_extern1,
>> @@ -85,12 +92,15 @@ enum clk_id {
>>         tegra_clk_gr3d_8,
>>         tegra_clk_hclk,
>>         tegra_clk_hda,
>> +       tegra_clk_hda_8,
>>         tegra_clk_hda2codec_2x,
>> +       tegra_clk_hda2codec_2x_8,
>>         tegra_clk_hda2hdmi,
>>         tegra_clk_hdmi,
>>         tegra_clk_hdmi_audio,
>>         tegra_clk_host1x,
>>         tegra_clk_host1x_8,
>> +       tegra_clk_host1x_9,
>>         tegra_clk_i2c1,
>>         tegra_clk_i2c2,
>>         tegra_clk_i2c3,
>> @@ -110,11 +120,14 @@ enum clk_id {
>>         tegra_clk_i2s4_sync,
>>         tegra_clk_isp,
>>         tegra_clk_isp_8,
>> +       tegra_clk_isp_9,
>>         tegra_clk_ispb,
>>         tegra_clk_kbc,
>>         tegra_clk_kfuse,
>>         tegra_clk_la,
>> +       tegra_clk_maud,
>>         tegra_clk_mipi,
>> +       tegra_clk_mipibif,
>>         tegra_clk_mipi_cal,
>>         tegra_clk_mpe,
>>         tegra_clk_mselect,
>> @@ -124,11 +137,16 @@ enum clk_id {
>>         tegra_clk_ndspeed,
>>         tegra_clk_ndspeed_8,
>>         tegra_clk_nor,
>> +       tegra_clk_nvdec,
>> +       tegra_clk_nvenc,
>> +       tegra_clk_nvjpg,
>>         tegra_clk_owr,
>> +       tegra_clk_owr_8,
>>         tegra_clk_pcie,
>>         tegra_clk_pclk,
>>         tegra_clk_pll_a,
>>         tegra_clk_pll_a_out0,
>> +       tegra_clk_pll_a1,
>>         tegra_clk_pll_c,
>>         tegra_clk_pll_c2,
>>         tegra_clk_pll_c3,
>> @@ -140,8 +158,10 @@ enum clk_id {
>>         tegra_clk_pll_d_out0,
>>         tegra_clk_pll_dp,
>>         tegra_clk_pll_e_out0,
>> +       tegra_clk_pll_g_ref,
>>         tegra_clk_pll_m,
>>         tegra_clk_pll_m_out1,
>> +       tegra_clk_pll_mb,
>>         tegra_clk_pll_p,
>>         tegra_clk_pll_p_out1,
>>         tegra_clk_pll_p_out2,
>> @@ -160,52 +180,77 @@ enum clk_id {
>>         tegra_clk_pll_x,
>>         tegra_clk_pll_x_out0,
>>         tegra_clk_pwm,
>> +       tegra_clk_qspi,
>>         tegra_clk_rtc,
>>         tegra_clk_sata,
>> +       tegra_clk_sata_8,
>>         tegra_clk_sata_cold,
>>         tegra_clk_sata_oob,
>> +       tegra_clk_sata_oob_8,
>>         tegra_clk_sbc1,
>>         tegra_clk_sbc1_8,
>> +       tegra_clk_sbc1_9,
>>         tegra_clk_sbc2,
>>         tegra_clk_sbc2_8,
>> +       tegra_clk_sbc2_9,
>>         tegra_clk_sbc3,
>>         tegra_clk_sbc3_8,
>> +       tegra_clk_sbc3_9,
>>         tegra_clk_sbc4,
>>         tegra_clk_sbc4_8,
>> +       tegra_clk_sbc4_9,
>>         tegra_clk_sbc5,
>>         tegra_clk_sbc5_8,
>>         tegra_clk_sbc6,
>>         tegra_clk_sbc6_8,
>>         tegra_clk_sclk,
>> +       tegra_clk_sdmmc_legacy,
>>         tegra_clk_sdmmc1,
>>         tegra_clk_sdmmc1_8,
>> +       tegra_clk_sdmmc1_9,
>>         tegra_clk_sdmmc2,
>>         tegra_clk_sdmmc2_8,
>> +       tegra_clk_sdmmc2_9,
>>         tegra_clk_sdmmc3,
>>         tegra_clk_sdmmc3_8,
>> +       tegra_clk_sdmmc3_9,
>>         tegra_clk_sdmmc4,
>>         tegra_clk_sdmmc4_8,
>> +       tegra_clk_sdmmc4_9,
>>         tegra_clk_se,
>>         tegra_clk_soc_therm,
>> +       tegra_clk_soc_therm_8,
>>         tegra_clk_sor0,
>>         tegra_clk_sor0_lvds,
>> +       tegra_clk_sor1,
>> +       tegra_clk_sor1_brick,
>> +       tegra_clk_sor1_src,
>>         tegra_clk_spdif,
>>         tegra_clk_spdif_2x,
>>         tegra_clk_spdif_in,
>> +       tegra_clk_spdif_in_8,
>>         tegra_clk_spdif_in_sync,
>>         tegra_clk_spdif_mux,
>>         tegra_clk_spdif_out,
>>         tegra_clk_timer,
>>         tegra_clk_trace,
>>         tegra_clk_tsec,
>> +       tegra_clk_tsec_8,
>> +       tegra_clk_tsecb,
>>         tegra_clk_tsensor,
>>         tegra_clk_tvdac,
>>         tegra_clk_tvo,
>>         tegra_clk_uarta,
>> +       tegra_clk_uarta_8,
>>         tegra_clk_uartb,
>> +       tegra_clk_uartb_8,
>>         tegra_clk_uartc,
>> +       tegra_clk_uartc_8,
>>         tegra_clk_uartd,
>> +       tegra_clk_uartd_8,
>>         tegra_clk_uarte,
>> +       tegra_clk_uarte_8,
>> +       tegra_clk_uartape,
>>         tegra_clk_usb2,
>>         tegra_clk_usb3,
>>         tegra_clk_usbd,
>> @@ -216,22 +261,32 @@ enum clk_id {
>>         tegra_clk_vi,
>>         tegra_clk_vi_8,
>>         tegra_clk_vi_9,
>> +       tegra_clk_vi_10,
>> +       tegra_clk_vi_i2c,
>>         tegra_clk_vic03,
>> +       tegra_clk_vic03_8,
>>         tegra_clk_vim2_clk,
>>         tegra_clk_vimclk_sync,
>>         tegra_clk_vi_sensor,
>> -       tegra_clk_vi_sensor2,
>>         tegra_clk_vi_sensor_8,
>> +       tegra_clk_vi_sensor_9,
>> +       tegra_clk_vi_sensor2,
>> +       tegra_clk_vi_sensor2_8,
>>         tegra_clk_xusb_dev,
>>         tegra_clk_xusb_dev_src,
>> +       tegra_clk_xusb_dev_src_8,
>>         tegra_clk_xusb_falcon_src,
>> +       tegra_clk_xusb_falcon_src_8,
>>         tegra_clk_xusb_fs_src,
>>         tegra_clk_xusb_host,
>>         tegra_clk_xusb_host_src,
>> +       tegra_clk_xusb_host_src_8,
>>         tegra_clk_xusb_hs_src,
>>         tegra_clk_xusb_ss,
>>         tegra_clk_xusb_ss_src,
>> +       tegra_clk_xusb_ss_src_8,
>>         tegra_clk_xusb_ss_div2,
>> +       tegra_clk_sclk_mux,
>>         tegra_clk_max,
>>  };
>>
>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
>> index 46af9244ba74..bde7286bb16b 100644
>> --- a/drivers/clk/tegra/clk-tegra-periph.c
>> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>> @@ -125,6 +125,19 @@
>>  #define CLK_SOURCE_HDMI_AUDIO 0x668
>>  #define CLK_SOURCE_VIC03 0x678
>>  #define CLK_SOURCE_CLK72MHZ 0x66c
>> +#define CLK_SOURCE_DBGAPB 0x718
>> +#define CLK_SOURCE_NVENC 0x6a0
>> +#define CLK_SOURCE_NVDEC 0x698
>> +#define CLK_SOURCE_NVJPG 0x69c
>> +#define CLK_SOURCE_APE 0x6c0
>> +#define CLK_SOURCE_SOR1 0x410
>> +#define CLK_SOURCE_SDMMC_LEGACY 0x694
>> +#define CLK_SOURCE_QSPI 0x6c4
>> +#define CLK_SOURCE_VI_I2C 0x6c8
>> +#define CLK_SOURCE_MIPIBIF 0x660
>> +#define CLK_SOURCE_UARTAPE 0x710
>> +#define CLK_SOURCE_TSECB 0x6d8
>> +#define CLK_SOURCE_MAUD 0x6d4
> 
> It would be nice if this list was organized better. For example
> CLK_SOURCE_SOR1, could be next to existing define of SOR0, and the
> same for TSECB, the UARTAPE, and SDMMC_LEGACY.
> 
> It's unfortunate that the list of clock sources is not sorted by name,
> by offset value, nor by the way these show up in the TRM.
> 

I'll make a cleanup patchset after this set lands to handle some things
like sorting fields like the above, filling in missing kerneldocs for
existing fields, etc...

-rhyland

-- 
nvpublic
