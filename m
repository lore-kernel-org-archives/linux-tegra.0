From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 10/10] arm/tegra: add support for tegra30 based
 board cardhu
Date: Fri, 9 Dec 2011 17:52:03 +0200
Message-ID: <20111209155203.GM27578@tbergstrom-lnx.Nvidia.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-11-git-send-email-pdeschrijver@nvidia.com>
 <4EE21B67.5040006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EE21B67.5040006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> >  choice
> >          prompt "Low-level debug console UART"
> >          default TEGRA_DEBUG_UART_NONE
> > diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
> > index cf51a00..7c1110f 100644
> > --- a/arch/arm/mach-tegra/Makefile.boot
> > +++ b/arch/arm/mach-tegra/Makefile.boot
> > @@ -7,3 +7,4 @@ dtb-$(CONFIG_MACH_PAZ00) += tegra-paz00.dtb
> >  dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
> >  dtb-$(CONFIG_MACH_TRIMSLICE) += tegra-trimslice.dtb
> >  dtb-$(CONFIG_MACH_VENTANA) += tegra-ventana.dtb
> > +dtb-$(CONFIG_MACH_CARDHU) += tegra-cardhu.dtb
> 
> Likewise, this should be more like:
> dtb-$(CONFIG_MACH_TEGRA_DT) += tegra-seaboard.dtb tegra-trimslice.dtb
> tegra-ventana.dtb ...
> 

I think is subject of a different patch.

Cheers,

Peter.
