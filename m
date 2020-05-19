From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 13:44:18 -0700
Message-ID: <c712de1d-cfa4-2746-ec6b-54f318aeaac2@nvidia.com>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
 <20200519162444.GD2113674@ulmo>
 <b4eb368e-adc2-7b77-3ae9-fefdcfddaf3d@gmail.com>
 <11c93dac-f5ba-2193-6f44-63af27fdce09@nvidia.com>
 <aed72c87-0e16-6dea-a4e2-7fc6a97cd313@nvidia.com>
 <c7469c16-f6f1-f9c0-566f-3b1d3774f130@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c7469c16-f6f1-f9c0-566f-3b1d3774f130-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 5/19/20 12:07 PM, Sowjanya Komatineni wrote:
>
> On 5/19/20 11:41 AM, Sowjanya Komatineni wrote:
>>
>> On 5/19/20 11:34 AM, Sowjanya Komatineni wrote:
>>>
>>> On 5/19/20 9:33 AM, Dmitry Osipenko wrote:
>>>> 19.05.2020 19:24, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry Osipenko wrote:
>>>>>> 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=20
>>>>>>> wrote:
>>>>>>>> Several people asked me about the MMC warnings in the KMSG log and
>>>>>>>> I had to tell to ignore them because these warning are=20
>>>>>>>> irrelevant to
>>>>>>>> pre-Tegra210 SoCs.
>>>>>>> Why are the warnings irrelevant?
>>>>>> That's what the DT binding doc says [1].
>>>>>>
>>>>>> [1]
>>>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvi=
dia%2Ctegra20-sdhci.txt=20
>>>>>>
>>>>>>
>>>>>> Although, looking at the driver's code and TRM docs, it seems=20
>>>>>> that all
>>>>>> those properties are really irrelevant only to the older Terga20=20
>>>>>> SoC. So
>>>>>> the binding doc is a bit misleading.
>>>>>>
>>>>>> Nevertheless, the binding explicitly says that the properties are
>>>>>> optional, which is correct.
>>>>> Optional only means that drivers must not fail if these properties
>>>>> aren't found, it doesn't mean that the driver can't warn that they
>>>>> are missing.
>>>>>
>>>>> Quite possibly the only reason why they were made optional is because
>>>>> they weren't part of the bindings since the beginning. Anything added
>>>>> to a binding after the first public release has to be optional by
>>>>> definition, otherwise DT ABI wouldn't be stable.
>>>>>
>>>>> I think these warnings were added on purpose, though I also see that
>>>>> there are only values for these in device tree for Tegra186 and=20
>>>>> Tegra194
>>>>> but not Tegra210 where these should also be necessary.
>>>
>>> dt binding doc we have is common for MMC, SD and SDIO of all Tegras.=20
>>> Its not mandatory to have both 3v3 and 1v8 in device tree as based=20
>>> on signal mode.
>>>
>>> As these driver strengths are SoC specific, they are part of Tegra=20
>>> SoC specific device tree where same values will be applicable to all=20
>>> Tegra SoC specific platforms.
>>>
>>> Based on interface usage on platform, we use one or both of them=20
>>> like sdcard supports dual voltage and we use both 3V3 and 1V8 but if=20
>>> same interface is used for WIFI SD we use 1V8 only.
>>>
>>> So made these dt properties as optional.
>>>
>>> Other reason they are optional is, Tegra210 and prior has drive=20
>>> strength settings part of apb_misc and Tegra186 and later has driver=20
>>> strengths part of SDMMC controller. So,
>>>
>>> - Pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" for driver strengths=20
>>> are applicable for Tegra210 and prior.
>>> - dt properties pad-autocal-pull-up/down-offset-1v8/3v3-timeout are=20
>>> for T186 onwards for driver strengths
>>>
>>> Looks like dt binding doc need fix to clearly document these based=20
>>> on SoC or agree with Yaml we can conditionally specify pinctrl or dt=20
>>> properties based on SoC dependent.
>>>
>>>
>>>>> Adding Sowjanya who wrote this code. Perhaps she can clarify why the
>>>>> warnings were added. If these values /should/ be there on a subset of
>>>>> Tegra, then I think we should keep them, or add them again, but=20
>>>>> perhaps
>>>>> add a better way of identifying when they are necessary and when=20
>>>>> it is
>>>>> safe to work without them.
>>>>>
>>>>> That said, looking at those checks I wonder if they are perhaps just
>>>>> wrong. Or at the very least they seem redundant. It looks to me like
>>>>> they can just be:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0if (tegra_host->pinctrl_state_XYZ =3D=3D NULL=
) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>>>>
>>>>> That !IS_ERR(...) doesn't seem to do anything. But in that case, it's
>>>>> also obvious why we're warning about them on platforms where these
>>>>> properties don't exist in DT.
>>>
>>> As drive strengths are through dt properties for T186 and later and=20
>>> thru pinctrl for T210 and prior, driver first checks for dt autocal=20
>>> timeout pull-up/down properties and if they are not found, it then=20
>>> checks for presence of pinctrl_state_xyx_drv only when valid=20
>>> pinctrl_state_xyz is present.
>>>
>>> Driver expects either pinctrl or dt properties and shows warning=20
>>> when neither of them are present as its mandatory to use fixed=20
>>> driver strengths when auto calibration fails.
>>>
>>> =C2=A0=C2=A0=C2=A0 err =3D device_property_read_u32(host->mmc->parent,
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "nvidia,pad-au=
tocal-pull-down-offset-3v3-timeout",
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 &autocal->pull=
_down_3v3_timeout);
>>> =C2=A0=C2=A0=C2=A0 if (err) {
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!IS_ERR(tegra_host->pinctrl_s=
tate_3v3) &&
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 (tegra_host->p=
inctrl_state_3v3_drv =3D=3D NULL))
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn("%s: M=
issing autocal timeout 3v3-pad drvs\n",
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 mmc_hostname(host->mmc));
>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 autocal->pull_down_3v3_timeout =
=3D 0;
>>> =C2=A0=C2=A0=C2=A0 }
>>>
>>>>>
>>>>> So I think we either need to add those values where appropriate so=20
>>>>> that
>>>>> the warning doesn't show, or we need to narrow down where they are
>>>>> really needed and add a corresponding condition.
>>>>>
>>>>> But again, perhaps Sowjanya can help clarify if these really are only
>>>>> needed on Tegra210 and later or if these also apply to older chips.
>>>> Either way will be cleaner to convert the DT binding to YAML rather=20
>>>> than
>>>> clutter the driver, IMO.
>>>>
>>>
>>>
>>>
>> Auto calibration is present from Tegra30 onward and looking into=20
>> change where autocalibration was added to sdhci driver somehow it was=20
>> enabled only for T30/T210/T186/T194.
>>
>> tegra_sdhci_parse_pad_autocal_dt() was added when auto-calibration=20
>> was added to driver and I see this dt parse is being done=20
>> irrespective of NVQUIRK_HAS_PADCALIB quirk so even on platforms=20
>> without auto cal enabled in driver, these messages shows up.
>>
>> This should be fixed in driver to allow=20
>> tegra_sdhci_parse_pad_autocal_dt() only when NVQUIRK_HAS_PADCALIB is=20
>> set to avoid dt parsing to happen on platforms that don't have auto=20
>> cal enabled.
>
> Warning on missing drive strengths when auto cal is enabled should be=20
> present as we should switch to fixed recommended drive strengths when=20
> auto cal fails.
>
> So probably proper fix should be
>
> - allow tegra_sdhci_parse_pad_autocal_dt() only when=20
> NVQUIRK_HAS_PADCALIB is set
>
> - current driver sets NVQUIRK_HAS_PADCALIB for T30 as well so need to=20
> add pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" to Tegra30 device tree.
[Correction] T30 has same drive strengths to use irrespective of signal=20
voltage and it doesn't have pad control. So for T3- we can update device=20
tree to specify "default" pinctrl with drvup/dn settings.
>
> - Keep warning message of missing auto cal timeouts as its mandatory=20
> to use fixed recommended driver strengths when auto cal fails.
>
Regarding warnings, I guess simpler and easy fix is to remove warning=20
message on missing 3v3/1v8 drive strengths as pinctrl/dt properties were=20
already added for T210/186/194 where we need and old device tree don't=20
have them but the case where auto cal can fail is very rare.

Otherwise should update driver to allow=20
tegra_sdhci_parse_pad_autocal_dt() only when NVQUIRK_HAS_PADCALIB is set=20
and also within tegra_sdhci_parse_pad_autocal_dt() show warning of=20
missing 3v3/1v8 settings only when NVQUIRK_NEEDS_PAD_CONTROL is set.

Thierry, please suggest if you prefer to removing warnings or fix driver=20
to show warning based on PADCALIB and PAD_CONTROL quirks.
