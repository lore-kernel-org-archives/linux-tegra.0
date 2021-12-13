Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708F9C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240943AbhLMQkp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238255AbhLMQkf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:40:35 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAC2C06173F
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:40:35 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id z8so24515578ljz.9
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+mG6LpVm22nNpDKgXE8ESbyuJPVUUg9J2McdEOWvYzU=;
        b=hH0h9n7OBxv2BPUxEPPDCfqHzUThoXW5YsrSMmGMqILoZp/NdLF7JpQS3jQtA0WACu
         muaaltRatnvMwOSqp4WJstsNTnOy5Q++2/pkJxGsgZxttlrlnPVC6wj2sFrEVtXL4A84
         LIk7QClFXYUX4uoYhT2dVYs0nLiF0EJUjFOY66Og96zh6uhhKX2s6Dkm4e/hOY1gCnhu
         VWIuryietxnE9ihFPi0lw676QSXJRYBq0SRb7tnqgQxfy2G0v8sn5n0mYfzVc9WitFhM
         Fq61+X2gvsTNTku2md006EuDe1/oED07p9+z+O3dMm7IrJCqTBmc4OA2+Cw5t3PKWoj/
         zZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+mG6LpVm22nNpDKgXE8ESbyuJPVUUg9J2McdEOWvYzU=;
        b=aYbey0gP7arEWi9JDNBmsus20+u7LpZfz9q5CfHbWiZXjYujQOMoasY0yq2TdBUG6h
         nI6YLSk5RsLzIBjPtEd7uLd8Do6pspQnA2N+coqdS6PLIDFj9Vu0tKX0iqgV2zvVgFim
         FmEdWchJ1Lk/6/qQyMUN2vLAXwrTZBWVZX/0OBQZrqdO1rl00K+oii9bVVqkRh9KOfaK
         19cZ5DMpHPlt0PAZS7fIck8FzLvS3+zvtLtm9CJdyLNyADFcjwMmQrWtk5xt6NnRCugV
         k8QVDvq9mXkiiyZnHYkx2b2u/zUqCms7Aa+m4f1yFOQRqIXUo3KM1RcL7xsNS8yZW3XW
         m6Dg==
X-Gm-Message-State: AOAM532MPHTG48mUkV0k4zYBxO6c0rN+wfTXIBiKf5IIQuukfCc0t37N
        HDcjHuuheT8v9XeV81jlgN7mU5HJx3M=
X-Google-Smtp-Source: ABdhPJyX4gNkMkI7hfxNcMMiMfoMY2woR6rRbFL6VraTWgsw+kbg1EnnBiPaHUr+8dtyAaNNwGHWtA==
X-Received: by 2002:a2e:a913:: with SMTP id j19mr30497904ljq.205.1639413633062;
        Mon, 13 Dec 2021 08:40:33 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id d4sm1486710lfg.82.2021.12.13.08.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:40:32 -0800 (PST)
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
 <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com> <YbNs1SCLclVifFDP@orome>
 <80f3fac6-ad64-988e-636d-5d872890f56e@gmail.com> <YbdwrnFH8GAZLfhv@orome>
 <d1b1568e-e218-a6e3-8b34-147b27cd5a1c@gmail.com>
Message-ID: <c1241b78-8986-ac7e-7b0d-44d3084f0715@gmail.com>
Date:   Mon, 13 Dec 2021 19:40:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d1b1568e-e218-a6e3-8b34-147b27cd5a1c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:26, Dmitry Osipenko пишет:
> 13.12.2021 19:11, Thierry Reding пишет:
>> On Fri, Dec 10, 2021 at 09:08:43PM +0300, Dmitry Osipenko wrote:
>>> 10.12.2021 18:05, Thierry Reding пишет:
>>>> On Thu, Dec 09, 2021 at 10:24:26PM +0300, Dmitry Osipenko wrote:
>>>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>
>>>>>> The Ouya board specifies the #reset-cells property for the GPIO
>>>>>> controller. Since the GPIO controller doesn't provide reset controls
>>>>>> this is not needed, so they can be dropped.
>>>>>>
>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>> ---
>>>>>>  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
>>>>>>  1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
>>>>>> index 4259871b76c9..fd64aadc472a 100644
>>>>>> --- a/arch/arm/boot/dts/tegra30-ouya.dts
>>>>>> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
>>>>>> @@ -70,7 +70,6 @@ hdmi@54280000 {
>>>>>>  
>>>>>>  	gpio: gpio@6000d000 {
>>>>>>  		gpio-ranges = <&pinmux 0 0 248>;
>>>>>> -		#reset-cells = <1>;
>>>>>>  	};
>>>>>>  
>>>>>>  	pinmux@70000868 {
>>>>>>
>>>>>
>>>>> Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested it
>>>>> almost 3 years ago [1].
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agner.ch/
>>>>
>>>> Does it still work today?
>>>
>>> It works. That patch still applies as-is.
>>
>> Alright, I'll pull that in then.
> 
> No-no-no, please rebase your patches on top of latest mine [1]. Please
> do it that way, this will be better for everyone. I already took care of
> all the conflicts between the patches and added the new ones, all you
> need to do is to *rebase your* patches.
> 
> [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=276354
> 
> You're again not looking at the incoming emails, are you receiving them
> at all? This situation is very strange to me. I'll continue to keep eye
> on what you're doing to make sure that everything will be merged properly.
> 

Please also don't forget about the power management patchset and the
other sets.

I asked you to reply in the private email, which you haven't done yet.
