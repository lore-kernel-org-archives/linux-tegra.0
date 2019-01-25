From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ALSA: hda/tegra: enable clock during probe
Date: Fri, 25 Jan 2019 13:26:27 +0000
Message-ID: <b64f5d05-f352-7b46-d70d-3809aab8ddda@nvidia.com>
References: <1548351403-1875-1-git-send-email-spujar@nvidia.com>
 <s5h5zudc1qw.wl-tiwai@suse.de>
 <06c00ce1-32ed-8aa9-0340-d00202a8fa62@nvidia.com>
 <s5hr2d0zz96.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5hr2d0zz96.wl-tiwai@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Sameer Pujar <spujar@nvidia.com>, pierre-louis.bossart@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org, thierry.reding@gmail.com, rlokhande@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 25/01/2019 12:40, Takashi Iwai wrote:
> On Fri, 25 Jan 2019 12:36:00 +0100,
> Jon Hunter wrote:
>>
>>
>> On 24/01/2019 19:08, Takashi Iwai wrote:
>>> On Thu, 24 Jan 2019 18:36:43 +0100,
>>> Sameer Pujar wrote:
>>>>
>>>> If CONFIG_PM is disabled or runtime PM calls are forbidden, the clocks
>>>> will not be ON. This could cause issue during probe, where hda init
>>>> setup is done. This patch checks whether runtime PM is enabled or not.
>>>> If disabled, clocks are enabled in probe() and disabled in remove()
>>>>
>>>> This patch does following minor changes as cleanup,
>>>>   * return code check for pm_runtime_get_sync() to take care of failure
>>>>     and exit gracefully.
>>>>   * In remove path runtime PM is disabled before calling snd_card_free().
>>>>   * hda_tegra_disable_clocks() is moved out of CONFIG_PM_SLEEP check.
>>>>   * runtime PM callbacks moved out of CONFIG_PM check
>>>>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
>>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>> (snip)
>>>> @@ -555,6 +553,13 @@ static int hda_tegra_probe(struct platform_device *pdev)
>>>>  	if (!azx_has_pm_runtime(chip))
>>>>  		pm_runtime_forbid(hda->dev);
>>>>  
>>>> +	/* explicit resume if runtime PM is disabled */
>>>> +	if (!pm_runtime_enabled(hda->dev)) {
>>>> +		err = hda_tegra_runtime_resume(hda->dev);
>>>> +		if (err)
>>>> +			goto out_free;
>>>> +	}
>>>> +
>>>>  	schedule_work(&hda->probe_work);
>>>
>>> Calling runtime_resume here is really confusing...
>>
>> Why? IMO it is better to have a single handler for resuming the device
>> and so if RPM is not enabled we call the handler directly. This is what
>> we have been advised to do in the past and do in other drivers. See ...
> 
> The point is that we're not "resuming" anything there.  It's in the
> early probe stage, and the device state is uninitialized, not really
> suspended.  It'd end up with just calling the same helper
> (hda_tegra_enable_clocks()), though.

Yes and you can make the same argument for every driver that calls
pm_runtime_get_sync() during probe to turn on clocks, handle resets,
etc, because at the end of the day the very first call to
pm_runtime_get_sync() invokes the runtime_resume callback, when we have
never been suspended.

Yes at the end of the day it is the same and given that we have done
this elsewhere I think it is good to be consistent if/where we can.

Furthermore, there are other various drivers in the kernel that do the
same ...

drivers/i2c/busses/i2c-img-scb.c
drivers/dma/xilinx/zynqmp_dma.c
drivers/gpu/drm/arm/malidp_drv.c

Cheers
Jon

-- 
nvpublic
