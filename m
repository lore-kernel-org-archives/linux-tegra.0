From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when
 not applicable
Date: Fri, 22 May 2020 15:42:18 +0300
Message-ID: <95d01fae-bf1f-28d1-2d11-8f5693646fa3@gmail.com>
References: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
 <20200522122644.GE2163848@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200522122644.GE2163848@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

22.05.2020 15:26, Thierry Reding пишет:
> On Wed, May 20, 2020 at 01:08:57PM -0700, Sowjanya Komatineni wrote:
>> When auto calibration timeouts, calibration is disabled and fail-safe
>> drive strength values are programmed based on the signal voltage.
>>
>> Different fail-safe drive strength values based on voltage are
>> applicable only for SoCs supporting 3V3 and 1V8 pad controls.
>>
>> So, this patch avoids reading these properties from the device tree
>> for SoCs not using pad controls and the warning of missing properties
>> will not show up on these SoC platforms.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------------
>>  1 file changed, 33 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
>> index 3e2c510..141b49b 100644
>> --- a/drivers/mmc/host/sdhci-tegra.c
>> +++ b/drivers/mmc/host/sdhci-tegra.c
>> @@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>>  		autocal->pull_down_1v8 = 0;
>>  
>>  	err = device_property_read_u32(host->mmc->parent,
>> +			"nvidia,pad-autocal-pull-up-offset-sdr104",
>> +			&autocal->pull_up_sdr104);
>> +	if (err)
>> +		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
>> +
>> +	err = device_property_read_u32(host->mmc->parent,
>> +			"nvidia,pad-autocal-pull-down-offset-sdr104",
>> +			&autocal->pull_down_sdr104);
>> +	if (err)
>> +		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
>> +
>> +	err = device_property_read_u32(host->mmc->parent,
>> +			"nvidia,pad-autocal-pull-up-offset-hs400",
>> +			&autocal->pull_up_hs400);
>> +	if (err)
>> +		autocal->pull_up_hs400 = autocal->pull_up_1v8;
>> +
>> +	err = device_property_read_u32(host->mmc->parent,
>> +			"nvidia,pad-autocal-pull-down-offset-hs400",
>> +			&autocal->pull_down_hs400);
>> +	if (err)
>> +		autocal->pull_down_hs400 = autocal->pull_down_1v8;
>> +
>> +	/*
>> +	 * Different fail-safe drive strength values based on the signaling
>> +	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
>> +	 * So, avoid reading below device tree properies for SoCs that don't
>> +	 * have NVQUIRK_NEEDS_PAD_CONTROL.
>> +	 */
>> +	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
>> +		return;
> 
> Hm... so what exactly is the difference between NVQUIRK_HAS_PADCALIB? I
> think Tegra30 will also end up calling tegra_sdhci_set_padctrl(), but it
> will then write the default (0) value for these drive strength. Is that
> okay?

It won't write 0, but skip the writing if values are 0. Technically T30+
supports the customized strengths, but I'm not sure whether it was ever
tested and whether it's really needed. I think Sowjanya said before that
the default values are always okay for older SoCs.
