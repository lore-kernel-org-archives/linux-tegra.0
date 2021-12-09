Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A52EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 19:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhLITLZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhLITLZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:11:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D1CC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 11:07:51 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b40so13828887lfv.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3JQ8YMCIvsby10vt9WkLS/3Q7MSPzRuwZ7TvpRdNUus=;
        b=iLDzhYde1qsGFMzRRWUTWGbnJ42cgmwrGydvj9ZsPQrJiITMJfUunyPE3MdCS3HHN2
         eOBQHyVjp50MjyG7j5TuSw5JlRwm0u1vUyZIyurUrricc4ZjESiBvV94XMoTdWKhLWr5
         h8vpJJYItC5iI/PN43uWFsUB1tY3RAUefARqyJ2I0r8xDYIq7W8NzCU8HkCsF8e3OF0X
         HxZF7O5Nk222bePS9uJ+3gnYDjiFoFp4C0/3hfL07TVfKP6FO4ePW7Kfg46VsagbDkF+
         3KIEq0g6ytx1h+K8GJd5VaneMThoENYceT50eqAYnlbmBVYASqyhtXWPQjY9/MnSnrpu
         THSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3JQ8YMCIvsby10vt9WkLS/3Q7MSPzRuwZ7TvpRdNUus=;
        b=3cZwkzD7dJclXMWdfRNHPdgkZ0vFQ7cafUSrkUXDj2cbxSODErJgt+18kCVKbS7edc
         AKeEyzILItuZ9QpE5I3AZNNKlTHiQN7AaxmBpe4kgyfBqqMvSFxSI7B1oDKEpcHFFU82
         ZPpRPGYSA5XI7kmmjPRQkUKxF9Y5M2jwzEOPO+P7joxpqIL2/7fqLIXCcsIaXYo5yOoT
         mKwuDRiUMf+WG8+SNVxCZqdbsDX66fIISEtBrfa0zji9s6a+6y1vvn+/gPdgl2WvntPk
         duCmgL73wxLDv5oUlvR9A3Wpg8W4bBuEoAh6elCJH8melUvSJyNC2egYtI9E2HBkm1gV
         AGKg==
X-Gm-Message-State: AOAM533exaDiNWF9MQkDcnKHI4TAd2P3kS25EgWoxnjfjpoHbPw2e3S8
        g0l5biEcNua64SXxTU+Jv+MR/PLPJuM=
X-Google-Smtp-Source: ABdhPJw0TkxvhuzZNlc9LoChLq0vERiDeLKptand+KbFHNH/Zj4BpvOmhlQupcLq/Qx7xYNEA4ZnsQ==
X-Received: by 2002:a19:9109:: with SMTP id t9mr7636112lfd.214.1639076869489;
        Thu, 09 Dec 2021 11:07:49 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id x6sm69035lfe.201.2021.12.09.11.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 11:07:48 -0800 (PST)
Subject: Re: [PATCH 19/25] ARM: tegra: Add dummy backlight power supplies
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Heidelberg <david@ixit.cz>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-20-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <77ab734b-2fbe-385a-0805-087b64d515be@gmail.com>
Date:   Thu, 9 Dec 2021 22:07:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-20-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Medcom Wide and PAZ00 boards don't specify the power supply for the
> backlight, which means that the Linux driver will provide a dummy one.
> Wire up an explicit dummy to also make the DT schema validation succeed.
> Unfortunately I don't have access to the schematics for these boards, so
> I don't know if a more accurate description is possible.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra20-medcom-wide.dts | 3 +++
>  arch/arm/boot/dts/tegra20-paz00.dts       | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> index ed0e4012e140..b072d715999e 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -54,6 +54,9 @@ backlight: backlight {
>  
>  		brightness-levels = <0 4 8 16 32 64 128 255>;
>  		default-brightness-level = <6>;
> +
> +		/* dummy */
> +		power-supply = <&vdd_5v0_reg>;
>  	};
>  
>  	panel: panel {
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
> index e4c6c1363fc5..dd80108ac72c 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -571,6 +571,9 @@ backlight: backlight {
>  
>  		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
>  		default-brightness-level = <10>;
> +
> +		/* dummy */
> +		power-supply = <&p5valw_reg>;
>  	};
>  
>  	clk32k_in: clock-32k {
> 

I think David's patches should be more correct [1][2]. Very unlikely
that 5v is used directly for backlight. I looked at the AC100 patch
previously, checking schematics. You can download paz00 schematics from
the internet [3].

[1]
https://github.com/okias/linux/commit/0a24a3097b2dcb6bb81b13197a2d4836f858199e

[2]
https://github.com/okias/linux/commit/98a2a32c482d0ffd59d96d22ae4169cc3d0ff15d

[3]
https://www.s-manuals.com/pdf/motherboard/compal/compal_la-6352p_r1.0a_schematics.pdf
