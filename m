Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C4C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 865E820774
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601896506;
	bh=QZDBQPDjGlcETLhVySdcVslA4fGitGz/5JwUVeEL0kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=hwh0vF2D1ltdtl3UYJdrVjdcFrck3vVt8HX2XA2qE6ooEjwezcxKa+BVJYWEcF18B
	 elEOMGIhyvnqlv4KsWyTA4BW4omE0JRHaYsbdY9T+Mc3SE/sYu/DLQRENvKYJoFK7C
	 fIE8ghIsYuCP/lkPUh1u1Gc9JLXdJWA2aOJlbLlw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgJELPF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:15:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgJELPB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 07:15:01 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF8412085B;
        Mon,  5 Oct 2020 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601896500;
        bh=QZDBQPDjGlcETLhVySdcVslA4fGitGz/5JwUVeEL0kw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=02OyK/5eMBScjHBMNFvMqBGkA6OMu3pk1ZoyshClgFx4nVejZpHfyPoipDjvR3hMD
         VsWK7kWg0G64G10iyd5a+IbHGf3q3cQOcWRfJ9bmI/03jPEddxn9enqTe+SafYtzQG
         wBj1oYj4dg3Cb/5rcY8ehb3bGEXTP4bV6E+GSFSw=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPOSJ-00HLMq-7o; Mon, 05 Oct 2020 12:14:59 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH 3/3] soc/tegra: pmc: Don't create fake interrupt hierarchy levels
Date:   Mon,  5 Oct 2020 12:14:43 +0100
Message-Id: <20201005111443.1390096-4-maz@kernel.org>
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

The Tegra PMC driver does ungodly things with the interrupt hierarchy,
repeatedly corrupting it by pulling hwirq numbers out of thin air,
overriding existing IRQ mappings and changing the handling flow
of unsuspecting users.

All of this is done in the name of preserving the interrupt hierarchy
even when these levels do not exist in the HW. Together with the use
of proper IRQs for IPIs, this leads to an unbootable system as the
rescheduling IPI gets repeatedly repurposed for random drivers...

Instead, let's allow the hierarchy to be trimmed to the level that
actually makes sense for the HW, and not any deeper. This avoids
having unnecessary callbacks, overriding mappings, and otherwise
keeps the hierarchy sane.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/soc/tegra/pmc.c | 79 +++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 50 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9960f7c18431..4eea3134fb3e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1993,6 +1993,30 @@ static int tegra_pmc_irq_translate(struct irq_domain *domain,
 	return 0;
 }
 
+/* Trim the irq hierarchy from a particular irq domain */
+static void trim_hierarchy(unsigned int virq, struct irq_domain *domain)
+{
+	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
+
+	/* The PMC doesn't generate any interrupt by itself */
+	if (WARN_ON(!irq_data->parent_data))
+		return;
+
+	/* Skip until we find the right domain */
+	while (irq_data->parent_data && irq_data->parent_data->domain != domain)
+		irq_data = irq_data->parent_data;
+
+	/* Sever the inner part of the hierarchy...  */
+	tail = irq_data->parent_data;
+	irq_data->parent_data = NULL;
+
+	/* ... and free it */
+	for (irq_data = tail; irq_data; irq_data = tail) {
+		tail = irq_data->parent_data;
+		kfree(irq_data);
+	};
+}
+
 static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 			       unsigned int num_irqs, void *data)
 {
@@ -2039,46 +2063,15 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 
 			err = irq_domain_set_hwirq_and_chip(domain, virq,
 							    event->id,
-							    &pmc->irq, pmc);
-
-			/*
-			 * GPIOs don't have an equivalent interrupt in the
-			 * parent controller (GIC). However some code, such
-			 * as the one in irq_get_irqchip_state(), require a
-			 * valid IRQ chip to be set. Make sure that's the
-			 * case by passing NULL here, which will install a
-			 * dummy IRQ chip for the interrupt in the parent
-			 * domain.
-			 */
-			if (domain->parent)
-				irq_domain_set_hwirq_and_chip(domain->parent,
-							      virq, 0, NULL,
-							      NULL);
-
+							    &pmc_irqchip, pmc);
+			if (!err)
+				trim_hierarchy(virq, domain->parent);
 			break;
 		}
 	}
 
-	/*
-	 * For interrupts that don't have associated wake events, assign a
-	 * dummy hardware IRQ number. This is used in the ->irq_set_type()
-	 * and ->irq_set_wake() callbacks to return early for these IRQs.
-	 */
-	if (i == soc->num_wake_events) {
-		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
-						    &pmc_irqchip, pmc);
-
-		/*
-		 * Interrupts without a wake event don't have a corresponding
-		 * interrupt in the parent controller (GIC). Pass NULL for the
-		 * chip here, which causes a dummy IRQ chip to be installed
-		 * for the interrupt in the parent domain, to make this
-		 * explicit.
-		 */
-		if (domain->parent)
-			irq_domain_set_hwirq_and_chip(domain->parent, virq, 0,
-						      NULL, NULL);
-	}
+	if (i == soc->num_wake_events)
+		trim_hierarchy(virq, domain);
 
 	return err;
 }
@@ -2094,9 +2087,6 @@ static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
-	if (data->hwirq == ULONG_MAX)
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2131,9 +2121,6 @@ static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 	unsigned int offset, bit;
 	u32 value;
 
-	if (data->hwirq == ULONG_MAX)
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2174,10 +2161,6 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
-	/* nothing to do if there's no associated wake event */
-	if (WARN_ON(data->hwirq == ULONG_MAX))
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2205,10 +2188,6 @@ static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
 
-	/* nothing to do if there's no associated wake event */
-	if (data->hwirq == ULONG_MAX)
-		return 0;
-
 	value = readl(pmc->wake + WAKE_AOWAKE_CNTRL(data->hwirq));
 
 	switch (type) {
-- 
2.28.0

