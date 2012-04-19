From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH] cpuidle: allow per cpu latencies
Date: Thu, 19 Apr 2012 13:23:57 +0300
Message-ID: <20120419102357.GJ514@tbergstrom-lnx.Nvidia.com>
References: <1333619620-21201-1-git-send-email-pdeschrijver@nvidia.com>
 <4F7DA009.4010802@linux.intel.com>
 <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
 <4F7F0D52.8080305@linaro.org>
 <20120410102857.GA22721@tbergstrom-lnx.Nvidia.com>
 <20120416153456.GB514@tbergstrom-lnx.Nvidia.com>
 <4F8FD773.5030500@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F8FD773.5030500-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Trinabh Gupta <g.trinabh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Deepthi Dharwar <deepthi-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Lee <rob.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ricardo Salveti <ricardo.salveti-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 19, 2012 at 11:14:27AM +0200, Daniel Lezcano wrote:
> On 04/16/2012 05:34 PM, Peter De Schrijver wrote:
> >>
> >> Maybe we also want to make the 'disabled' flag per CPU then or provide some
> >> other way the number of C states can be different per CPU?
> >
> > What do you think about this? Do we also want to make the disabled flag per
> > CPU? Or how should we deal with a different number of C states per CPU?
> 
> Hi Peter,
> 
> yes, that could makes sense. But in most of the architecture, this is 
> not needed, so duplicating the state's array and latencies is unneeded 
> memory consumption.
> 
> Maybe we can look for a COW approach, similar to what is done for the 
> nsproxy structure, no ?
> 

That could be easily solved by just having a pointer to the state table in the
per CPU datastructure I think?


Cheers,

Peter.
