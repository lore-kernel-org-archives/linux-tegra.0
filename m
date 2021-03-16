Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEDFC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:44:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D898650F6
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhCPPnm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbhCPPnh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 11:43:37 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C944C06174A;
        Tue, 16 Mar 2021 08:43:36 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y1so21066522ljm.10;
        Tue, 16 Mar 2021 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SsLT1SIrWQK3bgiPEdagxHQRJO95zNk7SgDAzmPn89A=;
        b=ILM65EWimZuDDpbu+DG5P/qqnqkR4Vc74CxtWlhJC48PzV1JL+FcUDftzoVJJOaPkj
         qct5oothHXIaiexZ6ku6UB5qf18zkS/ODRd8uDhMLVEKLC4PjK3HjRffCDqAKFuDTJk1
         bu+xuwSe/s6wROEUFq1Nk4v/+BRkv9agwokXz/Ez7LhKs8jilo1QgIYitDtlDh2GctI0
         fcI/0zUe7pEE/qD89JROU76Wl4JHvtAyqDp+422QzgamzkaYdKjaOpiVxgEDieTGNqjO
         mvk625A97lEo59y/fhixt/NkAbV5HKLrTwDBd9gla6emh05uXYfAjfGtCRNOJbd+wcjp
         MpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SsLT1SIrWQK3bgiPEdagxHQRJO95zNk7SgDAzmPn89A=;
        b=DsN3ecMeBZnsARO4EjDZxwSGxJxjDGjLY6VH16ISTomJbDf41um+tV/BEP6u7ObTaX
         5DfC+nmFcyUW4+s71X8+8mo6PFgZWdFhPOnxpQevb5/ZNmLG49tluiOpmWkWtacVwqYI
         9R0d9oJqRxfFMWKJrsKvU/86y9gjv2hygXvFwjcms1xnqxEXvNnp2riGj+fz9m6fvX0f
         QlNNvau3uoIpY1dO+SPNG61voeczaCk7Cj6P478XQNiygFAUI4wXSI2qy/2rGeRCKevt
         qBWBS3Gw0KkzIciy+in1V9vQka0QjHyTo4+LSge44V3uCOxrIRAEdl4vilVJrqE0PGIj
         WCPQ==
X-Gm-Message-State: AOAM531tb5DxgLmJqn0iW6IjfUUfk2Sgehv/6l+X7OFYJlI1nlv486nQ
        Ik9UPagp9MgDngY4T2pr3GY=
X-Google-Smtp-Source: ABdhPJwy/sqtmgEVmkTM1kxqki23iWbYL7Rqwy8KuUbqaH28l2EmCAIQsx2Htym56rP/v2De2akpJQ==
X-Received: by 2002:a05:651c:1136:: with SMTP id e22mr3012136ljo.3.1615909415094;
        Tue, 16 Mar 2021 08:43:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id c16sm3114520lfb.36.2021.03.16.08.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:43:34 -0700 (PDT)
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
Date:   Tue, 16 Mar 2021 18:43:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.03.2021 10:55, Krzysztof Kozlowski пишет:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
> built on platforms without it (e.g. compile test on MIPS with RALINK and
> SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Depend on COMMON_CLK always, not only for compile test.
> ---
>  drivers/usb/phy/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> index 52eebcb88c1f..7500e77a7d01 100644
> --- a/drivers/usb/phy/Kconfig
> +++ b/drivers/usb/phy/Kconfig
> @@ -163,6 +163,7 @@ config USB_MXS_PHY
>  config USB_TEGRA_PHY
>  	tristate "NVIDIA Tegra USB PHY Driver"
>  	depends on ARCH_TEGRA || COMPILE_TEST
> +	depends on COMMON_CLK
>  	select USB_COMMON
>  	select USB_PHY
>  	select USB_ULPI
> 

But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
