From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/panel: add support for EDT panels
Date: Thu, 15 May 2014 10:27:29 +0200
Message-ID: <1400142449.4102.16.camel@paszta.hi.pengutronix.de>
References: <cover.1400103181.git.stefan@agner.ch>
	 <35c081171a3d9a9401767601c02a12e266b37dd0.1400103181.git.stefan@agner.ch>
	 <20140515075102.GE5952@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515075102.GE5952@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 15.05.2014, 09:51 +0200 schrieb Thierry Reding:
> On Wed, May 14, 2014 at 11:45:57PM +0200, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> > From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > 
> > This panels are sold by Toradex for Colibri T20/T30 and Apalis T30
> > evaluation kits.
> > 
> > Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> Panel patches should go to the dri-devel mailing list as well.
> 
> Also a patch was posted only yesterday for a panel that seems to be the
> exact same one as this, even though the name differs minimally, see:
> 
> 	https://patchwork.kernel.org/patch/4175251/
> 
> Adding Philipp on Cc so you guys can work together whether this is
> indeed the same panel. The only differences seem to be in the vertical
> front and back porches, but I suspect that either settings will work on
> both Tegra and i.MX.

The ETM0700G0DH6 Datasheet lists 2 lines as the typical vsync pulse
width, 525 lines as the vertical period, and 35 lines as the vsync -de
time, which is vsync len + back porch.
So vertical timings 480 + 10 + 2 + 33 = 525 should be valid for the
ET0700G0DH6 panel:

https://www.glynshop.com/erp/owweb/Daten/DSS/EDT/Products/Specifications/Active%20Displays/ET0700G0DH6.pdf
et070080dh6

I have not seen the data sheet for ET070080DH6.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
