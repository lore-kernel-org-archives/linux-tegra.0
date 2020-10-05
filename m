Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7569C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9423C2080C
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601896500;
	bh=y6sw+9UqcCw1K4zL+X8JeaJ21hZxWlVi1L/6R4CeGng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Yqjh22v3rKEaUjDxWOidSJauLTCJUr3eOHRQa1LFTJjhNq/NGvXRfKLcJNnYXIA/5
	 x6kLgzne/wBbCkOmbpKhN3tfWIjvg/TWVgNxOotqVXM9N3W30qNKumWVtI6/OnWagO
	 vXXIjWkhOXzB+lATDc+am8IyMh794W7VfSNRrzUI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgJELPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:15:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgJELPA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 07:15:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B9C420774;
        Mon,  5 Oct 2020 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601896499;
        bh=y6sw+9UqcCw1K4zL+X8JeaJ21hZxWlVi1L/6R4CeGng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qHF4xyv1pf7fp18aIgqyzNRebvaU72Fv9FVNttGRHHGxv5Lnzqr3GOWx8+Jy+s6pN
         z9hvym2/+6RiuwCZVPOWpOZu5Kna6ZTkRn1v2nah5tHmmDQdtssZ93KJL4rRx+sBcR
         Y+dYrne0bJ6tQvAJUIL40QQOGdlM+iKRHriK4l4w=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPOSH-00HLMq-Sj; Mon, 05 Oct 2020 12:14:58 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH 1/3] gpio: tegra186: Allow optional irq parent callbacks
Date:   Mon,  5 Oct 2020 12:14:41 +0100
Message-Id: <20201005111443.1390096-2-maz@kernel.org>
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

Make the tegra186 GPIO driver resistent to variable depth
interrupt hierarchy, which we are about to introduce.

No functionnal change yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-tegra186.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 178e9128ded0..9500074b1f1b 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -430,7 +430,18 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int type)
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
 
-	return irq_chip_set_type_parent(data, type);
+	if (data->parent_data)
+		return irq_chip_set_type_parent(data, type);
+
+	return 0;
+}
+
+static int tegra186_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	if (data->parent_data)
+		return irq_chip_set_wake_parent(data, on);
+
+	return 0;
 }
 
 static void tegra186_gpio_irq(struct irq_desc *desc)
@@ -678,7 +689,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->intc.irq_mask = tegra186_irq_mask;
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
 	gpio->intc.irq_set_type = tegra186_irq_set_type;
-	gpio->intc.irq_set_wake = irq_chip_set_wake_parent;
+	gpio->intc.irq_set_wake = tegra186_irq_set_wake;
 
 	irq = &gpio->gpio.irq;
 	irq->chip = &gpio->intc;
-- 
2.28.0

