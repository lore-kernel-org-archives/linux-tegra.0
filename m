From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
Date: Wed, 22 Jan 2020 12:46:07 +0530
Message-ID: <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <598fe377-5b95-d30a-eb64-89a645166d42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/22/2020 11:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 22.01.2020 07:32, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [snip]
>>>>>> +static int tegra210_i2s_remove(struct platform_device *pdev)
>>>>>> +{
>>>>>> +     pm_runtime_disable(&pdev->dev);
>>>>>> +     if (!pm_runtime_status_suspended(&pdev->dev))
>>>>>> +             tegra210_i2s_runtime_suspend(&pdev->dev);
>>>>> This breaks device's RPM refcounting if it was disabled in the active
>>>>> state. This code should be removed. At most you could warn about the
>>>>> unxpected RPM state here, but it shouldn't be necessary.
>>>> I guess this was added for safety and explicit suspend keeps clock
>>>> disabled.
>>>> Not sure if ref-counting of the device matters when runtime PM is
>>>> disabled and device is removed.
>>>> I see few drivers using this way.
>>> It should matter (if I'm not missing something) because RPM should be i=
n
>>> a wrecked state once you'll try to re-load the driver's module. Likely
>>> that those few other drivers are wrong.
>>>
>>> [snip]
>> Once the driver is re-loaded and RPM is enabled, I don't think it would =
use
>> the same 'dev' and the corresponding ref count. Doesn't it use the new
>> counters?
>> If RPM is not working for some reason, most likely it would be the case
>> for other
>> devices. What best driver can do is probably do a force suspend during
>> removal if
>> already not done. I would prefer to keep, since multiple drivers still
>> have it,
>> unless there is a real harm in doing so.
> I took a closer look and looks like the counter actually should be
> reset. Still I don't think that it's a good practice to make changes
> underneath of RPM, it may strike back.

If RPM is broken, it probably would have been caught during device usage.
I will remove explicit suspend here if no any concerns from other folks.=20
Thanks.
>
>>>>>> +     int rx_fifo_th;
>>>>> Could rx_fifo_th be negative?
>>>> rx_fifo_th itself does not take negative values, explicit
>>>> typecasting> is avoided in "if" condition by declaring this as "int"
>>> Explicit typecasting isn't needed for integers.
>> What I meant was, rx_fifo_th is checked against a 'int' variable in an
>> "if" condition.
> What's the problem with comparing of unsigned with signed?

consider this example,
----
unsigned int x =3D 5;
int y =3D -1;

(x > y) is false.
----
Hence should be careful while using signed and unsigned comparisons.
>
> Besides, cif_conf.audio_ch > I2S_RX_FIFO_DEPTH can't be ever true, isn't
> it? I2S_RX_FIFO_DEPTH=3D64, channels_max=3D16

Yes true.
> Lastly, nothing stops you to make max_th unsigned.

will update.
