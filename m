From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ASoC: tegra: add Tegra186 based DSPK driver
Date: Mon, 10 Feb 2020 20:19:09 +0530
Message-ID: <ffff29e1-7ffb-01a0-a36a-fbc1e0604e5c@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
 <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
 <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4c75fc51-fbfd-158f-a096-d4f178921ee3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/10/2020 5:52 PM, Jon Hunter wrote:
> On 10/02/2020 11:15, Sameer Pujar wrote:
>>
>> On 2/7/2020 11:52 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 07.02.2020 14:26, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 2/6/2020 10:45 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> +static const struct dev_pm_ops tegra186_dspk_pm_ops =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_s=
uspend,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
gra186_dspk_runtime_resume, NULL)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_fo=
rce_suspend,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_force_=
resume)
>>>>>> +};
>>>>> Could you please explain why drivers need the "late" system sleep?
>>>> It was done to ensure core drivers are suspended first and defer the
>>>> codec driver suspend
>>> Suspend order is opposite to the drivers registration order. If there i=
s
>>> no real problem with that, then you should use the default suspend
>>> level. Please don't try to fix a non-existent problems.
>> No. This was done specifically to allow sound core to first stop any
>> ongoing audio activity during normal suspend and ensure a safe suspend
>> of AHUB devices by doing a LATE suspend.
> What Dmitry is saying is that if the DSPK driver is registered after the
> sound core then we will not need to suspend in the late phase. The DSPK
> device should only be registered once the sound core is loaded, because
> otherwise we should fail to register it with the sound core. So I don't
> think we need this to be late afterall.

I was originally thinking if DMA is the main reason for using LATE=20
suspend for audio drivers as well. I did a small sanity check and=20
appears normal suspend is fine. I will update the drivers with normal=20
suspend. If we come across any issue later, it can be addressed=20
separately. Thanks Dmitry and Jon.
>
> Jon
>
