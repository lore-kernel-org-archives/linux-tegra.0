From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: Fix build error with
	tegra_assert_system_reset
Date: Wed, 23 Nov 2011 08:59:48 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C6CC@HQMAIL01.nvidia.com>
References: <1322009631-711-1-git-send-email-swarren@nvidia.com>
 <20111123095009.GG9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111123095009.GG9581-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell King wrote at Wednesday, November 23, 2011 2:50 AM:
> On Tue, Nov 22, 2011 at 05:53:51PM -0700, Stephen Warren wrote:
> > Build error:
> >
> > error: static declaration of 'tegra_assert_system_reset' follows non-static
> > declaration
> >
> > Fix:
> >
> > Remove the non-static declaration; the function should be local now.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Thanks Stephen.  I'd prefer to fix this a different way, moving tegra to
> use the .restart method instead.  So, I'm about to merge this into the
> commit which created your error.
> ...

OK, I tested that and it works too.

Thanks!

-- 
nvpublic
