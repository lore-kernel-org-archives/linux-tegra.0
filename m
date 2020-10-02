Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD697C4727D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F0F1206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrXScAbv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388059AbgJBOWk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOWi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:22:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8ABC0613D0;
        Fri,  2 Oct 2020 07:22:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so1335626lja.7;
        Fri, 02 Oct 2020 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nS6D06SellKTicjxHhmhtpKieUSKN6mejQrgwpSnzL0=;
        b=TrXScAbvDO/Fq03RnNsWYApCVrGPHZ0N2nL/LLtxWLi3gs1TpRCO/9u13T+CI4Kepw
         +fkPfvT/99RJjNmbE3OntoNESfrO0xgqpapvBRR+FmuFhm5byqU2aepTEBdvyNt2HqDQ
         jxtIXclDiY9DE/B3c5GbDElMQAWY0OfhFx9EY3cYZf1VxMKNOq//zm+cF3xFjZ+RwNhw
         60N7Xz3E13r8BW81d8conz6kHc2sepAa/xGGgeDM08A43iPH4tqkHuwMlSd5HMC97WpS
         rCFdNmw0RRh/R8pCa7g8roftsGDjp3nQ6BJZAQNmimeSFieuhEE6y/Fkq68/gNjyJQ0x
         TifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nS6D06SellKTicjxHhmhtpKieUSKN6mejQrgwpSnzL0=;
        b=tlhnih/FqPvYccdOuF3c3/9neL+7UNrpMSYgtdz7LIHnO5VCir+2o6/n4xIyAGbJfX
         dzdH+2oUsp7AgaxCEY2YhYdf4MFD1ZGehn/VMLTgWe02UMjHiBY20RvGj4t8gfSicoBs
         DsMZdjuAMoIfRBMJ0Jn3dljJM8gn73ZD4gP7glsue8dMweb0NNFLpppgFZBfViRyRr5Z
         UlEDtDgybnnAEqPTpoKVklOsWpeIbhj/bi+4wMNeeSTPM+imNu5kPkGMjyp1VCVJ3gCH
         71X+sY+0imSRd1HX+YaTvwSFuJLuFPGkZOImY64qV3sOvwrcyn4Ez4MaDaukcFWKRcTI
         S9uw==
X-Gm-Message-State: AOAM533H7dGIhqD4JufXmWcVR/km8xb3o/g7M6qedtd2PoU8VliKx5Zx
        G0AUpgXi4+a47TcYiTlYNPUTp2VOsNY=
X-Google-Smtp-Source: ABdhPJyhBMjEGBAq5xouAYGzblqYPkzK2WLhb1IsDLQtl3LpHK9oxX6DW1N5YJ3yUIBYXdOaQyh4hQ==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr770307lji.204.1601648556727;
        Fri, 02 Oct 2020 07:22:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id 10sm316118lfq.64.2020.10.02.07.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:22:36 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
Date:   Fri, 2 Oct 2020 17:22:35 +0300
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
> -static void tegra_smmu_release_device(struct device *dev)
> -{
> -	dev_iommu_priv_set(dev, NULL);
> -}
> +static void tegra_smmu_release_device(struct device *dev) {}

Please keep the braces as-is.
