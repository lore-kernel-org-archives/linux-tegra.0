From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 05/17] ARM: tegra: Propagate error from
 tegra_idle_lp2_last()
Date: Fri, 21 Feb 2020 21:42:30 +0300
Message-ID: <535bff1a-cb38-a36e-4c8e-1e656618588e@gmail.com>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-6-digetx@gmail.com> <20200221151612.GJ10516@linaro.org>
 <1a8c81ab-6f6a-8221-6a4e-c080ba595836@gmail.com>
 <20200221174033.GV10516@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200221174033.GV10516-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.02.2020 20:40, Daniel Lezcano пишет:
> On Fri, Feb 21, 2020 at 08:21:41PM +0300, Dmitry Osipenko wrote:
>> 21.02.2020 18:16, Daniel Lezcano пишет:
>>> On Thu, Feb 13, 2020 at 02:51:22AM +0300, Dmitry Osipenko wrote:
>>>> Technically cpu_suspend() may fail and it's never good to lose information
>>>> about failure. For example things like cpuidle core could correctly sample
>>>> idling time in the case of failure.
>>>>
>>>> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>
>>> [ ... ]
>>>
>>>>  	cpu_cluster_pm_enter();
>>>>  	suspend_cpu_complex();
>>>>  
>>>> -	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
>>>> +	err = cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
>>>>  
>>>>  	/*
>>>>  	 * Resume L2 cache if it wasn't re-enabled early during resume,
>>>> @@ -208,6 +210,8 @@ void tegra_idle_lp2_last(void)
>>>>  
>>>>  	restore_cpu_complex();
>>>
>>> If the cpu_suspend fails, does restore_cpu_complex() need to be called ?
>>
>> Yes, because suspend_cpu_complex() didn't fail. I don't see any reason
>> why restore_cpu_complex() shouldn't be called, please clarify yours thought.
> 
> If the suspend fails, the power down does not happen, thus the logic is not
> lost and then it not necessary to restore something which has not been lost.
> 
> I don't know the hardware details, so that may be partially correct.

At quick glance, the restore_cpu_complex() is only used for restoring
the GIC's state on Tegra.

I don't think it's really worth the effort to handle
restore_cpu_complex() specially in a case of the error condition because
the chance that the error will ever happen is very small and restoring
the cluster's state won't cause any trouble in that case.

Let's keep this patch as-is for simplicity :)
