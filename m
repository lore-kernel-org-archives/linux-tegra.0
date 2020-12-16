Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EECEC2BBCA
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E2022DBF
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgLPJKI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 04:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgLPJKI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 04:10:08 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D5EC0613D6;
        Wed, 16 Dec 2020 01:09:27 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y19so46421317lfa.13;
        Wed, 16 Dec 2020 01:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QbEeqo5dgzdLxeA34Ysg1hMOAlCFp/9uw4fvBfMalNI=;
        b=lmw1uk+kFvzLcwor4Jyb0UxNUjmas45auMPRkp38FZy9yuxXj7wuvtaWp/0LommSAI
         lsHDS2GjeYbIeyHXQ69m/LLbmXa2qum4ETvtVXMxfyv5jvNuMr8UlVr2RufhbiuA7Fbi
         1aNzUsyDHKEYUoMqvLSpD3w7PdQo/pBpr78XapBy5hRBG6NRpgc6JYpoEx7FAasLhDnT
         0IPprMHaNxX+KqRZcjStfHHsFdfC+oKVaOUQo2RsvK9fGmKnh0WgYgo/8gxmFqhowPJz
         6etMbfMhLe6tcPDK+6gyndvEiVTWbe0Q+5ALMwrPSwsrkxlzZCiv08Ww28KB18CGLF71
         yXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QbEeqo5dgzdLxeA34Ysg1hMOAlCFp/9uw4fvBfMalNI=;
        b=kjYefAdep8f1QuV0eJixTN2D8U1dDhm5CsOK/VeFSYBOAoHqFHM/Rmlx+zxLx2cMzM
         eAiU/WL5f3ox1YMb4pQJgQjABxCYK5oFuZWJcUI46NYLL0bVsuLHzWgUcrwkt/PdDAtT
         tdm6V66uOQ7y4Ij9bA1gdAr5C/iHFGj/d4tnJ8SvLn0c6TJCYYZsYz3T0J+zGSZSHHgt
         V+MOMIsaH3ffeD9wyh2WWXsTillKyZY8+SlFgd9p+xcynjenGVyeGTDVRsTs68PWHusL
         bgP1Y7W0zltI5e+/LnTB73PZxWAG35WDQ/zb8CnXyUDNPoMYzu8yvRePyPieDguPjqz8
         qIzg==
X-Gm-Message-State: AOAM532peWYwVQMt9jacy90dJshTk73ta51VQHm79XiCY32tawO1aVT4
        mhS07Wmg8Wk6qLLvlcSqiM88EHxetwQ=
X-Google-Smtp-Source: ABdhPJy1v+x5vUsM67CcRzp8hSEYkyb33uip5hzSyNo7/Nv36WetRrcoaSalh1JGKZpsjh9BJ7oxSA==
X-Received: by 2002:ac2:4d4a:: with SMTP id 10mr11932292lfp.556.1608109766005;
        Wed, 16 Dec 2020 01:09:26 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id u3sm152157lff.259.2020.12.16.01.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 01:09:25 -0800 (PST)
Subject: Re: [PATCH v1 1/8] usb: phy: tegra: Add delay after power up
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-2-digetx@gmail.com>
 <ce6b80f9-986d-b293-fd33-e4ee4fe1458e@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <da1e8c0d-c30e-6bf4-5549-d800562e42af@gmail.com>
Date:   Wed, 16 Dec 2020 12:09:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <ce6b80f9-986d-b293-fd33-e4ee4fe1458e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 11:51, Sergei Shtylyov пишет:
> Hello!
> 
> On 15.12.2020 23:21, Dmitry Osipenko wrote:
> 
>> The PHY hardware needs the delay of 2ms after power up, otherwise initial
>> interrupt may be lost if USB controller is accessed before PHY is settled
>> down. Previously this issue was masked by implicit delays, but now it
>> pops
>> up after squashing the older ehci-tegra driver into the ChipIdea driver.
>>
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/usb/phy/phy-tegra-usb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c
>> b/drivers/usb/phy/phy-tegra-usb.c
>> index 03a333797382..cee9c9dbb775 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -784,6 +784,9 @@ static int tegra_usb_phy_power_on(struct
>> tegra_usb_phy *phy)
>>         phy->powered_on = true;
>>   +    /* let PHY to settle down */
> 
>    Let the PHY settle down.

Hi,

I'll improve the comments in v2, thanks.
