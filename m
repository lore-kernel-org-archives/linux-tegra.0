From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/tegra: Cycles can't be 0
Date: Mon, 17 Jun 2019 17:41:29 +0300
Message-ID: <6a0b098a-c040-88aa-f8de-b1a56f13af26@gmail.com>
References: <20190616234744.8975-1-digetx@gmail.com>
 <20190617092148.GA508@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617092148.GA508@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 12:21, Thierry Reding пишет:
> On Mon, Jun 17, 2019 at 02:47:43AM +0300, Dmitry Osipenko wrote:
>> The minimum number of "cycles" is limited to 1 by
>> clockevents_config_and_register().
> 
> Looks to me like cycles also depends on the multiplier and shift that
> are computed for the clock source. It looks like the multiplier will
> never be zero and the shift will always be such that it won't result in
> a zero cycles either. But might be worth mentioning this in the commit
> message. And it might be nice to also repeate that in a comment close to
> the code, just to document this.
> 
> It took me a couple of minutes to track this all down, so I think we
> should take the same amount of time to document it so that we don't have
> to go through it again once we've forgotten why we made this change.

It's explicitly stated in the comment [1] what's the intent of the min_delta. But it's
also good that you verified the clocksource code itself :)

[1] https://elixir.bootlin.com/linux/v5.2-rc5/source/kernel/time/clockevents.c#L500

>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clocksource/timer-tegra.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>> index f6a8eb0d7322..090c85358fe8 100644
>> --- a/drivers/clocksource/timer-tegra.c
>> +++ b/drivers/clocksource/timer-tegra.c
>> @@ -54,9 +54,7 @@ static int tegra_timer_set_next_event(unsigned long cycles,
>>  {
>>  	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
>>  
>> -	writel_relaxed(TIMER_PTV_EN |
>> -		       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
>> -		       reg_base + TIMER_PTV);
>> +	writel_relaxed(TIMER_PTV_EN | (cycles - 1), reg_base + TIMER_PTV);
> 
> Maybe keep the n+1 scheme comment and explain why we don't need to
> handle the case where cycles < 1. That way it becomes crystal clear that
> we don't need it, so we decrease the chances of somebody coming around
> and trying to "fix" this.

Okay, I'll extend the commit message and add a clarifying comment to the code in v2.
