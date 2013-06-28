From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] usb: phy: tegra: Add support for device tree-based
 vbus regulator control
Date: Fri, 28 Jun 2013 10:17:15 +0300
Message-ID: <20130628071715.GA3847@tbergstrom-lnx.Nvidia.com>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-2-git-send-email-mperttunen@nvidia.com>
 <51CB217B.1040308@wwwdotorg.org>
 <op.wzbtct1hpdlnwf@mperttunen-lnx>
 <51CC6506.4000503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CC6506.4000503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 27, 2013 at 06:15:02PM +0200, Stephen Warren wrote:
> On 06/27/2013 01:20 AM, Mikko Perttunen wrote:
> > On Wed, 26 Jun 2013 20:14:35 +0300, Stephen Warren
> > <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> > 
> >> On 06/26/2013 03:59 AM, Mikko Perttunen wrote:
> >>> After this patch, usb vbus regulators for tegra usb phy devices can
> >>> be specified
> >>> with the device tree attribute vbus-supply = <&x> where x is a
> >>> regulator defined
> >>> in the device tree.
> >>
> >>> diff --git a/drivers/usb/phy/phy-tegra-usb.c
> >>> b/drivers/usb/phy/phy-tegra-usb.c
> >>
> >>> @@ -250,12 +251,24 @@ static int utmip_pad_open(struct tegra_usb_phy
> >>> *phy)
> >>>          return PTR_ERR(phy->pad_clk);
> >>>      }
> >>>
> >>> +    phy->vbus = devm_regulator_get(phy->dev, "vbus");
> >>> +    /* On some boards, the VBUS regulator doesn't need to be
> >>> controlled */
> >>> +    if (IS_ERR(phy->vbus)) {
> >>> +        if (PTR_ERR(phy->vbus) == -ENODEV) {
> >>> +            dev_notice(phy->dev, "no vbus regulator");
> >>> +            phy->vbus = NULL;
> >>> +        } else {
> >>> +            return PTR_ERR(phy->vbus);
> >>> +        }
> >>> +    }
> >>
> >> I think this code should be added to some more core initialization
> >> function; IIRC, there are separate utmip_pad_open() and some other
> >> function for ULPI mode, and in the future there may be more for HSIC,
> >> etc.
> > 
> > I don't think ULPI and VBUS have a VBUS pin, though. The pinmux doesn't
> > even list a pin for USB2 which is a ULPI/HSIC only controller.
> 
> IIUC, ULPI, UTMI, and HSIC are just different physical layers for the
> USB data signals between Tegra and whatever is connected. Any of those
> could be translated to regular USB ports on the board. Certainly, UTMI
> is the common one for external ports, and we have Tegra boards with ULPI
> PHYs that translate to regular external ports. I don't know about HSIC;
> it's less common, but I see no reason one couldn't have a PHY that
> translates it to an external USB socket just like the rest.
> 

AFAIK HSIC is meant to attach eg modems or other onboard peripherals to USB
without having the (power) overhead of a PHY on both host and device side.

Cheers,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
