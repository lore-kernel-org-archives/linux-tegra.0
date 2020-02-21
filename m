From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 09/17] arm: tegra20: cpuidle: Handle case where
 secondary CPU hangs on entering LP2
Date: Fri, 21 Feb 2020 23:21:10 +0300
Message-ID: <50a8fb7c-f497-2234-c0b0-560aec1c5691@gmail.com>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-10-digetx@gmail.com>
 <20200221154318.GO10516@linaro.org>
 <239a2b66-8da8-2e6c-d19d-9ed207ad0a64@gmail.com>
 <20200221173649.GU10516@linaro.org>
 <b51f3f6b-8287-5ce8-fcaa-77cbab507618@gmail.com>
 <f27481cf-ca5e-df47-932b-fcb4713f0d78@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f27481cf-ca5e-df47-932b-fcb4713f0d78-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.02.2020 23:02, Daniel Lezcano пишет:
> On 21/02/2020 19:19, Dmitry Osipenko wrote:
>> 21.02.2020 20:36, Daniel Lezcano пишет:
>>> On Fri, Feb 21, 2020 at 07:56:51PM +0300, Dmitry Osipenko wrote:
>>>> Hello Daniel,
>>>>
>>>> 21.02.2020 18:43, Daniel Lezcano пишет:
>>>>> On Thu, Feb 13, 2020 at 02:51:26AM +0300, Dmitry Osipenko wrote:
>>>>>> It is possible that something may go wrong with the secondary CPU, in that
>>>>>> case it is much nicer to get a dump of the flow-controller state before
>>>>>> hanging machine.
>>>>>>
>>>>>> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> ---
>>>
>>> [ ... ]
>>>
>>>>>> +static int tegra20_wait_for_secondary_cpu_parking(void)
>>>>>> +{
>>>>>> +	unsigned int retries = 3;
>>>>>> +
>>>>>> +	while (retries--) {
>>>>>> +		ktime_t timeout = ktime_add_ms(ktime_get(), 500);
>>>>>
>>>>> Oops I missed this one. Do not use ktime_get() in this code path, use jiffies.
>>>>
>>>> Could you please explain what benefits jiffies have over the ktime_get()?
>>>
>>> ktime_get() is very slow, jiffies is updated every tick.
>>
>> But how jiffies are supposed to be updated if interrupts are disabled?
> 
> Yeah, other cpus must not be idle in this.

Okay, then jiffies can't be used here because this function is used for
the coupled / power-gated state only. All CPUs are idling in this state.

>> Aren't jiffies actually slower than ktime_get() because jiffies are
>> updating every 10/1ms (depending on CONFIG_HZ)?
> 
> They are no slower, they have a lower resolution which is 10ms or 4ms.
> 
> Given the 500ms timeout, it is fine.
> 
>> We're kinda interesting here in getting into deep-idling state as quick
>> as possible. I was checking how much time takes the busy-loop below and
>> it takes ~40-150us in average, which is good enough.
> 
> ktime_get() gets a seq lock and it is very slow.

Since all CPUs are idling here, the locking isn't a problem.

The wait_for_secondary_cpu_parking() function is called on CPU0, it
waits for the secondary CPUs to enter into safe-state before CPU0 could
power-gate the whole CPU cluster.

>>>>>> +
>>>>>> +		/*
>>>>>> +		 * The primary CPU0 core shall wait for the secondaries
>>>>>> +		 * shutdown in order to power-off CPU's cluster safely.
>>>>>> +		 * The timeout value depends on the current CPU frequency,
>>>>>> +		 * it takes about 40-150us  in average and over 1000us in
>>>>>> +		 * a worst case scenario.
>>>>>> +		 */
>>>>>> +		do {
>>>>>> +			if (tegra_cpu_rail_off_ready())
>>>>>> +				return 0;
>>>>>> +
>>>>>> +		} while (ktime_before(ktime_get(), timeout));
>>>>>
>>>>> So this loop will aggresively call tegra_cpu_rail_off_ready() and retry 3
>>>>> times. The tegra_cpu_rail_off_ready() function can be called thoushand of times
>>>>> here but the function will hang 1.5s :/
>>>>>
>>>>> I suggest something like:
>>>>>
>>>>> 	while (retries--i && !tegra_cpu_rail_off_ready()) 
>>>>> 		udelay(100);
>>>>>
>>>>> So <retries> calls to tegra_cpu_rail_off_ready() and 100us x <retries> maximum
>>>>> impact.
>>>> But udelay() also results into CPU spinning in a busy-loop, and thus,
>>>> what's the difference?
>>>
>>> busy looping instead of register reads with all the hardware things involved behind.
>>
>> Please notice that this code runs only on an older Cortex-A9/A15, which
>> doesn't support WFE for the delaying, and thus, CPU always busy-loops
>> inside udelay().
>>
>> What about if I'll add cpu_relax() to the loop? Do you think it it could
>> have any positive effect?
> 
> I think udelay() has a call to cpu_relax().

Yes, my point is that udelay() doesn't bring much benefit for us here
because:

1. we want to enter into power-gated state as quick as possible and
udelay() just adds an unnecessary delay

2. udelay() spins in a busy-loop until delay is expired, just like we're
doing it in this function already
