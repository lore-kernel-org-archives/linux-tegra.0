From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 18/19] PM / devfreq: tegra30: Tune up MCCPU boost-down
 coefficient
Date: Fri, 1 Nov 2019 17:14:57 +0300
Message-ID: <110096a4-9f77-3912-a911-76d9c2c5c277@gmail.com>
References: <20191029220019.26773-1-digetx@gmail.com>
 <CGME20191029220656epcas2p4b19cb854054ebce6132c7111f52cada4@epcas2p4.samsung.com>
 <20191029220019.26773-19-digetx@gmail.com>
 <99a90972-2170-ebcb-7bff-cd9ba8b0b0d1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99a90972-2170-ebcb-7bff-cd9ba8b0b0d1@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.11.2019 10:45, Chanwoo Choi пишет:
> On 19. 10. 30. 오전 7:00, Dmitry Osipenko wrote:
>> MCCPU boosts up very aggressively by 800% and boosts down very mildly by
>> 10%. This doesn't work well when system is idling because the very slow
>> de-boosting results in lots of consecutive-down interrupts, in result
>> memory stays clocked high and CPU doesn't enter deepest idling state
>> instead of keeping memory at lowest freq and having CPU cluster turned
>> off. A more faster de-boosting fixes the case of idling system and doesn't
>> affect the case of an active system.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index d0dd42856e5b..9a21a29198ee 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -123,7 +123,7 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
>>  		.offset = 0x200,
>>  		.irq_mask = 1 << 25,
>>  		.boost_up_coeff = 800,
>> -		.boost_down_coeff = 90,
>> +		.boost_down_coeff = 40,
>>  		.boost_up_threshold = 27,
>>  		.boost_down_threshold = 10,
>>  		.avg_dependency_threshold = 50000,
>>
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> IMO, I think that it is not good to change the threshold value
> on device driver directly when some requirement happen.
> Instead, better to get the threshold value from device-tree file.

I think in worst case these values could be tuned for a hardware
generation. The current hardcoded values should be good enough for everyone.

If we'll find that some differentiation is needed, then we could
consider making the pre-defined config per hardware generation by
specifying "data" fields of the of_device_id table.

It also should be possible add sysfs interface for userpace to change
the boosting values. Or make these values a driver's module parameters.

There are different variants of what could be done in order to
differentiate the configuration. But again, this is not needed for.
