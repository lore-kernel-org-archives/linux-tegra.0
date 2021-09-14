Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB69C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 13:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23430610E6
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 13:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbhINNag (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Sep 2021 09:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhINNag (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Sep 2021 09:30:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33D8C061574;
        Tue, 14 Sep 2021 06:29:18 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a4so28833611lfg.8;
        Tue, 14 Sep 2021 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j9vUGQm8IoZhCKNFmiI4S6Is2zu+5YV9tr4eWICr7gE=;
        b=hyvjBRZc51tx6C8lodT1wPEfBnGbEjZlr5JRMIeXOpiDpw7zvSF8MSAbHxiG/A3kRK
         6PNlGKJAieG36HSvsfWH/KLxxRIZ7ueoKi/bnOf/2JAakhjhrC1Oe35yRpcRdmd3f/4W
         nO7pR0eimcsgqk5qFx8dJ1xWuGupZwysHTNDU8IveON6+uDYogDhd4Avga/7NZjSoRMp
         O/iPL8IfEHual5wep8JyYQdkBRoE1YulGTylHGdGz/Lf57EM9z6exBxnsfjC12vF99TF
         mFc+bK+gaCrdOVb4L3pvTLfzLOuAu6yoE3fKogKPb/Hv/f7XMENqudQz8GVOETsovPdi
         eE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j9vUGQm8IoZhCKNFmiI4S6Is2zu+5YV9tr4eWICr7gE=;
        b=fLHdkylgIOoIKA20exxSsObLsXbKEJaM9dM0dcVgnEZcpGZzKwQoEiHq0CgUSgKk6h
         4JYYtNiRcuqWMG5CLoTFbmLuHuO7bPx6PN3PmfISYTlOn3G9uy4tky0Z6APGNtsETNHG
         R570Wr87wJLgrkm3/97Tj3JsF7GqUekSFBxr032xGXQOiQO6VesCwtsSKcx0zhCjbDsy
         pOiNHraK9pwOV8MEgulMHNVhxtYDWjFYMkufuhwb/X7skKkS+aYeKGhwvQMiJXrIhyCS
         vEIG2hqiDPdagAj5iyoq0f/tsB4+thbHPsXM1mSZQL5wSuG+yQJ/dUMnLHHOyppLDgVb
         p3WA==
X-Gm-Message-State: AOAM533R7YydHtV0vtci9Bntxcd7EnXGFKiSoTM8lWIoHe8aU8z6+4Kv
        TBu/I0j7yWeluip1Wu7NgZAXup4Tt6E=
X-Google-Smtp-Source: ABdhPJzSWnhui0lhyAItkS+T+u+WXznhKHZuZaq8qHAIE5Hm2oyM+1zdCRTMGX7y9PV73WwHIM92kA==
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr13120562lfo.689.1631626156958;
        Tue, 14 Sep 2021 06:29:16 -0700 (PDT)
Received: from [192.168.2.145] (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.googlemail.com with ESMTPSA id b12sm1122236lfb.42.2021.09.14.06.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 06:29:16 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
Date:   Tue, 14 Sep 2021 16:29:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914013858.31192-7-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.09.2021 04:38, Nicolin Chen пишет:
> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> +{
> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +}

We know that IOVA is fixed to u32 for this controller. Can we avoid all
these dma_addr_t castings? It should make code cleaner a tad, IMO.
