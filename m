Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45888C41604
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E85DC206B5
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601979117;
	bh=sJ1/VY9aEX3+d4vdPHyox0QqwqED1nbmWmUgzI5Gb/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=MRmtvqHKBpaSIXP5JdxT06Zt0bUvR8t50It/351PdTEW3d+LZCEJbRRivsvuXQVXT
	 jS62S96W58ZCk60j0wu2K5pcvm+Vf1yNeUmVMLU967FpKhNbFJpAMRVGdZb9nEYhhG
	 3zlImFbWh+aywqC4QhwVNadLnGXYliJv7MrZMK0k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgJFKLq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 06:11:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbgJFKLo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Oct 2020 06:11:44 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96B61206B5;
        Tue,  6 Oct 2020 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601979103;
        bh=sJ1/VY9aEX3+d4vdPHyox0QqwqED1nbmWmUgzI5Gb/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hz1S08/Yn1GBalrqs8wYvvEX3GYJ9ntC6cqgGhf4rQQHp1wgPGQ52vdfcBAk+Bklt
         KLjso5JpDprRs3SgZkoFZ4Z0x3p1Jr62cVwZnjUO5eTz2sEhJmGGIN+vPyFGYRk1rB
         i86R9yHbL2FZD/d+g+Hh+hE58CGdYxVbuXCilFoY=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPjwb-0002Qo-Uj; Tue, 06 Oct 2020 11:11:42 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v2 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
Date:   Tue,  6 Oct 2020 11:11:34 +0100
Message-Id: <20201006101137.1393797-2-maz@kernel.org>
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

It appears that some HW is ugly enough that not all the interrupts
connected to a particular interrupt controller end up with the same
hierarchy repth (some of them are terminated early). This leaves
the irqchip hacker with only two choices, both equally bad:

- create discrete domain chains, one for each "hierarchy depth",
  which is very hard to maintain

- create fake hierarchy levels for the shallow paths, leading
  to all kind of problems (what are the safe hwirq values for these
  fake levels?)

Instead, let's offer the possibility to cut short a single interrupt
hierarchy, exactly representing the HW. This can only be done from
the .alloc() callback, before mappings can be established.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h |  3 +++
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++----
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index b37350c4fe37..c6901c1bb981 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -509,6 +509,9 @@ extern void irq_domain_free_irqs_parent(struct irq_domain *domain,
 					unsigned int irq_base,
 					unsigned int nr_irqs);
 
+extern int irq_domain_trim_hierarchy(unsigned int virq,
+				     struct irq_domain *domain);
+
 static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 76cd7ebd1178..d0adaeea70b6 100644
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
@@ -1147,14 +1158,49 @@ static void irq_domain_free_irq_data(unsigned int virq, unsigned int nr_irqs)
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
+ * irq_domain_trim_hierarchy - Trim the irq hierarchy from a particular
+ *			       irq domain
+ * @virq:	IRQ number to trim where the hierarchy is to be trimmed
+ * @domain:	domain from which the hierarchy gets discarded for this
+ *		interrupt
+ *
+ * Drop the partial irq_data hierarchy from @domain (included) onward.
+ *
+ * This is only meant to be called from a .alloc() callback, when no
+ * actual mapping in the respective domains has been established yet.
+ * Its only use is to be able to trim levels of hierarchy that do not
+ * have any real meaning for this interrupt.
+ */
+int irq_domain_trim_hierarchy(unsigned int virq, struct irq_domain *domain)
+{
+	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
+
+	/* It really needs to be a hierarchy, and not a single entry */
+	if (WARN_ON(!irq_data->parent_data))
+		return -EINVAL;
+
+	/* Skip until we find the right domain */
+	while (irq_data->parent_data && irq_data->parent_data->domain != domain)
+		irq_data = irq_data->parent_data;
+
+	/* The domain doesn't exist in the hierarchy, which is pretty bad */
+	if (WARN_ON(!irq_data->parent_data))
+		return -ENOENT;
+
+	/* Sever the inner part of the hierarchy...  */
+	tail = irq_data->parent_data;
+	irq_data->parent_data = NULL;
+	__irq_domain_free_hierarchy(tail);
+
+	return 0;
+}
+
+
 static int irq_domain_alloc_irq_data(struct irq_domain *domain,
 				     unsigned int virq, unsigned int nr_irqs)
 {
-- 
2.28.0

