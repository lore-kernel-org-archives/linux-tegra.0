Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4B3C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Oct 2021 11:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81D5960EDF
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Oct 2021 11:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237129AbhJ0LQK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Oct 2021 07:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbhJ0LQJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Oct 2021 07:16:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000B1C061570;
        Wed, 27 Oct 2021 04:13:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bq11so5335557lfb.10;
        Wed, 27 Oct 2021 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3jAbywh6FBZn1JbpVxbDqKlHXuzjjbftG8a1nG7vq/g=;
        b=l1RHSQMHUNHJ2IzON2Z9uyKw+M9V8FS8bvNVyepY/pfcevOZp+r2d9Rus4e/htupU0
         sD0WwrJR4TXIafnbmVgPnYvlcfy3QrI2KZl3Y5R8mNSeDWlzySPsn0Qq9E5eYYTbOCn4
         KtMy507O0DTPVVSjtsGzoTuH3aSTRm8weNDU8KmJazalob/hqXGBT9HbcykXkmwPyE1J
         gSAwwIKVMouHAl79JaTxA4LZMgmJR1yhHk3TT3pRrnzm/MaAoIt8vV+rqriHXobfUxPh
         yuRjCANj/FVCwcZQq+v6cKn0K3DBX0L4QBRwZmmA9y+nWnWJOefyIU4CFD0yTAFUxHqr
         jsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3jAbywh6FBZn1JbpVxbDqKlHXuzjjbftG8a1nG7vq/g=;
        b=HyyB3irzBSNlORRMyBPz/RjAbMkVi8Cw2BAXCyjfl2q3Uv+6X1F4WIMPqVL0UzURET
         qDft/iNFt4XSG8I1XjJxW9MJf2veeXci10wm9r8ho+k84L3vAWSy1L3VF7CM+hxq6OE6
         Jr92kHMvXKszOPTiXN0DB626sHGUd9BHGK73nA8dFYYV8sKMUGuPja3dI2Q34fAAtV4s
         OPUwxVKYWnj7zuOzFREinBQKnq7L6mO5pMIV1kLIsBTxX1k9PDrSPXFR9z8hbw+Jpl8G
         hJ3Zavm8hdV7CftsA1BJPEZTyl4yD+d26/i8FQJLPPfuRK9ZQxlmvgdWEPtMQe/jWIkC
         gvPg==
X-Gm-Message-State: AOAM530eEk0PAZTUh8yyESUduICYe2hrXcls7bBW4QjRTN/cBTRzeHZu
        9J7iXm6jnzRY5x/Z/TfmwDRTLkA97Lo=
X-Google-Smtp-Source: ABdhPJwK1X9hQKe6NGBbeg/qMuCfJiTs/eNL4u3ZEFo3pz129QUEcCkaFTh55UOCW8yeyF+Q2ElzPg==
X-Received: by 2002:a19:7903:: with SMTP id u3mr27347045lfc.406.1635333222233;
        Wed, 27 Oct 2021 04:13:42 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id c20sm2209125lfi.182.2021.10.27.04.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 04:13:41 -0700 (PDT)
Subject: Re: [PATCH 22/22] usb: host: xhci-tegra: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-23-s.shtylyov@omp.ru>
 <415d1410-5b5f-3de4-1973-998528481c0f@gmail.com>
 <bde8811f-806e-1845-9a17-25227ecc02e9@omp.ru>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <424502be-baab-4c89-a39b-b921a4e2bd37@gmail.com>
Date:   Wed, 27 Oct 2021 14:13:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bde8811f-806e-1845-9a17-25227ecc02e9@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.10.2021 21:24, Sergey Shtylyov пишет:
> Hello!
> 
> On 10/21/21 12:09 PM, Dmitry Osipenko wrote:
> [...]
>>> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
>>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
>>> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>>>
>>> Fixes: e84fce0f8837 ("usb: xhci: Add NVIDIA Tegra XUSB controller driver")
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>> ---
>>>  drivers/usb/host/xhci-tegra.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>>> index 1bf494b649bd..7151b1d4f876 100644
>>> --- a/drivers/usb/host/xhci-tegra.c
>>> +++ b/drivers/usb/host/xhci-tegra.c
>>> @@ -1439,6 +1439,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>>  	tegra->xhci_irq = platform_get_irq(pdev, 0);
>>>  	if (tegra->xhci_irq < 0)
>>>  		return tegra->xhci_irq;
>>> +	if (!tegra->xhci_irq)
>>> +		return -ENIVAL;
>>>  
>>>  	tegra->mbox_irq = platform_get_irq(pdev, 1);
>>>  	if (tegra->mbox_irq < 0)
>>>
>>
>> platform_get_irq() never returns zero in accordance to [1], but I see
>> that it can return it [2].
> 
>    Not only that, it also can be returned thru the normal path (from an IRQ descriptor).
> I'm not sure whether 0 means an IRQ0 returned from acpi_dev_gpio_irq_get(), looks like yes...
> 
>> Should be better to fix [2] and return -EINVAL.
> 
>    No, we have WARN() before returning IRQ0 -- if we're going to finally declare IRQ0 invalid,
> it should be done after this check.

Warning is already explicitly saying that IRQ0 is invalid, hence IRQ0
*is* declared invalid. Either doc comment or function itself is wrong,
both are bad.

If function is wrong, then you're fixing symptom instead of fixing the
root of the problem.
