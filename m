Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB10CC4320E
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 20:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5DC160F6B
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 20:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhG0Uua (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbhG0Uu2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 16:50:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F61C061757;
        Tue, 27 Jul 2021 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=spnFBmzmT7fGGrcbj0YlEXpMLOsJLsdoYxskVfyMHXA=; b=czU1hxx505vVMYLHpiNVE24x2y
        TO/eAUbBxZNBC6Koi6octXwlvhw29sL+wXm+YX0Lf6crNjaG51uUlma86biIjzDwbKuKdP+AJb6H0
        QkP+zdE2lvxrd3LkKWq9x3zyweq7QiiOzKDAfuBkzcbNOxho3Rdz7fBhFVSADgD0zFzZbzvFueadH
        xEMnS19SfxkWv2o+OlfucykQo9+5bBu10ytpAT5hSRUJS9eD/L8gVvxhIRrKZiKwzz3nYDcXMxAs5
        RpsU/JGimLqMYrVkBNjTiVKeXiSCS2xlRz+tXk6IQl2rqCjv80ZmnDwwXKF70zOcGK+yKhRPmH9qb
        1t/aV81g==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8U1y-00GH6P-O6; Tue, 27 Jul 2021 20:50:28 +0000
Subject: Re: [PATCH V2] media: uvcvideo: Remove unused including
 <linux/version.h>
To:     Cai Huoqing <caihuoqing@baidu.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210727092854.1006-1-caihuoqing@baidu.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dc520c2d-a314-fc58-35f9-07564401b4a9@infradead.org>
Date:   Tue, 27 Jul 2021 13:50:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727092854.1006-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/27/21 2:28 AM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> V1->V2: Split the patch in two.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

as reported by 'make versioncheck':

../drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9a791d8ef200..b1b055784f8d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -16,7 +16,6 @@
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> -#include <linux/version.h>
>  #include <asm/unaligned.h>
>  
>  #include <media/v4l2-common.h>
> 


-- 
~Randy

