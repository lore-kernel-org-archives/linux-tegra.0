Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A983BC48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 12:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 810D560FE6
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 12:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhFKMWz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:22:55 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3968 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKMWz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 08:22:55 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G1fxT5s23z6xfP;
        Fri, 11 Jun 2021 20:17:49 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 20:20:55 +0800
Received: from [10.174.179.215] (10.174.179.215) by
 dggema769-chm.china.huawei.com (10.1.198.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 11 Jun 2021 20:20:54 +0800
Subject: Re: [PATCH -next] firmware: tegra: Fix build error while
 ARCH_TEGRA_234_SOC enabled
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <treding@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210611120636.28252-1-yuehaibing@huawei.com>
From:   YueHaibing <yuehaibing@huawei.com>
Message-ID: <708178d9-e842-bac0-2f48-c6ce81aaee54@huawei.com>
Date:   Fri, 11 Jun 2021 20:20:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210611120636.28252-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Pls ignore this

On 2021/6/11 20:06, YueHaibing wrote:
> drivers/firmware/tegra/bpmp.c:861:51:
>  error: ‘tegra186_soc’ undeclared here (not in a function); did you mean ‘tegra_ivc’?
>   { .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
>                                                    ^~~~~~~~~~~~
>                                                    tegra_ivc
> 
> Add missing ifdef block to fix this.
> 
> Fixes: 0ebdf11699d0 ("firmware: tegra: Enable BPMP support on Tegra234")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 0742a90cb844..5654c5e9862b 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -809,7 +809,8 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
>  };
>  
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> -    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>  static const struct tegra_bpmp_soc tegra186_soc = {
>  	.channels = {
>  		.cpu_tx = {
> 
