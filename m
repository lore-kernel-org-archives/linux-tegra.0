Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE94CC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A55A621531
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nynDsskn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgIZVY6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 17:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZVY6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 17:24:58 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09C3C0613CE;
        Sat, 26 Sep 2020 14:24:57 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y2so6708923lfy.10;
        Sat, 26 Sep 2020 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6wrB9fto+I1fUbDhgF+w5avJWzjFlsE3ApMnh8XsGZM=;
        b=nynDsskn2v5Qu272LIVZKOws9vaysTXN5vZ6JQgTLmnYG1jrb3q4FxGnFq+y5VkL7g
         F+N1QjZGNJnUDcmqPg0DxMXiwjXcf8VG84KBs513JJt4z2Zd394TptCU8mBo9swAiPeo
         TjgKgJiUZZ6pMVRnm9NpPtt2m8UeTBDdWBpjLyxFWr/hVZvhKLm0FyCEGpIvroNUIZ2l
         hA4x8IOpmhQyxaaoYB1uew6JOlinbvr3kQ2L/0wPhi+attppdLmUtK/fZN/jbrm9/WhO
         XKIlXDf1CL1zOkSWm0v32SrO3w1L6YzBke7RR/+u0xI3/7337PnPXG5g76qoNtBu3aGQ
         F01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6wrB9fto+I1fUbDhgF+w5avJWzjFlsE3ApMnh8XsGZM=;
        b=WJzWOF+h133w7UeU2I4j1tSxujUh8gvGkwxtVunBFXxmq7UKEcK+NZj33Gtu6QhHJy
         DrsJ3gX8WbEEKrUm6D0Y+qMLif+8trBj4Iuo4We3uVGbhhrqXXpS45jJpJVtgXGg4DdY
         s+WYSqyVoLEyDyQMno43/jxMsr5kotChjjrBi9vSgV8Z1lBjwWg2pdpJKVPI8LJlRM1y
         CAYgQObbHsCFzBilZsjDnIuC/OAxaahPveqi0lSld4sw1oINrGLRn8cDEnjfk7nBB2eQ
         2AyxLYTQSBVO/IDGiQd618RSo1E0l7+MjwG2G7nIPR8tMF6AC7RmtY4AZ6QF6Admy4l/
         4xhw==
X-Gm-Message-State: AOAM530sy2j1z2o++rPYmnK3CQzndbap1er/54NvMefLvQkxoZptnJ9K
        TMsPkzT9G0LkErbU73bxVw8=
X-Google-Smtp-Source: ABdhPJxT9fBzeCt7l5s5mHsDyMF6JTcv7kgGvdkxvGDECbJLHk4gNOOOtmGLdqsWW1tTLW51rYsfGA==
X-Received: by 2002:ac2:4559:: with SMTP id j25mr1442963lfm.484.1601155496084;
        Sat, 26 Sep 2020 14:24:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b8sm2124820lfq.144.2020.09.26.14.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 14:24:55 -0700 (PDT)
Subject: Re: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-6-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0451e362-30eb-2ba2-33f1-e9ab3972cada@gmail.com>
Date:   Sun, 27 Sep 2020 00:24:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926080719.6822-6-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 11:07, Nicolin Chen пишет:
...
> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt;
> +		u32 *addr;
> +
> +		if (!as->count[pd_index] || !pd[pd_index])
> +			continue;

I guess the idea of this patch is to print out the hardware state, isn't
it? Hence the as->count shouldn't be checked here.

> +		pde_count++;
> +		pte_count += as->count[pd_index];
> +		seq_printf(s, "\t[%d] 0x%x (%d)\n",
> +			   pd_index, pd[pd_index], as->count[pd_index]);
> +		pt = as->pts[pd_index];
> +		addr = page_address(pt);
> +
> +		seq_puts(s, "\t{\n");
> +		seq_printf(s, "\t\t%-5s %-4s %12s %12s\n", "PDE", "ATTR", "PHYS", "IOVA");
> +		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index++) {
> +			u64 iova;
> +
> +			if (!addr[pt_index])
> +				continue;
> +
> +			iova = ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT;
> +			iova |= ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +
> +			seq_printf(s, "\t\t#%-4d 0x%-4x 0x%-12llx 0x%-12llx\n",
> +				   pt_index, addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
> +				   SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR), iova);
>

Would be nice if you could improve the output formatting by printing out
contiguous ranges that have the same ATTRs, otherwise it could be a bit
too large and unpractical output in a case if lots of pages are mapped.
