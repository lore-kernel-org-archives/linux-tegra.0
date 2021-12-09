Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236B2C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 18:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbhLISmI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 13:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhLISln (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 13:41:43 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E77CC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 10:38:09 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id cf39so1622102lfb.8
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MqUGBdh/Tlrc/AttRmujXUgG1REjQZnDPXNoRLajicE=;
        b=pmHcFp40YyT/EtUOCvG1hLSoNy4Cf3xCjrqJJg0DXFZjdnr7ffJK93Ch3LFawxmxub
         1P2qAwEzZvO8jlM19AqJmPRxnGF1wFqBM1rpEqZrM0i/OVh/9fi6/xbOTP3+m5xhieEv
         yrWcBiBURnF9wZgyTmqZfviY+FxND+kAb+d2/A2g2BQ8NU8MuMcPt2HHeelfy/48//FK
         S7mhKSoOTHr1k30znT2rcd9EhRHDTEfXOnjjCWs1LZbC7VmP+JOmXWFmeJnwdIz0ED4o
         woxD6O8uhD/JUWKZhyg2WI0vOpgdhzgQCwvkegZgDL9H5q+/kcfVKSn/1EAljtbgvquY
         0ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MqUGBdh/Tlrc/AttRmujXUgG1REjQZnDPXNoRLajicE=;
        b=wRDLS6rEpZ01jvfwohJNeQLKk2uvlDdr0wNd6CmQ2Ycsf37QjvpZ4FFcWlkj5/i759
         ey2trJ/0Ka2q7/5FSCy+rx88y7M64S2iiUGx/IxDPlSkJ9iMes+JE2sfMZ1JVRTC5eEY
         rsWyhX+lC2IXz7QqDduOUT2MtAxXXWJkXbr+7Seh+4ef135DzLrAEUUMOCnO2TPI7pEj
         pc2H0O8DUQIjcRJH3mh31BLOY8aaIMzUDD+ut4CTkIaCAOIF+N59L+BOjSuMJlAjLhPT
         zyOT3BiZBeG2JfP3dE56zRcNZ2ISu7pYCw4qIDXFiUhsZB1QNGmBD3x6nPn3CrcNsVZh
         EWhg==
X-Gm-Message-State: AOAM5332A5f/H0KAd67BBlM2c36G4/re38Ct+9BZF8MoIjIPu7WC5tkP
        19W7JYreVH9iQEFbBImA/oTU6LnUv7g=
X-Google-Smtp-Source: ABdhPJx1y6cZvSk5m52amVsoRphBYZd6oRuYbzU450Prd9YYi83ZgO75DuoN7OSumUFPQzrtOy6Drw==
X-Received: by 2002:a05:6512:2eb:: with SMTP id m11mr7367266lfq.326.1639075087315;
        Thu, 09 Dec 2021 10:38:07 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id o15sm60528lfk.175.2021.12.09.10.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:38:06 -0800 (PST)
Subject: Re: [PATCH 12/25] ARM: tegra: Do not use unit-address for OPP nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-13-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b133948b-1705-b27e-d0fb-b71481148bad@gmail.com>
Date:   Thu, 9 Dec 2021 21:38:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-13-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> OPP nodes do not have a "reg" property and therefore shouldn't have a
> unit-address. Instead, use a dash instead of the '@' and ',' characters
> to allow validation of the nodes against the DT schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../boot/dts/tegra124-peripherals-opp.dtsi    | 142 ++++++++---------
>  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  82 +++++-----
>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  82 +++++-----
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  36 ++---
>  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 144 +++++++++---------
>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 144 +++++++++---------
>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 130 ++++++++--------
>  7 files changed, 382 insertions(+), 378 deletions(-)

This patch is wrong, you haven't renamed the delete-node properties [1].

Please stop rewriting patches and use what already has been sent out and
tested, thanks.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-35-digetx@gmail.com/
