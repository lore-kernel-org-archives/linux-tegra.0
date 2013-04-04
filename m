From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/7] ARM: tegra: update device trees for USB binding
 rework
Date: Thu, 4 Apr 2013 18:31:39 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E50BE48AE@BGMAIL02.nvidia.com>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
 <1364978502-22887-3-git-send-email-vbyravarasu@nvidia.com>
 <515C8024.30204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515C8024.30204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Thursday, April 04, 2013 12:47 AM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org;
> stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2 2/7] ARM: tegra: update device trees for USB binding
> rework
> 
> On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> > This patch updates all Tegra board files so that they contain all the
> 
> The binding documentation says that the vbus-supply property is required
> in all cases. However, many of the DT files still don't have that
> property even after this patch. That's inconsistent.

Will edit the binding to have the vbus-supply only for otg cases. 

> 
> > diff --git a/arch/arm/boot/dts/tegra20-iris-512.dts
> b/arch/arm/boot/dts/tegra20-iris-512.dts
> > index 52f1103..c99eccc 100644
> > --- a/arch/arm/boot/dts/tegra20-iris-512.dts
> > +++ b/arch/arm/boot/dts/tegra20-iris-512.dts
> > @@ -41,6 +41,10 @@
> >  		dr_mode = "otg";
> >  	};
> >
> > +	usb-phy@c5000000 {
> > +		dr_mode = "otg";
> > +	};
> 
> Since this port claims to be OTG-capable, presumably a vbus-supply
> property is mandatory here? If you don't know enough about the board to
> correctly set up such a regulator, lets just mark this port as host-only
> for now; we can switch it back to OTG-mode later once someone implements
> the required regulator. This won't lose any functionality, since we
> don't support OTG-mode yet anyway. However, it will allow the device
> tree to be correct/consistent in the mean time.
 
Agree completely.
Will update the patch accordingly and send for review.

> 
> > diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts
> b/arch/arm/boot/dts/tegra20-seaboard.dts
> 
> > +	usb-phy@c5000000 {
> > +		vbus-supply = <&vbus_reg>;
> > +		dr_mode = "otg";
> > +	};
> 
> Where is the nvidia,vbus-gpio property? Since your code changes don't
> actually implement use of the vbus-supply property yet, they will expect
> the vbus-gpio property to exist in the PHY node.

As of now Vbus-gpio is being used by EHCI driver only.
As anyways we wanted to use vbus-supply, will implement its
support in PHY driver and remove vbus-gpio from EHCI node. 
Hence did not add vbus-gpio to PHY DT nodes.
