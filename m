From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Shutdown problem in SMP system happened on Tegra20
Date: Mon, 27 Aug 2012 13:43:07 +0800
Message-ID: <A7051F87A141B744BCAF487D48E5B3BDF5BA98284F@HKMAIL02.nvidia.com>
References: <A7051F87A141B744BCAF487D48E5B3BDF5BA982848@HKMAIL02.nvidia.com>
 <20120824182133.GB18957@n2100.arm.linux.org.uk>
 <A7051F87A141B744BCAF487D48E5B3BDF5BA98284A@HKMAIL02.nvidia.com>
 <20120825071755.GG18957@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120825071755.GG18957-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Russell King - ARM Linux' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "'linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> On Sat, Aug 25, 2012 at 08:00:56AM +0800, Bill Huang wrote:
> > nvpublic
> > > So what you're asking for is a feature to do what
> > > CONFIG_PM_SLEEP_SMP does, but without CONFIG_PM_SLEEP_SMP enabled?
> >
> > Yeah pretty much, I'm actually asking should we take care of this
> > since maybe not all platforms will have this config enabled?
> > >
> > > Why not just ensure that CONFIG_PM_SLEEP_SMP is enabled if your
> > > platform requires that the lowest CPU number be the CPU dealing with reboot?
> >
> > Someday we will have it enabled, but before that we'll hit the issue,
> > so you don't think this should be taken care of? Thanks.
> 
> Well, just enable CONFIG_PM_SLEEP_SMP then - it'll be far better than trying to implement something in
> the ARM code, especially as sysrq can be used for poweroff/reboot etc (which will run from atomic
> contexts where you can't switch to another CPU.)
> 
> What you're asking for will make these callbacks fragile for other platforms.

OK, thanks.
