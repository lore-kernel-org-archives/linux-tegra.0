From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
Date: Wed, 22 Jan 2020 11:52:14 +0000
Message-ID: <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3f51939d-cf4b-f69b-728a-7eb99bbae458-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 22/01/2020 07:16, Sameer Pujar wrote:

...

>>>>>>> +static int tegra210_i2s_remove(struct platform_device *pdev)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_disable(&pdev->dev);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!pm_runtime_status_suspended(&pdev->d=
ev))
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 tegra210_i2s_runtime_suspend(&pdev->dev);
>>>>>> This breaks device's RPM refcounting if it was disabled in the activ=
e
>>>>>> state. This code should be removed. At most you could warn about the
>>>>>> unxpected RPM state here, but it shouldn't be necessary.
>>>>> I guess this was added for safety and explicit suspend keeps clock
>>>>> disabled.
>>>>> Not sure if ref-counting of the device matters when runtime PM is
>>>>> disabled and device is removed.
>>>>> I see few drivers using this way.
>>>> It should matter (if I'm not missing something) because RPM should
>>>> be in
>>>> a wrecked state once you'll try to re-load the driver's module. Likely
>>>> that those few other drivers are wrong.
>>>>
>>>> [snip]
>>> Once the driver is re-loaded and RPM is enabled, I don't think it
>>> would use
>>> the same 'dev' and the corresponding ref count. Doesn't it use the new
>>> counters?
>>> If RPM is not working for some reason, most likely it would be the case
>>> for other
>>> devices. What best driver can do is probably do a force suspend during
>>> removal if
>>> already not done. I would prefer to keep, since multiple drivers still
>>> have it,
>>> unless there is a real harm in doing so.
>> I took a closer look and looks like the counter actually should be
>> reset. Still I don't think that it's a good practice to make changes
>> underneath of RPM, it may strike back.
>=20
> If RPM is broken, it probably would have been caught during device usage.
> I will remove explicit suspend here if no any concerns from other folks.
> Thanks.

I recall that this was the preferred way of doing this from the RPM
folks. Tegra30 I2S driver does the same and Stephen had pointed me to
this as a reference. I believe that this is meant to ensure that the
device is always powered-off regardless of it RPM is enabled or not and
what the current state is.

Now for Tegra210 (or actually 64-bit Tegra) RPM is always enabled and so
we don't need to worry about the !RPM case. However, I still don't see
the harm in this.

Jon

--=20
nvpublic
