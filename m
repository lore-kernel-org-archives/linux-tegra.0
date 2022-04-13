Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4D2C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 21:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbiDMVTd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 17:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiDMVTd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 17:19:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105DA327;
        Wed, 13 Apr 2022 14:17:11 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0ECCC1F42B6D;
        Wed, 13 Apr 2022 22:17:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649884630;
        bh=Qg9+MUz9LbTwQy0+OoWPGW/aTuHbSme0cgxjsgipDw8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eqXJ7e3lTweXuriu+eRqzzWaxnDe6pUTZC8v+09Vn+/CS8HwadFWpsfooF9H4ELip
         aiTk4Z2yB+AX3I550c3eM9nF/jNEJnHJeaKPiQfSpeMm7pG5AVXNM1NQbBSK+dYzf7
         1fvItOO6eoLyNYE4RhI5kRNq5cWjrTm+nRgbJlnFBLC+Rg2tnIlCVhmq4PSPgA7YW2
         nQb9jHmJfMiA60yi+atc16SFnG6Ke4GMBzda14ZOE/z/0dgg2pJUoOOb6zFGisysGQ
         yMAov+FByuIKxHD21c+1dHIkowePjhCvG76LVMXonfkNBTehfnvBv4Q5ySO43QUuDd
         cohZpOMs15CxQ==
Message-ID: <7764e6b6-9f3a-42de-bc99-36975a4af5a9@collabora.com>
Date:   Thu, 14 Apr 2022 00:17:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v7 1/4] memory: tegra: Add memory controller channels
 support
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, digetx@gmail.com,
        krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220413094012.13589-1-amhetre@nvidia.com>
 <20220413094012.13589-2-amhetre@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220413094012.13589-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 4/13/22 12:40, Ashish Mhetre wrote:
> +static int tegra186_mc_map_regs(struct tegra_mc *mc)
> +{
> +	struct platform_device *pdev = to_platform_device(mc->dev);
> +	int i;
> +
> +	mc->bcast_ch_regs = devm_platform_ioremap_resource_byname(pdev, "broadcast");
> +	if (IS_ERR(mc->bcast_ch_regs)) {
> +		if (PTR_ERR(mc->bcast_ch_regs) == -EINVAL) {
> +			dev_warn(&pdev->dev, "Broadcast channel is missing, please update your device-tree\n");

Set mc->bcast_ch_regs=NULL on error.
