Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65062C49EAB
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 17:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36ECC61C2F
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 17:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhF0RpH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 13:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhF0RpG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 13:45:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20F4C061574;
        Sun, 27 Jun 2021 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=sA7GowKcsXoXLYbnQ09hwU77x7n7SZL9tGmjJEqs7dI=; b=IK3Tvyfx3jRRbMIer0ZoUV/P0R
        Ru5itNjRjU8oA75cAP+MWx6T17RVpWy7grt9A4EhVDWi0pDPIegHx5h6Z0rRJZ9+uAXIZMFDPxbwN
        6I0W3TroyJNfzkZnF4qjdUU7KDU54A+c0TWrEJqMvRpJxMurL6BGd4By6QluAZ8HfHZZf/yoZ/nDI
        iYWyLCnqtJxgIL2blhZ3CI3t6682pegatOC9tvsjbOSIM4zxksZHdYeSWT33CGZuuU+AsYwjeJp/q
        FBUI86rnpLRB5G49XyJK7NPJx2bXUYxzM/DAWSqWYGwO+3Vwfl0XVgenMr7Qex/C/njsWEMbuqIt/
        RwD4LeDA==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxYnq-005whY-A4; Sun, 27 Jun 2021 17:42:42 +0000
Subject: Re: [RFC 05/11] hte: Add Tegra194 IRQ HTE test driver
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-6-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <22373129-9a1a-9a00-690d-d600c3666222@infradead.org>
Date:   Sun, 27 Jun 2021 10:42:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625235532.19575-6-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/25/21 4:55 PM, Dipen Patel wrote:
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index f7b01fcc7190..c4d335c41254 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -31,4 +31,11 @@ config HTE_TEGRA194
>  	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
>  	  lines for timestamping in realtime.
>  
> +config HTE_TEGRA194_IRQ_TEST
> +        tristate "NVIDIA Tegra194 HTE LIC IRQ Test"
> +        depends on HTE_TEGRA194
> +        help
> +          The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
> +	  usage for the LIC IRQ hardware timestamp.
> +
>  endif

Fix indentation, please.


-- 
~Randy

