From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 11:34:15 -0700
Message-ID: <11c93dac-f5ba-2193-6f44-63af27fdce09@nvidia.com>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
 <20200519162444.GD2113674@ulmo>
 <b4eb368e-adc2-7b77-3ae9-fefdcfddaf3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b4eb368e-adc2-7b77-3ae9-fefdcfddaf3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 5/19/20 9:33 AM, Dmitry Osipenko wrote:
> 19.05.2020 19:24, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry Osipenko wrote:
>>> 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>>>>> Several people asked me about the MMC warnings in the KMSG log and
>>>>> I had to tell to ignore them because these warning are irrelevant to
>>>>> pre-Tegra210 SoCs.
>>>> Why are the warnings irrelevant?
>>> That's what the DT binding doc says [1].
>>>
>>> [1]
>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidia=
%2Ctegra20-sdhci.txt
>>>
>>> Although, looking at the driver's code and TRM docs, it seems that all
>>> those properties are really irrelevant only to the older Terga20 SoC. S=
o
>>> the binding doc is a bit misleading.
>>>
>>> Nevertheless, the binding explicitly says that the properties are
>>> optional, which is correct.
>> Optional only means that drivers must not fail if these properties
>> aren't found, it doesn't mean that the driver can't warn that they
>> are missing.
>>
>> Quite possibly the only reason why they were made optional is because
>> they weren't part of the bindings since the beginning. Anything added
>> to a binding after the first public release has to be optional by
>> definition, otherwise DT ABI wouldn't be stable.
>>
>> I think these warnings were added on purpose, though I also see that
>> there are only values for these in device tree for Tegra186 and Tegra194
>> but not Tegra210 where these should also be necessary.

dt binding doc we have is common for MMC, SD and SDIO of all Tegras. Its=20
not mandatory to have both 3v3 and 1v8 in device tree as based on signal=20
mode.

As these driver strengths are SoC specific, they are part of Tegra SoC=20
specific device tree where same values will be applicable to all Tegra=20
SoC specific platforms.

Based on interface usage on platform, we use one or both of them like=20
sdcard supports dual voltage and we use both 3V3 and 1V8 but if same=20
interface is used for WIFI SD we use 1V8 only.

So made these dt properties as optional.

Other reason they are optional is, Tegra210 and prior has drive strength=20
settings part of apb_misc and Tegra186 and later has driver strengths=20
part of SDMMC controller. So,

- Pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" for driver strengths are=20
applicable for Tegra210 and prior.
- dt properties pad-autocal-pull-up/down-offset-1v8/3v3-timeout are for=20
T186 onwards for driver strengths

Looks like dt binding doc need fix to clearly document these based on=20
SoC or agree with Yaml we can conditionally specify pinctrl or dt=20
properties based on SoC dependent.


>> Adding Sowjanya who wrote this code. Perhaps she can clarify why the
>> warnings were added. If these values /should/ be there on a subset of
>> Tegra, then I think we should keep them, or add them again, but perhaps
>> add a better way of identifying when they are necessary and when it is
>> safe to work without them.
>>
>> That said, looking at those checks I wonder if they are perhaps just
>> wrong. Or at the very least they seem redundant. It looks to me like
>> they can just be:
>>
>> 	if (tegra_host->pinctrl_state_XYZ =3D=3D NULL) {
>> 		...
>> 	}
>>
>> That !IS_ERR(...) doesn't seem to do anything. But in that case, it's
>> also obvious why we're warning about them on platforms where these
>> properties don't exist in DT.

As drive strengths are through dt properties for T186 and later and thru=20
pinctrl for T210 and prior, driver first checks for dt autocal timeout=20
pull-up/down properties and if they are not found, it then checks for=20
presence of pinctrl_state_xyx_drv only when valid pinctrl_state_xyz is=20
present.

Driver expects either pinctrl or dt properties and shows warning when=20
neither of them are present as its mandatory to use fixed driver=20
strengths when auto calibration fails.

 =C2=A0=C2=A0=C2=A0 err =3D device_property_read_u32(host->mmc->parent,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "nvidia,pad-autoc=
al-pull-down-offset-3v3-timeout",
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 &autocal->pull_do=
wn_3v3_timeout);
 =C2=A0=C2=A0=C2=A0 if (err) {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!IS_ERR(tegra_host->pinctrl_stat=
e_3v3) &&
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 (tegra_host->pinc=
trl_state_3v3_drv =3D=3D NULL))
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn("%s: Miss=
ing autocal timeout 3v3-pad drvs\n",
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mmc_hostname(host->mmc));
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 autocal->pull_down_3v3_timeout =3D 0=
;
 =C2=A0=C2=A0=C2=A0 }

>>
>> So I think we either need to add those values where appropriate so that
>> the warning doesn't show, or we need to narrow down where they are
>> really needed and add a corresponding condition.
>>
>> But again, perhaps Sowjanya can help clarify if these really are only
>> needed on Tegra210 and later or if these also apply to older chips.
> Either way will be cleaner to convert the DT binding to YAML rather than
> clutter the driver, IMO.
>
