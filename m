Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D19CC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 20:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D219921527
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 20:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p21Cw0Gd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgIZUwk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 16:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIZUwk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 16:52:40 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8D7C0613CE;
        Sat, 26 Sep 2020 13:52:40 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s31so883573pga.7;
        Sat, 26 Sep 2020 13:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WDzjfa8QUsgUaih+kIpPeyFOqv/pDOBqTsibbBt+0tA=;
        b=p21Cw0Gd5+8Un3GCJAR7IRm9YOwwgnJJTECiQUrzwluzON3YE0rHS2rkhNAToyq1iy
         LAiYyWrglDQyz1NimEvVAcwlPrhwKCeNkTIrfi9u/8T+0YT5I1dPG5yZgXDp6CKMCEhX
         0Ao9gibUIOzk65fw0c7HBQxMnJer5x/yxdlohKQxN1XJ5x09QjnGDi4KIGGMD+21JBeQ
         ecfno/bfvh55TgkY6kcdwQ+guh3DBnwPt/Ap28BI1ou6Ot2319GPrkP8lqe3rTwLZTBP
         S7RoKJbABPrDYnDtryxA2qmYCuNeihYSkZbcL61TBg/h9ly7Gk0pEg3AtDC4kRS2jwFb
         rWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WDzjfa8QUsgUaih+kIpPeyFOqv/pDOBqTsibbBt+0tA=;
        b=aLjFfyZAHccxQnVPkZdoV2NNaNEW+3OlVADOd31XPA7rzXczMmSIRNyyYr0Y1Xg8L4
         yWT2NpTM23DVxD5PmpO3ydIrlwNBBD9BrxBU+MFP5onuq7+VO/5ieizA9sWtR6os8uff
         FmInGzzOMGjudARU5n4USB/2r6m+Jp85RkQgm9lvlweJyKwZJC5x+PwzGwC0xVqknFEL
         yg2Sb/qpetvdDFuytAIJAC1/UUzOwQ4KvAl3u7IFquuQPNYFSEDcsxiLephHqngeuOeK
         4KHOfqAWWm1YX2s69ijLfveDXKrI9Ie66Ad5vhRoZNFWtw+LIf80F0v/3mPhTBRVmIDp
         NvHQ==
X-Gm-Message-State: AOAM530nBwEwU4yEqtsz5lus/m6C06pqAijnVV10dZFBlN1gRBX/uuBq
        SfLm06EGS7dmfHuUHuKbiLw=
X-Google-Smtp-Source: ABdhPJzQgKnWxoBbJQBJf/eknMgjtWp+DPqXjU/t6wROxeDyeHz3Nq1vOnxzQ3KbUmJjCyFz+Zi+xQ==
X-Received: by 2002:a63:f54f:: with SMTP id e15mr3816188pgk.310.1601153559608;
        Sat, 26 Sep 2020 13:52:39 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id c6sm6314291pfd.83.2020.09.26.13.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 13:52:39 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:47:44 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <20200926204744.GB4947@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-6-nicoleotsuka@gmail.com>
 <0c9ca297-d656-59a5-eefd-00e0c0542c29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c9ca297-d656-59a5-eefd-00e0c0542c29@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the review.

On Sat, Sep 26, 2020 at 05:48:54PM +0300, Dmitry Osipenko wrote:
> 26.09.2020 11:07, Nicolin Chen пишет:
> ...
> > +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> > +{
> > +	struct tegra_smmu_group_debug *group_debug = s->private;
> > +	const struct tegra_smmu_swgroup *group;
> > +	struct tegra_smmu_as *as;
> > +	struct tegra_smmu *smmu;
> > +	int pd_index, pt_index;
> > +	u64 pte_count = 0;
> > +	u32 pde_count = 0;
> > +	u32 val, ptb_reg;
> > +	u32 *pd;
> > +
> > +	if (!group_debug || !group_debug->priv || !group_debug->group)
> > +		return 0;
> > +
> > +	group = group_debug->group;
> > +	as = group_debug->priv;
> > +	smmu = as->smmu;
> > +
> > +	val = smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
> > +	if (!val)
> > +		return 0;
> > +
> > +	pd = page_address(as->pd);
> > +	if (!pd)
> > +		return 0;
> > +
> > +	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n", group->name,
> > +			as->id, group->reg);
> > +
> > +	mutex_lock(&smmu->lock);
> > +	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
> > +	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
> 
> I think the whole traverse needs a locking protection, doesn't it?

Hmm..probably would be nicer. Will move the mutex to the top.

> > +	mutex_unlock(&smmu->lock);
> > +
> > +	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
> > +	seq_puts(s, "{\n");
> > +
> > +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> > +		struct page *pt;
> > +		u32 *addr;
> > +
> > +		if (!as->count[pd_index] || !pd[pd_index])
> > +			continue;
> > +
> > +		pde_count++;
> > +		pte_count += as->count[pd_index];
> > +		seq_printf(s, "\t[%d] 0x%x (%d)\n",
> > +			   pd_index, pd[pd_index], as->count[pd_index]);
> > +		pt = as->pts[pd_index];
> > +		addr = page_address(pt);
> 
> This needs as->lock protection.

Will add that.

> > +		seq_puts(s, "\t{\n");
> > +		seq_printf(s, "\t\t%-5s %-4s %12s %12s\n", "PDE", "ATTR", "PHYS", "IOVA");
> > +		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index++) {
> > +			u64 iova;
> > +
> > +			if (!addr[pt_index])
> > +				continue;
> > +
> > +			iova = ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT;
> > +			iova |= ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> > +
> > +			seq_printf(s, "\t\t#%-4d 0x%-4x 0x%-12llx 0x%-12llx\n",
> > +				   pt_index, addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
> > +				   SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR), iova);
> > +		}
> > +		seq_puts(s, "\t}\n");
> > +	}
> > +	seq_puts(s, "}\n");
> > +	seq_printf(s, "Total PDE count: %d\n", pde_count);
> > +	seq_printf(s, "Total PTE count: %lld\n", pte_count);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
> > +
> >  static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
> >  {
> > +	const struct tegra_smmu_soc *soc = smmu->soc;
> > +	struct tegra_smmu_group_debug *group_debug;
> > +	struct device *dev = smmu->dev;
> > +	struct dentry *d;
> > +	int i;
> > +
> > +	group_debug = devm_kzalloc(dev, sizeof(*group_debug) * soc->num_swgroups, GFP_KERNEL);
> 
> devm_kcalloc()

Will change it.

Thanks
Nic
