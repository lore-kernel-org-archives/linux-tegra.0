Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DA2C41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9531C206C1
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vPOk1Eug"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgJCOGq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCOGq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:06:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A31C0613D0;
        Sat,  3 Oct 2020 07:06:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d24so1453132lfa.8;
        Sat, 03 Oct 2020 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bx6Er5n5mhxYHHvURjb1uunhMDfSLBADFm1BcHlIQrU=;
        b=vPOk1EugRygidJMpN+/VQXyMhf/gszfPk2s+HuTMM/d0NvZr4eCvRaBuoUXqxf1AOG
         HAmoBdUOpTvTA1jk4DbOUJau1pIdx3pVwVuMJ7vAAgj+/P+R9aMi9lx5M58vCOHR6+Xk
         IvayIB8OANtfFY2sIPdem5LnyJNAQBjCJZuKmzt2lrWnUSl1l/GG4MDwKFws1Qg+DezI
         dDWVl98np/7r3xkKfIdVuTmxwbEB0/v0342grgnOyf+BNqQWUk+QCdFnlUH/WzfDCklS
         S97PqpcJ7+GWZiTnIjURp/iyM2aAjIGNQxmzjQOFuVIr4QEebB9FKxsXnMvS1UekcDsz
         xUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bx6Er5n5mhxYHHvURjb1uunhMDfSLBADFm1BcHlIQrU=;
        b=ALdMtAlsp4fDrsFgE9mjr9BSK+VXaaByd9aqsNNY91c+4jboyyTp7VErwcVvqHzwQl
         TET+cuMmwdO93RTNLY2RzZylp3ByFbA+IX4IKXpptewjCfVX4XSb87fem8QtxNMsOgiB
         sPy9bDNUeX5Mrn19ZaZjcgnamK8Vk/LEMty4Co08/TpuZ3/v3/1wnl2HofrdNg4PKmt6
         5krv/4dqokkx6bXS/Rafd+1S1LcITZmHCxPitMBVKt1xxjcUI9TPQIWN7UCHr+RdYPQJ
         9c2j/Gu2+5ZRoGzcPARNsX87jUTjakal0RgUc39oX57039ZqzCpGWp1Kh91ZgmYZYP5v
         E1Dw==
X-Gm-Message-State: AOAM531I+uKiOGbYGp8Wd7HthBh/ApOMpkN99CzvNuFz3m4LSIaZ1aGo
        b8284USEqrMjh/3eEd2Dz5Ij0/EFQNw=
X-Google-Smtp-Source: ABdhPJzRjghQrvv/1QRYHrh7udF6gDxgv2wE+pcaClW4SpwZsyNRY8gl9G7Xb/voZ/Cb/jHHj5Yxhw==
X-Received: by 2002:a19:2214:: with SMTP id i20mr2839812lfi.252.1601734003842;
        Sat, 03 Oct 2020 07:06:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id q17sm1518034lfd.37.2020.10.03.07.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:06:43 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
Date:   Sat, 3 Oct 2020 17:06:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2020 09:59, Nicolin Chen пишет:
>  static int tegra_smmu_of_xlate(struct device *dev,
>  			       struct of_phandle_args *args)
>  {
> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
>  	u32 id = args->args[0];
>  
> +	put_device(&iommu_pdev->dev);
> +
> +	if (!mc || !mc->smmu)
> +		return -EPROBE_DEFER;

I'm not very excited by seeing code in the patches that can't be
explained by the patch authors and will appreciate if you could provide
a detailed explanation about why this NULL checking is needed because I
think it is unneeded, especially given that other IOMMU drivers don't
have such check.

I'm asking this question second time now, please don't ignore review
comments next time.
