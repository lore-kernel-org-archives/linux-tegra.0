From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
Date: Wed, 11 Dec 2019 19:29:46 +0300
Message-ID: <44f99e56-468e-c3f9-3785-73c2cf8ba118@gmail.com>
References: <20191210014011.21987-1-digetx@gmail.com>
 <CAPDyKFpMe09PNQqinvvidF+wfASx2nuvgf7=Hx5+cGni8pdcRA@mail.gmail.com>
 <28045442-6a1c-1e0b-0dfe-c36fa9de149a@gmail.com>
 <CAPDyKFpWO_McZEoefX1T=SE=RYm_GU3S+LgYZrgJY_SJgv7egA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFpWO_McZEoefX1T=SE=RYm_GU3S+LgYZrgJY_SJgv7egA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

11.12.2019 19:10, Ulf Hansson пишет:
> On Wed, 11 Dec 2019 at 16:46, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Hello Ulf,
>>
>> 11.12.2019 11:11, Ulf Hansson пишет:
>>> On Tue, 10 Dec 2019 at 02:40, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
>>>> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
>>>> In a result high-speed mode isn't enabled for the WiFi card and this
>>>> results in a malfunctioning SDIO communication.
>>>
>>> Does that also mean SDIO_SPEED_SHS bit is set when reading SDIO_CCCR_SPEED?
>>
>> Yes, the SDIO_SPEED_SHS bit is set.
>>
>>>>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -84
>>>>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
>>>>
>>>> Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
>>>> the problem, let's do the same in upstream.
>>>>
>>>> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
>>>> which overrides card's info for the TI wl1251 WiFi.
>>>
>>> This is a temporary solution and should be replaced by doing the DT
>>> parsing during
>>>
>>> So, yes, let's see if we can use a card quirk instead. That's the first option.
>>>
>>> A second option is simply to parse the DT subnode for a new DT
>>> property during mmc_sdio_init_card(). Along the lines of what we do
>>> for the broken-hpi DT binding for eMMC.
>>
>> Let's try the first option. My understanding is that the problem affects
>> only the specific model of the WiFi chip and it's not a board-specific
>> problem. I'll add Broadcom driver people to CC for the next version of
>> the patch, maybe they'll have something to say.
> 
> Okay, sounds reasonable. By looking at your latest attempt for a fix,
> I have two minor nitpicks, otherwise it looks good.
> 
> The nitpicks:
> I suggest to rename MMC_QUIRK_HIGH_SPEED_CARD to MMC_QUIRK_HIGH_SPEED
> and mmc_card_need_high_speed_toggle() to mmc_card_quirk_hs().

I'll take it into account, thanks.
