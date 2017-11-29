From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Wed, 29 Nov 2017 10:12:00 +0000
Message-ID: <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f940d9f1-aaec-cf25-24d2-956df63bbbd1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 29/11/17 00:09, Dmitry Osipenko wrote:
> On 29.11.2017 02:30, Dmitry Osipenko wrote:
>> On 23.10.2017 14:12, Jon Hunter wrote:
>>> Commit a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
>>> fixed the parent clock for APBDMA, but the consequence of this that
>>> after probing the APBDMA device, the APB Clock (or PCLK) is now
>>> disabled. Disabling the APB clock causes accesses to any other device
>>> on the APB to hang and prevent Tegra from booting.
>>>
>>> Currently, the APB clock is registered with the flag "CLK_IGNORE_UNUSED"
>>> to prevent the clock being disabled if unused on boot. However, even
>>> if it is used, it still needs to be always kept enabled and so update
>>> the flag for the APB clock to be "CLK_IS_CRITICAL".
>>>
>>> Fixes: a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
>>>
>>> Suggested-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/clk/tegra/clk-tegra-super-gen4.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> index 4f6fd307cb70..10047107c1dc 100644
>>> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> @@ -166,7 +166,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>>>  				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
>>>  				   &sysrate_lock);
>>>  	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
>>> -				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
>>> +				CLK_IS_CRITICAL, clk_base + SYSTEM_CLK_RATE,
>>>  				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
>>>  	*dt_clk = clk;
>>>  }
>>>
>>
>> Unfortunately this patch somehow breaks Tegra20, getting a hang during boot. For
>> now I don't know what's the cause of the issue, may take a more detailed look
>> soon. If you have any suggestions, please tell.
>>
> 
> It looks like that with CLK_IS_CRITICAL flag, pclk is getting enabled before
> clock rate is setup and in result it is enabled with some invalid rate config.

What Tegra20 platform? I have not seen any issues with booting Tegra20
trimslice with v4.15-rc1 or next-20171129. I am surprised this clock
would not have been enabled by the bootloader and hence rate set correctly.

Cheers
Jon

-- 
nvpublic
