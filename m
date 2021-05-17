Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB23C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 06:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F1F461185
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 06:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbhEQG2L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 02:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhEQG2K (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 02:28:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6458D60E09;
        Mon, 17 May 2021 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621232814;
        bh=jn2SaI7axFVBIYRBlUnEKjgE+jA5zwUtTS1nY4T5GBc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RURx+nQZJGT2S5mQ3MTr+VEbsnXhDppToXBTwfzFQx20iPzHDMBZT2NJs6yo+M9vF
         jaiu5nOftR4PvTHQSYfqpQ6g/O7Mm4BrJE78EvxdzOMc1x8L3LoGO+SxsFHxG0Sk1T
         RiqTIQt80Nro/CWaWaxovn43+I3KzwDkq1iN2boehg+6WW2QJjgDSoeaPOvvWaAOl/
         NZYOgy4DmHr0s+82wv70lDwi7NL54Ol4t0D8snxKA94jgHGr8Ui1+48RgZdWdIwm42
         bIernAz/EOvxCOc7AMARuOtWJ4HoEcebrz+EPODXxixArVJ5Byp0is16fEkFBLsSlB
         eAc/ndNzVpW2g==
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <831d3af5-1e4a-f3c0-f69d-3fff145fde08@kernel.org>
Date:   Sun, 16 May 2021 23:26:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/16/2021 9:12 AM, Dmitry Osipenko wrote:
> Fix compilation warning on 64bit platforms caused by implicit promotion
> of 32bit signed integer to a 64bit unsigned value which happens after
> enabling compile-testing of the driver.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   drivers/memory/tegra/tegra124-emc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 5699d909abc2..c9eb948cf4df 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -272,8 +272,8 @@
>   #define EMC_PUTERM_ADJ				0x574
>   
>   #define DRAM_DEV_SEL_ALL			0
> -#define DRAM_DEV_SEL_0				(2 << 30)
> -#define DRAM_DEV_SEL_1				(1 << 30)
> +#define DRAM_DEV_SEL_0				(2u << 30)
> +#define DRAM_DEV_SEL_1				(1u << 30)
>   
>   #define EMC_CFG_POWER_FEATURES_MASK		\
>   	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
> 

