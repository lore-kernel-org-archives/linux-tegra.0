From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 10/19] PM / devfreq: tegra30: Reduce unnecessary
 interrupts activity
Date: Wed, 2 Oct 2019 21:40:29 +0300
Message-ID: <5d5bce05-1eab-7635-b684-b833b0cf00ce@gmail.com>
References: <20190811212315.12689-1-digetx@gmail.com>
 <CGME20190811212533epcas4p3e4968a3397caaf8682a56105cd061cad@epcas4p3.samsung.com>
 <20190811212315.12689-11-digetx@gmail.com>
 <b67a7878-fa74-df89-9a62-556b9300b5a5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b67a7878-fa74-df89-9a62-556b9300b5a5@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.10.2019 02:35, Chanwoo Choi пишет:
> Hi,
> 
> On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
>> There are cases where unnecessary ACTMON interrupts could be avoided,
>> like when one memory client device requests higher clock rate than the
>> other or when clock rate is manually limited using sysfs devfreq
>> parameters. These cases could be avoided by tuning upper watermark or
>> disabling hardware events when min/max boosting thresholds are reached.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 87 ++++++++++++++++++++++++++++---
>>  1 file changed, 80 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index 43d50b4366dd..a2623de56d20 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -312,7 +312,8 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
>>  }
>>  
>>  static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>> -					   struct tegra_devfreq_device *dev)
>> +					   struct tegra_devfreq_device *dev,
>> +					   unsigned long freq)
>>  {
>>  	unsigned long avg_dependency_freq, lower, upper;
>>  
>> @@ -320,6 +321,22 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>>  
>>  	avg_dependency_freq = tegra_actmon_dev_avg_dependency_freq(tegra, dev);
>>  
>> +	/*
>> +	 * If cumulative EMC frequency selection (MCALL / min_freq) is
>> +	 * higher than the device's, then there is no need to set upper
>> +	 * watermark to a lower value because it will result in unnecessary
>> +	 * upper interrupts.
>> +	 *
>> +	 * Note that average watermarks are also updated after EMC
>> +	 * clock rate change, hence if clock rate goes down, then the
>> +	 * watermarks will be set in accordance to the new rate after
>> +	 * changing the rate. There are other ways to achieve the same
>> +	 * result, but this one is probably the least churning, although
>> +	 * it may look a bit convoluted.
>> +	 */
>> +	if (freq * ACTMON_SAMPLING_PERIOD > upper)
>> +		upper = freq * ACTMON_SAMPLING_PERIOD;
>> +
>>  	/*
>>  	 * We want to get interrupts when MCCPU client crosses the
>>  	 * dependency threshold in order to take into / out of account
>> @@ -361,7 +378,18 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>>  	tegra_actmon_get_lower_upper(tegra, dev, freq - 1, &lower, &upper);
>>  
>>  	delta = do_percent(upper - lower, dev->config->boost_up_threshold);
>> -	device_writel(dev, lower + delta, ACTMON_DEV_UPPER_WMARK);
> 
> 
> Also, this patch edits the added codes on front patch.
> This code was added on patch5 and then delete it on this patch.
> If it is not necessary, you can remove it on patch5 by refactoring.
> 
>> +
>> +	/*
>> +	 * The memory events count could go a bit higher than the maximum
>> +	 * defined by the OPPs, hence make the upper watermark infinitely
>> +	 * high to avoid unnecessary upper interrupts in that case.
>> +	 */
>> +	if (freq == tegra->max_freq)
>> +		upper = ULONG_MAX;
>> +	else
>> +		upper = lower + delta;
>> +
>> +	device_writel(dev, upper, ACTMON_DEV_UPPER_WMARK);
> 
> I think that the changes of tegra_devfreq_update_avg_wmark() on this patch
> can be merged to patch5.

Okay, I'll revisit these parts of tegra_devfreq_update_avg_wmark() and will move them to
patch5 if there won't be any major obstacles.
