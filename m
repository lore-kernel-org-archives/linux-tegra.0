Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D92C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D9A60FC4
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348229AbhICIc0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 04:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348150AbhICIcZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 04:32:25 -0400
X-Greylist: delayed 478 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Sep 2021 01:31:24 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5B3C061760;
        Fri,  3 Sep 2021 01:31:24 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 40DB15C0222;
        Fri,  3 Sep 2021 10:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1630657426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fjLOEiXgMndi2Q7uZCMxj1Uu2i4mPZJaKSRzdIFBuTQ=;
        b=T/cjSSjNuV1c5iAHsIX3UEBP41pp58INL2FhGpdroivJwC/W88r2CIGqkTVc5KHRp2gflq
        fXGWBSJgRnR+n8v4eFDJcqT2GWdgSjge9OEX0+1cDnxr9zQF19kle6KCZxVtvArhFbOHJP
        zevChd2TLYExLz8D8f/TXTpkdjYxTYI=
MIME-Version: 1.0
Date:   Fri, 03 Sep 2021 10:23:45 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: Make use of the helper function
 devm_platform_ioremap_resource()
In-Reply-To: <20210901074230.9483-1-caihuoqing@baidu.com>
References: <20210901074230.9483-1-caihuoqing@baidu.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <fb7aec944e72f91a9a33d7d37d0cbb44@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-09-01 09:42, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> b/drivers/mtd/nand/raw/tegra_nand.c
> index fbf67722a049..32431bbe69b8 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -1144,7 +1144,6 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  {
>  	struct reset_control *rst;
>  	struct tegra_nand_controller *ctrl;
> -	struct resource *res;
>  	int err = 0;
>  
>  	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> @@ -1155,8 +1154,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  	nand_controller_init(&ctrl->controller);
>  	ctrl->controller.ops = &tegra_nand_controller_ops;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctrl->regs = devm_ioremap_resource(&pdev->dev, res);
> +	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctrl->regs))
>  		return PTR_ERR(ctrl->regs);
