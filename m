Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF97CC47420
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EF74215A4
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9gN1ml5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIZIMh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 04:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgIZIMe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 04:12:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB27C0613CE;
        Sat, 26 Sep 2020 01:12:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 5so4370715pgf.5;
        Sat, 26 Sep 2020 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hn15A+vsHfLhY3Qf2WKiES6GK2r9N1/EPLi1y9sGZ+o=;
        b=E9gN1ml5289yy634xD3SxLIOwpcQ28fm+5OJf0GUVpnRghCObspVzuiA4bxNrVSUIk
         A4PFZp75Q8+OOTW/RcXdduTpvYmbKz1GlgpApbx1wllz4sBoBna4b02v8bCYpjamsiEz
         rLpcovobdTgXmG4XIWKHOeNEsK56O1BoPBuuE4pmFkAFy8t/7F+5Elt6cbU7dHiZ5IRn
         tpPVKnHoHC4KdSrb725ADTki2VliPGQvom6u4sW4SxERnhc3t6rZ1TyH0+C+IPdfxyVO
         M0C1OQbZBBX2b4iImXCYmkiLGd49zuj5QHZMh4sKDs/q/96Uszso3HvKVD+d2WPjoCNP
         tgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hn15A+vsHfLhY3Qf2WKiES6GK2r9N1/EPLi1y9sGZ+o=;
        b=OPvY4SAEc/BWEmQhmjmQQ/JYYs0wNc4bzzj3xM5WcnHN1flsrXO9WMWsf/QbB5WACf
         8+eYMDXMngbk/dhEGRoFUCW1m8nG2xNW+WoSL0tMBqmFXblpFES/0lT3SBXh2C8NZTEC
         KD9IbziwDWcSu4gT7eyRlq44gqDnyNKbF7fIlqZnHJmUFpQIWwyesa5WROHq9T1nVO4M
         37FUXzwE0vq/mvk/WglfFt7nShryBV9YBDyhKnex4kfLspMjOIQP7jjFoDhKvogTvzw5
         1Ixkwy13ePQSQGLAvVKp5FVI1VMLjkNm2gBMTUi+FJuvIcoMtbynOGVtoY35ECpNqAe5
         71mA==
X-Gm-Message-State: AOAM531hA08byonEjQ1EB2D0fNn/9x7CNaFpJEyhm9PCdoa1OxQljyog
        Df6Np8mdG2295YNg4sB8X3tm6ay4DZE=
X-Google-Smtp-Source: ABdhPJyH63/udFsunnlEF9CWjc0nbDNTUFXv6823ctOsZ47ZbwEKBQn1Iy/guE1oUd/7sUJUDxLhLw==
X-Received: by 2002:a63:1604:: with SMTP id w4mr2057718pgl.148.1601107953334;
        Sat, 26 Sep 2020 01:12:33 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
Date:   Sat, 26 Sep 2020 01:07:19 -0700
Message-Id: <20200926080719.6822-6-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch dumps all active mapping entries from pagetable
to a debugfs directory named "mappings".

Ataching an example:

SWGROUP: hc
ASID: 0
reg: 0x250
PTB_ASID: 0xe00bb880
as->pd_dma: 0xbb880000
{
        [1023] 0xf00bb882 (1)
        {
                PDE   ATTR         PHYS         IOVA
                #1023 0x5    0x159f5d000    0xfffff000
        }
}
Total PDE count: 1
Total PTE count: 1

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 130 +++++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 9dbc5d7183cc..53160d1ca086 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -20,6 +20,11 @@
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
 
+struct tegra_smmu_group_debug {
+	const struct tegra_smmu_swgroup *group;
+	void *priv;
+};
+
 struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
@@ -48,6 +53,8 @@ struct tegra_smmu {
 	struct dentry *debugfs;
 
 	struct iommu_device iommu;	/* IOMMU Core code handle */
+
+	struct tegra_smmu_group_debug *group_debug;
 };
 
 struct tegra_smmu_as {
@@ -155,6 +162,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
 
 #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
 				 SMMU_PDE_NONSECURE)
+#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
+				 SMMU_PTE_NONSECURE)
+#define SMMU_PTE_ATTR_SHIFT	(29)
 
 static unsigned int iova_pd_index(unsigned long iova)
 {
@@ -337,7 +347,7 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
 }
 
 static const struct tegra_smmu_swgroup *
-tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
+tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup, int *index)
 {
 	const struct tegra_smmu_swgroup *group = NULL;
 	unsigned int i;
@@ -345,6 +355,8 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
 	for (i = 0; i < smmu->soc->num_swgroups; i++) {
 		if (smmu->soc->swgroups[i].swgroup == swgroup) {
 			group = &smmu->soc->swgroups[i];
+			if (index)
+				*index = i;
 			break;
 		}
 	}
@@ -353,19 +365,22 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
 }
 
 static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
-			      unsigned int asid)
+			      struct tegra_smmu_as *as)
 {
 	const struct tegra_smmu_swgroup *group;
+	unsigned int asid = as->id;
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value |= SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		if (smmu->group_debug)
+			smmu->group_debug[i].priv = as;
 	} else {
 		pr_warn("%s group from swgroup %u not found\n", __func__,
 				swgroup);
@@ -392,13 +407,15 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value &= ~SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		if (smmu->group_debug)
+			smmu->group_debug[i].priv = NULL;
 	}
 
 	for (i = 0; i < smmu->soc->num_clients; i++) {
@@ -501,7 +518,7 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		if (err)
 			goto err_disable;
 
-		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_enable(smmu, fwspec->ids[index], as);
 	}
 
 	if (index == 0)
@@ -1078,8 +1095,96 @@ static int tegra_smmu_clients_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
 
+static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
+{
+	struct tegra_smmu_group_debug *group_debug = s->private;
+	const struct tegra_smmu_swgroup *group;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
+	int pd_index, pt_index;
+	u64 pte_count = 0;
+	u32 pde_count = 0;
+	u32 val, ptb_reg;
+	u32 *pd;
+
+	if (!group_debug || !group_debug->priv || !group_debug->group)
+		return 0;
+
+	group = group_debug->group;
+	as = group_debug->priv;
+	smmu = as->smmu;
+
+	val = smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
+	if (!val)
+		return 0;
+
+	pd = page_address(as->pd);
+	if (!pd)
+		return 0;
+
+	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n", group->name,
+			as->id, group->reg);
+
+	mutex_lock(&smmu->lock);
+	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
+	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
+	mutex_unlock(&smmu->lock);
+
+	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: 0x%llx\n", ptb_reg, as->pd_dma);
+	seq_puts(s, "{\n");
+
+	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
+		struct page *pt;
+		u32 *addr;
+
+		if (!as->count[pd_index] || !pd[pd_index])
+			continue;
+
+		pde_count++;
+		pte_count += as->count[pd_index];
+		seq_printf(s, "\t[%d] 0x%x (%d)\n",
+			   pd_index, pd[pd_index], as->count[pd_index]);
+		pt = as->pts[pd_index];
+		addr = page_address(pt);
+
+		seq_puts(s, "\t{\n");
+		seq_printf(s, "\t\t%-5s %-4s %12s %12s\n", "PDE", "ATTR", "PHYS", "IOVA");
+		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index++) {
+			u64 iova;
+
+			if (!addr[pt_index])
+				continue;
+
+			iova = ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT;
+			iova |= ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
+
+			seq_printf(s, "\t\t#%-4d 0x%-4x 0x%-12llx 0x%-12llx\n",
+				   pt_index, addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
+				   SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR), iova);
+		}
+		seq_puts(s, "\t}\n");
+	}
+	seq_puts(s, "}\n");
+	seq_printf(s, "Total PDE count: %d\n", pde_count);
+	seq_printf(s, "Total PTE count: %lld\n", pte_count);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
+
 static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 {
+	const struct tegra_smmu_soc *soc = smmu->soc;
+	struct tegra_smmu_group_debug *group_debug;
+	struct device *dev = smmu->dev;
+	struct dentry *d;
+	int i;
+
+	group_debug = devm_kzalloc(dev, sizeof(*group_debug) * soc->num_swgroups, GFP_KERNEL);
+	if (!group_debug)
+		return;
+
 	smmu->debugfs = debugfs_create_dir("smmu", NULL);
 	if (!smmu->debugfs)
 		return;
@@ -1088,6 +1193,21 @@ static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 			    &tegra_smmu_swgroups_fops);
 	debugfs_create_file("clients", S_IRUGO, smmu->debugfs, smmu,
 			    &tegra_smmu_clients_fops);
+	d = debugfs_create_dir("mappings", smmu->debugfs);
+
+	for (i = 0; i < soc->num_swgroups; i++) {
+		const struct tegra_smmu_swgroup *group = &soc->swgroups[i];
+
+		if (!group->name)
+			continue;
+
+		group_debug[i].group = group;
+
+		debugfs_create_file(group->name, 0444, d, &group_debug[i],
+				    &tegra_smmu_mappings_fops);
+	}
+
+	smmu->group_debug = group_debug;
 }
 
 static void tegra_smmu_debugfs_exit(struct tegra_smmu *smmu)
-- 
2.17.1

