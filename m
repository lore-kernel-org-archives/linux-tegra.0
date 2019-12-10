From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
Date: Tue, 10 Dec 2019 17:32:15 +0300
Message-ID: <bc0ebcd6-082a-7b2f-0dc7-c1dc04db12b0@gmail.com>
References: <20191210014011.21987-1-digetx@gmail.com>
 <20191210125208.GD2703785@ulmo>
 <61b7a865-6a6f-5edf-7463-cfdd6b20f687@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61b7a865-6a6f-5edf-7463-cfdd6b20f687@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.12.2019 17:15, Dmitry Osipenko пишет:
> 10.12.2019 15:52, Thierry Reding пишет:
>> On Tue, Dec 10, 2019 at 04:40:11AM +0300, Dmitry Osipenko wrote:
>>> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
>>> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
>>> In a result high-speed mode isn't enabled for the WiFi card and this
>>> results in a malfunctioning SDIO communication.
>>>
>>>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -84
>>>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
>>>
>>> Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
>>> the problem, let's do the same in upstream.
>>>
>>> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
>>> which overrides card's info for the TI wl1251 WiFi.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/mmc/host/sdhci-tegra.c | 28 ++++++++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>
>> This seems like the wrong place to do this. If this is specific to this
>> WiFi SDIO chip this should be handled at the SDIO card or function
>> level. It seems like the SDIO infrastructure doesn't currently allow
>> this because the OF nodes are attached to the card after
>> mmc_sdio_init_card(), whereas it seems like the quirk is already needed
>> during mmc_sdio_init_card().
>>
>> That said, I think we could have some common code that's executed as
>> part of mmc_attach_sdio() (and before mmc_sdio_init_card()).
>>
>> Actually, it looks like we already have something like that.
>> mmc_sdio_init_card() calls mmc_fixup_device() with sdio_fixup_methods
>> after doing some very basic initialization. Do you know if things start
>> to go wrong before or after that point? It might be worth looking at
>> that SDIO fixup array and add something that would override the CCCR
>> support. That would fix things in a more generic way rather than
>> requiring every host controller driver to duplicate this quirk.
> 
> Hello Thierry,
> 
> Thank you very much for the suggestion, looks like indeed it is possible
> to make workaround in a generic way.
> 
> Ulf / Adrian, will something like this be acceptable:
> 
> diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
> index 7bd392d55cfa..a6001f210b9e 100644
> --- a/drivers/mmc/core/card.h
> +++ b/drivers/mmc/core/card.h
> @@ -150,6 +150,12 @@ static inline void __maybe_unused
> add_limit_rate_quirk(struct mmc_card *card,
>  	card->quirk_max_rate = data;
>  }
> 
> +static inline void __maybe_unused add_high_speed_quirk(struct mmc_card
> *card,
> +						       int data)
> +{
> +	card->cccr.high_speed = data;
> +}
> +
>  /*
>   * Quirk add/remove for MMC products.
>   */
> diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
> index 3dba15bccce2..a824c0caa7fb 100644
> --- a/drivers/mmc/core/quirks.h
> +++ b/drivers/mmc/core/quirks.h
> @@ -142,6 +142,9 @@ static const struct mmc_fixup sdio_fixup_methods[] = {
>  	SDIO_FIXUP(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8887WLAN,
>  		   add_limit_rate_quirk, 150000000),
> 
> +	SDIO_FIXUP(SDIO_VENDOR_ID_BROADCOM, SDIO_DEVICE_ID_BROADCOM_4329,
> +		   add_high_speed_quirk, 1),
> +
>  	END_FIXUP
>  };
> 
> [snip]

On second thought, perhaps it's not very universal to change card's CCCR
and this should be a better variant:

diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
index 7bd392d55cfa..b5e44fcda7fb 100644
--- a/drivers/mmc/core/card.h
+++ b/drivers/mmc/core/card.h
@@ -222,4 +222,9 @@ static inline int mmc_card_broken_hpi(const struct
mmc_card *c)
 	return c->quirks & MMC_QUIRK_BROKEN_HPI;
 }

+static inline int mmc_card_need_high_speed_toggle(const struct mmc_card *c)
+{
+	return c->quirks & MMC_QUIRK_HIGH_SPEED_CARD;
+}
+
 #endif
diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index 3dba15bccce2..c9af62a1d44b 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -142,6 +142,9 @@ static const struct mmc_fixup sdio_fixup_methods[] = {
 	SDIO_FIXUP(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8887WLAN,
 		   add_limit_rate_quirk, 150000000),

+	SDIO_FIXUP(SDIO_VENDOR_ID_BROADCOM, SDIO_DEVICE_ID_BROADCOM_4329,
+		   add_quirk, MMC_QUIRK_HIGH_SPEED_CARD),
+
 	END_FIXUP
 };

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index ebb387aa5158..ac12c7631ec5 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -323,7 +323,7 @@ static int mmc_sdio_switch_hs(struct mmc_card *card,
int enable)
 	if (!(card->host->caps & MMC_CAP_SD_HIGHSPEED))
 		return 0;

-	if (!card->cccr.high_speed)
+	if (!mmc_card_need_high_speed_toggle(card) && !card->cccr.high_speed)
 		return 0;

 	ret = mmc_io_rw_direct(card, 0, 0, SDIO_CCCR_SPEED, 0, &speed);
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index cf3780a6ccc4..06f697e6d002 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -269,6 +269,7 @@ struct mmc_card {
 #define MMC_QUIRK_BROKEN_IRQ_POLLING	(1<<11)	/* Polling SDIO_CCCR_INTx
could create a fake interrupt */
 #define MMC_QUIRK_TRIM_BROKEN	(1<<12)		/* Skip trim */
 #define MMC_QUIRK_BROKEN_HPI	(1<<13)		/* Disable broken HPI support */
+#define MMC_QUIRK_HIGH_SPEED_CARD	(1<<14)	/* Card is high-speed capable */

 	bool			reenable_cmdq;	/* Re-enable Command Queue */
