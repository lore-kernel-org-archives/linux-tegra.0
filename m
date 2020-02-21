From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 09/17] arm: tegra20: cpuidle: Handle case where
 secondary CPU hangs on entering LP2
Date: Fri, 21 Feb 2020 21:48:56 +0100
Message-ID: <21e3cc35-cc6b-5452-da93-bdaac43716c5@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-10-digetx@gmail.com>
 <20200221154318.GO10516@linaro.org>
 <239a2b66-8da8-2e6c-d19d-9ed207ad0a64@gmail.com>
 <20200221173649.GU10516@linaro.org>
 <b51f3f6b-8287-5ce8-fcaa-77cbab507618@gmail.com>
 <f27481cf-ca5e-df47-932b-fcb4713f0d78@linaro.org>
 <50a8fb7c-f497-2234-c0b0-560aec1c5691@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50a8fb7c-f497-2234-c0b0-560aec1c5691-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 21/02/2020 21:21, Dmitry Osipenko wrote:
> 21.02.2020 23:02, Daniel Lezcano пишет:

[ ... ]

>>>>>>> +
>>>>>>> +		/*
>>>>>>> +		 * The primary CPU0 core shall wait for the secondaries
>>>>>>> +		 * shutdown in order to power-off CPU's cluster safely.
>>>>>>> +		 * The timeout value depends on the current CPU frequency,
>>>>>>> +		 * it takes about 40-150us  in average and over 1000us in
>>>>>>> +		 * a worst case scenario.
>>>>>>> +		 */
>>>>>>> +		do {
>>>>>>> +			if (tegra_cpu_rail_off_ready())
>>>>>>> +				return 0;
>>>>>>> +
>>>>>>> +		} while (ktime_before(ktime_get(), timeout));
>>>>>>
>>>>>> So this loop will aggresively call tegra_cpu_rail_off_ready() and retry 3
>>>>>> times. The tegra_cpu_rail_off_ready() function can be called thoushand of times
>>>>>> here but the function will hang 1.5s :/
>>>>>>
>>>>>> I suggest something like:
>>>>>>
>>>>>> 	while (retries--i && !tegra_cpu_rail_off_ready()) 
>>>>>> 		udelay(100);
>>>>>>
>>>>>> So <retries> calls to tegra_cpu_rail_off_ready() and 100us x <retries> maximum
>>>>>> impact.
>>>>> But udelay() also results into CPU spinning in a busy-loop, and thus,
>>>>> what's the difference?
>>>>
>>>> busy looping instead of register reads with all the hardware things involved behind.
>>>
>>> Please notice that this code runs only on an older Cortex-A9/A15, which
>>> doesn't support WFE for the delaying, and thus, CPU always busy-loops
>>> inside udelay().
>>>
>>> What about if I'll add cpu_relax() to the loop? Do you think it it could
>>> have any positive effect?
>>
>> I think udelay() has a call to cpu_relax().
> 
> Yes, my point is that udelay() doesn't bring much benefit for us here
> because:
> 
> 1. we want to enter into power-gated state as quick as possible and
> udelay() just adds an unnecessary delay
> 
> 2. udelay() spins in a busy-loop until delay is expired, just like we're
> doing it in this function already

In this case why not remove ktime_get() and increase the number of retries?

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
