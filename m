From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 14/24] PM / devfreq: tegra30: Ensure that target freq
 won't overflow
Date: Tue, 16 Jul 2019 16:59:42 +0300
Message-ID: <14115aa7-ed40-2775-9b0b-a2bf6ca9d47e@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223631epcas4p42012d0364a4c952d90f078fb45982722@epcas4p4.samsung.com>
 <20190707223303.6755-15-digetx@gmail.com>
 <e6b53ba0-ac98-bda6-b087-553088a43d9f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6b53ba0-ac98-bda6-b087-553088a43d9f@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.07.2019 15:30, Chanwoo Choi пишет:
> On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
>> Potentially very high boosting could cause an integer overflow for a
>> highly clocked memory after conversion to MHz.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index 2f59c78930bd..0de1efdaabf4 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -460,6 +460,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
>>  	unsigned long target_freq;
>>  
>>  	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
>> +	target_freq = min(target_freq, ULONG_MAX / KHZ);
> 
> Did you meet this corner case?

I can't recall that, technically it could happen and I don't feel
comfortable by having potential integer overflows anyway.

> If have to change it, you better to use 'tegra->max_freq' as following:
> 	min(target_freq, tegra->max_freq);

The 'tegra->max_freq' will work here, but 'ULONG_MAX / KHZ' is a
constant value which is also correct and doesn't case any harm.

Probably will be even more expressive to write this as:

	target_freq = dev->avg_freq + dev->boost_freq;
	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);

	return min(target_freq, tegra->max_freq);


Thank you very much for the reviews!
