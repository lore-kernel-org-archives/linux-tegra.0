Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CAAC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 12:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F23A1611CA
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 12:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240706AbhI1Mbr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Sep 2021 08:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbhI1Mbr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Sep 2021 08:31:47 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BE5C061575;
        Tue, 28 Sep 2021 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yF1lWcH2qjndVjno9oL2GGiLBEO3Zc/VEOg/LYKD2Zw=; b=pZ1FyoI9SmTcmf2eZPSWQ3fJk4
        1+u2M1qKaoebPofrBylcAMGuLhkJDQMwn6KxxRQTmq4UnrtBzY9nhdD1J4tU3Va+nfTCmHULJWFA8
        x1xzp0CQubwEDl0UQYsaEhvENaTFyJqLxLHV7PgQfnCGN6BeMcKhkbCGnveCHh81Urls4vT+Z4R8J
        94ytDvUot3QCjQDlJHsRC6CuMFTvXnB7HtfTUpOP3c/Ne/KqAfw6p8e4Ks9EHn8Coiu0uL8l97ZOW
        7H48RAShYAU0uP8oMAb1r4SSGKc5zt+kAVlHQUd8yAaueUmPeAXjNMi1E/GRklyR5Nj4+kHsD1CQr
        8YXbGVrw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mVCFG-0004La-Ms; Tue, 28 Sep 2021 15:30:02 +0300
Subject: Re: [PATCH -next v2] memory: tegra186-emc: Fix error return code in
 tegra186_emc_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     krzysztof.kozlowski@canonical.com, mperttunen@nvidia.com
References: <20210928021545.3774677-1-yangyingliang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <9080ad2f-e01b-5c7a-333e-6039a8824ae5@kapsi.fi>
Date:   Tue, 28 Sep 2021 15:30:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210928021545.3774677-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/28/21 5:15 AM, Yang Yingliang wrote:
> Return the error code when command fails.
> 
> Fixes: 13324edbe926 ("memory: tegra186-emc: Handle errors in BPMP response")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/memory/tegra/tegra186-emc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
> index abc0c2eeaab7..746c4ef2c0af 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -198,6 +198,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   		goto put_bpmp;
>   	}
>   	if (msg.rx.ret < 0) {
> +		err = -EINVAL;
>   		dev_err(&pdev->dev, "EMC DVFS MRQ failed: %d (BPMP error code)\n", msg.rx.ret);
>   		goto put_bpmp;
>   	}
> 

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
