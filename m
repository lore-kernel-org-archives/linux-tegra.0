Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BCDC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 14:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8915F20BED
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 14:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVVIaVs4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIZOs5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 10:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZOs5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 10:48:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95149C0613CE;
        Sat, 26 Sep 2020 07:48:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w3so4818496ljo.5;
        Sat, 26 Sep 2020 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4OSLoIvgTYKgG5y/bcFbwHMYscpnTNwdnsVBcUysUWY=;
        b=mVVIaVs4BacQs0AQgvwyFqke2v36x9e78QGTTUtogy5RKUpiKsJGuXDe/sZEYFq2fw
         sK8dP1/moJH16zAvN+ntaQtyqwSQyqN02mDwNi5qtKf7YEqwAIuQ1REHOwkG3Hib8pAH
         EUXGRhjopioQQBM7yKWE4iIdnSpGKZe2Lfg4BAhLMDPqT6dlCggEhZfj+RudZHBgBKyO
         AmpGHQVJURH9X3NSoJEQKBCHLGczyfvDCw1FEOXzGhZu0cTyuFTYtL4+1e4G+9NjpktI
         ISFGuXdGGpdjLIHgHqeNHArXIsYSHRiHqDHNP7TwfwRnLNvzwIH0cVglL1Dc5EHlNvKp
         R7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4OSLoIvgTYKgG5y/bcFbwHMYscpnTNwdnsVBcUysUWY=;
        b=cHBxEueriRpyKLJno9aXJQwr2wItnqsBRuqJpv5WyB7dqw5+yhBaYU8WYZk0QoDuOZ
         7xPSoV/6uE+YXZM+izCM2XjSB66sLOfU3dbTdyRN5CFUYTya9l+74t1LJWhpDuWHdfR8
         FHdckuFNYkQ3W7HZMTVHeMaaUIzlnX+b0wl1tVS6qPn6cQeAWaQLI7BS5WScWkbigIa5
         XyuvhdIlaaNDniL6FOPaI+ANNdwS/kO9rZdq5g19QWu8sWRvAI1K4cBY8w5+OD+Ao1ri
         Jfj7ky9FgIFqHSVPHgnqIZkmx2T/iSQJbdhiXcGnOyd3euumsD9k2savUHHtPrKqt2O3
         hEGA==
X-Gm-Message-State: AOAM5318VV9rji54/uF2Vilq7JzKSNDlhFn2UT3SUxC68O7kI82LbrRe
        lTv7XIsU3UsZIKOuKDquGyQ=
X-Google-Smtp-Source: ABdhPJwY7G8FOMBEhZy5FRZ4mUUuXJU3s9VtwvIaDkRDccOb3pX1z+sZkkSo10SkAsacRQDjGD13hQ==
X-Received: by 2002:a2e:814c:: with SMTP id t12mr2858344ljg.362.1601131735096;
        Sat, 26 Sep 2020 07:48:55 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 191sm1744043lfa.131.2020.09.26.07.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 07:48:54 -0700 (PDT)
Subject: Re: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-6-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c9ca297-d656-59a5-eefd-00e0c0542c29@gmail.com>
Date:   Sat, 26 Sep 2020 17:48:54 +0300
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
> +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> +{
> +	struct tegra_smmu_group_debug *group_debug = s->private;
> +	const struct tegra_smmu_swgroup *group;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
> +	int pd_index, pt_index;
> +	u64 pte_count = 0;
> +	u32 pde_count = 0;
> +	u32 val, ptb_reg;
> +	u32 *pd;
> +
> +	if (!group_debug || !group_debug->priv || !group_debug->group)
> +		return 0;
> +
> +	group = group_debug->group;
> +	as = group_debug->priv;
> +	smmu = as->smmu;
> +
> +	val = smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
> +	if (!val)
> +		return 0;
> +
> +	pd = page_address(as->pd);
> +	if (!pd)
> +		return 0;
> +
> +	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n", group->name,
> +			as->id, group->reg);
> +
> +	mutex_lock(&smmu->lock);
> +	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
> +	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);

I think the whole traverse needs a locking protection, doesn't it?

> +	mutex_unlock(&smmu->lock);
> +
> +	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
> +	seq_puts(s, "{\n");
> +
> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt;
> +		u32 *addr;
> +
> +		if (!as->count[pd_index] || !pd[pd_index])
> +			continue;
> +
> +		pde_count++;
> +		pte_count += as->count[pd_index];
> +		seq_printf(s, "\t[%d] 0x%x (%d)\n",
> +			   pd_index, pd[pd_index], as->count[pd_index]);
> +		pt = as->pts[pd_index];
> +		addr = page_address(pt);

This needs as->lock protection.

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
> +		}
> +		seq_puts(s, "\t}\n");
> +	}
> +	seq_puts(s, "}\n");
> +	seq_printf(s, "Total PDE count: %d\n", pde_count);
> +	seq_printf(s, "Total PTE count: %lld\n", pte_count);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
> +
>  static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
>  {
> +	const struct tegra_smmu_soc *soc = smmu->soc;
> +	struct tegra_smmu_group_debug *group_debug;
> +	struct device *dev = smmu->dev;
> +	struct dentry *d;
> +	int i;
> +
> +	group_debug = devm_kzalloc(dev, sizeof(*group_debug) * soc->num_swgroups, GFP_KERNEL);

devm_kcalloc()
