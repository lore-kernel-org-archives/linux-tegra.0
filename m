From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to
 *_noirq
Date: Tue, 24 Jul 2012 12:13:58 +0300
Message-ID: <20120724091358.GK12034@tbergstrom-lnx.Nvidia.com>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
 <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
 <500D96E6.4060507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <500D96E6.4060507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 23, 2012 at 08:24:38PM +0200, Stephen Warren wrote:
> On 07/10/2012 05:20 AM, Laxman Dewangan wrote:
> > To provide the late suspend and early resume for i2c
> > driver, convert the suspend/resume as
> > 	suspend-> suspend_noirq
> > 	resume -> resume_noirq
> > 
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Why do we need this change?
> 
> IIRC, I proposed it before solely to solve some suspend/resume ordering
> issues, and Colin Cross NAKd it. These days, deferred probe should make
> this change unnecessary.
> 

How does deferred probe solve this? Iirc the problem is that i2c is needed to
talk to the PMIC, so we need to make sure i2c is shutdown last because drivers
might want to do regulator control in the suspend function.

Cheers,

Peter.
