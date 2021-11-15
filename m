Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03C4C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 17:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C10563339
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 17:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237165AbhKORhy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 12:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238299AbhKORgp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 12:36:45 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AE8C0432E5;
        Mon, 15 Nov 2021 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ihOFeztaQKLnVze0Cxjjm7Ij5JMiLFtb/81+coQOzSI=; b=S20kIx3WUQSw4hFttpnvzbftN0
        q4v4X/vqZbVndvHkXwhnw3oRBox8f6tfLFNGERyCSM1EgDKE/lSev/y8hxlHHYkpOsTw/oVCXrHKu
        24MHhKWPk3Wnh4qK6k71dHskrBlNjsB4g8uq9F4q0dt+hiYcOE4kuMxS6UUisBOVaS3aHieE0eO9N
        MMpe1Ph6p/AjldkWDMGpvNe/+AFNMjRNSscXUXB16tsvpI9X3GvAzosyAseL1dZBBIb+T8RJFtBes
        lRtK0JNjlI37vu6dUWpd19QxczHw+iH20wbJa8ZsvWFC1DXzZfSN+sBBrot/J+3a+1QIY5ZbR86KI
        WMEujB2Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mmffo-00010C-G8; Mon, 15 Nov 2021 19:21:40 +0200
Subject: Re: [PATCH] reset: tegra-bpmp: Revert Handle errors in BPMP response
To:     Jon Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211112112712.21587-1-jonathanh@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <417a93fd-7581-1d33-1522-31f05ca253b9@kapsi.fi>
Date:   Mon, 15 Nov 2021 19:21:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211112112712.21587-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/12/21 1:27 PM, Jon Hunter wrote:
> Commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> response") fixed an issue in the Tegra BPMP error handling but has
> exposed an issue in the Tegra194 HDA driver and now resetting the
> Tegra194 HDA controller is failing. For now revert the commit
> c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
> while a fix for the Tegra HDA driver is created.
> 
> Fixes: c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/reset/tegra/reset-bpmp.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset-bpmp.c
> index 4c5bba52b105..24d3395964cc 100644
> --- a/drivers/reset/tegra/reset-bpmp.c
> +++ b/drivers/reset/tegra/reset-bpmp.c
> @@ -20,7 +20,6 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
>   	struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
>   	struct mrq_reset_request request;
>   	struct tegra_bpmp_message msg;
> -	int err;
>   
>   	memset(&request, 0, sizeof(request));
>   	request.cmd = command;
> @@ -31,13 +30,7 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
>   	msg.tx.data = &request;
>   	msg.tx.size = sizeof(request);
>   
> -	err = tegra_bpmp_transfer(bpmp, &msg);
> -	if (err)
> -		return err;
> -	if (msg.rx.ret)
> -		return -EINVAL;
> -
> -	return 0;
> +	return tegra_bpmp_transfer(bpmp, &msg);
>   }
>   
>   static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
> 

Is there some reason the subject and commit message does not follow 
normal revert convention (as done by 'git revert')?

Mikko
