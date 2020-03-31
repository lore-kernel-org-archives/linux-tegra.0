From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v1 4/5] PM / devfreq: tegra30: Use
 clk_round_rate_unboundly()
Date: Wed, 1 Apr 2020 08:23:45 +0900
Message-ID: <870e9436-34c0-4de3-4414-ac931532ed27@samsung.com>
References: <20200330231617.17079-1-digetx@gmail.com>
        <CGME20200330232025epcas1p37cf026c6e46723d416f94b1f005ac5ab@epcas1p3.samsung.com>
        <20200330231617.17079-5-digetx@gmail.com>
        <147b571a-bae1-8a58-942c-579a5297299b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <147b571a-bae1-8a58-942c-579a5297299b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 4/1/20 8:22 AM, Chanwoo Choi wrote:
> On 3/31/20 8:16 AM, Dmitry Osipenko wrote:
>> The clk_round_rate() doesn't work for us properly if clock rate is bounded
>> by a min/max rate that is requested by some other clk-user because we're
>> building devfreq's OPP table based on the rounding.
>>
>> In particular this becomes a problem if display driver is probed earlier
>> than devfreq, and thus, display adds a memory bandwidth request using
>> interconnect API, which results in a minimum clock-rate being set for
>> the memory clk. In a result, the lowest devfreq OPP rate is getting
>> limited to the minimum rate imposed by the display driver.
>>
>> Let's use new clk_round_rate_unboundly() that resolves the problem by
>> rounding clock rate without taking into account min/max limits imposed by
>> active clk users.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index 28b2c7ca416e..34f6291e880c 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -834,7 +834,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  
>>  	reset_control_deassert(tegra->reset);
>>  
>> -	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
>> +	rate = clk_round_rate_unboundly(tegra->emc_clock, ULONG_MAX);
>>  	if (rate < 0) {
>>  		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
>>  		return rate;
>> @@ -849,7 +849,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
>> -		rate = clk_round_rate(tegra->emc_clock, rate);
>> +		rate = clk_round_rate_unboundly(tegra->emc_clock, rate);
>>  
>>  		if (rate < 0) {
>>  			dev_err(&pdev->dev,
>>
> 
> Firstly, patch2 have to be reviewed for this patch.
> I have no any objection. It looks good to me.
> 
> If patch1 get the confirmation from clock maintainer,

Sorry. I mean the patch2 about clk_round_rate_unboundly() function.
instead of patch1.

> feel free to add my acked tag:
> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
