From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when
 not applicable
Date: Fri, 22 May 2020 08:11:43 -0700
Message-ID: <e574c225-aa2a-7431-6ea8-2d2f1e7dd384@nvidia.com>
References: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
 <20200522122644.GE2163848@ulmo>
 <95d01fae-bf1f-28d1-2d11-8f5693646fa3@gmail.com>
 <20200522125230.GH2163848@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200522125230.GH2163848@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 5/22/20 5:52 AM, Thierry Reding wrote:
> On Fri, May 22, 2020 at 03:42:18PM +0300, Dmitry Osipenko wrote:
>> 22.05.2020 15:26, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Wed, May 20, 2020 at 01:08:57PM -0700, Sowjanya Komatineni wrote:
>>>> When auto calibration timeouts, calibration is disabled and fail-safe
>>>> drive strength values are programmed based on the signal voltage.
>>>>
>>>> Different fail-safe drive strength values based on voltage are
>>>> applicable only for SoCs supporting 3V3 and 1V8 pad controls.
>>>>
>>>> So, this patch avoids reading these properties from the device tree
>>>> for SoCs not using pad controls and the warning of missing properties
>>>> will not show up on these SoC platforms.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>   drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++--------=
----------
>>>>   1 file changed, 33 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-t=
egra.c
>>>> index 3e2c510..141b49b 100644
>>>> --- a/drivers/mmc/host/sdhci-tegra.c
>>>> +++ b/drivers/mmc/host/sdhci-tegra.c
>>>> @@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(stru=
ct sdhci_host *host)
>>>>   		autocal->pull_down_1v8 =3D 0;
>>>>  =20
>>>>   	err =3D device_property_read_u32(host->mmc->parent,
>>>> +			"nvidia,pad-autocal-pull-up-offset-sdr104",
>>>> +			&autocal->pull_up_sdr104);
>>>> +	if (err)
>>>> +		autocal->pull_up_sdr104 =3D autocal->pull_up_1v8;
>>>> +
>>>> +	err =3D device_property_read_u32(host->mmc->parent,
>>>> +			"nvidia,pad-autocal-pull-down-offset-sdr104",
>>>> +			&autocal->pull_down_sdr104);
>>>> +	if (err)
>>>> +		autocal->pull_down_sdr104 =3D autocal->pull_down_1v8;
>>>> +
>>>> +	err =3D device_property_read_u32(host->mmc->parent,
>>>> +			"nvidia,pad-autocal-pull-up-offset-hs400",
>>>> +			&autocal->pull_up_hs400);
>>>> +	if (err)
>>>> +		autocal->pull_up_hs400 =3D autocal->pull_up_1v8;
>>>> +
>>>> +	err =3D device_property_read_u32(host->mmc->parent,
>>>> +			"nvidia,pad-autocal-pull-down-offset-hs400",
>>>> +			&autocal->pull_down_hs400);
>>>> +	if (err)
>>>> +		autocal->pull_down_hs400 =3D autocal->pull_down_1v8;
>>>> +
>>>> +	/*
>>>> +	 * Different fail-safe drive strength values based on the signaling
>>>> +	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad contro=
ls.
>>>> +	 * So, avoid reading below device tree properies for SoCs that don't
>>>> +	 * have NVQUIRK_NEEDS_PAD_CONTROL.
>>>> +	 */
>>>> +	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
>>>> +		return;
>>> Hm... so what exactly is the difference between NVQUIRK_HAS_PADCALIB? I
>>> think Tegra30 will also end up calling tegra_sdhci_set_padctrl(), but i=
t
>>> will then write the default (0) value for these drive strength. Is that
>>> okay?

Yes separate 3v3 and 1v8 drive strengths are for Tegra210/184/194 where=20
they have separate pad controls.

T30 also has auto calibration enabled but don't need to use these=20
properties as they don't have separate default drive strengths based on=20
signaling.

Same default drive strengths set by boot loader/default pinmux will hold=20
good.

>> It won't write 0, but skip the writing if values are 0. Technically T30+
>> supports the customized strengths, but I'm not sure whether it was ever
>> tested and whether it's really needed. I think Sowjanya said before that
>> the default values are always okay for older SoCs.
> Alright then, in that case:
>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
