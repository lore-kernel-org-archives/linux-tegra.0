Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BF1C4363D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A8F120795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601896505;
	bh=gIf2fr8wsadXbuwaZvbtzY4oeFXCBgDIGX0jJUBfwOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Aggf1EbpDcHoqbknKuG+xd8+im1nYWU6+4RWbGoAFuXvGMCOkK2sCaqoObG+ao5Au
	 SZso9+i9nNefHQ6AcyIIaIUHkNI3MdQqK2LLQHFn/RkoppchuqkSPzcY2MK9UaIcdI
	 NSduxH5Irjm1hNRocgH9rgPgo7pXMSOH/L7NvjoY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgJELPB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:15:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgJELPB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 07:15:01 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2050A20795;
        Mon,  5 Oct 2020 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601896500;
        bh=gIf2fr8wsadXbuwaZvbtzY4oeFXCBgDIGX0jJUBfwOc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lxi1FFqfjNYJw9XRjLb5XqNhO/re3I636YxkAg7Xrd1O+6oi4LKWs70GCp8/e6935
         /9fZg8Z/rdHZOe6pOuAqPmGC06kHRJvNxqasVNK5zjUVKl1eZLZVhLxDquHZF0E5Vj
         /drdYdBgAnNmzACLSTuDKVmJpzvDpfvLUClhUtfw=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPOSI-00HLMq-Hw; Mon, 05 Oct 2020 12:14:58 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH 2/3] soc/tegra: pmc: Allow optional irq parent callbacks
Date:   Mon,  5 Oct 2020 12:14:42 +0100
Message-Id: <20201005111443.1390096-3-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005111443.1390096-1-maz@kernel.org>
References: <20201005111443.1390096-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, tglx@linutronix.de, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make the PMC driver resistent to variable depth interrupt hierarchy,
which we are about to introduce. The irq_chip structure is now
allocated statically, providing the indirection for the couple of
callbacks that are SoC-specific.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/soc/tegra/pmc.c | 65 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d332e5d9abac..9960f7c18431 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -439,7 +439,6 @@ struct tegra_pmc {
 	struct pinctrl_dev *pctl_dev;
 
 	struct irq_domain *domain;
-	struct irq_chip irq;
 
 	struct notifier_block clk_nb;
 };
@@ -1928,6 +1927,58 @@ static void tegra_pmc_reset_sysfs_init(struct tegra_pmc *pmc)
 	}
 }
 
+static void tegra_irq_mask_parent(struct irq_data *data)
+{
+	if (data->parent_data)
+		irq_chip_mask_parent(data);
+}
+
+static void tegra_irq_unmask_parent(struct irq_data *data)
+{
+	if (data->parent_data)
+		irq_chip_unmask_parent(data);
+}
+
+static void tegra_irq_eoi_parent(struct irq_data *data)
+{
+	if (data->parent_data)
+		irq_chip_eoi_parent(data);
+}
+
+static int tegra_irq_set_affinity_parent(struct irq_data *data,
+					 const struct cpumask *dest,
+					 bool force)
+{
+	if (data->parent_data)
+		return irq_chip_set_affinity_parent(data, dest, force);
+
+	return -EINVAL;
+}
+
+static int tegra_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+
+	return pmc->soc->irq_set_type(data, type);
+}
+
+static int tegra_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+
+	return pmc->soc->irq_set_wake(data, on);
+}
+
+static struct irq_chip pmc_irqchip = {
+	.name			= "tegra-pmc",
+	.irq_mask		= tegra_irq_mask_parent,
+	.irq_unmask		= tegra_irq_unmask_parent,
+	.irq_eoi		= tegra_irq_eoi_parent,
+	.irq_set_affinity	= tegra_irq_set_affinity_parent,
+	.irq_set_type		= tegra_irq_set_type,
+	.irq_set_wake		= tegra_irq_set_wake,
+};
+
 static int tegra_pmc_irq_translate(struct irq_domain *domain,
 				   struct irq_fwspec *fwspec,
 				   unsigned long *hwirq,
@@ -1965,7 +2016,7 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 
 			err = irq_domain_set_hwirq_and_chip(domain, virq,
 							    event->id,
-							    &pmc->irq, pmc);
+							    &pmc_irqchip, pmc);
 			if (err < 0)
 				break;
 
@@ -2015,7 +2066,7 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 	 */
 	if (i == soc->num_wake_events) {
 		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
-						    &pmc->irq, pmc);
+						    &pmc_irqchip, pmc);
 
 		/*
 		 * Interrupts without a wake event don't have a corresponding
@@ -2198,14 +2249,6 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	if (!parent)
 		return 0;
 
-	pmc->irq.name = dev_name(pmc->dev);
-	pmc->irq.irq_mask = irq_chip_mask_parent;
-	pmc->irq.irq_unmask = irq_chip_unmask_parent;
-	pmc->irq.irq_eoi = irq_chip_eoi_parent;
-	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
-	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
-	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
-
 	pmc->domain = irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
 					       &tegra_pmc_irq_domain_ops, pmc);
 	if (!pmc->domain) {
-- 
2.28.0

