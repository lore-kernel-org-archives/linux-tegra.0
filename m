Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9D2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235322AbhLJPTH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhLJPTH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:19:07 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5805C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:15:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bi37so18669599lfb.5
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=phaoDr6eSfVkdRaM2IGEkMgF2cRckolimSHWqi9K2x8=;
        b=oBemBmm4+UARcNz3HjxZtcJheGFx3aGSbwPPnsRwG1LidBKf6g0WOG3uI1T86mSxAS
         1rBm0akyrH1rJEWfOhIVW2qrJDyTue2iuEI+Y8H52eAN+58iy3zmcG2Sr/OusvdTW7me
         LUMPBO5tNdLb7JcZ71F+Sk4Y5YwYfPHVZIeu/k9te2wA/RNygNLieUktNuV/6WMpQyaV
         wb+6HdYms8TjBexMX8GTdWCMm1YTBjC+cwj94mkovrNxDP4Rd+rG88Jxe5qTsh9w+JPR
         c2Tli/S/LAPSyB8qRHuFozLPdX6jt48IjNoPt+Wyy8QIO1+/TEFZJwl63BgXCOv0OnNY
         0WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=phaoDr6eSfVkdRaM2IGEkMgF2cRckolimSHWqi9K2x8=;
        b=InX3s8rwhxJZuXbG5Kp3hfLk1q08ZdEVl5h/V1oYyW3JrJ6SKUaQ5j1ja6bOdnvrJb
         HexOoXjX2Cw3j/r7AmUbiEXOto7WezwIX//0CQOVb9S/ykpo2k3K0Vc8oKc2+J66agMd
         f6QdYdOhkfwAJUB+l1tQEW68G34kpOKMGcvuYn9Wj4+KJ1X9w74rfqtHzvEFQ4/O8eOp
         KP6v4bX173bYfUCDFRemYJ/tLfrS/EWXnlSFAaTMwUgfWQkEh1ktVa2gMoamIcQbi1Zu
         zHGGEnpePoZLMhw2YyjkSCWfTDcuQRDagoahHboHM6mqo96gROp6VgPp/B8gj4+Vs0qB
         d21A==
X-Gm-Message-State: AOAM533F0Q5ZYRHOvHowYZ++YSY8j29OBHmpJswK/RiIc5GsoY+n0BHV
        ft8VWinwGrj9g6fn/8filstk8hOhsG8=
X-Google-Smtp-Source: ABdhPJz1GBebVbbnH/mh6oenfPju+X67g7PRaM6l20cNARAnql4fCbwjUSWFy4LWEXEkHOi+Y9UeIw==
X-Received: by 2002:a19:6b0b:: with SMTP id d11mr12885067lfa.446.1639149329765;
        Fri, 10 Dec 2021 07:15:29 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id v10sm335570ljp.125.2021.12.10.07.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:15:29 -0800 (PST)
Subject: Re: [PATCH 01/25] ARM: tegra: Clean up external memory controller
 nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-2-thierry.reding@gmail.com>
 <ec912e49-5ac6-476c-903e-cf1ad08e62bb@gmail.com> <YbNFVznlT+ErMfSf@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a4a14cc9-975e-ae36-8486-02fbecb00931@gmail.com>
Date:   Fri, 10 Dec 2021 18:15:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNFVznlT+ErMfSf@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 15:17, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 11:01:10PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The external memory controller should be sorted after the memory
>>> controller to keep the ordering by unit-address intact.
>>
>> "sorted after the memory controller, I don't understand what this means.
>> Please clarify.
> 
> In device tree we sort nodes by unit-address. In these files the
> external memory controller device tree nodes (which have a higher unit-
> address than the memory controller device tree nodes) was listed before
> the memory controller device tree node. This fixes the order by sorting
> the nodes correctly.
> 
> Guess "sort after" doesn't really exist, but I thought it'd be clear
> enough in the context to avoid using so many words. Guess I was wrong.

Now I see what you did, thanks.

>>> While at it,
>>> rename the emc-timings and timing nodes to avoid including the RAM code
>>> and clock frequency in their names. There is no requirement to do this,
>>> so we can use simple enumerations instead.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |  483 +++--
>>>  .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  699 +++---
>>>  arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  | 1918 +++++++++--------
>>>  .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  639 +++---
>>>  4 files changed, 1900 insertions(+), 1839 deletions(-)
>>
>> It's very suspicious that you changed only T124. This all doesn't look
>> good to me.
>>
>> Please either explain it all or drop this patch.
> 
> Well, on other SoCs the order of the MC vs. EMC was correct, so I didn't
> have to touch those and therefore didn't fix up the numbering while at
> it. What exactly is suspicous about that?
> 
> I'll go and update all of those files as well if that makes you happy.

You renamed only the T124 timings here. This is similar to another patch
where you partially removed the reg-shift, which is incorrect to do.

If you'll split this patch into two and rename all the timings
consistently in a separate patch, then I'll be happy. Please note that
you'll also have to change the new DTs if you're going to take them into
5.17.
