Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D611C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhLJPls (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242956AbhLJPls (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:41:48 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D156C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:38:13 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b19so12524288ljr.12
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qw+/x7HvXjtY+TLCaXUtS6MJEulyGycMf2fLmYM1g28=;
        b=cHO0xbG+GVAl6VUnv4kyGYUXQ9agh5hcJ6+B2VRF32MJgMKe1M/Sp7kydyVnMohQlu
         PKy4SJoioAbtC+DkwofpIz6nYZNoboFCemqJ3N6V/pvJQDbICdGCdchahBgCB6uADv1j
         kOR/uRmMVBF7Y+Ztx/waPdWPee2q1wPWCkil4fl12EI7bY3R8aoOrjjYoTDm2iMUVSxQ
         Q/GfcXM26WrD1iDVwTJrj8opF5PMbsGcska0qgHj0yF0xxF/iJINIXEljaic/LcngEmk
         Sx5A7ozzy9K1Bb3i941RUKIxX1MdM+Kivydhp+aB3yDp82Hlp5fLaHZMgo/tiZQSOHp6
         dPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qw+/x7HvXjtY+TLCaXUtS6MJEulyGycMf2fLmYM1g28=;
        b=jcE9uXGPQm+xLzwgTU14xRlChfcWBDvsB7dukqFlb2kMPx461wJ4L8NRmyqY3+tScL
         ikYcdzU5tfpS3aQJo46gGpfhtceoOWGXBV7wGoOZslE/jNkyVUVaTOhkmPqkG8mZ27rj
         04UD395GhceEXvpgA824F/5ncPuBzT/7KuUyDLpIYvlS0UjJ/ueSBXL7ppVFF30EOOoI
         hZ66WxKXejP9CSrurvbK5LLHYcnIto2H2HCBg/n2Hg5lnq/MxCALzqOpEBJBJ76jTJqh
         9GAmC4xHoHTE6CHlFNfdeAlGjBWh3StaFlLtvnlJvLZEKZcLXpMJrB1PYAQcgaCIE/Mm
         yIYA==
X-Gm-Message-State: AOAM5300AsImhynNaAt0AncwwkPftClT+/76Niw6EnbFaP9SAma6c7Xv
        nCl4CfMSTCekPKH4pTxnMEXpUFex4ss=
X-Google-Smtp-Source: ABdhPJzKAbGiQwAQ21nKogsfYpzKD5L2GlfUV2aN7g+wzDaCpRMga+YDBTgTRZKdDfgi2tWpz4qsPg==
X-Received: by 2002:a2e:9b17:: with SMTP id u23mr13667202lji.258.1639150691239;
        Fri, 10 Dec 2021 07:38:11 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id h10sm343505lfv.56.2021.12.10.07.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:38:10 -0800 (PST)
Subject: Re: [PATCH 16/25] ARM: tegra: Avoid pwm- prefix in pinmux nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-17-thierry.reding@gmail.com>
 <169a140b-7cf6-7a60-fc1d-e3a9574604a7@gmail.com> <YbNmSIqlzB9A6aGX@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e253fc7-34eb-8178-b8a0-8f5cf9014d35@gmail.com>
Date:   Fri, 10 Dec 2021 18:38:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNmSIqlzB9A6aGX@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 17:38, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 10:13:56PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The "pwm-" prefix currently matches the DT schema for PWM controllers
>>> and throws an error in that case. This is something that should be fixed
>>> in the PWM DT schema, but in this case we can also preempt any such
>>> conflict by naming the nodes after the pins like we do for many others
>>> of these nodes.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 4 ++--
>>>  arch/arm/boot/dts/tegra20-colibri-iris.dts    | 4 ++--
>>>  arch/arm/boot/dts/tegra20-colibri.dtsi        | 4 ++--
>>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
>>> index a05fb3853da8..d2a3bf9d28bd 100644
>>> --- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
>>> +++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
>>> @@ -70,11 +70,11 @@ mmccd {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> -			pwm-a-b {
>>> +			sdc {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> -			pwm-c-d {
>>> +			sdb_sdd {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
>>> index 425494b9ed54..00ecbbd5e9e1 100644
>>> --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
>>> +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
>>> @@ -70,11 +70,11 @@ mmccd {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> -			pwm-a-b {
>>> +			sdc {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> -			pwm-c-d {
>>> +			sdb_sdd {
>>>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>>>  			};
>>>  
>>> diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
>>> index 80e439003a6d..2350fda3be6a 100644
>>> --- a/arch/arm/boot/dts/tegra20-colibri.dtsi
>>> +++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
>>> @@ -113,7 +113,7 @@ bl-on {
>>>  			};
>>>  
>>>  			/* Colibri Backlight PWM<A>, PWM<B> */
>>> -			pwm-a-b {
>>> +			sdc {
>>>  				nvidia,pins = "sdc";
>>>  				nvidia,function = "pwm";
>>>  				nvidia,tristate = <TEGRA_PIN_ENABLE>;
>>> @@ -242,7 +242,7 @@ cif {
>>>  			};
>>>  
>>>  			/* Colibri PWM<C>, PWM<D> */
>>> -			pwm-c-d {
>>> +			sdb_sdd {
>>>  				nvidia,pins = "sdb", "sdd";
>>>  				nvidia,function = "pwm";
>>>  				nvidia,tristate = <TEGRA_PIN_ENABLE>;
>>>
>>
>> Should be a bit nicer to add the 'pin-' prefix, like I suggested to
>> David [1] sometime ago.
> 
> We don't use the pin- prefix anywhere else, so it would just look out of
> place. We've used this kind of notation where the node name is composed
> of the concatenation of the pins defined within elsewhere, so I prefer
> that.

I borrowed idea to use the 'pin-' prefix from device-trees
of other vendors. To me it's a good practice to have nodes with
meaningful names.
