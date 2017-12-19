From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: enable secure platform-only erratas
Date: Tue, 19 Dec 2017 23:28:11 +0000
Message-ID: <20171219232810.GI10595@n2100.armlinux.org.uk>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
 <77ce738c15b992a92bee3a18e5468342fb2dc5ab.1500510157.git.mirq-linux@rere.qmqm.pl>
 <bdff72b9-8ebd-a426-b27b-fe055d45cfb1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bdff72b9-8ebd-a426-b27b-fe055d45cfb1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 05, 2017 at 09:16:12PM +0300, Dmitry Osipenko wrote:
> On 20.07.2017 03:29, Michał Mirosław wrote:
> > Allow secure-only erratas to be used in multiarch kernel.
> > 
> > Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> > ---
> >  arch/arm/Kconfig | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index a208bfe367b5..a1eff866550b 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -696,6 +696,14 @@ config ARCH_MULTI_CPU_AUTO
> >  
> >  endmenu
> >  
> > +config ARCH_ASSUME_SECURE_PLATFORM
> > +	bool "Enable ERRATAs using secure-only registers"
> > +	default !ARCH_MULTIPLATFORM
> 
> I think default should always be "Yes" and this option shouldn't affect
> multiplatform kernels. So a multiplatform kernel wouldn't be an option
> for your device.

No, that changes the current behaviour.

Current behaviour is for the secure-only errata to be disabled when the
multi-platform option is enabled, because multi-platform kernels have to
be able to run in the non-secure world.  Defaulting this option to "yes"
means that these errata become visible.

I have to wonder why you need this though - your patches seem to be
targetting a platform that runs in non-secure world, and enabling these
errata would make the kernel non-bootable on your platform.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
