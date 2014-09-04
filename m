From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: usb: phy: tegra: Program new PHY parameters
Date: Thu, 4 Sep 2014 17:20:32 +0300
Message-ID: <20140904142032.GQ6549@mwanda>
References: <20140904141002.GA30570@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140904141002.GA30570@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 04, 2014 at 05:10:02PM +0300, Dan Carpenter wrote:
> Hello Tuomas Tynkkynen,
> 
> The patch e497a24d8e18: "usb: phy: tegra: Program new PHY parameters"
> from Aug 12, 2013, leads to the following static checker warning:
> 
> 	drivers/usb/phy/phy-tegra-usb.c:460 utmi_phy_power_on()
> 	warn: 0x1fc is larger than 8 bits
> 
> drivers/usb/phy/phy-tegra-usb.c
>    101  #define   UTMIP_XCVR_HSSLEW(x)                  (((x) & 0x3) << 4)
>    102  #define   UTMIP_XCVR_HSSLEW_MSB(x)              ((((x) & 0x1fc) >> 2) << 25)
> 
> [snip]
> 
>    455          val |= UTMIP_XCVR_LSRSLEW(config->xcvr_lsrslew);
>    456  
>    457          if (phy->soc_config->requires_extra_tuning_parameters) {
>    458                  val &= ~(UTMIP_XCVR_HSSLEW(~0) | UTMIP_XCVR_HSSLEW_MSB(~0));

Btw, the only place where this matters is right here.  We end up masking
out a bit which we had not intended.  The extra '1' doesn't make a
difference to the line below which generated the static checker warning.

regards,
dan carpenter

>    459                  val |= UTMIP_XCVR_HSSLEW(config->xcvr_hsslew);
>    460                  val |= UTMIP_XCVR_HSSLEW_MSB(config->xcvr_hsslew);
>                                                      ^^^^^^^^^^^^^^^^^^^
> This is a u8 so it can only go up to 0xff and not 0x1fc.  Also 0xfc and
> 0x03 are symetric so I think 0xfc was probably intended?
> 
> But I don't know the hardware at all, this is pure guess work.
> 
>    461          }
>    462          writel(val, base + UTMIP_XCVR_CFG0);
> 
> regards,
> dan carpenter
