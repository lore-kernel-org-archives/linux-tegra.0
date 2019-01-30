From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ALSA: hda/tegra: enable clock during probe
Date: Wed, 30 Jan 2019 12:24:17 +0000
Message-ID: <4a607da0-616b-378d-b62a-598277f0254c@nvidia.com>
References: <1548351403-1875-1-git-send-email-spujar@nvidia.com>
 <s5h5zudc1qw.wl-tiwai@suse.de>
 <06c00ce1-32ed-8aa9-0340-d00202a8fa62@nvidia.com>
 <s5hr2d0zz96.wl-tiwai@suse.de>
 <b64f5d05-f352-7b46-d70d-3809aab8ddda@nvidia.com>
 <s5hef90zvo0.wl-tiwai@suse.de>
 <1f4c5185-e518-5674-4a8c-4e7db64aa0d3@nvidia.com>
 <da021878-5d89-c6d3-e5b2-4ab20f9b573b@nvidia.com>
 <ef05ac7a-8fa8-5776-312a-afecdeae10c6@nvidia.com>
 <s5h8sz2e8ev.wl-tiwai@suse.de>
 <4aee601a-f72c-7c94-60cb-ec2546900b8c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4aee601a-f72c-7c94-60cb-ec2546900b8c@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, Takashi Iwai <tiwai@suse.de>
Cc: pierre-louis.bossart@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org, thierry.reding@gmail.com, rlokhande@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2019 10:56, Sameer Pujar wrote:
>=20
> On 1/30/2019 4:09 PM, Takashi Iwai wrote:
>> On Wed, 30 Jan 2019 10:35:35 +0100,
>> Jon Hunter wrote:
>>>
>>> On 28/01/2019 06:06, Sameer Pujar wrote:
>>>> On 1/25/2019 7:34 PM, Jon Hunter wrote:
>>>>> On 25/01/2019 13:58, Takashi Iwai wrote:
>>>>>> On Fri, 25 Jan 2019 14:26:27 +0100,
>>>>>> Jon Hunter wrote:
>>>>>>> On 25/01/2019 12:40, Takashi Iwai wrote:
>>>>>>>> On Fri, 25 Jan 2019 12:36:00 +0100,
>>>>>>>> Jon Hunter wrote:
>>>>>>>>> On 24/01/2019 19:08, Takashi Iwai wrote:
>>>>>>>>>> On Thu, 24 Jan 2019 18:36:43 +0100,
>>>>>>>>>> Sameer Pujar wrote:
>>>>>>>>>>> If CONFIG_PM is disabled or runtime PM calls are forbidden, the
>>>>>>>>>>> clocks
>>>>>>>>>>> will not be ON. This could cause issue during probe, where
>>>>>>>>>>> hda init
>>>>>>>>>>> setup is done. This patch checks whether runtime PM is enabled
>>>>>>>>>>> or not.
>>>>>>>>>>> If disabled, clocks are enabled in probe() and disabled in
>>>>>>>>>>> remove()
>>>>>>>>>>>
>>>>>>>>>>> This patch does following minor changes as cleanup,
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 * return code check for pm_runtime_get_sync(=
) to take
>>>>>>>>>>> care of
>>>>>>>>>>> failure
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and exit gracefully.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 * In remove path runtime PM is disabled befo=
re calling
>>>>>>>>>>> snd_card_free().
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 * hda_tegra_disable_clocks() is moved out of=
 CONFIG_PM_SLEEP
>>>>>>>>>>> check.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 * runtime PM callbacks moved out of CONFIG_P=
M check
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>>>>>>>>> Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
>>>>>>>>>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>>>>>>>>> (snip)
>>>>>>>>>>> @@ -555,6 +553,13 @@ static int hda_tegra_probe(struct
>>>>>>>>>>> platform_device *pdev)
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!azx_has_pm_runtime(ch=
ip))
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm=
_runtime_forbid(hda->dev);
>>>>>>>>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* explicit resume if runtime =
PM is disabled */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!pm_runtime_enabled(hda->dev)) {
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D hda_tegra_r=
untime_resume(hda->dev);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto out_free;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>> +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_work(&hda->probe_=
work);
>>>>>>>>>> Calling runtime_resume here is really confusing...
>>>>>>>>> Why? IMO it is better to have a single handler for resuming the
>>>>>>>>> device
>>>>>>>>> and so if RPM is not enabled we call the handler directly. This i=
s
>>>>>>>>> what
>>>>>>>>> we have been advised to do in the past and do in other drivers.
>>>>>>>>> See ...
>>>>>>>> The point is that we're not "resuming" anything there.=C2=A0 It's =
in the
>>>>>>>> early probe stage, and the device state is uninitialized, not
>>>>>>>> really
>>>>>>>> suspended.=C2=A0 It'd end up with just calling the same helper
>>>>>>>> (hda_tegra_enable_clocks()), though.
>>>>>>> Yes and you can make the same argument for every driver that calls
>>>>>>> pm_runtime_get_sync() during probe to turn on clocks, handle resets=
,
>>>>>>> etc, because at the end of the day the very first call to
>>>>>>> pm_runtime_get_sync() invokes the runtime_resume callback, when
>>>>>>> we have
>>>>>>> never been suspended.
>>>>>> Although there are some magical pm_runtime_*() in some places,
>>>>>> most of
>>>>>> such pm_runtime_get_sync() is for the actual runtime PM management
>>>>>> (to
>>>>>> prevent the runtime suspend), while the code above is for explicitly
>>>>>> setting up something for non-PM cases.
>>>>>>
>>>>>> And if pm_runtime_get_sync() is obviously superfluous, we should
>>>>>> remove such calls.=C2=A0 Really.
>>>>> Yes agree.
>>>>>
>>>>>>> Yes at the end of the day it is the same and given that we have don=
e
>>>>>>> this elsewhere I think it is good to be consistent if/where we can.
>>>>>> The code becomes less readable, and that's a good reason against
>>>>>> it :)
>>>>> I don't its less readable. However, I do think it is less error
>>>>> prone :-)
>>>> Do we have a consensus here? Request others to provide opinions to hel=
p
>>>> close on this.
>>> I am not going to block this and ultimately it is Iwai-san call.
>>>
>>> However, I wonder if it would be appropriate to move the whole ...
>>>
>>> =C2=A0 if (pm_runtime_enabled())
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D pm_runti=
me_get_sync();
>>> =C2=A0 else
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hda_tegr=
a_runtime_resume();
>>>
>>> ... into the probe_work function? In other words, we are just resuming
>>> when we really need to. Unless I am still misunderstanding Iwai-san
>>> comment. Otherwise if Iwai-san is happy with V2 then go with that.
>> Only from my personal taste, I find the v2 patch is better.
>> It like simpler, after all.=C2=A0 That is, the code in v1 patch
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0probe() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_enable();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pm_runtime_enabled())
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hda_t=
egra_runtime_resume();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_work();
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0work() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_get_sync();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_put();
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> becomes shorter in v2:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0probe() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hda_tegra_enable_clocks();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_work();
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0work() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_enable();
>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>
>>
>> However, the point about hda_tegra_remove() you raised in the v2 patch
>> is still valid.=C2=A0 (BTW, I guess the discussion followed in that thre=
ad
>> was somehow misunderstood; your argument was about hda_tegra_remove()
>> while Sameer discussed about the probe.)=C2=A0 It can be with
>> hda_tegra_disable_clocks() if we want more consistency.
>>
>> Though, I don't mind too much about that as long as the proper comment
>> is given.
> We might need entire functionality of hda_tegra_runtime_suspend()
> replicated here,
> if hda_tegra_disable_clocks() were to be used. Right now it takes care
> of both the
> cases where runtime PM is enabled/disabled. If you all agree, we can
> move the
> discussion to v2 patch.

We should avoid replicating the function.

Jon

--=20
nvpublic
