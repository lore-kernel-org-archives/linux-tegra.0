Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8881CC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 18:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FD5960F9D
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 18:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236871AbhJZS1I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:27:08 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:53538 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhJZS1I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Oct 2021 14:27:08 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 2EBF1209B989
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 22/22] usb: host: xhci-tegra: deny IRQ0
To:     Dmitry Osipenko <digetx@gmail.com>, <linux-usb@vger.kernel.org>,
        "Alan Stern" <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-23-s.shtylyov@omp.ru>
 <415d1410-5b5f-3de4-1973-998528481c0f@gmail.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <bde8811f-806e-1845-9a17-25227ecc02e9@omp.ru>
Date:   Tue, 26 Oct 2021 21:24:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <415d1410-5b5f-3de4-1973-998528481c0f@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

On 10/21/21 12:09 PM, Dmitry Osipenko wrote:
[...]
>> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
>> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>>
>> Fixes: e84fce0f8837 ("usb: xhci: Add NVIDIA Tegra XUSB controller driver")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index 1bf494b649bd..7151b1d4f876 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -1439,6 +1439,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  	tegra->xhci_irq = platform_get_irq(pdev, 0);
>>  	if (tegra->xhci_irq < 0)
>>  		return tegra->xhci_irq;
>> +	if (!tegra->xhci_irq)
>> +		return -ENIVAL;
>>  
>>  	tegra->mbox_irq = platform_get_irq(pdev, 1);
>>  	if (tegra->mbox_irq < 0)
>>
> 
> platform_get_irq() never returns zero in accordance to [1], but I see
> that it can return it [2].

   Not only that, it also can be returned thru the normal path (from an IRQ descriptor).
I'm not sure whether 0 means an IRQ0 returned from acpi_dev_gpio_irq_get(), looks like yes...

> Should be better to fix [2] and return -EINVAL.

   No, we have WARN() before returning IRQ0 -- if we're going to finally declare IRQ0 invalid,
it should be done after this check.

> [1]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/base/platform.c#L254
> 
> [2]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/base/platform.c#L226

MBR, Sergey
