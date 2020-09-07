Return-Path: <SRS0=rvI8=CQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B39C433E2
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BE6E2177B
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="dbyO4rHY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgIGTnj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Sep 2020 15:43:39 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10342 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgIGTnf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:43:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568d350000>; Mon, 07 Sep 2020 12:42:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:43:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:43:34 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:43:33 +0000
Subject: Re: [PATCH 8/9] firmware: tegra: Enable BPMP support on Tegra234
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-9-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <05068df4-7c6d-e291-9bed-4b4a57eb2498@nvidia.com>
Date:   Mon, 7 Sep 2020 20:43:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-9-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599507765; bh=73KBzlUIA5eYA1VqGk+Jtuiw1SyndnYIZV7XhXuuO9k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=dbyO4rHY+Qa9L2N8jGL7BRzWWFDUdzg0OAnguoQ9F/9cKxzGxuhb/PA8YeYVCKIvG
         gHqBOTh5YWj1ycSn0X0g2R5kKN0jKW9fGWaBSZqvG1/WgumeQ8gHVf2X6DqGIMG6ha
         CegGIb8wuv5AOxtHuVUF9VRjVH3v5MZHkxlXktuxt2gfFyf2Newbg63a075SSDW9kn
         WD2XBz52Q3lljVs2mNzt53pAO9lLYuosQM9ThaTOPX5M322io18/R6b/x4lIjmqxI4
         kNLeEFOZ860P4+Q4/YUealIXpev0K6ilDQjmTNhESs7MhpHbUGx0FhhxnsLzA16RTm
         mlRoSJfRuEyeA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Enable support for the BPMP on Tegra234 to avoid relying on Tegra194
> being enabled to pull in the needed OF device ID table entry.
> 
> On simulation platforms the BPMP hasn't booted up yet by the time we
> probe the BPMP driver and the BPMP hasn't had a chance to mark the
> doorbell as ringable by the CCPLEX. This corresponding check in the
> BPMP driver will therefore fail. Work around this by disabling the
> check on simulation platforms.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 3 ++-
>  drivers/mailbox/tegra-hsp.c   | 9 ++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 4d93d8925e14..0742a90cb844 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -856,7 +856,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
>  
>  static const struct of_device_id tegra_bpmp_match[] = {
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> -    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>  	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
>  #endif
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 834b35dc3b13..e07091d71986 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -13,6 +13,8 @@
>  #include <linux/pm.h>
>  #include <linux/slab.h>
>  
> +#include <soc/tegra/fuse.h>
> +
>  #include <dt-bindings/mailbox/tegra186-hsp.h>
>  
>  #include "mailbox.h"
> @@ -322,7 +324,12 @@ static int tegra_hsp_doorbell_startup(struct mbox_chan *chan)
>  	if (!ccplex)
>  		return -ENODEV;
>  
> -	if (!tegra_hsp_doorbell_can_ring(db))
> +	/*
> +	 * On simulation platforms the BPMP hasn't had a chance yet to mark
> +	 * the doorbell as ringable by the CCPLEX, so we want to skip extra
> +	 * checks here.
> +	 */
> +	if (tegra_is_silicon() && !tegra_hsp_doorbell_can_ring(db))
>  		return -ENODEV;
>  
>  	spin_lock_irqsave(&hsp->lock, flags);
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
