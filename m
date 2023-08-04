Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C8AC41513
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Aug 2023 01:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjHDBLc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Aug 2023 21:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjHDBLb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Aug 2023 21:11:31 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A602E46;
        Thu,  3 Aug 2023 18:11:30 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RH6zb6ynfzJrGR;
        Fri,  4 Aug 2023 09:08:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 09:11:27 +0800
Message-ID: <5a1a9d40-8374-fb4e-2f2b-e59392838f67@huawei.com>
Date:   Fri, 4 Aug 2023 09:11:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] drm/tegra: hdmi: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230724143626.2582615-1-ruanjinjie@huawei.com>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230724143626.2582615-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ping.

On 2023/7/24 22:36, Ruan Jinjie wrote:
> From: ruanjinjie <ruanjinjie@huawei.com>
> 
> Use the devm_platform_ioremap_resource() helper instead of calling
> platform_get_resource() and devm_ioremap_resource() separately.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 6eac54ae1205..f3a44ca87151 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1769,7 +1769,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
>  static int tegra_hdmi_probe(struct platform_device *pdev)
>  {
>  	struct tegra_hdmi *hdmi;
> -	struct resource *regs;
>  	int err;
>  
>  	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
> @@ -1831,8 +1830,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		return err;
>  
> -	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
> +	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hdmi->regs))
>  		return PTR_ERR(hdmi->regs);
>  
