From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
Date: Mon, 27 Jan 2020 10:52:17 +0530
Message-ID: <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <075e476a-36bb-5fee-15bc-76af4474a797-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/24/2020 7:34 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.01.2020 12:51, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 24/01/2020 09:07, Jon Hunter wrote:
>>> On 23/01/2020 15:16, Dmitry Osipenko wrote:
>>>> 23.01.2020 12:22, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>
>>>>> On 1/22/2020 9:57 PM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 22.01.2020 14:52, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 22/01/2020 07:16, Sameer Pujar wrote:
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>>>>>>>>> +static int tegra210_i2s_remove(struct platform_device *pdev=
)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +     pm_runtime_disable(&pdev->dev);
>>>>>>>>>>>>>> +     if (!pm_runtime_status_suspended(&pdev->dev))
>>>>>>>>>>>>>> +             tegra210_i2s_runtime_suspend(&pdev->dev);
>>>>>>>>>>>>> This breaks device's RPM refcounting if it was disabled in th=
e
>>>>>>>>>>>>> active
>>>>>>>>>>>>> state. This code should be removed. At most you could warn
>>>>>>>>>>>>> about the
>>>>>>>>>>>>> unxpected RPM state here, but it shouldn't be necessary.
>>>>>>>>>>>> I guess this was added for safety and explicit suspend keeps c=
lock
>>>>>>>>>>>> disabled.
>>>>>>>>>>>> Not sure if ref-counting of the device matters when runtime PM=
 is
>>>>>>>>>>>> disabled and device is removed.
>>>>>>>>>>>> I see few drivers using this way.
>>>>>>>>>>> It should matter (if I'm not missing something) because RPM sho=
uld
>>>>>>>>>>> be in
>>>>>>>>>>> a wrecked state once you'll try to re-load the driver's module.
>>>>>>>>>>> Likely
>>>>>>>>>>> that those few other drivers are wrong.
>>>>>>>>>>>
>>>>>>>>>>> [snip]
>>>>>>>>>> Once the driver is re-loaded and RPM is enabled, I don't think i=
t
>>>>>>>>>> would use
>>>>>>>>>> the same 'dev' and the corresponding ref count. Doesn't it use t=
he
>>>>>>>>>> new
>>>>>>>>>> counters?
>>>>>>>>>> If RPM is not working for some reason, most likely it would be t=
he
>>>>>>>>>> case
>>>>>>>>>> for other
>>>>>>>>>> devices. What best driver can do is probably do a force suspend
>>>>>>>>>> during
>>>>>>>>>> removal if
>>>>>>>>>> already not done. I would prefer to keep, since multiple drivers
>>>>>>>>>> still
>>>>>>>>>> have it,
>>>>>>>>>> unless there is a real harm in doing so.
>>>>>>>>> I took a closer look and looks like the counter actually should b=
e
>>>>>>>>> reset. Still I don't think that it's a good practice to make chan=
ges
>>>>>>>>> underneath of RPM, it may strike back.
>>>>>>>> If RPM is broken, it probably would have been caught during device
>>>>>>>> usage.
>>>>>>>> I will remove explicit suspend here if no any concerns from other
>>>>>>>> folks.
>>>>>>>> Thanks.
>>>>>>> I recall that this was the preferred way of doing this from the RPM
>>>>>>> folks. Tegra30 I2S driver does the same and Stephen had pointed me =
to
>>>>>>> this as a reference.
>>>>>>> I believe that this is meant to ensure that the
>>>>>>> device is always powered-off regardless of it RPM is enabled or not=
 and
>>>>>>> what the current state is.
>>>>>> Yes, it was kinda actual for the case of unavailable RPM.
>>>>>> Anyways, /I think/ variant like this should have been more preferred=
:
>>>>>>
>>>>>> if (!pm_runtime_enabled(&pdev->dev))
>>>>>>           tegra210_i2s_runtime_suspend(&pdev->dev);
>>>>>> else
>>>>>>           pm_runtime_disable(&pdev->dev);
>>>>> I think it looks to be similar to what is there already.
>>>>>
>>>>> pm_runtime_disable(&pdev->dev); // it would turn out to be a dummy ca=
ll
>>>>> if !RPM
>>>>> if (!pm_runtime_status_suspended(&pdev->dev)) // it is true always if=
 !RPM
>>>>>          tegra210_i2s_runtime_suspend(&pdev->dev);
>>>> Maybe this is fine for !RPM, but not really fine in a case of enabled
>>>> RPM. Device could be in resumed state after pm_runtime_disable() if it
>>>> wasn't suspended before the disabling.
>>> I don't see any problem with this for the !RPM case.
>> Sorry I meant the RPM case. In other words, I don't see a problem for
>> neither the RPM case of the !RPM case.
> 1. Device shall be in RPM-suspended state at the time of driver's
> removal, unless there is a bug in the sound driver. Hence why do you
> need the dead code which doesn't bring any practical value?
>
> 2. Making changes underneath of RPM is simply error-prone. It may hit
> badly in the future once something will change in the RPM core.

I think we are stretching a bit more here when there is no any real harm.
Right now it works well for both RPM and !RPM case and if we really need to
fix something in future we can fix. Since my initial inclination was keepin=
g
the code as it is and Jon also has similar thoughts, I would retain this=20
code.
Sorry Dmitry, we can fix if something comes up and many other drivers would
need this at that time.
