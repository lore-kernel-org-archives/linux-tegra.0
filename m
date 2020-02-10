From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ASoC: tegra: add Tegra186 based DSPK driver
Date: Mon, 10 Feb 2020 12:22:56 +0000
Message-ID: <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
 <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3c19ef99-8051-76f7-a4d6-0d61182fe6e4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 10/02/2020 11:15, Sameer Pujar wrote:
>=20
>=20
> On 2/7/2020 11:52 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 07.02.2020 14:26, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> On 2/6/2020 10:45 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +static const struct dev_pm_ops tegra186_dspk_pm_ops =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_su=
spend,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
gra186_dspk_runtime_resume, NULL)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_for=
ce_suspend,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_force_=
resume)
>>>>> +};
>>>> Could you please explain why drivers need the "late" system sleep?
>>> It was done to ensure core drivers are suspended first and defer the
>>> codec driver suspend
>> Suspend order is opposite to the drivers registration order. If there is
>> no real problem with that, then you should use the default suspend
>=20
>> level. Please don't try to fix a non-existent problems.
>=20
> No. This was done specifically to allow sound core to first stop any
> ongoing audio activity during normal suspend and ensure a safe suspend
> of AHUB devices by doing a LATE suspend.

What Dmitry is saying is that if the DSPK driver is registered after the
sound core then we will not need to suspend in the late phase. The DSPK
device should only be registered once the sound core is loaded, because
otherwise we should fail to register it with the sound core. So I don't
think we need this to be late afterall.

Jon

--=20
nvpublic
