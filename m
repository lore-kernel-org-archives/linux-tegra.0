Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F048C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 05:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30A0E6109E
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 05:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhJVGAW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Oct 2021 02:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhJVGAW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Oct 2021 02:00:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8331C061764;
        Thu, 21 Oct 2021 22:58:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq11so507803lfb.10;
        Thu, 21 Oct 2021 22:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YBqZ2/WOjzFpakGpLZqp4pTnNIzI3k69qYYA40+nsis=;
        b=lXhUDsy8yUWIDFjjiXAOqAibq/tVSSErBHVs+3nhznGA605bJYXCviOhpL2tuNgWC1
         9ieEq+sXXLF3o5P6jYEywU4zuiZUv3RQ23ohd7Xpzi6933k9SuLVRydbcE+QcCI/oc5s
         +n0m4qTYneQ9YQ0onKYjzqnQmea2m6teqz18XZcuQ7M7eytbtbEJO47tFtFxuw7YLkM2
         +Tw5V9ZSh/kFTuZ2G2SzVhpSmshHana4gjBi9xD4nYSpPJspNpHz62DX6Qx7OBEXWREj
         xvxvrc2BewV4Qhm+pbLB47uvE3lXm9URP7b1LXCZJu56E1cUDFSBqgU+cNU8DWV/iiXU
         r/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YBqZ2/WOjzFpakGpLZqp4pTnNIzI3k69qYYA40+nsis=;
        b=blLW34IhEgJ/Inuz/oyIwZZ9nZ8QiiLa1uDglmd2KJCBYIVE1TGI2rUctSzJgQOj9Y
         JWVdp6Pm3SY1S0kMoukQiWnJ52/w1SdJk0yePrgliXTdBEw8ewL+7X1P8E+n4s3MB8It
         hk9UR2gpqrp0Y00CGh6ghMI+PrNe3CW1L/ejN+qWNjExfnckxDLHObiMLQ34e8AXRSfj
         IfqJIJ6bG0ivn4Z0ysHg5zCrDusD4ugaLYSTVTvGY4Mvs+Ub+8T0d0Txps9mE7gO8yCA
         HBJiYza2komSifBpbyc4ssTuiEe9nh5OwQcPynTKW92KS9belU9E/VRWJoxDM+qXJlnk
         Yiug==
X-Gm-Message-State: AOAM532qmbSdWzYQWF70l/Yb2GCmE+La1uoSzyeyOfuIclRmIvYnOCtC
        gVv2M4ulLt4MHj89w5OrEoRvaoc3MGE=
X-Google-Smtp-Source: ABdhPJyXHKRTOCpaI9IpWlp8wQuhrn2y3HW9UFhN3SNR7MxhhHE27VV4q1409BMTc41rdrwrn/mQPg==
X-Received: by 2002:a05:6512:10d3:: with SMTP id k19mr9608407lfg.438.1634882283081;
        Thu, 21 Oct 2021 22:58:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id t3sm634511lfc.216.2021.10.21.22.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 22:58:02 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a48c38e-1841-0dc9-473e-5dbe67ce04d5@gmail.com>
Date:   Fri, 22 Oct 2021 08:58:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXHmOT+inPg7as0x@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.10.2021 01:14, Michał Mirosław пишет:
> On Fri, Oct 22, 2021 at 12:46:23AM +0300, Dmitry Osipenko wrote:
>> 22.10.2021 00:37, Michał Mirosław пишет:
>>> On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
>>>> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
>>>> now fails to probe with -EINVAL using those device-trees. Check interrupt
>>>> presence and disallow runtime PM suspension if it's missing to fix the
>>>> trouble.
>>> [...]
>>>> --- a/drivers/usb/host/xhci-tegra.c
>>>> +++ b/drivers/usb/host/xhci-tegra.c
>>>> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>>>  		goto put_padctl;
>>>>  	}
>>>>  
>>>> -	tegra->padctl_irq = of_irq_get(np, 0);
>>>> -	if (tegra->padctl_irq <= 0) {
>>>> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
>>>> -		goto put_padctl;
>>>> +	/* Older device-trees don't specify padctrl interrupt */
>>>> +	if (of_property_read_bool(np, "interrupts")) {
>>>
>>> Does this catch "interrupts-extended"?
>>
>> No, Tegra doesn't use interrupts-extended.
> 
> I believe it is generic and equivalent to "interrupt-parent" +
> "interrupts" properties, so people might as well put this in
> the DT to save (or loose) a few bytes.
> 
> You could just check if of_irq_get() returned -EINVAL instead of
> matching "interrupts" property.

It should be a bad idea to rely on -EINVAL since it's ambiguous error code.

Perhaps it's fine to assume that today of_irq_get() may only return
-EINVAL in a case of a missing DT property, but then it should be two
patches here:

1. Use -EINVAL and backport this fix to stable kernel.
2. Change of_irq_get() to return -ENOENT for a missing property and
change tegra_xusb_probe() accordingly.
