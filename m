Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF08BC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 14:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A132820BED
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 14:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da2dQsvt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZOsW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZOsU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 10:48:20 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C6BC0613CE;
        Sat, 26 Sep 2020 07:48:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so4799397ljk.8;
        Sat, 26 Sep 2020 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GmeWL4e97JOYksVRJPh3LZ20PhqAWfrd18WuURhNUqs=;
        b=Da2dQsvtt390rs2pLfGxg5H7LfvRU97nWrWHhLdOnlueFbA5n9xzbVj8G0EQEi9A2B
         T4ElpmoXvzicZoTHgevuKH3Vn16UztVYNlv0WLDASryYQFE6tRVOvaQQNms5YL9L78h+
         kxAUQMzroE7n+meun8leaDB24i+tI2Zngfqe8YoywblLHNI8JWUB99eGUFsaD3bnfmi3
         PIEwvwfL9oteyke579GB9C4SPjMl12LTNBtJJISDaWCsdtaYMKzgx1+p7ZSnLjRDQa8L
         HC5xhyVTO1AO0PLg0rFXdLkGNSTd0QTXS+9mm6/J7/wo5r47+nh+2ICLhf7oV3hadLZz
         lL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GmeWL4e97JOYksVRJPh3LZ20PhqAWfrd18WuURhNUqs=;
        b=TO1ufPHyB0OfE/OkAwYCbWAgM3+FOGRvPQ9F0Qpy7M8Lgcn/1156wgR3o3fN+YKhvm
         r0nkzpP7zys1/kPCBqXJEeQX5WpCMO2hhT3CvhHnQqqTg4ESKvXVDYkWb/bL+LSV7N3R
         b2yG7W9tdH84nLfvl1ta7LOa9fl9WRM3f5t+If2raEkzAdmztqaYfvxN1bMlmoMjznkb
         SCXdyq82pJzz8mRPfhhdqu7BhGT87RptT4AEn4SppiXj/F5UYLVmAi+wwFZZ1YeUYYBg
         INuaB74OINhlvrBucaayZcXvD9u3u2peMxJMKOA0za9JQat1dtsRVeOp+plAYKfkOhVs
         PJGQ==
X-Gm-Message-State: AOAM533S9oAi5qc3BsGcrj5OnxYAxTswMCQXP1YqlJBaoMkLfjDcOpP4
        7pstra+aCzUC7Q/fQJ5mF9w=
X-Google-Smtp-Source: ABdhPJysZ6qsJ8tmdwEUN8O9JQINNopqSw7epUEiCL+BXo31HbEM/8IxY+vVbIbm9TmEqyjilNGz9g==
X-Received: by 2002:a05:651c:1397:: with SMTP id k23mr2998474ljb.263.1601131698679;
        Sat, 26 Sep 2020 07:48:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n4sm1757440lfe.246.2020.09.26.07.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 07:48:18 -0700 (PDT)
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ccb95c4e-64ba-bab9-1f75-0c6d287540b0@gmail.com>
Date:   Sat, 26 Sep 2020 17:48:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926080719.6822-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 11:07, Nicolin Chen пишет:
...
> +	/* NULL smmu pointer means that SMMU driver is not probed yet */
> +	if (unlikely(!smmu))
> +		return ERR_PTR(-EPROBE_DEFER);

Hello, Nicolin!

Please don't pollute code with likely/unlikely. This is not a
performance-critical code.

...
> -static struct platform_driver tegra_mc_driver = {
> +struct platform_driver tegra_mc_driver = {
>  	.driver = {
>  		.name = "tegra-mc",
>  		.of_match_table = tegra_mc_of_match,
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..49a4cf64c4b9 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -184,4 +184,6 @@ struct tegra_mc {
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
>  
> +extern struct platform_driver tegra_mc_driver;

No global variables, please. See for the example:

https://elixir.bootlin.com/linux/v5.9-rc6/source/drivers/devfreq/tegra20-devfreq.c#L100

The tegra_get_memory_controller() is now needed by multiple Tegra
drivers, I think it should be good to have it added into the MC driver
and then make it globally available for all drivers by making use of
of_find_matching_node_and_match().

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index e1db209fd2ea..ed1bd6d00aaf 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -43,6 +43,29 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);

+struct tegra_mc *tegra_get_memory_controller(void)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+
+	np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return mc;
+}
+EXPORT_SYMBOL_GPL(tegra_get_memory_controller);
