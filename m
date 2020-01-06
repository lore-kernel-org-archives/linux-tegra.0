From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Tue, 7 Jan 2020 01:59:03 +0300
Message-ID: <50657716-a719-6fe1-af3e-76eb90ca0ac5@gmail.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
 <20191225175736.GC27497@sirena.org.uk>
 <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
 <dbbce994-27f5-d949-078d-05646100e6be@nvidia.com>
 <b6ec6cfd-d883-ea28-00f8-884fa80cfee1@nvidia.com>
 <576fca44-6734-5431-b523-512747a0bf12@gmail.com>
 <fb252096-e101-7d21-9717-c23607ae6edd@nvidia.com>
 <0f956c12-98cf-3466-f3ee-ffc3a23e3e3d@gmail.com>
 <9e08a1eb-7a9f-0ed0-a2f4-08f1d6f93958@nvidia.com>
 <359bf92f-2e67-28b2-8412-9e47bb24ffdb@nvidia.com>
 <5921f8e1-359d-4352-a785-8a685cd1a200@nvidia.com>
 <33eb0b3e-5605-3dfd-a6ea-a50ae1348c86@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <33eb0b3e-5605-3dfd-a6ea-a50ae1348c86@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.01.2020 19:30, Sowjanya Komatineni пишет:
> 
> On 1/6/20 8:09 AM, Sowjanya Komatineni wrote:
>>
>> On 1/5/20 8:21 PM, Sameer Pujar wrote:
>>>
>>> On 1/5/2020 10:33 AM, Sowjanya Komatineni wrote:
>>>>
>>>> On 1/4/20 5:05 PM, Dmitry Osipenko wrote:
>>>>> 04.01.2020 08:49, Sowjanya Komatineni пишет:
>>>>>> On 1/2/20 8:12 AM, Dmitry Osipenko wrote:
>>>>>>> 02.01.2020 10:03, Sowjanya Komatineni пишет:
>>>>>>>> On 12/27/19 1:19 PM, Sowjanya Komatineni wrote:
>>>>>>>>> On 12/27/19 6:56 AM, Dmitry Osipenko wrote:
>>>>>>>>>> 25.12.2019 20:57, Mark Brown пишет:
>>>>>>>>>>> On Mon, Dec 23, 2019 at 12:14:34AM +0300, Dmitry Osipenko wrote:
>>>>>>>>>>>> 21.12.2019 01:26, Sowjanya Komatineni пишет:
>>>>>>>>>>>>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from
>>>>>>>>>>>>> Tegra30
>>>>>>>>>>>>> through Tegra210 and currently Tegra clock driver does
>>>>>>>>>>>>> initial parent
>>>>>>>>>>>>> configuration for audio mclk "clk_out_1" and enables them
>>>>>>>>>>>>> by default.
>>>>>>>>>>> Please delete unneeded context from mails when replying. 
>>>>>>>>>>> Doing this
>>>>>>>>>>> makes it much easier to find your reply in the message,
>>>>>>>>>>> helping ensure
>>>>>>>>>>> it won't be missed by people scrolling through the irrelevant
>>>>>>>>>>> quoted
>>>>>>>>>>> material.
>>>>>>>>>> Ok
>>>>>>>>>>
>>>>>>>>>>>>> - clk_disable_unprepare(data->clk_cdev1);
>>>>>>>>>>>>> - clk_disable_unprepare(data->clk_pll_a_out0);
>>>>>>>>>>>>> - clk_disable_unprepare(data->clk_pll_a);
>>>>>>>>>>>>> +    if (__clk_is_enabled(data->clk_cdev1))
>>>>>>>>>>>>> + clk_disable_unprepare(data->clk_cdev1);
>>>>>>>>>>>> The root of the problem is that you removed clocks enabling
>>>>>>>>>>>> from
>>>>>>>>>>>> tegra_asoc_utils_init().
>>>>>>>>> currently, audio mclk and its parent clocks enabling are from
>>>>>>>>> clock
>>>>>>>>> driver init and not from tegra_asoc_utils_init.
>>>>>>>>>>>> I'm not sure why clocks should be disabled during the
>>>>>>>>>>>> rate-changing,
>>>>>>>>>>>> probably this action is not really needed.
>>>>>>>>>>> I know nothing about this particular device but this is not that
>>>>>>>>>>> unusual a restriction for audio hardware, you often can't
>>>>>>>>>>> robustly reconfigure the clocking for a device while it's active
>>>>>>>>>>> due to issues in the hardware.  You often see issues with FIFOs
>>>>>>>>>>> glitching or state machines getting stuck. This may not be an
>>>>>>>>>>> issue here but if it's something that's documented as a
>>>>>>>>>>> requirement it's probably good to pay attention.
>>>>>>>>>> I don't know details about that hardware either, maybe it is
>>>>>>>>>> simply not
>>>>>>>>>> safe to change PLL_A rate dynamically and then
>>>>>>>>>> CLK_SET_RATE_GATE could
>>>>>>>>>> be used.
>>>>>>>>>>
>>>>>>>>>> If nobody knows for sure, then will be better to keep
>>>>>>>>>> tegra_asoc_utils_set_rate() unchanged.
>>>>>>>>> plla rate change through tegra_asoc_utils_set_rate() happens
>>>>>>>>> only when
>>>>>>>>> there is not active playback or record corresponding to this sound
>>>>>>>>> device.
>>>>>>>>>
>>>>>>>>> So, I don't see reason for disabling clock during rate change
>>>>>>>>> and not
>>>>>>>>> sure why we had this from the beginning.
>>>>>>>>>
>>>>>>>>> Thierry/Sameer,
>>>>>>>>>
>>>>>>>>> Can you please comment?
>>>>>>>>>
>>>>>>>>> Yes, we can use CLK_SET_RATE_GATE for PLLA and remove clock
>>>>>>>>> disabling
>>>>>>>>> before rate change.
>>>>>>>>>
>>>>>>>> PLLA is used for both I2S controller clock and also for audio
>>>>>>>> mclk. I2S
>>>>>>>> driver suspend resume implementations takes care of enabling and
>>>>>>>> disabling I2S clock but audio mclk will be enabled during that
>>>>>>>> time and
>>>>>>>> PLLA disable might not happen. So using CLK_SET_RATE_GATE
>>>>>>>> prevents rate
>>>>>>>> change to happen and as rate change happens only when there is
>>>>>>>> no active
>>>>>>>> audio record/playback, we can perform rate change without
>>>>>>>> disable/enable
>>>>>>>> during rate change.
>>>>>>>>
>>>>>>>> So probably below changes should be good.
>>>>>>>>
>>>>>>>>    * remove asoc_utils_set_rate call from asoc_utils_init as
>>>>>>>> set_rate
>>>>>>>>      happens during existing hw_params callback implementations
>>>>>>>> in sound
>>>>>>>>      drivers and there is no need to do rate change during
>>>>>>>> asoc_utils_init.
>>>>>>>>    * remove disable/enable clocks during rate change in
>>>>>>>> asoc_utils_set_rate.
>>>>>>>>    * add startup and shutdown snd_soc_ops callbacks to do enable
>>>>>>>> and
>>>>>>>>      disable audio mclk.
>>>>>>>>
>>>>>>> Sounds good, thanks. I'll be happy to review and test it.
>>>>>> Regarding disabling audio mclk during PLLA rate change, no need to
>>>>>> explicitly disable PLLA on asoc utils as clock driver takes care
>>>>>> of it
>>>>>> properly during pll rate change.
>>>>>>
>>>>>> But the downstream clock divider hardware can malfunction without
>>>>>> recovery when subject to unstable PLL output during locking, unless
>>>>>> clock is gated.
>>>>>>
>>>>>> So it is recommended to disable downstream clocks during PLL rate
>>>>>> change.
>>>>>>
>>>>>> PLLA downstream clocks are I2S and audio mclk (cdev1/clk1 and extern1
>>>>>> clocks) and I2S clock is disabled in I2S driver by PM runtime ops.
>>>>> The I2S driver uses asynchronous pm_runtime_put() and thus there is no
>>>>> guarantee that I2S clock is disabled at the time of changing PLLA
>>>>> rate.
>>>>> Could this be a problem?
>>>> Looking into soc_pcm_hw_params, I see dai_link hw_params ops happens
>>>> prior to  platform snd_soc_dai_driver hw_params ops.
>>>
>>> This is true.
>>>
>>>>
>>>> So, PLL rate change thru asoc_utils_set_rate happens during sample
>>>> rate config of dai_link hw_params ops and during this time I2S will
>>>> always be in idle state.
>>>
>>> This is probably not the case, since runtime resume for I2S would
>>> have already enabled the clock for I2S and in turn PLLA. The
>>> hw_param() call would happen later.
>>> We could have used a fixed clock rate for PLLA, but the reason why we
>>> are setting the rate at runtime is, we support sample rates (and
>>> multuples) of 8kHz and 11.025kHz.
>>> Both of these require a different PLLA base rate for downstream clock
>>> dividers to work properly. That is why, I think we have two base
>>> rates for PLLA.
>>>
>>> Even if we want to enable the clocks (for i2s) in hw_param(), this
>>> still may not help.
>>> For example there could be multiple I2S instances, which can use the
>>> same PLLA source. ALSA playback/capture on different I2S can run
>>> independently.
>>> Hence we are not sure if clk_disable_unprepare() in
>>> tegra_asoc_utils.c would actually disable PLLA. Hence I think the
>>> problem exists in current code too.
>>
>> clk_disable_unprepare in aosc_utils_set_rate will not disable PLLA as
>> it will be in use by other consumer (I2S).
>>
>> But clock driver it self takes care of disabling pll output and
>> keeping it in bypass state so its not really like PLLA output is off.
>>
>> So regarding PLLA rate change, we dont have to explicitly disable in
>> audio driver as pll clock driver takes care during rate update,
>>
>> But consumer clocks of PLLA need to be disabled during rate update so
>> existing dividers doesn't cause any malfunction with new rate update.
>>
>> audio mclk can will be in disabled state during rate update thru
>> hw_params with addition of shutdown snd_soc_ops callbacks to disable
>> of audio mclk.
>>
>> But issue is for I2S clock where clock might be in enabled state and
>> this is issue with current I2S driver already.
>>
>> Sameer/Dmitry,
>>
>> Making sure I2S clock is in disabled state during rate update is
>> something need to work thru for proper fix and this is not related to
>> this patch series as this issue exists with current upstream.
>>
>> So, can we take care of this as separate patch out of this series so I
>> can get this series out as this PMC clock changes are needed for
>> upcoming camera drivers.
>>
> Based on internal discussion with sameer, proper I2S clock fix will be
> take care separately and this is not something introduced with this
> patch series.
> 
> So, will move once with audio MCLK fix in next version of patch series.
> 
>   * remove asoc_utils_set_rate call from asoc_utils_init as set_rate
>     happens during hw_params callback based on existing driver
>   * add shutdown snd_soc_ops callbacks to disable of audio mclk
>   * remove disable clocks prior to rate change in asoc_utils_set_rate
>     (as audio mclk will already be in disabled state by the time
>     hw_param callback gets executed) and keep audio mclk enable after
>     rate change in asoc_utils_set_rate
> 
>>> We really want to allow user to run any sample rate in the supported
>>> range. However the sample rate is known during hw_param() callback.
>>>
>>> Looking at current discussion, we may have to provide an aternate way
>>> of switching PLLA base rate (may be not in ALSA callbacks)
>>>
>>>>
>>>> Sameer, Please confirm.
>>>>
>>>>>> For audio mclk, need to make sure mclk are disabled during rate
>>>>>> change.
>>>>>>
>>>>>> So below are the changes to audio clocks that will be in next
>>>>>> version.
>>>>>>
>>>>>>    * remove tegra_asoc_utils_set_rate call from
>>>>>> tegra_asoc_utils_init as
>>>>>>      tegra_asoc_utils_set_rate happens during hw_params callback.
>>>>>>    * add shutdown snd_soc_ops callbacks to disable of audio mclk.
>>>>>>    * remove disable audio mclk (cdev1) and plla clocks prior to rate
>>>>>>      change in tegra_asoc_utils_set_rate (as audio mclk will
>>>>>> always be in
>>>>>>      disabled state every time hw_param callback gets executed)
>>>>>> and keep
>>>>>>      audio mclk enable after the rate change in
>>>>>> tegra_asoc_utils_set_rate.
>>>>>>

Indeed, it should be better to factor out all changes that are not
directly related to the PMC patches into separate patchset.
