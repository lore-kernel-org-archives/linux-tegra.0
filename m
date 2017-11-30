From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Thu, 30 Nov 2017 17:22:34 +0000
Message-ID: <e73fb625-58bc-8ccf-4c71-00b457da6a05@nvidia.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
 <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
 <95c14859-a2c7-1c61-adba-bd6c16155c01@gmail.com>
 <9d479a38-f40b-0e58-09c3-d06e9ee32a25@nvidia.com>
 <a96d03da-c2a3-1e44-f227-02577f972df6@gmail.com>
 <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
 <6264cf17-0850-37dd-ca92-9362521d2db6@gmail.com>
 <236aa250-3b9b-94de-0978-0fb8546d504d@nvidia.com>
 <17a79383-0642-5cc6-7b3f-9d302f027b4b@gmail.com>
 <43e293c3-daf2-7b2e-2524-f14de3811f44@nvidia.com>
 <6378f92d-54a9-590a-5fdb-88a7bfa96fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6378f92d-54a9-590a-5fdb-88a7bfa96fc1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/11/17 16:53, Dmitry Osipenko wrote:

...

>>> Could you please show the /sys/kernel/debug/clk/clk_summary?
>>
>> With what patches present?
>>
> linux-next without any additional patches

Here you go. This is from Tegra124 Jetson TK1 ...

   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
----------------------------------------------------------------------------------------
 dfllCPU_out                              2            2  1326000000          0 0  
    cclk_g                                1            1  1326000000          0 0  
 clock                                    0            0       32768          0 0  
 vimclk_sync                              0            0    24000000          0 0  
 i2s4_sync                                0            0    24000000          0 0  
 i2s3_sync                                0            0    24000000          0 0  
 i2s2_sync                                0            0    24000000          0 0  
 i2s1_sync                                0            0    24000000          0 0  
 i2s0_sync                                0            0    24000000          0 0  
 spdif_in_sync                            0            0    24000000          0 0  
    spdif_mux                             0            0    24000000          0 0  
       spdif                              0            0    24000000          0 0  
          spdif_doubler                   0            0    48000000          0 0  
             spdif_div                    0            0    48000000          0 0  
                spdif_2x                  0            0    48000000          0 0  
    audio4_mux                            0            0    24000000          0 0  
       audio4                             0            0    24000000          0 0  
          audio4_doubler                  0            0    48000000          0 0  
             audio4_div                   0            0    48000000          0 0  
                audio4_2x                 0            0    48000000          0 0  
    audio3_mux                            0            0    24000000          0 0  
       audio3                             0            0    24000000          0 0  
          audio3_doubler                  0            0    48000000          0 0  
             audio3_div                   0            0    48000000          0 0  
                audio3_2x                 0            0    48000000          0 0  
    audio2_mux                            0            0    24000000          0 0  
       audio2                             0            0    24000000          0 0  
          audio2_doubler                  0            0    48000000          0 0  
             audio2_div                   0            0    48000000          0 0  
                audio2_2x                 0            0    48000000          0 0  
    audio1_mux                            0            0    24000000          0 0  
       audio1                             0            0    24000000          0 0  
          audio1_doubler                  0            0    48000000          0 0  
             audio1_div                   0            0    48000000          0 0  
                audio1_2x                 0            0    48000000          0 0  
    audio0_mux                            0            0    24000000          0 0  
       audio0                             0            0    24000000          0 0  
          audio0_doubler                  0            0    48000000          0 0  
             audio0_div                   0            0    48000000          0 0  
                audio0_2x                 0            0    48000000          0 0  
 clk_32k                                  1            1       32768          0 0  
    blink_override                        0            0       32768          0 0  
       blink                              0            0       32768          0 0  
    kbc                                   0            0       32768          0 0  
    rtc                                   2            2       32768          0 0  
 osc                                      2            2    12000000          0 0  
    pll_ref                               5            5    12000000          0 0  
       pll_x                              0            0   696000000          0 0  
          pll_x_out0                      0            0   348000000          0 0  
       gpu                                0            0    12000000          0 0  
       pll_p                             16           16   408000000          0 0  
          hda2codec_2x                    1            1    48000000          0 0  
          hda                             1            1   102000000          0 0  
          sata_oob                        1            1   204000000          0 0  
          sata                            2            2   102000000          0 0  
          sbc4                            1            1    19902440          0 0  
          dfll_ref                        2            2    51000000          0 0  
          dfll_soc                        2            2    51000000          0 0  
          dsiblp                          0            0    68000000          0 0  
          dsialp                          0            0    68000000          0 0  
          host1x                          2            2   136000000          0 0  
          vde                             0            0   408000000          0 0  
          uartc                           0            0   408000000          0 0  
          uartb                           0            0   408000000          0 0  
          uarta                           0            0   408000000          0 0  
          uartd                           1            1   408000000          0 0  
          csite                           1            1   204000000          0 0  
          soc_therm                       0            0    51000000          0 0  
          sdmmc4                          1            1    51000000          0 0  
          sdmmc3                          1            1    48000000          0 0  
          spdif_in                        0            0   408000000          0 0  
          mselect                         2            2   102000000          0 0  
             afi                          1            1   102000000          0 0  
          se                              0            0   102000000          0 0  
          i2c5                            1            2    81600000          0 0  
          pll_p_out5_div                  0            0   408000000          0 0  
             pll_p_out5                   0            0   408000000          0 0  
          pll_p_out4_div                  0            0   204000000          0 0  
             pll_p_out4                   0            0   204000000          0 0  
          pll_p_out3_div                  0            0   102000000          0 0  
             pll_p_out3                   0            0   102000000          0 0  
                csi                       0            0   102000000          0 0  
                clk72mhz                  0            0   102000000          0 0  
                   mipi-cal               0            0   102000000          0 0  
                hdmi_audio                0            0   102000000          0 0  
          pll_p_out2_div                  1            1   102000000          0 0  
             pll_p_out2                   1            1   102000000          0 0  
                sclk                      2            2   102000000          0 0  
                   hclk_div               1            1    51000000          0 0  
                      hclk                1            1    51000000          0 0  
                         pclk_div           1            1    51000000          0 0  
                            pclk           2            2    51000000          0 0  
                               apbdma           1            1    51000000          0 0  
                               cec           0            0    51000000          0 0  
          pll_p_out1_div                  1            1     9600000          0 0  
             pll_p_out1                   1            1     9600000          0 0  
                pll_a                     2            2   282240000          0 0  
                   pll_a_out0_div           1            1    11289600          0 0  
                      pll_a_out0           2            2    11289600          0 0  
                         i2s4             0            0    11289600          0 0  
                         i2s3             0            0    11289600          0 0  
                         i2s2             0            0    11289600          0 0  
                         i2s1             0            0    11289600          0 0  
                         i2s0             0            0    11289600          0 0  
                         extern1           2            2    11289600          0 0  
                            clk_out_1_mux           2            2    11289600          0 0  
                               clk_out_1           1            1    11289600          0 0  
          dpaux                           0            0    24000000          0 0  
       pll_d2                             1            1   296000000          0 0  
          pll_d2_out0                     2            2   296000000          0 0  
             disp1                        1            1   296000000          0 0  
             hdmi                         1            1   296000000          0 0  
       pll_dp                             0            0    18750000          0 0  
       pll_c4                             0            0    18750000          0 0  
       pll_e                              4            4   100000000          0 0  
          cml1                            1            1   100000000          0 0  
          cml0                            1            1   100000000          0 0  
       pll_re_vco                         0            0   672000000          0 0  
          pll_re_out                      0            0   672000000          0 0  
             xusb_host_src                0            0   112000000          0 0  
                xusb_host                 0            0   112000000          0 0  
             xusb_falcon_src              0            0   224000000          0 0  
       pll_d                              0            0   925000000          0 0  
          pll_d_out0                      0            0   462500000          0 0  
             pll_d_dsi_out                0            0   462500000          0 0  
                dsib                      0            0   462500000          0 0  
                dsia                      0            0   462500000          0 0  
       pll_u                              3            3   480000000          0 0  
          pll_u_12M                       0            0    12000000          0 0  
          pll_u_48M                       0            0    48000000          0 0  
             xusb_fs_src                  0            0    48000000          0 0  
          pll_u_60M                       0            0    60000000          0 0  
             xusb_hs_src                  0            0    60000000          0 0  
          pll_u_480M                      0            0   480000000          0 0  
             xusb_ss_src                  0            0   120000000          0 0  
                xusb_ss                   0            0   120000000          0 0  
                xusb_ss_div2              0            0    60000000          0 0  
       pll_m                              1            1   924000000          0 0  
          isp                             0            0   924000000          0 0  
             ispb                         0            0   924000000          0 0  
          vi_sensor                       0            0   924000000          0 0  
          vi_sensor2                      0            0   924000000          0 0  
          vic03                           0            0   924000000          0 0  
          vi                              0            0   924000000          0 0  
          pll_m_ud                        1            1   924000000          0 0  
             emc                          1            1   924000000          0 0  
                mc                        0            0   462000000          0 0  
          pll_m_out1_div                  0            0   924000000          0 0  
             pll_m_out1                   0            0   924000000          0 0  
       pll_c3                             0            0   300000000          0 0  
          msenc                           0            0   300000000          0 0  
          tsec                            0            0   300000000          0 0  
       pll_c2                             0            0   300000000          0 0  
       pll_c                              0            0   768000000          0 0  
          pll_c_ud                        0            0   768000000          0 0  
          pll_c_out1_div                  0            0    96000000          0 0  
             pll_c_out1                   0            0    96000000          0 0  
    clk_m                                 6           10    12000000          0 0  
       tsensor                            0            0      400000          0 0  
       cclk_lp                            0            0    12000000          0 0  
       clk_out_3_mux                      0            0    12000000          0 0  
          clk_out_3                       0            0    12000000          0 0  
       clk_out_2_mux                      0            0    12000000          0 0  
          clk_out_2                       0            0    12000000          0 0  
       pcie                               1            1    12000000          0 0  
       vim2_clk                           0            0    12000000          0 0  
       sata_cold                          0            0    12000000          0 0  
       dtv                                0            0    12000000          0 0  
       dp2                                0            0    12000000          0 0  
       dds                                0            0    12000000          0 0  
       csus                               0            0    12000000          0 0  
       usb3                               1            1    12000000          0 0  
       usb2                               1            1    12000000          0 0  
       usbd                               1            1    12000000          0 0  
       bsev                               0            0    12000000          0 0  
       bsea                               0            0    12000000          0 0  
       hda2hdmi                           1            1    12000000          0 0  
       apbif                              0            0    12000000          0 0  
       kfuse                              0            0    12000000          0 0  
       fuse_burn                          0            0    12000000          0 0  
       fuse                               0            0    12000000          0 0  
       vcp                                0            0    12000000          0 0  
       timer                              2            2    12000000          0 0  
       xusb_dev_src                       0            0    12000000          0 0  
          xusb_dev                        0            0    12000000          0 0  
       sor0                               0            0    12000000          0 0  
       disp2                              0            0    12000000          0 0  
       sor0_lvds                          0            0    12000000          0 0  
       entropy                            0            0    12000000          0 0  
       extern3                            0            0    12000000          0 0  
       extern2                            0            0    12000000          0 0  
       sdmmc2                             0            0    12000000          0 0  
       sdmmc1                             0            0    12000000          0 0  
       amx1                               0            0    12000000          0 0  
       adx1                               0            0    12000000          0 0  
       sbc6                               0            0    12000000          0 0  
       sbc5                               0            0    12000000          0 0  
       sbc3                               0            0    12000000          0 0  
       sbc2                               0            0    12000000          0 0  
       sbc1                               0            0    12000000          0 0  
       i2cslow                            0            0    12000000          0 0  
       actmon                             0            0    12000000          0 0  
       cile                               0            0    12000000          0 0  
       cilcd                              0            0    12000000          0 0  
       cilab                              0            0    12000000          0 0  
       mipi                               0            0    12000000          0 0  
       nor                                0            0    12000000          0 0  
       owr                                0            0    12000000          0 0  
       trace                              0            0    12000000          0 0  
       la                                 0            0    12000000          0 0  
       vfir                               0            0    12000000          0 0  
       amx                                0            0    12000000          0 0  
       adx                                0            0    12000000          0 0  
       pwm                                0            0    12000000          0 0  
       spdif_out                          0            0    12000000          0 0  
       i2c6                               0            0    12000000          0 0  
       i2c4                               0            1    12000000          0 0  
       i2c3                               0            1    12000000          0 0  
       i2c2                               0            1    12000000          0 0  
       i2c1                               0            1    12000000          0 0  
       dam2                               0            0    12000000          0 0  
       dam1                               0            0    12000000          0 0  
       dam0                               0            0    12000000          0 0  
       d_audio                            0            0    12000000          0 0  
       clk_m_div4                         0            0     3000000          0 0  
       clk_m_div2                         0            0     6000000          0 0  
 

-- 
nvpublic
