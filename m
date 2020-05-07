From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
Date: Thu, 7 May 2020 22:03:14 +0530
Message-ID: <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
 <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chun-Hung Wu <chun-hung.wu@mediatek.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: linux-tegra@vger.kernel.org


On 5/6/2020 10:06 PM, Ulf Hansson wrote:
> On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>>
>> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
>>> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
>>> in mmc_of_parse().
>>>
>>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>> ---
>>>    drivers/mmc/core/host.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
>>> index c876872..47521c6 100644
>>> --- a/drivers/mmc/core/host.c
>>> +++ b/drivers/mmc/core/host.c
>>> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
>>>                host->caps2 |= MMC_CAP2_NO_SD;
>>>        if (device_property_read_bool(dev, "no-mmc"))
>>>                host->caps2 |= MMC_CAP2_NO_MMC;
>>> +     if (device_property_read_bool(dev, "supports-cqe"))
>>> +             host->caps2 |= MMC_CAP2_CQE;
>> This change is breaking emmc driver on qcom platforms where this dt
>> property is defined.
>>
>> [    1.543453]  cqhci_deactivate+0xc/0x38
>> [    1.545627]  sdhci_msm_reset+0x40/0x58
>> [    1.549447]  sdhci_do_reset+0x48/0x7c
>> [    1.553180]  __sdhci_read_caps+0x7c/0x214
>> [    1.556913]  sdhci_setup_host+0x58/0xce8
>> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
>> [    1.564900]  platform_drv_probe+0x4c/0xb0
>>
>> So, we cant have this flag defined before sdhci_setup_host().
>>
>> I will have to clear this cap and re-enable it in our initialization.
> Thanks for reporting! I have dropped all the four patches from
> Chun-Hung, so we can figure out how to fix this.
>
> Please help to review the next version of the series.

Thanks Ulf.

Hi Chun-Hung,

On qcom controller CQE also gets reset when SDHC is reset. So we have to 
explicitly disable CQE
by invoking  cqhci_deactivate() during sdhc reset

SDHC gets reset in sdhci_setup_host() even before cqe is initialized.
With MMC_CAP2_CQE_DCMD cap set even before sdhci_set_host(), we are 
getting null pointer access with cqhci_deactivate().

If CQE getting reset with SDHC reset is generic (applicable to other 
controllers) then you have revisit your logic.
If its not the case then only qcom driver would get affected.

I see you are updating sdhci-msm.c file as-well. How about including 
below change besides your change?

@@ -1658,6 +1658,8 @@ static int sdhci_msm_cqe_add_host(struct 
sdhci_host *host,
         if (host->caps & SDHCI_CAN_64BIT)
                 host->alloc_desc_sz = 16;

+       /* Clear the CQE cap during setup host */
+       msm_host->mmc->caps2 &= ~MMC_CAP2_CQE;
+
         ret = sdhci_setup_host(host);

>>> +     if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
>>> +             host->caps2 |= MMC_CAP2_CQE_DCMD;
>>> +     }
>>>
>>>        /* Must be after "non-removable" check */
>>>        if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> Kind regards
> Uffe
