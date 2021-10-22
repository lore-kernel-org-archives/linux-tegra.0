Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E0BC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 09:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E47B61163
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 09:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhJVJh5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Oct 2021 05:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhJVJh5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Oct 2021 05:37:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F3BC061764;
        Fri, 22 Oct 2021 02:35:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t9so1260157lfd.1;
        Fri, 22 Oct 2021 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0l4MQzSwkdGxy2ppxiCW5Dsfgm74PP5ogUQqLKW3vJg=;
        b=gNkYbMzFFsjcC6xEuuDMBSwcDE9B5Bj6NOmfd0ZiujPlWZsiwbqLtX6G4l/bOC8uRQ
         jnjyoMijkDezlz/nnD122dbAvTUiPt9W71vgtZCbosRynih0xU63vkJTI1MhVCMTQWuU
         pSd42Cil36KvXUCja99g5A50V8LS60TubUo+hapcoUKSmTD9JoqzM83AQQO3JPPKrUXt
         rGH9xogtEv1hjF1Ya5tr+xNORqHVSpeb8hY0r/j2grG9rh6947jDvK3prfmNmsBrCbZj
         umzMHLoiwEjB2z3rjLYnCUlx9Slw2x8XQcVD8vdVqA6f6YP6R21qXzSqCy00PXEUX6lE
         8oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0l4MQzSwkdGxy2ppxiCW5Dsfgm74PP5ogUQqLKW3vJg=;
        b=6Q+bbTqBYCdrw8ODeIsxl5idGkI7D5/9N6jLHFxLjDlUGmLaTNXfgxtzRzN8IRcGcL
         mnF8/7/x8y5uyEiylpnEqTYOlPSjGCu1ClV69lQDnMdH1EcrK/lurCJtOPRq2fnmoLLY
         1ucYC9Eyzq1ZeoUO4pjQxLA8rqN/gOOxkxZO/nw7rUAq2yRPTN2eHFBFQX5uFMfvygX+
         +sXRBSMWDXbYj58KpQ6b4EVRF344jwPHkcQAqqKaihsyD/VZg6Af971z5WPOBf0bq/nP
         NxqykVaSqGzW6jrfA7sRVxdg3YYhQiuffbv+gZ3otDnKtq4lMRfMD8sErfUm3Fa7Pnej
         imDw==
X-Gm-Message-State: AOAM532+BusBQwLqtracef7lbd1s6zUGFERyQPyvXS8z2NGIYKT5bndC
        NOL/XOeqSj4TSjTFZojbWM9en98gqfc=
X-Google-Smtp-Source: ABdhPJxkPtWyKpFEIkNqU0DOqb3wcrVzrx69BUxDv6IXvsamp9jkOpG6g7KqNsRw6koW80rTQED63g==
X-Received: by 2002:a05:6512:3da9:: with SMTP id k41mr10668488lfv.359.1634895338103;
        Fri, 22 Oct 2021 02:35:38 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id l9sm685749lfh.36.2021.10.22.02.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 02:35:37 -0700 (PDT)
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
 <29b38423-631e-192e-b006-aa0d258c8030@gmail.com>
 <YXHmOT+inPg7as0x@qmqm.qmqm.pl>
 <0a48c38e-1841-0dc9-473e-5dbe67ce04d5@gmail.com>
 <YXKEZyweVxvNyl8K@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e40f008-7a46-e6ec-a2d5-a5e6501bff78@gmail.com>
Date:   Fri, 22 Oct 2021 12:35:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXKEZyweVxvNyl8K@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.10.2021 12:29, Michał Mirosław пишет:
> On Fri, Oct 22, 2021 at 08:58:02AM +0300, Dmitry Osipenko wrote:
>> 22.10.2021 01:14, Michał Mirosław пишет:
>>> On Fri, Oct 22, 2021 at 12:46:23AM +0300, Dmitry Osipenko wrote:
>>>> 22.10.2021 00:37, Michał Mirosław пишет:
>>>>> On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
>>>>>> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
>>>>>> now fails to probe with -EINVAL using those device-trees. Check interrupt
>>>>>> presence and disallow runtime PM suspension if it's missing to fix the
>>>>>> trouble.
>>>>> [...]
>>>>>> --- a/drivers/usb/host/xhci-tegra.c
>>>>>> +++ b/drivers/usb/host/xhci-tegra.c
>>>>>> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>>>>>  		goto put_padctl;
>>>>>>  	}
>>>>>>  
>>>>>> -	tegra->padctl_irq = of_irq_get(np, 0);
>>>>>> -	if (tegra->padctl_irq <= 0) {
>>>>>> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
>>>>>> -		goto put_padctl;
>>>>>> +	/* Older device-trees don't specify padctrl interrupt */
>>>>>> +	if (of_property_read_bool(np, "interrupts")) {
>>>>>
>>>>> Does this catch "interrupts-extended"?
>>>>
>>>> No, Tegra doesn't use interrupts-extended.
>>>
>>> I believe it is generic and equivalent to "interrupt-parent" +
>>> "interrupts" properties, so people might as well put this in
>>> the DT to save (or loose) a few bytes.
>>>
>>> You could just check if of_irq_get() returned -EINVAL instead of
>>> matching "interrupts" property.
>>
>> It should be a bad idea to rely on -EINVAL since it's ambiguous error code.
>>
>> Perhaps it's fine to assume that today of_irq_get() may only return
>> -EINVAL in a case of a missing DT property, but then it should be two
>> patches here:
>>
>> 1. Use -EINVAL and backport this fix to stable kernel.
>> 2. Change of_irq_get() to return -ENOENT for a missing property and
>> change tegra_xusb_probe() accordingly.
> 
> I would love to see the part 2 done, but I'm afraid you will need to
> change a lot of callsites before that can happen.

At a quick glance there are only couple drivers which explicitly check
for -EINVAL, others only check whether returned value is negative. Seems
not that bad.
