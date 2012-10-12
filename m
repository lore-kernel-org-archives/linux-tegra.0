From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra30: cpuidle: add LP2 driver for CPU0
Date: Fri, 12 Oct 2012 15:54:02 +0800
Message-ID: <20121012075358.GA4962@S2101-09.ap.freescale.net>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
 <1349691981-31038-8-git-send-email-josephl@nvidia.com>
 <5074AA0E.2080508@wwwdotorg.org>
 <1349954685.19413.207.camel@jlo-ubuntu-64.nvidia.com>
 <5076F5CB.4020200@wwwdotorg.org>
 <CAMbhsRScnEaEeyqGz6tfYQMHXaZva4UeHtFY4C9Vvu1MrKXPNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRScnEaEeyqGz6tfYQMHXaZva4UeHtFY4C9Vvu1MrKXPNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 11, 2012 at 09:48:45AM -0700, Colin Cross wrote:
> As is, coupled cpuidle will work on Tegra30, but it will unnecessarily
> wake up the secondary cpus during the transitions to off and back on
> again.  Those cpus will immediately go back to single-cpu LP2,

I'm sure coupled cpuidle will work like that.  We have the following
code at the end of  cpuidle_enter_state_coupled() to wait until all
coupled cpus have exited idle.

        while (!cpuidle_coupled_no_cpus_ready(coupled))
                cpu_relax();

The cpu woken up during the transitions will just loop there until all
other 3 cpus exit from idle function.

Shawn

> so it
> may not be a big deal, but there is a small optimization I've
> discussed with a few other people that could avoid waking them up.  I
> suggest adding an extra pre-idle hook to the Tegra30 that is called by
> coupled cpuidle on the last cpu to go down.  It would return a cpumask
> of cpus that have been prepared for idle by guaranteeing that they
> will not wake up from an interrupt, and therefore don't need to be
> woken up for the transitions.  I haven't worked with a cpu that needs
> this optimization yet, so I haven't done it.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
