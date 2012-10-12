From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra30: cpuidle: add LP2 driver for CPU0
Date: Fri, 12 Oct 2012 13:50:35 -0700
Message-ID: <CAMbhsRRGyPB1DvXqkmNpF=hA-3ya5Y+JLV-KY5BW+FX_RoEc9g@mail.gmail.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
	<1349691981-31038-8-git-send-email-josephl@nvidia.com>
	<5074AA0E.2080508@wwwdotorg.org>
	<1349954685.19413.207.camel@jlo-ubuntu-64.nvidia.com>
	<5076F5CB.4020200@wwwdotorg.org>
	<CAMbhsRScnEaEeyqGz6tfYQMHXaZva4UeHtFY4C9Vvu1MrKXPNg@mail.gmail.com>
	<20121012075358.GA4962@S2101-09.ap.freescale.net>
	<1350030264.15495.14.camel@jlo-ubuntu-64.nvidia.com>
	<20121012083017.GB4962@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121012083017.GB4962-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 12, 2012 at 1:30 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 12, 2012 at 04:24:24PM +0800, Joseph Lo wrote:
>> On Fri, 2012-10-12 at 15:54 +0800, Shawn Guo wrote:
>> > On Thu, Oct 11, 2012 at 09:48:45AM -0700, Colin Cross wrote:
>> > > As is, coupled cpuidle will work on Tegra30, but it will unnecessarily
>> > > wake up the secondary cpus during the transitions to off and back on
>> > > again.  Those cpus will immediately go back to single-cpu LP2,
>> >
>> > I'm sure coupled cpuidle will work like that.  We have the following
>> > code at the end of  cpuidle_enter_state_coupled() to wait until all
>> > coupled cpus have exited idle.
>> >
>> >         while (!cpuidle_coupled_no_cpus_ready(coupled))
>> >                 cpu_relax();
>> >
>> > The cpu woken up during the transitions will just loop there until all
>> > other 3 cpus exit from idle function.
>> >
>>
>> Did this a good idea if the CPU was been woken up from an interrupt but
>> it still needed to wait all other CPUs been woken up then it could
>> handle the interrupt?
>>
> This is how coupled cpuidle gets implemented right now.  And that's
> why I see RCU stall warning reported on that cpu when I tried coupled
> cpuidle on imx6q (CA9 Quad).

Current coupled cpuidle requires all cpus to wake up together and go
back to the idle governor to select a new state, because that's what
all available ARM cpus did when I wrote it.  You should be able to
implement coupled idle on a cpu that does not need to wake all the
cpus if you wake them anyways, and then later you can optimize it to
avoid the extra wakeups when the extension to coupled cpuidle that I
discussed previously gets implemented.
