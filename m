Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F87C2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C89623888
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:41:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkteLc/e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIZVlz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 17:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZVlz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 17:41:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97230C0613CE;
        Sat, 26 Sep 2020 14:41:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so5268984ljp.13;
        Sat, 26 Sep 2020 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2jz0h6b9CR6KbSz4tqSf42E2FSaTwpvxWGYgWqTJfi8=;
        b=CkteLc/eq1lT3wgp+W6Zyle4C1gszMukiKDWMf8hOZKJcEwaZdNd1kuh4cNh24UnQy
         Q1funKEyRmKaRR4r8RCyDDWjpXxSbVR8KUwyvsEYEOe0aRnEhvjaFOviDFwkOfUt9zJQ
         LOsApwB0XhRrz5Rs07xtBIILT4rGYPCPnIPvDLnDdTN2iioz+zwBAr04/n8Hl5I9o8VP
         RDuGEq9wdpsIjkHjeDCg1m3elWpWLXKBvtJjrbi7eQBTruj82fNPAL4tSoHKCdIYMH/F
         kPxBHC9EUZOSUP3T2K6KBl2N3chgtopzcXMUQweWrH2rFvLjWSWAuWHl/Kpke/p8y2T7
         ySLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jz0h6b9CR6KbSz4tqSf42E2FSaTwpvxWGYgWqTJfi8=;
        b=StQGj6Du1nXYyWmE85FZBVz/Co9Ixphy2pRxgb3pliZA0wJgIGdb26GiKF0EN2n5yG
         o2z+gcL8VKV1Y9jJgu9jd9BJr4ijQuGBQT5rUOr/mmD6KTzR+MRloSy9PGoJ4Urn7efq
         budcm04E5Jpk3rtUWQ6rlwyD6iWuBjrVH2fSrW4LAA1UoA7QvTJYxoHLe6fFTC0sevAy
         oylqegBxDKs/2a+LPaSL6wx/a9Hgn6rr8SIeBrWCaPu/lI5r7EmGdWjxAZgfqgKybJz6
         Bq3lv/UTTHBQZSufyMrKs9WAfIWtxmeVmdrwRWkpZXSAi0eSt9wuKrTJfSge24hV2v8L
         GIkg==
X-Gm-Message-State: AOAM533eO3ppEbYgKxkzD150iHYXRbKtGX4epXUAgeIE/AexQIJdB3Mq
        brk1gqUETRTRdn6T+9uMO4Q=
X-Google-Smtp-Source: ABdhPJywcTvmhWZivLoqAZRjpc2nWQT7cLkgtOe/7Uqqf02ZGXOvmEijGl0clawcNWybrv6uqY3KiQ==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr3176834ljm.3.1601156512972;
        Sat, 26 Sep 2020 14:41:52 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b14sm2133664lfp.176.2020.09.26.14.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 14:41:52 -0700 (PDT)
Subject: Re: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-6-nicoleotsuka@gmail.com>
 <0c9ca297-d656-59a5-eefd-00e0c0542c29@gmail.com>
 <20200926204744.GB4947@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fb0eec94-3a36-0e92-edf7-d8de0966a656@gmail.com>
Date:   Sun, 27 Sep 2020 00:41:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926204744.GB4947@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 23:47, Nicolin Chen пишет:
...
>>> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
>>> +		struct page *pt;
>>> +		u32 *addr;
>>> +
>>> +		if (!as->count[pd_index] || !pd[pd_index])
>>> +			continue;
>>> +
>>> +		pde_count++;
>>> +		pte_count += as->count[pd_index];
>>> +		seq_printf(s, "\t[%d] 0x%x (%d)\n",
>>> +			   pd_index, pd[pd_index], as->count[pd_index]);
>>> +		pt = as->pts[pd_index];
>>> +		addr = page_address(pt);
>>
>> This needs as->lock protection.
> 
> Will add that.
> 
>>> +		seq_puts(s, "\t{\n");
>>> +		seq_printf(s, "\t\t%-5s %-4s %12s %12s\n", "PDE", "ATTR", "PHYS", "IOVA");
>>> +		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index++) {
>>> +			u64 iova;
>>> +
>>> +			if (!addr[pt_index])
>>> +				continue;
>>> +
>>> +			iova = ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT;
>>> +			iova |= ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
>>> +
>>> +			seq_printf(s, "\t\t#%-4d 0x%-4x 0x%-12llx 0x%-12llx\n",
>>> +				   pt_index, addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
>>> +				   SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR), iova);

Please also note that the addr[pt_index] needs to be protected as well.
Perhaps you could temporally bump the as->count.
