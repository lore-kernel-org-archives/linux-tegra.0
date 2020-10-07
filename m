Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB1BC41604
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B47620870
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602074759;
	bh=UB31QiXnrOw6XsxPw+aI7bh7lJEn3Dr2D4cHBouTdPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rrxIqPs7uE+FPKBAa5mygT/Fr/j5AJE2pThlw9Lqjm82ybqUEBr2r45t1fjppFAXK
	 Z12RPw9UkyVY9wEX5ihbsq25ppmEvgtba+ZxV9JSNgeCDml7XkG+97NjaD+JfPR2b5
	 WDGgF9OBBbgV0ICzN6B7VTFoTdRlH4JR0sfQ072E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgJGMp6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:45:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728260AbgJGMp6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 7 Oct 2020 08:45:58 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5557D207EA;
        Wed,  7 Oct 2020 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602074757;
        bh=UB31QiXnrOw6XsxPw+aI7bh7lJEn3Dr2D4cHBouTdPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ImCaVPJtBWyF++jwDRx7PAoLoe7TeLSePbQ93TplhJtVJrHxFJNXAxJBvZLcWIVjK
         MgJmTkCysb4AZame3tAgbOyZ7aWenRf39Ckg+1SaYuVAHNxJIKB0Nkai1UGXtoX+uF
         ktnQh3nt7J8vtJ3elTo9iemvCUbhd9IYwiLhzuiU=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQ8pP-000M8V-L0; Wed, 07 Oct 2020 13:45:55 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v3 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
Date:   Wed,  7 Oct 2020 13:45:41 +0100
Message-Id: <20201007124544.1397322-2-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007124544.1397322-1-maz@kernel.org>
References: <20201007124544.1397322-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, tglx@linutronix.de, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It appears that some HW is ugly enough that not all the interrupts
connected to a particular interrupt controller end up with the same
hierarchy depth (some of them are terminated early). This leaves
the irqchip hacker with only two choices, both equally bad:

- create discrete domain chains, one for each "hierarchy depth",
  which is very hard to maintain

- create fake hierarchy levels for the shallow paths, leading
  to all kind of problems (what are the safe hwirq values for these
  fake levels?)

Implement the ability to cut short a single interrupt hierarchy
from the first level that doesn't have a corresponding irqchip.
As this is never a valid option (we have the no_irq_chip chip
for the "do nothing" case), the hierarchy can be trimmed from
that level.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/irqdomain.c | 58 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 76cd7ebd1178..375eb2b79fe5 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1136,6 +1136,17 @@ static struct irq_data *irq_domain_insert_irq_data(struct irq_domain *domain,
 	return irq_data;
 }
 
+static void __irq_domain_free_hierarchy(struct irq_data *irq_data)
+{
+	struct irq_data *tmp;
+
+	while (irq_data) {
+		tmp = irq_data;
+		irq_data = irq_data->parent_data;
+		kfree(tmp);
+	}
+}
+
 static void irq_domain_free_irq_data(unsigned int virq, unsigned int nr_irqs)
 {
 	struct irq_data *irq_data, *tmp;
@@ -1147,14 +1158,47 @@ static void irq_domain_free_irq_data(unsigned int virq, unsigned int nr_irqs)
 		irq_data->parent_data = NULL;
 		irq_data->domain = NULL;
 
-		while (tmp) {
-			irq_data = tmp;
-			tmp = tmp->parent_data;
-			kfree(irq_data);
-		}
+		__irq_domain_free_hierarchy(tmp);
 	}
 }
 
+/**
+ * irq_domain_trim_hierarchy - Trim the uninitialized part of a irq hierarchy
+ * @virq:	IRQ number to trim where the hierarchy is to be trimmed
+ *
+ * Drop the partial irq_data hierarchy from the level where the
+ * irq_data->chip is NULL.
+ *
+ * Its only use is to be able to trim levels of hierarchy that do not
+ * have any real meaning for this interrupt, and that the driver leaves
+ * uninitialized in its .alloc() callback.
+ */
+static void irq_domain_trim_hierarchy(unsigned int virq)
+{
+	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
+
+	/* It really needs to be a hierarchy, and not a single entry */
+	if (!irq_data->parent_data)
+		return;
+
+	/* Skip until we find a parent irq_data without a populated chip */
+	while (irq_data->parent_data && irq_data->parent_data->chip)
+		irq_data = irq_data->parent_data;
+
+	/* All levels populated */
+	if (!irq_data->parent_data)
+		return;
+
+	pr_info("IRQ%d: trimming hierarchy from %s\n",
+		virq, irq_data->parent_data->domain->name);
+
+	/* Sever the inner part of the hierarchy...  */
+	tail = irq_data->parent_data;
+	irq_data->parent_data = NULL;
+	__irq_domain_free_hierarchy(tail);
+}
+
+
 static int irq_domain_alloc_irq_data(struct irq_domain *domain,
 				     unsigned int virq, unsigned int nr_irqs)
 {
@@ -1362,8 +1406,10 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 		mutex_unlock(&irq_domain_mutex);
 		goto out_free_irq_data;
 	}
-	for (i = 0; i < nr_irqs; i++)
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_trim_hierarchy(virq + i);
 		irq_domain_insert_irq(virq + i);
+	}
 	mutex_unlock(&irq_domain_mutex);
 
 	return virq;
-- 
2.28.0

