From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 5/9] clocksource: tegra: Enable ARM arch_timer with TSC
Date: Tue, 08 Jan 2013 23:40:49 -0700
Message-ID: <50ED10F1.30001@wwwdotorg.org>
References: <1357649263-1098-6-git-send-email-hdoyu@nvidia.com><50EC444B.5060206@arm.com><50ECA0A6.4090307@wwwdotorg.org> <20130109.080031.1063344100374199123.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130109.080031.1063344100374199123.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/08/2013 11:00 PM, Hiroshi Doyu wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Tue, 8 Jan 2013 23:41:42 +0100:
>> On 01/08/2013 09:07 AM, Marc Zyngier wrote:
>>> On 08/01/13 12:47, Hiroshi Doyu wrote:
>>>> Add platform enabler for ARM arch_timer(TSC). TSC is more fine grained
>>>> timer than TMR0. If it's available, it will be used for clock source
>>>> and sched_clock. Otherwise, TMR0 is used. In any case TMR0 is
>>>> necessary for clock event.
>>
>>>> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
>>
>>>> +/* FIXME: only secure mode is supported. */
>>>
>>> And this is a bug, as far as I'm concerned.
>>>
>>>> +static int tegra_arch_timer_init(void)
>>
>>>> +	clk = clk_get_sys("clk_m", NULL);
>>>> +	if (IS_ERR(clk)) {
>>>> +		freq = 12000000;
>>>> +		pr_warn("Unable to get timer clock. Assuming 12Mhz input clock.\n");
>>>> +	} else {
>>>> +		freq = clk_get_rate(clk);
>>>> +		clk_put(clk);
>>>> +	}
>>>> +	writel_relaxed(freq, tsc_base + TSC_CNTFID0);
>>>> +
>>>> +	/* CNTFRQ */
>>>> +	asm("mcr p15, 0, %0, c14, c0, 0\n" : : "r" (freq));
>>>> +	asm("mrc p15, 0, %0, c14, c0, 0\n" : "=r" (val));
>>>> +	BUG_ON(val != freq);
>>>
>>> No, not again! Like I said last year, this won't fly. So instead of
>>> trying to work around a broken firmware, let's do the right thing.
>>
>> OK, so I understand you want to firmware/bootloader/... to write the
>> value into that register instead, so this all works in non-secure mode
>> (which sounds like a fine objection), but ...
> 
> If possible, I want to run kernel without bootloader initializing TSC
> . IOW, I want to allow legacy bootloaders to boot kernel with ARM arch
> timer.

Is it really hard to just fix the bootloader? Tegra114 is new enough,
and upstream support new enough, it should be fine to require a fixed
bootloader in order to run the upstream kernel even if we don't yet do
this right in the downstream kernels.
