From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ALSA: hda/tegra: enable clock during probe
Date: Fri, 25 Jan 2019 11:36:00 +0000
Message-ID: <06c00ce1-32ed-8aa9-0340-d00202a8fa62@nvidia.com>
References: <1548351403-1875-1-git-send-email-spujar@nvidia.com>
 <s5h5zudc1qw.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5h5zudc1qw.wl-tiwai@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>
Cc: pierre-louis.bossart@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org, thierry.reding@gmail.com, rlokhande@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 24/01/2019 19:08, Takashi Iwai wrote:
> On Thu, 24 Jan 2019 18:36:43 +0100,
> Sameer Pujar wrote:
>>
>> If CONFIG_PM is disabled or runtime PM calls are forbidden, the clocks
>> will not be ON. This could cause issue during probe, where hda init
>> setup is done. This patch checks whether runtime PM is enabled or not.
>> If disabled, clocks are enabled in probe() and disabled in remove()
>>
>> This patch does following minor changes as cleanup,
>>   * return code check for pm_runtime_get_sync() to take care of failure
>>     and exit gracefully.
>>   * In remove path runtime PM is disabled before calling snd_card_free().
>>   * hda_tegra_disable_clocks() is moved out of CONFIG_PM_SLEEP check.
>>   * runtime PM callbacks moved out of CONFIG_PM check
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> (snip)
>> @@ -555,6 +553,13 @@ static int hda_tegra_probe(struct platform_device *pdev)
>>  	if (!azx_has_pm_runtime(chip))
>>  		pm_runtime_forbid(hda->dev);
>>  
>> +	/* explicit resume if runtime PM is disabled */
>> +	if (!pm_runtime_enabled(hda->dev)) {
>> +		err = hda_tegra_runtime_resume(hda->dev);
>> +		if (err)
>> +			goto out_free;
>> +	}
>> +
>>  	schedule_work(&hda->probe_work);
> 
> Calling runtime_resume here is really confusing...

Why? IMO it is better to have a single handler for resuming the device
and so if RPM is not enabled we call the handler directly. This is what
we have been advised to do in the past and do in other drivers. See ...

sound/soc/tegra/tegra30_i2s.c

> 
>> @@ -571,7 +576,14 @@ static void hda_tegra_probe_work(struct work_struct *work)
>>  	struct platform_device *pdev = to_platform_device(hda->dev);
>>  	int err;
>>  
>> -	pm_runtime_get_sync(hda->dev);
>> +	err = pm_runtime_get_sync(hda->dev);
>> +	if (err < 0) {
>> +		dev_err(hda->dev,
>> +			"failed in pm_runtime_get_syc with err = %d\n",
>> +			err);
>> +		return;
>> +	}
> 
> This pm_runtime_get_sync() is needed just because you enabled runtime
> PM before probe_work.  Why not deferring the runtime PM enablement
> after probing done?

That would be fine with me.

> That is what we need is the hda_tegra_enable_clocks() call at probe
> unconditionally before enabling runtime PM.

I think that calling hda_tegra_runtime_resume as above is sufficient.
The nice thing about calling the runtime_resume function is that if for
a future device there is something else in addition to clocks, say a
reset, that also needs to be handled, we just added to the
runtime_resume/suspend handlers and we are done.

Cheers
Jon

-- 
nvpublic
