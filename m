From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: Regression: ASoC: soc-core: clear platform pointers on error
Date: Mon, 4 Mar 2019 13:07:34 +0000
Message-ID: <e4b5fe11-0351-ee0b-d093-2044c9b0475d@nvidia.com>
References: <bbc0d37a-5a08-9ce0-58b6-c89d28c558ce@nvidia.com>
 <CAOReqxhYUASVFdrHzKEr8F_NA0CNnJ1Hx51L4ganvcrK=dSCCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOReqxhYUASVFdrHzKEr8F_NA0CNnJ1Hx51L4ganvcrK=dSCCA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Curtis Malainey <cujomalainey@google.com>
Cc: Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
List-Id: linux-tegra@vger.kernel.org


On 01/03/2019 17:28, Curtis Malainey wrote:
> On Fri, Mar 1, 2019 at 4:07 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Hi Mark, Curtis,
>>
>> I am seeing a regression on -next where the soundcard on one of our
>> Tegra boards fails to initialise following a probe deferral. The bisect
>> points to the commit 78a24e10cd94420f1b4e2dc5923ae7109e2aaba1 ('ASoC:
>> soc-core: clear platform pointers on error') and reverting this on top
>> of -next fixes the problem.
>>
>> Looking at the bootlog from the failure I see ...
>>
>>  tegra-snd-wm8903 sound: ASoC: failed to init link WM8903
>>
>>  tegra-snd-wm8903 sound: snd_soc_register_card failed (-517)
>>
>>  tegra30-i2s 70080400.i2s: DMA channels sourced from device 70080000.ahub
>>
>>  tegra-snd-wm8903 sound: ASoC: Both platform name/of_node are set for WM8903
>>
>>  tegra-snd-wm8903 sound: ASoC: failed to init link WM8903
>>
>>  tegra-snd-wm8903 sound: snd_soc_register_card failed (-22)
>>
>>  tegra-snd-wm8903: probe of sound failed with error -22
>>
>>
>> With the above change I see soc_cleanup_platform() is ever being called
>> when the probe is deferred and hence leads to the failure. Note that the
>> initial failure, "ASoC: failed to init link WM8903" occurs very early
>> in snd_soc_register_card() when initialising the prelinks.
>>
>> The following fixes it, but I have not scrutinised the code to see if
>> there are other exit points that we need to handle.
>>
> You are indeed correct. That should be there. I think I got confused
> when I was doing my initial debugging on our local 4.19 kernel as the
> cleanup code had changed when I was testing on -next and forgot to add
> this to my upstream patch and it wasn't caught in my testing. Thanks
> for catching this. I went back and looked and it appears that is the
> only call to soc_init_dai_link that is outside soc_instantiate_card
> and therefore not caught by the original patch's cleanup routine. Do
> you want to submit a patch and I'll add my signoff?

Thanks. I will send out a patch shortly.

Cheers
Jon

-- 
nvpublic
