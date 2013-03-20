From: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra114: add speedo-based process
 identification
Date: Wed, 20 Mar 2013 09:42:51 +0800
Message-ID: <1363743771.3573.55.camel@dahuang-vm>
References: <1363605454-24176-1-git-send-email-dahuang@nvidia.com>
	 <5148A645.9020009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148A645.9020009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-20 at 01:54 +0800, Stephen Warren wrote:
> On 03/18/2013 05:17 AM, Danny Huang wrote:
> > Add speedo-based process identifictaion for Tegra114.
> 
> I have applied this to Tegra's for-3.10/soc branch, with one addition below:
> 
> > diff --git a/arch/arm/mach-tegra/tegra114_speedo.c b/arch/arm/mach-tegra/tegra114_speedo.c
> 
> > +#include <linux/kernel.h>
> 
> Here, I also added:
> 
> #include <linux/bug.h>
> 
> That's not needed in the Tegra for-next branch (which is based on
> 3.9-rc1), but is needed when merged into linux-next, and hence will
> presumably be needed once this is submitted into 3.10.

Thanks. Does it mean that we have to include the bug.h for all newly
created file for 3.10?
