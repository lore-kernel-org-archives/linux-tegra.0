Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80FCC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80201206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djXuCRSq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388089AbgJBOXS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387688AbgJBOXR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:23:17 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A98FC0613D0;
        Fri,  2 Oct 2020 07:23:17 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y17so2072064lfa.8;
        Fri, 02 Oct 2020 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DA+RN1Dn35B2wGHEnO/Mk8Fh50eib10nF2ruvxG9eT4=;
        b=djXuCRSq/Vk/3n2qWVOABJEEMPuS4agtIctngP16KWi9ksY0NC+0U26anA+gJ2jmw4
         4Fgt+8dxZTQlefXtkf10Cv3ABStOCLx1xef8I7P0BlbdpK1v3IpSSl7Jxm7klN7hTo1E
         c+xK2L7i5wapA2HvG3yTFRugFpD6GnK/vWgQCTiuYklMxDtdLSxrlSFEPjcQPqx1NkGr
         ICDhQnrXbxnjV9r6/ETJlrOmvn18Lo65cWZXIb3bgipaoBT+VOhz6mwsht5UB1T+zjDB
         VxlOOJd8KQ5zRR3+fedbGkIMtnxZwq4bQf/VXQQ3LENyv003+sl/P3WLbiPaIxM0y/IO
         dY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DA+RN1Dn35B2wGHEnO/Mk8Fh50eib10nF2ruvxG9eT4=;
        b=cj25gfi/O8NyaKWB2U632vCAyqBgpjBw+YDA0bZmGWq45C4AmTmLgjU6BOmu9Ydui+
         jpQgFboMA2ovSZN+PdOLSQ/cKqlNQtc0RoHWeDiwAJPES68Q3gOupHVR9+Bx+6arP7A1
         msphpauit8gheJsR4Ct1cFbQmXr9smPRC1BzzmTzPH/JaNaYdAMgsOhfnAlCEQXr2/88
         qwGI09KTW1zOaWIv//YtyoIA+O2XXYUguFb5omwm444KLPyxw8an8LRRa7YtIQqCvhY4
         4NZkpg1dk0aMHS92WkU9rUn46f2rc9wPqKZnr71zOodDyMXBm9rG9eZflJqfv/QRibhq
         z/GA==
X-Gm-Message-State: AOAM533rq5k39eGfyQ7R3eALc5kjPCkmrlLLugceLkurrY6ahApS/v2s
        zl3bGaxQktVT5EdG5qTmbYKHykMoN9c=
X-Google-Smtp-Source: ABdhPJw+ed2QEtC71VcfGQG07bMaRnVlimVs6U5wUut7GCddAP7FJEZrD0qEc4KtOnP7pp3HeaqlPg==
X-Received: by 2002:a05:6512:3453:: with SMTP id j19mr1046979lfr.92.1601648595547;
        Fri, 02 Oct 2020 07:23:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id f19sm316335lfs.85.2020.10.02.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:23:14 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <070a13b2-cde2-ab9e-7ee0-8fb71fb64d5d@gmail.com>
Date:   Fri, 2 Oct 2020 17:23:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
>  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
>  {
> -	struct device_node *np = dev->of_node;
> -	struct tegra_smmu *smmu = NULL;
> -	struct of_phandle_args args;
> -	unsigned int index = 0;
> -	int err;
> -
> -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					  &args) == 0) {
> -		smmu = tegra_smmu_find(args.np);
> -		if (smmu) {
> -			err = tegra_smmu_configure(smmu, dev, &args);
> -			of_node_put(args.np);
> -
> -			if (err < 0)
> -				return ERR_PTR(err);
> -
> -			/*
> -			 * Only a single IOMMU master interface is currently
> -			 * supported by the Linux kernel, so abort after the
> -			 * first match.
> -			 */
> -			dev_iommu_priv_set(dev, smmu);
> -
> -			break;
> -		}
> -
> -		of_node_put(args.np);
> -		index++;
> -	}
> +	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>  
>  	if (!smmu)
>  		return ERR_PTR(-ENODEV);

The !smmu can't ever be true now, isn't it? Then please remove it.
