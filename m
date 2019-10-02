From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/19] PM / devfreq: tegra30: Use kHz units uniformly
 in the code
Date: Wed, 2 Oct 2019 21:26:52 +0300
Message-ID: <10e71085-dc92-6003-2bbd-40c3369cdb26@gmail.com>
References: <20190811212315.12689-1-digetx@gmail.com>
 <CGME20190811212545epcas4p4132cb98ef69ef04136fda4030bd64f92@epcas4p4.samsung.com>
 <20190811212315.12689-10-digetx@gmail.com>
 <2b65c78a-4b8f-661b-dd9c-29b3cbf0844f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2b65c78a-4b8f-661b-dd9c-29b3cbf0844f@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.10.2019 02:29, Chanwoo Choi пишет:
> On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
>> Now that all kHz-conversion related bugs are fixed, we can use the kHz
>> uniformly. This makes code cleaner and avoids integer divisions in the
>> code, which is useful in a case of Tegra30 that has Cortex A9 CPU that
>> doesn't support integer division instructions, hence all divisions are
>> actually made in software mode. Another small benefit from this change
>> is that now powertop utility correctly displays devfreq's stats, for
>> some reason it expects them to be in kHz.
> 
> If possible, please specify the benefit result on patch description.

As I wrote above, there are fewer divisions in the code as a result of this patch.

Then I also found that powertop expects KHz. This is actually something that devfreq core
potentially could improve by allowing drivers to specify what units are used for the freqs
such that sysfs interface could present freqs to userpspace in a predictable manner.

Lastly, this patch comes very handy for the patch11, because of the replacement of
avg_count with avg_freq which helps to keep code cleaner in further patches. Please note
that this patch doesn't change logic of the code.

> And I have a question. Why do you fix the KHz-conversion issue on one patch?
> Actually, in my case, it is difficult to understand that multiple patches
> try to fix the KHz-conversion issue. I think that it is possible to
> make one patch.

This driver used Hz units for the OPPs from the very beginning and then there were
Hz<->KHz conversion bugs that were fixed by previous patches. This patch doesn't fix any
KHz-conversion issue and merely makes a minor clean up by using KHz units everywhere in
the code, starting from OPPs that are created by dev_pm_opp_add().

> And, 
> On these series, some codes wad added and then these codes are deleted
> on later patch. It looks like that you made the issue and then you fix
> the issue by yourself. I think that it is not proper.
> Even if you developed the patches on your local environment sequentially
> according to the sequence of your issue detection, you better to do
> refactoring the patches.
> 
> Frankly, I cannot agree that some codes wad added on front patch
> and then added codes are deleted on later patch in the same patchset.

Alright, I understand that it makes easier for you to review patches without going back
and forth between patches, verifying every changed line of the previous patches of this
series.

>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 81 +++++++++++++++++++------------
>>  1 file changed, 49 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index ca499368ee81..43d50b4366dd 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -137,8 +137,11 @@ struct tegra_devfreq_device {
>>  	const struct tegra_devfreq_device_config *config;
>>  	void __iomem *regs;
>>  
>> -	/* Average event count sampled in the last interrupt */
>> -	u32 avg_count;
>> +	/*
>> +	 * Average event count sampled in the last interrupt and converted
>> +	 * to frequency value.
>> +	 */
>> +	u32 avg_freq;
>>  
>>  	/*
>>  	 * Extra frequency to increase the target by due to consecutive
>> @@ -222,6 +225,14 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
>>  	return 0;
>>  }
>>  
>> +static unsigned long
>> +tegra_actmon_dev_avg_dependency_freq(struct tegra_devfreq *tegra,
>> +				     struct tegra_devfreq_device *dev)
>> +{
>> +	return dev->config->avg_dependency_threshold /
>> +		ACTMON_SAMPLING_PERIOD;
>> +}
>> +
>>  static unsigned long
>>  tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>>  			      struct tegra_devfreq_device *dev,
>> @@ -229,13 +240,15 @@ tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>>  {
>>  	unsigned long static_cpu_emc_freq;
>>  
>> -	if (dev->config->avg_dependency_threshold &&
>> -	    dev->config->avg_dependency_threshold < dev->avg_count) {
>> +	if (!dev->config->avg_dependency_threshold)
>> +		return target_freq;
>> +
>> +	if (dev->avg_freq > tegra_actmon_dev_avg_dependency_freq(tegra, dev))
>>  		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
>> -		target_freq = max(target_freq, static_cpu_emc_freq);
>> -	}
>> +	else
>> +		static_cpu_emc_freq = 0;
>>  
>> -	return target_freq;
>> +	return max(target_freq, static_cpu_emc_freq);
>>  }
>>  
>>  static unsigned long tegra_actmon_lower_freq(struct tegra_devfreq *tegra,
>> @@ -261,7 +274,7 @@ static unsigned long tegra_actmon_upper_freq(struct tegra_devfreq *tegra,
>>  
>>  	opp = dev_pm_opp_find_freq_ceil(tegra->devfreq->dev.parent, &upper);
>>  	if (IS_ERR(opp))
>> -		upper = ULONG_MAX;
>> +		upper = KHZ_MAX;
>>  	else
>>  		dev_pm_opp_put(opp);
>>  
>> @@ -280,15 +293,12 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
>>  	 * range in a case where target_freq falls into a range of
>>  	 * next_possible_opp_freq - 1MHz.
>>  	 */
>> -	target_freq = round_down(target_freq, 1000000);
> 
> This line was added on patch5. I think that you could fix the KHz-conversion
> on patch5 instead of this patch. It is not good way to make the patches.
> Because some codes wad added and then these codes are deleted on later patch.
> 
> It looks like that you made the issue and then you fix the issue by yourself.
> It is difficult to make me to decide this patch is either proper or not.

The OPPs were always defined in Hz units in this driver. The patch5 was created much
earlier than this patch and thus I'm making changes here to the code that was added in patch5.

Okay, I'll try to change the order of the patches. But usually it takes a lot if time and
effort to rebase patches and then re-test them, so I'm trying to avoid that when not
absolutely necessary.

>> +	target_freq = round_down(target_freq, 1000);
>>  
>>  	/* watermarks are set at the borders of the corresponding OPPs */
>>  	*lower = tegra_actmon_lower_freq(tegra, target_freq);
>>  	*upper = tegra_actmon_upper_freq(tegra, target_freq);
>>  
>> -	*lower /= KHZ;
>> -	*upper /= KHZ;
>> -
>>  	/*
>>  	 * The upper watermark should take into account CPU's frequency
>>  	 * because cpu_to_emc_rate() may override the target_freq with
>> @@ -304,10 +314,11 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
>>  static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>>  					   struct tegra_devfreq_device *dev)
>>  {
>> -	unsigned long lower, upper, freq;
>> +	unsigned long avg_dependency_freq, lower, upper;
>> +
>> +	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);
>>  
>> -	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
>> -	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
>> +	avg_dependency_freq = tegra_actmon_dev_avg_dependency_freq(tegra, dev);
>>  
>>  	/*
>>  	 * We want to get interrupts when MCCPU client crosses the
>> @@ -316,7 +327,7 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>>  	 */
>>  	if (lower < dev->config->avg_dependency_threshold &&
>>  	    upper > dev->config->avg_dependency_threshold) {
>> -		if (dev->avg_count < dev->config->avg_dependency_threshold)
>> +		if (dev->avg_freq < avg_dependency_freq)
>>  			upper = dev->config->avg_dependency_threshold;
>>  		else
>>  			lower = dev->config->avg_dependency_threshold;
>> @@ -358,8 +369,7 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>>  	 * device. Once that mark is hit and boosting is stopped, the
>>  	 * interrupt is disabled by ISR.
>>  	 */
>> -	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
>> -	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
>> +	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);
> 
> Also, patch5 newly defined this function and then you edit the function prototype
> of this function. It is not proper way.

Sorry, I'm not sure what you're meaning by the "prototype" here. In case of this
particular hunk, the freq==dev->avg_freq and dev->avg_count is replaced with dev->avg_freq
in this patch as well. Hence this is a cosmetic change that doesn't change any logic of
the code. I'll see if this all could be made a bit more clear and easier for review.

[snip]
