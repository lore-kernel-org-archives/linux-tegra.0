From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2] ALSA: hda/tegra: enable clock during probe
Date: Thu, 31 Jan 2019 15:06:43 +0530
Message-ID: <1a248adf-2239-b6bd-1f17-270e6e579b72@nvidia.com>
References: <1548414418-5785-1-git-send-email-spujar@nvidia.com>
 <b631310f-93fa-ef4b-7014-d97fcfb2dcdf@nvidia.com>
 <s5ha7jicd4l.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5ha7jicd4l.wl-tiwai@suse.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Jon Hunter <jonathanh@nvidia.com>
Cc: pierre-louis.bossart@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org, thierry.reding@gmail.com, mkumard@nvidia.com, rlokhande@nvidia.com, sharadg@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/30/2019 10:10 PM, Takashi Iwai wrote:
> On Wed, 30 Jan 2019 13:45:49 +0100,
> Jon Hunter wrote:
>>
>> On 25/01/2019 11:06, Sameer Pujar wrote:
>>> If CONFIG_PM is disabled or runtime PM calls are forbidden, the clocks
>>> will not be ON. This could cause issue during probe, where hda init
>>> setup is done. This patch enables clocks unconditionally during probe.
>>>
>>> Along with above, follwoing changes are done.
>>>    * enable runtime PM before exiting from probe work. This helps to avoid
>>>      usage of pm_runtime_get_sync/pm_runtime_put() in probe work.
>>>    * hda_tegra_disable_clocks() is moved out of CONFIG_PM_SLEEP check.
>>>    * runtime PM callbacks moved out of CONFIG_PM check
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   sound/pci/hda/hda_tegra.c | 26 +++++++++++++++++---------
>>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>>> index c8d18dc..ba6175f 100644
>>> --- a/sound/pci/hda/hda_tegra.c
>>> +++ b/sound/pci/hda/hda_tegra.c
>>> @@ -219,7 +219,6 @@ static int hda_tegra_enable_clocks(struct hda_tegra *data)
>>>   	return rc;
>>>   }
>>>   
>>> -#ifdef CONFIG_PM_SLEEP
>>>   static void hda_tegra_disable_clocks(struct hda_tegra *data)
>>>   {
>>>   	clk_disable_unprepare(data->hda2hdmi_clk);
>>> @@ -227,6 +226,7 @@ static void hda_tegra_disable_clocks(struct hda_tegra *data)
>>>   	clk_disable_unprepare(data->hda_clk);
>>>   }
>>>   
>>> +#ifdef CONFIG_PM_SLEEP
>>>   /*
>>>    * power management
>>>    */
>>> @@ -257,7 +257,6 @@ static int hda_tegra_resume(struct device *dev)
>>>   }
>>>   #endif /* CONFIG_PM_SLEEP */
>>>   
>>> -#ifdef CONFIG_PM
>>>   static int hda_tegra_runtime_suspend(struct device *dev)
>>>   {
>>>   	struct snd_card *card = dev_get_drvdata(dev);
>>> @@ -283,7 +282,7 @@ static int hda_tegra_runtime_resume(struct device *dev)
>>>   	int rc;
>>>   
>>>   	rc = hda_tegra_enable_clocks(hda);
>>> -	if (rc != 0)
>>> +	if (rc)
>>>   		return rc;
>>>   	if (chip && chip->running) {
>>>   		hda_tegra_init(hda);
>>> @@ -292,7 +291,6 @@ static int hda_tegra_runtime_resume(struct device *dev)
>>>   
>>>   	return 0;
>>>   }
>>> -#endif /* CONFIG_PM */
>>>   
>>>   static const struct dev_pm_ops hda_tegra_pm = {
>>>   	SET_SYSTEM_SLEEP_PM_OPS(hda_tegra_suspend, hda_tegra_resume)
>>> @@ -551,9 +549,9 @@ static int hda_tegra_probe(struct platform_device *pdev)
>>>   
>>>   	dev_set_drvdata(&pdev->dev, card);
>>>   
>>> -	pm_runtime_enable(hda->dev);
>>> -	if (!azx_has_pm_runtime(chip))
>>> -		pm_runtime_forbid(hda->dev);
>>> +	err = hda_tegra_enable_clocks(hda);
>>> +	if (err)
>>> +		goto out_free;
>> We also need to think about power-domains here. Enabling the clocks
>> might not be enough as the appropriate power-domain needs to be enabled.
>> For 64-bit Tegra runtime-pm will handle the power-domains (assuming they
>> are populated in device-tree). So I still think it is better we call
>> pm_runtime_get_sync() at some point rather than just replying on
>> enabling the clocks.
> If I understand correctly the code, the pm domain is already activated
> at calling driver's probe callback.

If there are no further concerns, can we consider this for approval?

Thanks,
Sameer.

>
> thanks,
>
> Takashi
