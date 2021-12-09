Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B34C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhLIUiQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhLIUiQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:38:16 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF05C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 12:34:42 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id p8so10815954ljo.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 12:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3pioD8N7JhUNTpdtLN8RDbkZeQdupwSD2tp3G8Ih3vg=;
        b=npmXjKyY+pcaQxjcqL1Dy7NBjuG2cWIuFwlgOUhc13taGiYgEhpTckdO/nSH4tp+gq
         y8BxZpNs+Jp2PzIigsKk5p00XCds5dBJKtw5TdOrGYpfxs9cVY8QQcAnJZ5tGuVOwK6m
         6sOiENasjV+XPhZjGIVWtjsHQzxGjk/VfwrT6j7GqoK6f2IAl79iRinU6vSZOyu1QRtH
         mRy6HjEWp5auNDSS+tJtk8EIA4+ave12xUI6f4ERotvaT3VcsLtI8t+/gWTG0WW3o19D
         5EJu52ArxKr0++C3QdVBVMwIjW6hOnADWpeie856smX070AS3Tb8mgjDp/Z7jP3uQDWq
         1hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3pioD8N7JhUNTpdtLN8RDbkZeQdupwSD2tp3G8Ih3vg=;
        b=N8usX/lre+exwmXxCzZwM9NfsXKjE6B2L/RCc3A9vXf21aEbvY22OMPo6yqLf73GX6
         ijOOngUVf3pS+dtdopbVhARuVbGko1ZNxBuzu+Sag1OqGgfma7VJ1yqfI5UnlGoI6nUd
         IMhHBbDfa09i2En13KszB/ZmLCqfYWoNer17PpcFWQ0MSQHuhNoADDHTGlFJySB8AuNg
         xOcqdyt4vi907a3uZmpkQt6FeF/rvmcRqW4OlkvFdy5ImmbmQjlyg/N3sNcnqRzCh1Ou
         rmtgS5xLDzhXl4AXGAvS68rjQz5/Wjcp/tWLu0wWOc3nDAjKVOfU/FXNQklAN/aLxO7x
         NhWA==
X-Gm-Message-State: AOAM530GI7msnKhPSPhPq8KL089ZkhVPWwcE4IuwBUDvUOeYaYOHQDO9
        Cqj97pfsRwwLT60Qpc94zj193KA4Osk=
X-Google-Smtp-Source: ABdhPJz8I8XSHxvPfBmycBaS+lNg7iabHghDlChNh9r0k/AxQ4MEiUDLYUA8iWAdasX2uJyaNVOCrw==
X-Received: by 2002:a2e:2206:: with SMTP id i6mr8522147lji.357.1639082080688;
        Thu, 09 Dec 2021 12:34:40 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id k8sm95163lfv.179.2021.12.09.12.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 12:34:40 -0800 (PST)
Subject: Re: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-8-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com>
Date:   Thu, 9 Dec 2021 23:34:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra memory controller provides reset controls for hotflush reset,
> so the #reset-cells property must be specified.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index 328425dba023..ce7410ee08b8 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
>  
>  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>  
> +		#reset-cells = <1>;
>  		#iommu-cells = <1>;
>  	};
>  
> 

This will conflict with the patch that adds video decoder node [1].
Since the VDE patch was sent out earlier, I suggest you to drop this patch.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.4064-23-digetx@gmail.com/
