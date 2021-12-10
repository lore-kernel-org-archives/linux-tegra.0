Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66326C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 16:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbhLJQMC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 11:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240274AbhLJQMC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 11:12:02 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7622C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 08:08:26 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id i63so14478512lji.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yO19n6rEX9s/r1FIcXbkbOtSlXt5jG4o1654FyO9tIE=;
        b=fT+UqaTu62FOdp5euMV5kpqBbx29Nv77uSDVYtleuR+VsSa+Ofb1iF2DbJyw0cpQ05
         pYoY5pSKl4uBoWcN9lZ3fP6c9po5PZjVqaEiPrDCpjKCGD7KKzto1qMIDJvYe3hJekhZ
         zJqE1fHQen7UvntEsb8q1k5IMC3OEEshDrkTsC6IEcdv4VArL1Iden0U+a3Mc3NhgEvo
         J0iW0wheXRk7iBLELZw8f6ymp8W6YByL1VY3LWjyvgSvvgpW0nJR8A+msDudUCKslPbq
         xBZHHi/6FeefcZLXTzl3uhRQnyifnfM7+nx/mfHO1DGhxH/pfrPxo5+PYycrNCKAbsHF
         bZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yO19n6rEX9s/r1FIcXbkbOtSlXt5jG4o1654FyO9tIE=;
        b=C687srny30nYoWothkx9cTB+jhxrZBZDI50Q6qUZSDpZm3BA20d2bi0vyd7whR9eP/
         aEHVDbWNCMOcGMRikZbFFV6+dWJR4W9NZOrkSy1oylpFWt2tTrBhRN+IGh/GvPGCoosc
         PWhpJwTydjD39HmnoYGF+ltbE22LYMUcDg8f+NGEzsWfVAKNDmm0iZUrwqUj32yF55+z
         lK/cw0repQB/QAYGclj57g34NzuYLr6RdRy2CIS7fcNTfdp7jvb/e7+XjRhFtEkAgsFA
         GxQpDiPXYwHh6YAUWwFx24noTSjl0xNk2KciupXHCSeSGywnPqXyuH36KF4klHdj0l/h
         13Cg==
X-Gm-Message-State: AOAM532xldClNV6SxCWBrJX+knLAHQOUkrNnENsts0BS7aPZa4adrqhe
        HgeOw59rUS5m3qVnok8KUFAqKCHS2r8=
X-Google-Smtp-Source: ABdhPJyGCrm/c33bvsvU/ktALLw1F+Oi2devrFri/BleW/nQ0lvOOdxeoTF/ChvzR/b4mny+wsZJ0A==
X-Received: by 2002:a2e:9982:: with SMTP id w2mr13874596lji.440.1639152504801;
        Fri, 10 Dec 2021 08:08:24 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id f9sm381360lfu.10.2021.12.10.08.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 08:08:23 -0800 (PST)
Subject: Re: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-23-thierry.reding@gmail.com>
 <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com> <YbNrxsv6Gd9jvx7l@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8bb98f01-5cd6-ec17-fdfe-13557d79d590@gmail.com>
Date:   Fri, 10 Dec 2021 19:08:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNrxsv6Gd9jvx7l@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 18:01, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 09:57:08PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The "clock-frequency" property for an I2C controller needs to be
>>> specified at the bus level.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 3 ++-
>>>  arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 4 ++--
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> The clock-frequency is specified in the parent-common N7 DTSI, NAK.
>>
>> There is already patch from David that removes the clock-frequency from
>> NFC node [1], please use it.
>>
>> Please never again rewrite the preexisting patches, this makes you look odd.
> 
> Again, please don't make this into something it isn't.
> 
>> I suggest to collect *all* patches (not only your own) into single
>> for-next branch, resolving all conflicts, making sure that you don't
>> duplicate the effort and letting it all to be tested before it will hit
>> the bus.
> 
> You know, if you guys communicated better over existing channels or
> actually let me know of what's going on then a lot of this could've been
> avoided. I don't have visibility into what you're all up to, so I can't
> take that into account.

All the messages from me and David are in yours email inbox and on
#tegra IRC. You have the complete visibility. Either you don't have time
to take a look and then forget about it or I don't know what's the problem.

> If I happen to start working on something that someone else is also
> doing in their corner, that's by accident, not because I have bad
> intentions or because "I want to do everything myself", or whatever
> other reason you keep coming up with.
> 
> Stop insinuating things that aren't true.

My point is that you're ignoring the existing patches. It may not look
like a big problem to you since you can apply patches directly and I
understand that own patches are always the most important ones, but this
is a problem for everyone around you.
