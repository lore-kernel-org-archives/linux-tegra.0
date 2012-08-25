From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Shutdown problem in SMP system happened on Tegra20
Date: Sat, 25 Aug 2012 08:52:21 +0100
Message-ID: <20120825075221.GH18957@n2100.arm.linux.org.uk>
References: <A7051F87A141B744BCAF487D48E5B3BDF5BA982848@HKMAIL02.nvidia.com> <20120824182133.GB18957@n2100.arm.linux.org.uk> <20120825073624.GI31998@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120825073624.GI31998-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Aug 25, 2012 at 03:36:27PM +0800, Shawn Guo wrote:
> On Fri, Aug 24, 2012 at 07:21:33PM +0100, Russell King - ARM Linux wrote:
> > Why not just ensure that CONFIG_PM_SLEEP_SMP is enabled if your platform
> > requires that the lowest CPU number be the CPU dealing with reboot?
> 
> I have CONFIG_PM_SLEEP_SMP enabled for imx6q, but still see the imx6q
> restart hook running on cpu1 than cpu0.  It seems that
> disable_nonboot_cpus is only called in kernel_power_off but never
> kernel_restart.  We should probably patch kernel_restart or
> machine_restart to have disable_nonboot_cpus called? 

Remember that this path gets called from IRQ context which makes calling
functions which sleep very dodgy.
