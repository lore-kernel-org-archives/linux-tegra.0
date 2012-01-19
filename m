From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Wed, 18 Jan 2012 21:35:23 -0800
Message-ID: <20120119053523.GB27447@quad.lixom.net>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
 <1326342789-5781-11-git-send-email-sjg@chromium.org>
 <4F174C3E.2090403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F174C3E.2090403-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 18, 2012 at 03:48:30PM -0700, Stephen Warren wrote:
> On 01/11/2012 09:32 PM, Simon Glass wrote:
> > This adds a property to indicate a port which can switch between host and device
> > mode.
> > 
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > 
> >  doc/device-tree-bindings/usb/tegra-usb.txt |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
> > index 035d63d..96fd022 100644
> > --- a/doc/device-tree-bindings/usb/tegra-usb.txt
> > +++ b/doc/device-tree-bindings/usb/tegra-usb.txt
> > @@ -11,3 +11,7 @@ Required properties :
> >   - phy_type : Should be one of "ulpi" or "utmi".
> >   - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
> >     activated for the bus to be powered.
> > +
> > +Optional properties:
> > + - support-host-mode : If present then this peripheral can switch between
> > +   host and device mode
> 
> All of Tegra's USB ports support host mode, and it's the typical mode of
> operation. The TRM also indicates that all USB ports support device mode
> (possibly depending on the PHY type that's been selected for or attached
> to port). Port 2 explicitly doesn't support run-time switching, but by
> omission, ports 1 and 3 do.
> 
> Hence, "support-host-mode" is not an accurate name, and doesn't match
> the description given either.
> 
> I think that it'd be better to:
> * Add properties to explicitly specify whether the port is
> intended/allowed to operate (per board design) in each of host or device
> mode.
> * Default to static host mode if no properties are present.
> 
> i.e.:
> 
> +Optional properties:
> + - enable-host-mode : Indicate that the port is intended to operate in
> +   host mode.
> + - enable-device-mode : Indicate that the port is intended to operate
> +   in device mode.

fsl-usb.txt uses "dr_mode" here, which might make sense to reuse given some of
the shared IP in question for device mode:

 - dr_mode : indicates the working mode for "fsl-usb2-dr" compatible
   controllers.  Can be "host", "peripheral", or "otg".  Default to
   "host" if not defined for backward compatibility.


-Olof
