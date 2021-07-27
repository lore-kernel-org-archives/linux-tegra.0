Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D371FC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 20:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E2660F6C
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 20:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhG0Uta (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhG0Ut3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 16:49:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3136C061757;
        Tue, 27 Jul 2021 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Lsp08SM0yo7PFzwQehwxLP0bQIcTNF5fA6u5jcyMQ2s=; b=WFloFrAEFsNIvZV881tCKTeWU8
        kfITgaO9SUn/5zCjxQb+mvSZxamHAT0sUIJ/k1ji+xsxaLhHgTFlNayjCHIYf9SCLHI2OM8oLhB0Y
        CzSw8rhCw6h5X60GZgbAOcQg1q9MOf52FoA70PrZIHOZBemKPdb/G1DEvGDM8RI2Uh04Oash3uHt5
        XA3MuGE4bkAvl1Bn7ftpoH+lmerW7gSRgbla+WUwMQLLEjBkGOsAxXrxoTzTPIXeGvuZYAGGenF7K
        WvrLZjtRmXskhXodxt+1jrEtv8e6qvuoQpfI+3CYgMX3TRRXQJ5jTMAwF7uH+4w1fWarbctAQIoRG
        7Ebo6rxw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8U0z-00GH0X-KH; Tue, 27 Jul 2021 20:49:25 +0000
Subject: Re: [PATCH V2] soc/tegra: bpmp: Remove unused including
 <linux/version.h>
To:     Cai Huoqing <caihuoqing@baidu.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210727092854.1006-1-caihuoqing@baidu.com>
 <20210727092854.1006-2-caihuoqing@baidu.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5b2a5ef2-9ddc-5a85-4ea8-2485244c412a@infradead.org>
Date:   Tue, 27 Jul 2021 13:49:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727092854.1006-2-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/27/21 2:28 AM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> V1->V2: Split the patch in two
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

as reported by 'make versioncheck':

../drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.

thanks.

> ---
>  drivers/soc/tegra/powergate-bpmp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/powergate-bpmp.c b/drivers/soc/tegra/powergate-bpmp.c
> index 06c792bafca5..8eaf50d0b6af 100644
> --- a/drivers/soc/tegra/powergate-bpmp.c
> +++ b/drivers/soc/tegra/powergate-bpmp.c
> @@ -7,7 +7,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> -#include <linux/version.h>
>  
>  #include <soc/tegra/bpmp.h>
>  #include <soc/tegra/bpmp-abi.h>
> 


-- 
~Randy
