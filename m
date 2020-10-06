Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B810DC4727D
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F019206B5
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601979118;
	bh=TNw0xhLAmuLxi/z2k28H4w4A4c5/Nmqw8znZJEz8AkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KZIHzDik7tUBcc8EZHSGjke3dC1abwRx4r5j+2yISPmvQ6cC3Tfehr1hFJJEOZ0SV
	 s9MiLl8QWgT/jmyV0IEkCxRxVbutenDx9Qt7HvNs1rAkvIekXKcZX2xMPgXuVk6l6X
	 9YnHCKZ4tilLW6VjzoJ2THKALWbqk2iKPErfatic=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgJFKL5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 06:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgJFKLp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Oct 2020 06:11:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 048D02075A;
        Tue,  6 Oct 2020 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601979105;
        bh=TNw0xhLAmuLxi/z2k28H4w4A4c5/Nmqw8znZJEz8AkA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uiya/zobtN6Wf+xzGTomM992afKS3ZRkmrSnRNDTAzNrokadAokdhdHjXi3zn+17F
         8HcQ8ZyRvZ0sAQuQD8n+Dq8kRKXy8CVbs52izre3/2JU5H/5TpHQPZCz1bAUJQLtrg
         y9GgnufaPlGcObWWe8AZU+aUAv/nbO5dKHj8XcAo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPjwd-0002Qo-AE; Tue, 06 Oct 2020 11:11:43 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v2 3/4] soc/tegra: pmc: Allow optional irq parent callbacks
Date:   Tue,  6 Oct 2020 11:11:36 +0100
Message-Id: <20201006101137.1393797-4-maz@kernel.org>
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

Make the PMC driver resistent to variable depth interrupt hierarchy,
which we are about to introduce.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/soc/tegra/pmc.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d332e5d9abac..b39536c68f45 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2184,6 +2184,34 @@ static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 	return 0;
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
 static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 {
 	struct irq_domain *parent = NULL;
@@ -2199,10 +2227,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 		return 0;
 
 	pmc->irq.name = dev_name(pmc->dev);
-	pmc->irq.irq_mask = irq_chip_mask_parent;
-	pmc->irq.irq_unmask = irq_chip_unmask_parent;
-	pmc->irq.irq_eoi = irq_chip_eoi_parent;
-	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
+	pmc->irq.irq_mask = tegra_irq_mask_parent;
+	pmc->irq.irq_unmask = tegra_irq_unmask_parent;
+	pmc->irq.irq_eoi = tegra_irq_eoi_parent;
+	pmc->irq.irq_set_affinity = tegra_irq_set_affinity_parent;
 	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
 	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
-- 
2.28.0

