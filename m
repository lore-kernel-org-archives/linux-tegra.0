From: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Subject: Re: [PATCH] fix drivers/staging/nvec linkage error when keyboard is
 disabled
Date: Mon, 10 Oct 2011 22:20:11 +0200
Message-ID: <20111010202011.GA7220@jak-linux.org>
References: <20112.34922.209107.730268@pilspetsen.it.uu.se>
 <1534774.fR3YHUzZE9@fb07-iapwap2>
 <74CDBE0F657A3D45AFBB94109FB122FF173B23B539@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173B23B539-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Greg KH (gregkh-l3A5Bk7waGM@public.gmane.org)" <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 10, 2011 at 10:25:07AM -0700, Stephen Warren wrote:
> Marc Dietrich wrote at Sunday, October 09, 2011 9:48 AM:
> > Hi Mikael,
> > 
> > thanks for review. The nvec driver received some overhaul in the 3.1 release cycle
> > and he fruids can be viewed in linux-next tree. The nvec client drivers were
> > converted to mfd children in the mean time. This solves the build error, but is not
> > very flexible. We are planing to move the mfd stuct to the board file(s) in the next
> > cycle.
> 
> Indeed, the code in v3.1-rc9 is quite different to that in linux-next, so
> this exact problem doesn't exist in linux-next.
> 
> However, don't we still want to solve build problems for the final v3.1
> release, or a stable update to that? As such,
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>

But I should also add that there are probably more build failures due to
dependencies, as there are no dependencies specified in Kconfig (so basically
all nvec-* modules are subject to build failure if there dependencies
are not enabled (INPUT/SERIO/whatever). There's a patch in -staging
and -next for that, it may need adoption for 3.1 but would be needed
to fix all build failures.

I do not have good internet currently and am busy, so I can't
do anything to fix those problems, but I should have time
and connection to review patches for 3.1 (perhaps adapted
from the -staging one).

> > Am Samstag, 8. Oktober 2011, 19:29:14 schrieb Mikael Pettersson:
> > > Building linux-3.1-rc9 for the Tegra ARM SoC with CONFIG_MFD_NVEC=y
> > > and CONFIG_KEYBOARD_NVEC=n results in the following linkage error:
> > >
> > > drivers/built-in.o: In function `tegra_nvec_probe':
> > > /tmp/linux-3.1-rc9/drivers/staging/nvec/nvec.c:373: undefined reference to
> > > `nvec_kbd_init' make: *** [.tmp_vmlinux1] Error 1
> > >
> > > Fixed by #ifdef:ing the call to nvec_kbd_init(), similar to the
> > > existing #ifdef CONFIG_SERIO_NVEC_PS2 around the nvec_ps2() call.
> > >
> > > Signed-off-by: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
> > > ---
> > >
> > > --- linux-3.1-rc9/drivers/staging/nvec/nvec.c.~1~	2011-10-08 16:28:20.000000000
> > > +0200 +++ linux-3.1-rc9/drivers/staging/nvec/nvec.c	2011-10-08 19:09:18.000000000
> > > +0200 @@ -370,7 +370,9 @@ static int __devinit tegra_nvec_probe(st
> > >  	nvec_write_async(nvec, EC_ENABLE_EVENT_REPORTING,
> > >  				sizeof(EC_ENABLE_EVENT_REPORTING));
> > >
> > > +#ifdef CONFIG_KEYBOARD_NVEC
> > >  	nvec_kbd_init(novec);
> > > +#endif
> > >  #ifdef CONFIG_SERIO_NVEC_PS2
> > >  	nvec_ps2(nvec);
> > >  #endif
> 
Live long and prosper!
-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.
