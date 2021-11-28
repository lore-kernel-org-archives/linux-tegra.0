Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C860FC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Nov 2021 21:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhK1VhC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 16:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbhK1VfC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 16:35:02 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70623C061574;
        Sun, 28 Nov 2021 13:31:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id u3so39362680lfl.2;
        Sun, 28 Nov 2021 13:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hqqwFzuESSMW0jfkK2QrjmANVN0lbBWl/IRoqqwzlaA=;
        b=OGkzeXXqF/r80GXewSEKN+gWZcT9R9NHUg4RZ2BQi1FAxk8/eeAmxkyB3uemAID09h
         dSQBmsobE+Eub+Wzpe6ow+3ohI/ZUsykTqeNVO0f9cwO7gt1vjUyj/yPSUWzivOEIW90
         jfEELvTYSl8v7+7HK7IoOeGZkLOr/EZRgCPvZGtjqPeHMYdNapLN81AxoQOj2NoeLAaW
         dC88A58qAatfBmcMn3F0OfhZVyoJc9oF3D6rJpJs5HAYJztl111/oQ4gjVnOXOmM3G3i
         vCGviULK7RYnOc6REiRvyp3itnpZR/FMEPjiX2wiOSg1f8eTDRMxIyYpTszQEMIdwwn/
         KOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hqqwFzuESSMW0jfkK2QrjmANVN0lbBWl/IRoqqwzlaA=;
        b=Zkh/19s/UzppczcsqnkMN3erh2P0gfIqrz5xothd1dIv8Rpc/G/i12SK8mx4YnGhap
         xsdAbzsAg3pO4NmDt/aVR721+9ZFWMxqHYlYcolYXxwFkUiCQa3T4aqZ17WNoYMntL1c
         rJZCpHEkslKmAPQg8f+6DxAsvLb5DLym6NEI7SKRzLawIjZAfRMGD6tra/lxDTs6Jc9u
         gt5lCqSrdBlY3mD9MdbnmhYTYoKQMV9LenmeQDMeBOyxJtrfxhhINstBAC3Zqd8nqKi5
         kk96fVQBn0QeVVsv/K68pXnK2T+5jd7sSZWcKCnHdY1nUwStlKWGr7dBYowl+/vaEDKv
         khcw==
X-Gm-Message-State: AOAM531jn5YU0fsQEWzlh4CwM/bAfYdrdsPc0qmOLu7FuS8QwAPwPUiM
        fpTBA2AQ1G5W3yStTLtf7nMsvt09+Ic=
X-Google-Smtp-Source: ABdhPJxgOPj2S6BJzWOgPCRrn2IW5GKkMv7aH2gogt/zHQ/lSX21we7ICSaM0s2wXzYz/su/7RBvqw==
X-Received: by 2002:ac2:4119:: with SMTP id b25mr41931675lfi.3.1638135103545;
        Sun, 28 Nov 2021 13:31:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id k15sm1163913ljg.123.2021.11.28.13.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 13:31:43 -0800 (PST)
Subject: Re: [PATCH v3 05/14] ARM: tegra: Add device-tree for ASUS Transformer
 Prime TF201
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-6-digetx@gmail.com> <YaLgpb2hQGzQXrej@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8762c5e6-1ec0-4412-b3db-968551e15b30@gmail.com>
Date:   Mon, 29 Nov 2021 00:31:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLgpb2hQGzQXrej@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.11.2021 04:51, Michał Mirosław пишет:
> On Sat, Nov 27, 2021 at 05:23:18PM +0300, Dmitry Osipenko wrote:
>> From: Svyatoslav Ryhel <clamor95@gmail.com>
>>
>> Add device-tree for ASUS Transformer Prime TF201, which is NVIDIA
>> Tegra30-based tablet device.
>>
>> Co-developed-by: Ion Agorria <ion@agorria.com>
>> Signed-off-by: Ion Agorria <ion@agorria.com>
>> Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
>> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>> ---
>>  arch/arm/boot/dts/Makefile                    |    1 +
>>  .../boot/dts/tegra30-asus-lvds-display.dtsi   |   46 +
>>  arch/arm/boot/dts/tegra30-asus-tf201.dts      |  623 ++++++
>>  .../dts/tegra30-asus-transformer-common.dtsi  | 1741 +++++++++++++++++
>>  4 files changed, 2411 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi
>>  create mode 100644 arch/arm/boot/dts/tegra30-asus-tf201.dts
>>  create mode 100644 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
> 
> I think the common.dtsi is combined from all the DT authors, so they all
> should be mentioned in the co-developed/signed-off lines. (Or maybe just
> split the common part out if you want to be more specific in assigning
> credits?)

I'll factor out the common part into separate patch and will make you
the author of that patch since it really was derived from yours original
TF300T DT. I actually wanted to do that previously, it's good that you
reminded about it.

>> +	i2c@7000c400 {
>> +		/* Atmel MXT768E touchscreen */
>> +		touchscreen@4d {
> [...]
>> +			interrupt-parent = <&gpio>;
>> +			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;
> [...]
> 
> Nit: This could use 'interrupts-extended' as it's more readable, I think.
> (There are similar cases in other DTs.)

I don't have objections, although the classic variant is also good to me.

I don't think that it makes sense to change only the Transformer DTs to
use 'interrupts-extended'. I'd suggest to create a followup patches that
will cleanup and improve all Tegra device-trees together, making them
all more uniform and nicer to look.

>> +	uartb: serial@70006040 {
>> +		compatible = "nvidia,tegra30-hsuart";
> [...]
> 
> I wonder why isn't this in the tegra30.dtsi? The DT shouldn't select a
> driver - it should only describe the hardware.

The "nvidia,tegra30-hsuart" implies that UART port is capable of
performing the high speed transfers, which should be board dependent.
Meanwhile "nvidia,tegra30-uart" should work for all hardware variants.
That's how I understand it.

The comment in the Tegra dtsi really shouldn't refer to the drivers.
Changing that comment should be material for a separate patch. It could
become a part of the DT cleanup patches together with the
'interrupts-extended' changes.
