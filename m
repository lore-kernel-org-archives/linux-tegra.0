Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12F1C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 08:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C41861157
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 08:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhI0Iye (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 04:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbhI0Iyd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 04:54:33 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B035EC061575;
        Mon, 27 Sep 2021 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TcyusGOPUsXGG6IViMHWfWJUjG8E0+ATdI6E3Zdg0BI=; b=FiUkBae+5naVlKsgX8Ipfw0PPL
        g8FFUo9x52sUeMrKC9W3/VAYn0tmy43R+YxSwdCbwcLWJ6HO1+0dsZgVC16my9NZA9MCUQc8lmW0W
        Lrz7fiESybL9qUPdGIjHCTfvI5OBOm6RQ3IG8+rPc9ZW+ZbCWk5xsNUMt7HJEvC9a5+7S1to7zSp0
        Prig+1s7IWCwbe4DSzKYQTEFhlhr1ZVkaSbT3XXPWKxodTLL3sWJTspB4PUjGpOLWBSOMX8MFxbz8
        6D5JridswqK28SVHhOD5/OoZC8mTL4s0Wul92aKWbgqxrfPlaLrwjuaIVfjBxPd5xXMF5HfcAfK+Z
        oJDrwGIw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mUmNV-0003dq-CM; Mon, 27 Sep 2021 11:52:49 +0300
Subject: Re: [PATCH -next] memory: tegra186-emc: Fix error return code in
 tegra186_emc_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     krzysztof.kozlowski@canonical.com, mperttunen@nvidia.com
References: <20210927075107.2882569-1-yangyingliang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <09e28d31-881f-acd0-33d0-565bdc9475ae@kapsi.fi>
Date:   Mon, 27 Sep 2021 11:52:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210927075107.2882569-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/27/21 10:51 AM, Yang Yingliang wrote:
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
> index abc0c2eeaab7..16351840b187 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -198,6 +198,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   		goto put_bpmp;
>   	}
>   	if (msg.rx.ret < 0) {
> +		err = msg.rx.ret;
>   		dev_err(&pdev->dev, "EMC DVFS MRQ failed: %d (BPMP error code)\n", msg.rx.ret);
>   		goto put_bpmp;
>   	}
> 

Good catch, but we shouldn't return msg.rx.ret since it is a BPMP error 
code that doesn't necessarily map directly to a Linux error code. So we 
should set err to something like -EINVAL instead. Please update, or if 
you'd prefer, I can fix it.

Mikko
