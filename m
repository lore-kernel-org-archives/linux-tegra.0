Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A365DC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8020D603E7
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhJUVsm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 17:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhJUVsm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 17:48:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00906C061764;
        Thu, 21 Oct 2021 14:46:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l5so1017803lja.13;
        Thu, 21 Oct 2021 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0xlnYhJkaNk96ITMhxfdXS3J1MPuX3UoZqSSw9IGVG0=;
        b=OGQIwTdBSyVZSx0jNWT6RkOfe4yhLHKAIRBe9+3akekOo/cdiycS+q1v3/9zLX0+6Q
         OxmeeN932jX02OXkVXigEr8W3RskvUkl8dg3BJxxre9SmKd4UAF7sP/NpjfuZeZ8Kz2Z
         c/4Bv6XOz1Urvc7YkMpVW3+e/+Q5Phavk6R2oozc8rYjwRZoGelI5iBThX7DrG13WMYa
         gMrZemgI9+p02XYA6d0kdbOFzgS8QKxHiZFOrCCtWdJHspBz8MVVbFpsyQKRFQNVCqsn
         CsICWPvTWOwp2IBfyiDfRq6zSkVRG6HBH60336Zsnoja2FS6ql0T9Sf53vhb1ZDV8EpW
         Tckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0xlnYhJkaNk96ITMhxfdXS3J1MPuX3UoZqSSw9IGVG0=;
        b=WwI2/wZdqJXMXaNFzlptuAkZpCejimqc74V4kTiWBJKmu7Mq1moT/UhsHmOdK00Woz
         ufsbJe3nJKoMQ2TYdPluVhOj8l3gAyT+zoOJ+4YZukX7bnOiIMoLGMsz3SubOiCpmtXJ
         sRylzyf0DWNnnt7hEeKrP9NZ/MSh/bD8K2dvYUK9kGQphPX/yxS2Iq11IQ8+ACA3pIWv
         D19YjDKKc5r2ryijpJQgVLQOeloJHvBJpw97D/FZVsj90SgwEO37aG4eUk4iFHvVasNW
         G/xqGwgqmkv7mi5C1cD4XgwMZvAOXrydvPyRb+HUIiFzsoTfbA5jqb20rCBb8xSiYnz9
         +y+g==
X-Gm-Message-State: AOAM533pI8gmpTL6/CqvpbTtxWU6YB3gBvhvK7WUk4/UgfAV4mxoYRku
        ifKXdr+8C+TrMcRfXNxJhqnupAF8VfA=
X-Google-Smtp-Source: ABdhPJz9v5HcOPJefrKvS+XLSq6llXFfDWF7caDiqhx5rsCTgUV7mgJ39z/fW28JLWBw5IjLz1weHw==
X-Received: by 2002:a2e:7004:: with SMTP id l4mr8843888ljc.199.1634852784116;
        Thu, 21 Oct 2021 14:46:24 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id t20sm599687lft.240.2021.10.21.14.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 14:46:23 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXHdoFAgGlxoI0Jx@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <29b38423-631e-192e-b006-aa0d258c8030@gmail.com>
Date:   Fri, 22 Oct 2021 00:46:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXHdoFAgGlxoI0Jx@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.10.2021 00:37, Michał Mirosław пишет:
> On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
>> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
>> now fails to probe with -EINVAL using those device-trees. Check interrupt
>> presence and disallow runtime PM suspension if it's missing to fix the
>> trouble.
> [...]
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  		goto put_padctl;
>>  	}
>>  
>> -	tegra->padctl_irq = of_irq_get(np, 0);
>> -	if (tegra->padctl_irq <= 0) {
>> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
>> -		goto put_padctl;
>> +	/* Older device-trees don't specify padctrl interrupt */
>> +	if (of_property_read_bool(np, "interrupts")) {
> 
> Does this catch "interrupts-extended"?

No, Tegra doesn't use interrupts-extended.
