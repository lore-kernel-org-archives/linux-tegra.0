Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0029DC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBC8861151
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbhINBs6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhINBsz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:55 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF91DC061574;
        Mon, 13 Sep 2021 18:47:38 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id v19so5052998pjh.2;
        Mon, 13 Sep 2021 18:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KEHBwA3froCQB75sci1LoZ3044EVfAvduVBAgISzhzk=;
        b=gQzHtdm0kIgxR9hlbp7Pjgzn6MbQiszWuTlHp1mtplAW/fkprOBU+rypu/wfNDbK7R
         gG3vr58E51xUDsidiN1Q2L36oZ4e6d+Kwfy/DWRenC3EWKJrF8ztDCU+1BrvYo1LHAQ6
         OY1jrcZRlJad9c7azQpLZEBlDZa5ZjtKiXnis+BPxuMl7GIPm56nwQiFaXxfBzFlFUNW
         qRMNJmAMWT3KCoG0RcXZ25MDEvhc4N4eghuMAsCaWEQIa0DWpFhWv4p8ab0i8bxZdaJr
         T7lxMfz4xiWi6cyuty4w1xvgBhK2oFkgXPT4oPXNV1vHZtuGYkKXyr7M+jlqLm3mPZ7T
         OY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KEHBwA3froCQB75sci1LoZ3044EVfAvduVBAgISzhzk=;
        b=sfK7sQSsLzGeXfmiPJERGhZFekyi+qNZ1IAfWLbr9hoCq1/OoVaet/+2IpmNQXiMkP
         MTIlXIbv/F7QQ4CqHWcrLQdb71B5aAu7AVrtC+7fwC5Fsuxgae0loqRddjokYm0bbs0I
         pliaja05qBPeBYIVvkId5TNzuRFQO/a8YaOFhAZ8g6UnnvCYIkcxnMxzSUEtBL5LvGPg
         moBMugjL24PA2it3Ds1SW9R5gdmq8k+RYsaweZKD3V3RWB90dJJH0y9OPXBPR8mYzaje
         l/QGsWKYE0zSTqwbNTQOW4bumCSj0mZaQupztIUAbbKqg+MVvfmI4PSsnPkWhAa8WPY8
         jp2Q==
X-Gm-Message-State: AOAM533TsKWqkOufG7R6nM+6NgGSw5h51mLEXY+mJRGywOMPXIqlImhE
        39beYBcLua59MNKPSuBWhKM=
X-Google-Smtp-Source: ABdhPJzskNw45GqqeSUXGgj/1ef7/AQJvkz3kHRa8IqJIcIMjhbaL0IaTXZxhlQF+pqgvenczr1Ibw==
X-Received: by 2002:a17:902:968a:b0:133:e2c5:4908 with SMTP id n10-20020a170902968a00b00133e2c54908mr12842074plp.2.1631584058457;
        Mon, 13 Sep 2021 18:47:38 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:38 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
Date:   Mon, 13 Sep 2021 18:38:58 -0700
Message-Id: <20210914013858.31192-7-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch dumps all active mapping entries from pagetable
to a debugfs directory named "mappings".

Attaching an example:

SWGROUP: hc
as->id: 0
as->attr: R|W|N
as->pd_dma: 0x0000000080c03000
{
        [index: 1023] 0xf0080c3e (count: 2)
        {
                PTE RANGE      | ATTR | PHYS               | IOVA               | SIZE
                [#1022, #1023] | 0x5  | 0x000000010bbf1000 | 0x00000000ffffe000 | 0x2000
        }
}
Total PDE count: 1
Total PTE count: 2

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 145 +++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 68c34a4a0ecc..aac977e181f6 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -46,6 +46,7 @@ struct tegra_smmu {
 	struct list_head list;
 
 	struct dentry *debugfs;
+	struct dentry *debugfs_mappings;
 
 	struct iommu_device iommu;	/* IOMMU Core code handle */
 };
@@ -153,6 +154,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
 
 #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
 				 SMMU_PDE_NONSECURE)
+#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
+				 SMMU_PTE_NONSECURE)
+#define SMMU_PTE_ATTR_SHIFT	29
 
 static unsigned int iova_pd_index(unsigned long iova)
 {
@@ -164,6 +168,12 @@ static unsigned int iova_pt_index(unsigned long iova)
 	return (iova >> SMMU_PTE_SHIFT) & (SMMU_NUM_PTE - 1);
 }
 
+static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
+{
+	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
+	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
+}
+
 static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
 {
 	addr >>= 12;
@@ -496,6 +506,8 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 	mutex_unlock(&smmu->lock);
 }
 
+static const struct file_operations tegra_smmu_debugfs_mappings_fops;
+
 static void tegra_smmu_attach_as(struct tegra_smmu *smmu,
 				 struct tegra_smmu_as *as,
 				 unsigned int swgroup)
@@ -517,6 +529,12 @@ static void tegra_smmu_attach_as(struct tegra_smmu *smmu,
 			dev_warn(smmu->dev,
 				 "overwriting group->as for swgroup: %s\n", swgrp->name);
 		group->as = as;
+
+		if (smmu->debugfs_mappings)
+			debugfs_create_file(group->swgrp->name, 0444,
+					    smmu->debugfs_mappings, group,
+					    &tegra_smmu_debugfs_mappings_fops);
+
 		break;
 	}
 
@@ -541,6 +559,12 @@ static void tegra_smmu_detach_as(struct tegra_smmu *smmu,
 		if (group->swgrp != swgrp)
 			continue;
 		group->as = NULL;
+
+		if (smmu->debugfs_mappings) {
+			d = debugfs_lookup(group->swgrp->name, smmu->debugfs_mappings);
+			debugfs_remove(d);
+		}
+
 		break;
 	}
 
@@ -1124,6 +1148,125 @@ static int tegra_smmu_clients_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
 
+static int tegra_smmu_debugfs_mappings_show(struct seq_file *s, void *data)
+{
+	struct tegra_smmu_group *group = s->private;
+	const struct tegra_smmu_swgroup *swgrp;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
+	unsigned int pd_index;
+	unsigned int pt_index;
+	unsigned long flags;
+	u64 pte_count = 0;
+	u32 pde_count = 0;
+	u32 *pd, val;
+
+	if (!group || !group->as || !group->swgrp)
+		return 0;
+
+	swgrp = group->swgrp;
+	smmu = group->smmu;
+	as = group->as;
+
+	mutex_lock(&smmu->lock);
+
+	val = smmu_readl(smmu, swgrp->reg) & SMMU_ASID_ENABLE;
+	if (!val)
+		goto unlock;
+
+	pd = page_address(as->pd);
+	if (!pd)
+		goto unlock;
+
+	seq_printf(s, "\nSWGROUP: %s\n", swgrp->name);
+	seq_printf(s, "as->id: %d\nas->attr: %c|%c|%s\nas->pd_dma: %pad\n", as->id,
+		   as->attr & SMMU_PD_READABLE ? 'R' : '-',
+		   as->attr & SMMU_PD_WRITABLE ? 'W' : '-',
+		   as->attr & SMMU_PD_NONSECURE ? "NS" : "S",
+		   &as->pd_dma);
+	seq_puts(s, "{\n");
+
+	spin_lock_irqsave(&as->lock, flags);
+
+	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
+		struct page *pt_page;
+		unsigned int i;
+		u32 *addr;
+
+		/* An empty PDE should not have a pte use count */
+		WARN_ON_ONCE(!pd[pd_index] ^ !as->count[pd_index]);
+
+		/* Skip this empty PDE */
+		if (!pd[pd_index])
+			continue;
+
+		pde_count++;
+		pte_count += as->count[pd_index];
+		seq_printf(s, "\t[index: %u] 0x%x (count: %d)\n",
+			   pd_index, pd[pd_index], as->count[pd_index]);
+		pt_page = as->pts[pd_index];
+		addr = page_address(pt_page);
+
+		seq_puts(s, "\t{\n");
+		seq_printf(s, "\t\t%-14s | %-4s | %-10s%s | %-10s%s | %-11s\n",
+			   "PTE RANGE", "ATTR",
+			   "PHYS", sizeof(phys_addr_t) > 4 ? "        " : "",
+			   "IOVA", sizeof(dma_addr_t)  > 4 ? "        " : "",
+			   "SIZE");
+		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index += i) {
+			size_t size = SMMU_SIZE_PT;
+			dma_addr_t iova;
+			phys_addr_t pa;
+
+			i = 1;
+
+			if (!addr[pt_index])
+				continue;
+
+			iova = pd_pt_index_iova(pd_index, pt_index);
+			pa = SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR);
+
+			/* Check contiguous mappings and increase size */
+			while (pt_index + i < SMMU_NUM_PTE) {
+				dma_addr_t next_iova;
+				phys_addr_t next_pa;
+
+				if (!addr[pt_index + i])
+					break;
+
+				next_iova = pd_pt_index_iova(pd_index, pt_index + i);
+				next_pa = SMMU_PFN_PHYS(addr[pt_index + i] & ~SMMU_PTE_ATTR);
+
+				/* Break at the end of a linear mapping */
+				if ((next_iova - iova != SMMU_SIZE_PT * i) ||
+				    (next_pa - pa != SMMU_SIZE_PT * i))
+					break;
+
+				i++;
+			}
+
+			seq_printf(s, "\t\t[#%-4u, #%-4u] | 0x%-2x | %pa | %pad | 0x%-9zx\n",
+				   pt_index, pt_index + i - 1,
+				   addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
+				   &pa, &iova, size * i);
+		}
+		seq_puts(s, "\t}\n");
+	}
+
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	seq_puts(s, "}\n");
+	seq_printf(s, "Total PDE count: %u\n", pde_count);
+	seq_printf(s, "Total PTE count: %llu\n", pte_count);
+
+unlock:
+	mutex_unlock(&smmu->lock);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(tegra_smmu_debugfs_mappings);
+
 static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 {
 	smmu->debugfs = debugfs_create_dir("smmu", NULL);
@@ -1134,6 +1277,8 @@ static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 			    &tegra_smmu_swgroups_fops);
 	debugfs_create_file("clients", S_IRUGO, smmu->debugfs, smmu,
 			    &tegra_smmu_clients_fops);
+
+	smmu->debugfs_mappings = debugfs_create_dir("mappings", smmu->debugfs);
 }
 
 static void tegra_smmu_debugfs_exit(struct tegra_smmu *smmu)
-- 
2.17.1

