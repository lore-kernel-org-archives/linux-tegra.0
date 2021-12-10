Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4C6C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 18:08:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbhLJSMW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 13:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhLJSMV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 13:12:21 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66F2C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 10:08:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id l7so14934336lja.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 10:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cK6qmxFLQsM3eV8lZjxg5lgsM0S37Qs/CRcK+VhiKFY=;
        b=a3HfbbVW+Unmf7klGt/K3MumyAgp56w9t6rOQ4aAnte7oRtjVqj7EdWgwhvUJoYbaO
         jhXJG/GFijscNivMflq9MATndGZbHJWkuLJDQ0B3/OYIhKtU+gT/Bk1nBZLfkilv8iYw
         9mXkEbnh2hmW0H8X9BG9fNVJMR05S4Id3yXjfvVj3xZA2geCHuCGL02UjfVsd+lwwzaX
         g14ivXET3Zmvdf6lqwsdCRP4jdM+FLfkGbbMkbpV+F/4xpGZ4yvK9CfLPBrU1z6qpMBT
         +g6uRXkCF5tSbMGHwID0yoj8ri1ATjExKw3t0AuyszdXke4y9CHRBWI17etkxX3xRIVB
         RU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cK6qmxFLQsM3eV8lZjxg5lgsM0S37Qs/CRcK+VhiKFY=;
        b=Vmmt2q7s6qi4d84inuIttSBjSHHEOOL6R2oIb+8rHgYdK6kxtCDcRpBh5Fzg/cLlb1
         PlQaHnZb7xxs4VhGeOB1xXExWaUXpWKORORDz1Ghmxeyudb+2brlNjNRCj0rm+wgEKDN
         YcvVdCpJp+wODdcBe996KvIHoB5Ltyd0fQGFDENRbqpIoLiODKOH/UKLQjSYDKNuSDp/
         JyRkjQCcldFGWOkjpKsLfnyWYIBRZfFQfUHO4+Y6/bGabMItKbtREKTA0qW4IXafRukh
         rY5yP/FXjXPhjl+4NcIxTSlv8Qeip5hbFbBWtgu1lx6ra0Es7CvEG0KCBgSFZDfd1sqn
         Lcfg==
X-Gm-Message-State: AOAM533xOF+zhwHRXQU/H5PSOJqVDD5GnE0Dz8inTtrVxZDJ6be6efuJ
        M5ZqXn+fwjk1p0/CNUbV2c/RrFTQGgk=
X-Google-Smtp-Source: ABdhPJz1SHlxJDdpCA7M2TZ6oi52FOHzXdk2cmL5mjAU+hLSEyWPhZCm4PNKVQgo5YvvNeYig0lvaw==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr14214074ljr.53.1639159723948;
        Fri, 10 Dec 2021 10:08:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id g6sm375455lfu.86.2021.12.10.10.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 10:08:43 -0800 (PST)
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
 <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com> <YbNs1SCLclVifFDP@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <80f3fac6-ad64-988e-636d-5d872890f56e@gmail.com>
Date:   Fri, 10 Dec 2021 21:08:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNs1SCLclVifFDP@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 18:05, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 10:24:26PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The Ouya board specifies the #reset-cells property for the GPIO
>>> controller. Since the GPIO controller doesn't provide reset controls
>>> this is not needed, so they can be dropped.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
>>> index 4259871b76c9..fd64aadc472a 100644
>>> --- a/arch/arm/boot/dts/tegra30-ouya.dts
>>> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
>>> @@ -70,7 +70,6 @@ hdmi@54280000 {
>>>  
>>>  	gpio: gpio@6000d000 {
>>>  		gpio-ranges = <&pinmux 0 0 248>;
>>> -		#reset-cells = <1>;
>>>  	};
>>>  
>>>  	pinmux@70000868 {
>>>
>>
>> Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested it
>> almost 3 years ago [1].
>>
>> [1]
>> https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agner.ch/
> 
> Does it still work today?

It works. That patch still applies as-is.

