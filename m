From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Thu, 19 May 2016 15:29:07 +0100
Message-ID: <573DCDB3.80202@nvidia.com>
References: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
 <1463124331.2459.0.camel@lynxeye.de> <20160513172704.GA498@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160513172704.GA498-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/05/16 18:27, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 13, 2016 at 09:25:31AM +0200, Lucas Stach wrote:
>> Am Montag, den 29.02.2016, 22:01 +0100 schrieb Lucas Stach:
>>> This allows to switch the card signal voltage level to 1.8V,
>>> which is needed for any ultra high speed modes to work.
>>>
>>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>>> ---
>>> This needs the SDMMC memcomp pad calibration patches I just
>>> sent out to be applied, otherwise the card voltage change will
>>> fail with a message in the kernel log and a fall back to
>>> high speed operation.
>>
>> The patches this one depends on have been applied for some time now.
>> Please pick up this patch.
> 
> My understanding is that UHS modes currently cause problems on Beaver.
> What I don't understand about that is how it will even try those modes
> if the voltage regulator can't be set to 1.8 V? Shouldn't that actively
> prevent those modes from even being attempted?

Looking at the sdhci code, if the regulator is missing then we still
attempt to place the controller is 1.8V mode ...

 static int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
                                              struct mmc_ios *ios)
 {

 ...

         case MMC_SIGNAL_VOLTAGE_180:
                 if (!IS_ERR(mmc->supply.vqmmc)) {
                         ret = regulator_set_voltage(mmc->supply.vqmmc,
                                         1700000, 1950000);
                         if (ret) {
                                 pr_warn("%s: Switching to 1.8V signalling voltage failed\n",
                                         mmc_hostname(mmc));
                                 return -EIO;
                         }
                 }

                 /*
                  * Enable 1.8V Signal Enable in the Host Control2
                  * register
                  */
                 ctrl |= SDHCI_CTRL_VDD_180;
                 sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
 
                 /* Some controller need to do more when switching */
                 if (host->ops->voltage_switch)
                         host->ops->voltage_switch(host);
 
                 /* 1.8V regulator output should be stable within 5 ms */
                 ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
                 if (ctrl & SDHCI_CTRL_VDD_180)
                         return 0;
 
                 pr_warn("%s: 1.8V regulator output did not became stable\n",
                         mmc_hostname(mmc));
 
                 return -EAGAIN;

Ideally, the above *should* fail if the regulator is missing. However, what
I have found, is that in my case, even though the regulator is missing, the
above succeeds and the host thinks we are operating at 1.8V even though we
are still at 3.3V! It seems that this does not happen with all SD cards that
support UHS. 

This patch resolves the problems I am seeing on beaver with SD card
initialisation failing. I am surprised this is not causing problems for
others?

That said, looking at the schematics for the board, this patch looks
correct to me and we should apply this and mark for stable as this
appears to be broken for sometime. Note that even before Lucas' changes
in the SD card init we will try to switch to 1.8V if the cards supports
it and the controller is greater or equal to sdhci v3.

Cheers
Jon

-- 
nvpublic
