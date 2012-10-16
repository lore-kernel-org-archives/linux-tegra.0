From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra30: cpuidle: add LP2 driver for CPU0
Date: Tue, 16 Oct 2012 11:06:34 +0300
Message-ID: <20121016080634.GG3196@tbergstrom-lnx.Nvidia.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
 <1349691981-31038-8-git-send-email-josephl@nvidia.com>
 <5074AA0E.2080508@wwwdotorg.org>
 <1349954685.19413.207.camel@jlo-ubuntu-64.nvidia.com>
 <5076F5CB.4020200@wwwdotorg.org>
 <1350025676.20241.82.camel@jlo-ubuntu-64.nvidia.com>
 <507885D4.10604@wwwdotorg.org>
 <1350287799.23354.23.camel@jlo-ubuntu-64.nvidia.com>
 <507C32E8.1040701@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507C32E8.1040701-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > Even though we have plan to use coupled cpuidle, I still prefer to go
> > with the LP2 driver first. Then adding one more patch to support coupled
> > cpuidle based on LP2 driver. This is good for history. And if there is
> > any issue, it's more easy to roll back to the stable one.
> 
> I don't think that implementing it one way and then changing to a
> different way will benefit history at all. It'll make the history more
> complicated. What exactly is the problem with just using coupled cpuidle
> from the start? If we did merge this implementation now, then switch to
> coupled cpuidle later, when do you think the switch would happen?
> 

Before we consider doing this, I think we should have some idea on how
frequently we run into the situation where CPU0 is idle but a secondary
core is not. Depending on that we can then decide how useful coupled cpuidle
would be for us.

Cheers,

Peter.
