Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58270C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Mar 2022 19:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241685AbiCBTgy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Mar 2022 14:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241583AbiCBTgx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Mar 2022 14:36:53 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F81D885E
        for <linux-tegra@vger.kernel.org>; Wed,  2 Mar 2022 11:36:01 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 975E63F5F3
        for <linux-tegra@vger.kernel.org>; Wed,  2 Mar 2022 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646249759;
        bh=5wyQTLndbR1770shQ9vCiiUodd9jZDMmW24GTz8q7QA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=PGinYwWn+mcuW1mCvYCn2S99SlZjE3nFQuJKhFZkygtIIju0Zk01xZY2onyBbURTc
         JELkj2a2JHXRnMSecZTh7XdJkdhX8e3+mdaXemQ5LS3XTSPYPqQ6P6nSD7bA22rd/H
         ze9Wu+9gFNUpe8PSFvevc0ZaC9L1pThJrcVlhSfwgMe3xBguTs2wE8koSzzOCh5Hm/
         nQI59eiFSrFAFIbRmuiRFd6C9PE+rNopOpxlB0iuayyWeUTTplRtP7D1wD+a3uG/x9
         r+vq3rMUdvj7l8MsWqY/nMK2JzzDXUem27/T61RihMnDxXMjztEQ8xl8JRN0mLfTku
         5G72e7v/hwKHA==
Received: by mail-ed1-f70.google.com with SMTP id b13-20020a056402278d00b0041311e02a9bso1529122ede.13
        for <linux-tegra@vger.kernel.org>; Wed, 02 Mar 2022 11:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5wyQTLndbR1770shQ9vCiiUodd9jZDMmW24GTz8q7QA=;
        b=SiT2jpvoaweCmF5erGM0auM6cxWi/iZTfhA26PT8PtlHwFmDHrKhbJ+pzLmUEZg6of
         NYwulRbJZvADhfohd8rhbskA4hWxH91p3KtTOq24NTRsyxIPv28e7RaA/8vWqEuRy0Vf
         GaTcm2cCpCw/5gPWJAArf0A7tM2qbxYquOhSYocXOD5lQXO4TD1FX4YIubnc8+a9sdGX
         qR/gyEUB3VRjaT7fo5pxb6QZuhv4modnOSSLvSLm0WJFMfdLs9igVXwBaARy4jlZS4Bq
         +st2la7fr04ysrEx5RKsGiYVKer8INiDMIGY0t1BWLgUkirkTlNwDuh6AKMAIewVzkIH
         X09g==
X-Gm-Message-State: AOAM532+YoaNd1+3XS76Ijrx7sF53B5yYZh6fbKzbalH/d5Ud7VjdyFh
        2Tm3xLYiyM7cS5/6vyXqgj083oOQsMJC5OTw65ZZ8rAyvuOoJBrP8Z5yPr38j7Zs9WI47KSbab7
        A/Chy7nauLcS+XKB++RKuC+IIjTKcgWR599l0RxJJ
X-Received: by 2002:a05:6402:53:b0:415:c610:168e with SMTP id f19-20020a056402005300b00415c610168emr2734105edu.291.1646249759039;
        Wed, 02 Mar 2022 11:35:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOzefDrgrOFqNbJ++xpGQo0pnJymI1R6/pv/xxsa1NzVv+OV2Y/dASa6qdp76/GQwLpz98Vw==
X-Received: by 2002:a05:6402:53:b0:415:c610:168e with SMTP id f19-20020a056402005300b00415c610168emr2734085edu.291.1646249758878;
        Wed, 02 Mar 2022 11:35:58 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id bo14-20020a170906d04e00b006ce98d9c3e3sm6677084ejb.194.2022.03.02.11.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 11:35:58 -0800 (PST)
Message-ID: <34646ebd-2c37-65ec-ecfe-cfbfa4bd29d2@canonical.com>
Date:   Wed, 2 Mar 2022 20:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v4 3/4] memory: tegra: Add memory controller channels
 support
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <1646210609-21943-1-git-send-email-amhetre@nvidia.com>
 <1646210609-21943-4-git-send-email-amhetre@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1646210609-21943-4-git-send-email-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/03/2022 09:43, Ashish Mhetre wrote:
> From tegra186 onwards, memory controller support multiple channels.
> Add support for mapping address spaces of these channels.
> During error interrupts from memory controller, appropriate registers
> from these channels need to be accessed for logging error info.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       |  6 ++++++
>  drivers/memory/tegra/tegra186.c | 21 +++++++++++++++++++++
>  drivers/memory/tegra/tegra194.c |  1 +
>  drivers/memory/tegra/tegra234.c |  1 +
>  include/soc/tegra/mc.h          |  7 +++++++
>  5 files changed, 36 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index bf3abb6..3cda1d9 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -749,6 +749,12 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  	if (IS_ERR(mc->regs))
>  		return PTR_ERR(mc->regs);
>  
> +	if (mc->soc->ops && mc->soc->ops->map_regs) {
> +		err = mc->soc->ops->map_regs(mc, pdev);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	mc->debugfs.root = debugfs_create_dir("mc", NULL);
>  
>  	if (mc->soc->ops && mc->soc->ops->probe) {
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index 3d15388..59a4425 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -139,11 +139,31 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>  	return 0;
>  }
>  
> +static int tegra186_mc_map_regs(struct tegra_mc *mc,
> +				struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	int i;
> +
> +	mc->mcb_regs = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> +	if (IS_ERR(mc->mcb_regs))
> +		return PTR_ERR(mc->mcb_regs);
> +
> +	for (i = 0; i < mc->soc->num_channels; i++) {
> +		mc->mc_regs[i] = devm_platform_get_and_ioremap_resource(pdev, i + 2, &res);
> +		if (IS_ERR(mc->mc_regs[i]))
> +			return PTR_ERR(mc->mc_regs[i]);

This breaks the ABI, so I need Thierry's ack that such ABI break is
perfectly ok.

> +	}
> +
> +	return 0;
> +}
> +


Best regards,
Krzysztof
