Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54204C2D0A3
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 17:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6B9B221FB
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 17:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bzkNQpyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgKCRGP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:06:15 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1629 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgKCRGP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Nov 2020 12:06:15 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa18e060000>; Tue, 03 Nov 2020 09:06:14 -0800
Received: from [10.26.45.122] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 17:06:13 +0000
Subject: Re: [PATCH] drm/tegra: sor: Don't warn on probe deferral
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20201103114426.546626-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cc0e6f6e-2e06-81b3-38b8-fbdc5c772658@nvidia.com>
Date:   Tue, 3 Nov 2020 17:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103114426.546626-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604423174; bh=wLq1VK2L7j+qzIJOsu91q3Us07fpe99UhftzABkPUJw=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=bzkNQpyjQa6zoWrV4LtF9I/xCCgR5HgfDSoaKMcSTx+viezL7EssCm7uAx4gsHtGw
         6BO59p5M9FkbGxoE4K3MWb9TMiv1h3dS+YqX4c+04R+l7xUxlPSbLoZuKCIjC1s+Sh
         k05cflTwL/pLCWRwWuDKXv9SzBdxo+cJYHMcoPl5kvFi0Rq/0Q/DPgu7XMSHYV0Wrb
         Zx/wNP8oyB58cUBEjZnQG4CPoDPNVTxL1oUs79AK6Opy955M6utfl6JEur7Q49Yg0J
         gIjZGozkIyfITji3Vnhp62NPQkSU08Ya95av0aI85LZY5h0IpEjCNp24L3gMLfRmFb
         7Q7tMx9aIRD1A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 03/11/2020 11:44, Jon Hunter wrote:
> Deferred probe is an expected return value for tegra_output_probe().
> Given that the driver deals with it properly, there's no need to output
> a warning that may potentially confuse users.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index e88a17c2937f..5a232055b8cc 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3765,7 +3765,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  
>  	err = tegra_output_probe(&sor->output);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
> +		dev_err_probe(&pdev->dev, "failed to probe output: %d\n", err);
>  		return err;
>  	}

Sorry this is not right. I will fix this in V2.

Jon

-- 
nvpublic
