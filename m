Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F0BC4727E
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 363D82068E
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601979114;
	bh=NZTkrPpxbTDeDFNsq+Knp0WH5R+1R2cA6tjzcVY1/Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=a3MOwI7zRqRRCdLx2MQULGjVaNtt4AKKsY2BSnAFHlXjCwbHKNAIyhpWkTZabeVkp
	 ms22xcplCMYcUZTUP6LSisfSg3FRszpHYctnUYFA1xaEeJWC7t38Apl3aTjcHMD4tF
	 LRnHu3d2hBwxCkD3y6RMfLasJrVLbG3X3eRkR/vg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgJFKLt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 06:11:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbgJFKLr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Oct 2020 06:11:47 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B5C720853;
        Tue,  6 Oct 2020 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601979105;
        bh=NZTkrPpxbTDeDFNsq+Knp0WH5R+1R2cA6tjzcVY1/Q4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MYS5d7ZawOe+3ULT5X5XidlD8VszR2DErwp/aKKhu7W7D2oCwp6lobXIieS1SR6du
         y1fzxanDXg3z3Fs0AUYP/EBVUGNskChbN+rfKYtHdKFwLf3TFYq/cx/NDSN+XX4/Tg
         5BStCE33dPGQAylLJOfsZYTWQSHbEfKkhmvInoX4=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPjwe-0002Qo-0u; Tue, 06 Oct 2020 11:11:44 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v2 4/4] soc/tegra: pmc: Don't create fake interrupt hierarchy levels
Date:   Tue,  6 Oct 2020 11:11:37 +0100
Message-Id: <20201006101137.1393797-5-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006101137.1393797-1-maz@kernel.org>
References: <20201006101137.1393797-1-maz@kernel.org>
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

Instead, let's trim the hierarchy yo the level that actually makes
sense for the HW, and not any deeper. This avoids having unnecessary
callbacks, overriding mappings, and otherwise keeps the hierarchy sane.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/soc/tegra/pmc.c | 53 ++++-------------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b39536c68f45..eed500e4b7b6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1989,45 +1989,14 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 			err = irq_domain_set_hwirq_and_chip(domain, virq,
 							    event->id,
 							    &pmc->irq, pmc);
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
+			if (!err)
+				err = irq_domain_trim_hierarchy(virq, domain->parent);
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
-						    &pmc->irq, pmc);
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
+		err = irq_domain_trim_hierarchy(virq, domain);
 
 	return err;
 }
@@ -2043,9 +2012,6 @@ static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
-	if (data->hwirq == ULONG_MAX)
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2080,9 +2046,6 @@ static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 	unsigned int offset, bit;
 	u32 value;
 
-	if (data->hwirq == ULONG_MAX)
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2123,10 +2086,6 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
-	/* nothing to do if there's no associated wake event */
-	if (WARN_ON(data->hwirq == ULONG_MAX))
-		return 0;
-
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -2154,10 +2113,6 @@ static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
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

