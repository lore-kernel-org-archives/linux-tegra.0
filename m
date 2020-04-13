From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Mon, 13 Apr 2020 11:51:41 +0530
Message-ID: <20200413062141.a6hmwipexhv3sctq@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20200326115023.xy3n5bl7uetuw7mx@vireshk-i7>
 <d233b26b-6b50-7d41-9f33-a5dc151e0e7d@nvidia.com>
 <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
 <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
 <08307e54-0e14-14a3-7d6a-d59e1e04a683@nvidia.com>
 <20200409074415.twpzu2n4frqlde7b@vireshk-i7>
 <00390070-38a1-19aa-ca59-42c4658bee7e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00390070-38a1-19aa-ca59-42c4658bee7e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09-04-20, 16:51, Sumit Gupta wrote:
> We are using "read_counters_work" as local variable. So every invocation the
> function will have its own copy of counters for corresponding cpu. That's
> why are doing INIT_WORK_ONSTACK here.

Why? To support parallel calls to reading the freq ?

> > > > > > > > > +     queue_work_on(cpu, read_counters_wq, &read_counters_work.work);
> > > > > > > > > +     flush_work(&read_counters_work.work);
> > > > > > > > 
> > > > > > > > Why can't this be done in current context ?
> > > > > > > > 
> > > > > > > We used work queue instead of smp_call_function_single() to have long delay.
> > > > > > 
> > > > > > Please explain completely, you have raised more questions than you
> > > > > > answered :)
> > > > > > 
> > > > > > Why do you want to have long delays ?
> > > > > > 
> > > > > Long delay value is used to have the observation window long enough for
> > > > > correctly reconstructing the CPU frequency considering noise.
> > > > > In next patch version, changed delay value to 500us which in our tests is
> > > > > considered reliable.
> > > > 
> > > > I understand that you need to put a udelay() while reading the freq from
> > > > hardware, that is fine, but why do you need a workqueue for that? Why can't you
> > > > just read the values directly from the same context ?
> > > > 
> > > The register to read frequency is per core and not accessible to other
> > > cores. So, we have to execute the function remotely as the target core to
> > > read frequency might be different from current.
> > > The functions for that are smp_call_function_single or queue_work_on.
> > > We used queue_work_on() to avoid long delay inside ipi interrupt context
> > > with interrupts disabled.
> > 
> > Okay, I understand this now, finally :)
> > 
> > But if the interrupts are disabled during some call, won't workqueues face the
> > same problem ?
> > 
> Yes, we are trying to minimize the case.

But how do you know workqueues will perform better than
smp_call_function_single() ? Just asking for clarity on this as normally
everyone tries to do smp_call_function_single().

-- 
viresh
