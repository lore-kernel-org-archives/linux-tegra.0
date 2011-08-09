From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks required for usboperation
Date: Tue, 9 Aug 2011 21:26:28 +0200
Message-ID: <201108092126.28521.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 09 August 2011 20:35:45 you wrote:
> Marc Dietrich wrote at Tuesday, August 09, 2011 12:29 PM:
> > These clocks are required for usb operation.
> > ---
> > 
> >  arch/arm/mach-tegra/board-paz00.c |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/mach-tegra/board-paz00.c
> > b/arch/arm/mach-tegra/board-paz00.c index 45111f6..89a3dda 100644
> > --- a/arch/arm/mach-tegra/board-paz00.c
> > +++ b/arch/arm/mach-tegra/board-paz00.c
> > @@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table
> > paz00_clk_init_table[] = {
> > 
> >  	/* name		parent		rate		enabled */
> >  	{ "uarta",	"pll_p",	216000000,	true },
> >  	{ "uartd",	"pll_p",	216000000,	true },
> > 
> > +
> > +	{ "pll_p_out4",	"pll_p",	24000000,	true },
> 
> Do you need the pll_p_out4 entry? What's that driving? Check in
> /sys/kernel/debug/clock/clock_tree (/sys/kernel/debug is debugfs).

I think it is only required to setup the correct (non-standard?) frequency. 
Seems all other boards use 108 MHz which cause one of the ports to fail. Don't 
ask me for details ...

Here is the clock tree (as it is for 3.1):

root@ac100:~# cat /sys/kernel/debug/clock/clock_tree 
   clock                          state  ref div      rate
--------------------------------------------------------------
   cdev2                          on     1            26000000  
  *cdev1                          off    0            26000000  
   clk_m                          on     9            12000000  
     *pcie_xclk                   off    0   1        12000000  
     *afi                         off    0   1        12000000  
     *pex                         off    0   1        12000000  
     *csus                        off    0   1        12000000  
     *isp                         off    0   1        12000000  
      usb3                        on     1   1        12000000  
      usb2                        on     2   1        12000000  
      usbd                        on     1   1        12000000  
     *disp2                       off    0   1        12000000  
     *tvdac                       off    0   1        12000000  
     *hdmi                        off    0   1        12000000  
     *tvo                         off    0   1        12000000  
     *cve                         off    0   1        12000000  
     *uarte                       off    0   1        12000000  
     *uartc                       off    0   1        12000000  
     *uartb                       off    0   1        12000000  
      dvc                         off    0   4        3000000   
     *i2c3                        on     0   15       800000    
      i2c2                        off    0   4        3000000   
      i2c1                        off    0   4        3000000   
     *mipi                        off    0   1        12000000  
     *nor                         off    0   1        12000000  
     *owr                         off    0   1        12000000  
     *la                          off    0   1        12000000  
     *bsev                        off    0   1        12000000  
     *bsea                        off    0   1        12000000  
     *vcp                         off    0   1        12000000  
     *sdmmc3                      off    0   1        12000000  
     *sdmmc2                      off    0   1        12000000  
      sdmmc1                      on     1   1        12000000  
     *vfir                        off    0   1        12000000  
     *ndflash                     off    0   1        12000000  
     *ide                         off    0   1        12000000  
     *sbc4                        off    0   1        12000000  
     *sbc3                        off    0   1        12000000  
     *sbc2                        off    0   1        12000000  
     *sbc1                        off    0   1        12000000  
     *twc                         off    0   1        12000000  
     *xio                         off    0   1        12000000  
     *spi                         off    0   1        12000000  
     *spdif_out                   off    0   1        12000000  
     *i2s2                        off    0   1        12000000  
     *i2s1                        off    0   1        12000000  
      timer                       on     1   1        12000000  
     *clk_d                       on     0   x2       24000000  
     *pll_e                       off    0   x100     1200000000
      pll_x                       off    0   x26      312000000 
      pll_u                       on     2   x40      480000000 
     *pll_d                       off    0   12       1000000   
        *dsi                      off    0   1        1000000   
        *pll_d_out0               off    0   2        500000    
      pll_p                       on     10  x18      216000000 
        *disp1                    on     0   1        216000000 
        *host1x                   off    0   2        108000000 
         uartd                    on     1   1        216000000 
         uarta                    on     1   1        216000000 
         csite                    on     1   1.5      144000000 
         sdmmc4                   on     1   4.5      48000000  
        *pwm                      on     0   128.5    1680933   
        *spdif_in                 off    0   6        36000000  
         cclk                     on     1            216000000 
            cpu                   on     3            216000000 
         pll_p_out4               on     3   9        24000000  
            sclk                  on     2            24000000  
               avp.sclk           off    0            24000000  
               cop                on     1            24000000  
               hclk               on     2   1        24000000  
                  pclk            on     2   2        12000000  
                     apbdma       on     1   1        12000000  
         pll_p_out3               on     4   3        72000000  
           *csi                   off    0   1        72000000  
            dvc_i2c               on     1   1        72000000  
           *i2c3_i2c              on     0   1        72000000  
            i2c2_i2c              on     1   1        72000000  
            i2c1_i2c              on     1   1        72000000  
         pll_p_out2               on     1   4.5      48000000  
         pll_p_out1               on     1   7.5      28800000  
           *pll_a                 on     0   x1.9..   56448000  
              *pll_a_out0         on     0   5        11289600  
                 *audio           on     0            11289600  
                    *audio_2x     off    0   x2       22579200  
     *pll_c                       on     0   x50      600000000 
        *vde                      off    0   2.5      240000000 
        *pll_c_out1               on     0   2.5      240000000 
      pll_m                       on     1   x55.5    666000000 
        *mpe                      off    0   6        111000000 
        *epp                      off    0   6        111000000 
        *vi_sensor                off    0   6        111000000 
        *vi                       off    0   6        111000000 
        *2d                       off    0   6        111000000 
        *3d                       off    0   6        111000000 
         emc                      on     3   1        666000000 
            usb3.emc              off    0            666000000 
            usb2.emc              on     1            666000000 
            usb1.emc              off    0            666000000 
            usbd.emc              off    0            666000000 
            host.emc              off    0            666000000 
            hdmi.emc              off    0            666000000 
            disp2.emc             off    0            666000000 
            disp1.emc             off    0            666000000 
            cpu.emc               on     2            666000000 
            avp.emc               off    0            666000000 
        *pll_m_out1               on     0   3        222000000 
   clk_32k                        on     2            32768     
      rtc                         on     1   1        32768     
     *blink                       off    0   393208   0         
     *pll_s                       off    0   1        32768   
