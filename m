From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] arm/tegra: prepare early init for multiple tegra
 variants
Date: Tue, 1 Nov 2011 15:37:47 +0200
Message-ID: <20111101133747.GF13358@tbergstrom-lnx.Nvidia.com>
References: <1319561644-6160-1-git-send-email-pdeschrijver@nvidia.com>
 <1319561644-6160-4-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B49B2@HQMAIL01.nvidia.com>
 <20111027201657.GP19187@n2100.arm.linux.org.uk>
 <20111028161933.GK23539@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111028161933.GK23539-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 28, 2011 at 06:19:34PM +0200, Will Deacon wrote:
> On Thu, Oct 27, 2011 at 09:16:57PM +0100, Russell King - ARM Linux wrote:
> > On Thu, Oct 27, 2011 at 01:06:13PM -0700, Stephen Warren wrote:
> > > Peter De Schrijver wrote at Tuesday, October 25, 2011 10:54 AM:
> > > > -static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
> > > > +void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
> > > 
> > > I'm not sure why you moved that, but I suppose it's fine.
> > 
> > Note that Nicolas has a patch set during KS which cleans the arch_reset
> > business out of mach/system.h, and effectively gets rid of arch_reset
> > entirely, so this probably conflicts with those changes.
> 
> I've spammed the ARM list with this patch series now, so the state of the
> conflicts should be evident.
> 

Will be taken into account in the next version.

Chers,

Peter.
