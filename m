Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E07C43334
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiGKPkk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiGKPkk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:40:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695073AB35
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:38 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h17so7591337wrx.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYnBr/wNjLJrIFyLmT5Q7G4SeBDinWfBMSvyzlXXgSQ=;
        b=eiokIFpp+GOJ5ReQxNwA54jx2zNuEr8L0Fp07BWZP3GPRzFl+mADVnpKKAvW16RfHU
         unIV/OgTCpRUScck8bBY72mCqa/PRWMXen+NHQuQrhPqpNLEMtkJm5lwhkxEZ/8JaNr2
         EsRjTIYXL8PIQjxdiN3GNDUm6dsWNZOTiGsTUIhBFGpCtmPO6X2LzZrIPtsldpB7g06B
         YkZeCygpo5hdxhjUrnYYoWw2wRtS8xkw5+cT2xX1cwsj8+agYu0NWMQlk+sAqI3azT2w
         c0ahYC0VoAcUtgx8sUskxV8bNPP0ycSxYz1kArDLPGUL9cHQVebJEDO4pWJE85O/4JXH
         Jj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYnBr/wNjLJrIFyLmT5Q7G4SeBDinWfBMSvyzlXXgSQ=;
        b=dohBZGsZotjVmKLIe7n8LmQDlwbIGU7g+EVrnwbCAoJ6cLT29/d818bEieVaM3DJjb
         wiQnwghGu9cxtAX/vnAQdhbrgWuubf6GbTv+BtrWAgb1uyn6Si3OODdhUQ6PeAuA2Rqn
         Mr9H5e/rmXBRNNatsMVGcnisfaCnqYsfPVIg4oJQQj9Vl9dgmMHhmQFP/OgGlDtJkLZg
         SUmRDOPtZIX9olyF2NNLzmSqtQED8dcWNxSaoP9UlVQW55oQDneRySSlY5n+ftbqdYNh
         Vl7HryOMrB1GfMODA5cg5/GWcO5Rd3c5wMaMGvM6wONsdR2nnS3LCCZmFK5813HFuBlq
         AXyg==
X-Gm-Message-State: AJIora/MRjzVXSyX+9r1GuUK0JiYMYsGPzUANhWN+rSbRQNRsuVURDEQ
        t6AvfJ/4DHZy7l+8lfiAgdc7n45T/XM=
X-Google-Smtp-Source: AGRyM1seQ4TfQNSOKZKXsHAuGRJRBTFM1o9VOYZKGqyYG+h23bFo8N8pfa8aquk8RpdK5rTpunaSsw==
X-Received: by 2002:a5d:4a0c:0:b0:21d:78c9:c5d3 with SMTP id m12-20020a5d4a0c000000b0021d78c9c5d3mr17490933wrq.42.1657554036880;
        Mon, 11 Jul 2022 08:40:36 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4148000000b0021d8b1656dfsm6109291wrq.93.2022.07.11.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:40:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Marc Zyngier <maz@kernel.org>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] soc/tegra: pmc: Add support for simple wake events
Date:   Mon, 11 Jul 2022 17:40:30 +0200
Message-Id: <20220711154031.689715-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711154031.689715-1-thierry.reding@gmail.com>
References: <20220711154031.689715-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Simple wake events are neither mapped to GIC interrupts nor have an
associated GPIO line. They are close to GPIO-backed wake events in that
the IRQ hierarchy processing needs to stop at the PMC level, but since
there is no dedicated GPIO line for them, let's turn them into a
separate type.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 0e87fdb90a4a..48286bc59f46 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -296,6 +296,17 @@ struct tegra_wake_event {
 	} gpio;
 };
 
+#define TEGRA_WAKE_SIMPLE(_name, _id)			\
+	{						\
+		.name = _name,				\
+		.id = _id,				\
+		.irq = 0,				\
+		.gpio = {				\
+			.instance = UINT_MAX,		\
+			.pin = UINT_MAX,		\
+		},					\
+	}
+
 #define TEGRA_WAKE_IRQ(_name, _id, _irq)		\
 	{						\
 		.name = _name,				\
@@ -2239,6 +2250,7 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 	for (i = 0; i < soc->num_wake_events; i++) {
 		const struct tegra_wake_event *event = &soc->wake_events[i];
 
+		/* IRQ and simple wake events */
 		if (fwspec->param_count == 2) {
 			struct irq_fwspec spec;
 
@@ -2251,6 +2263,12 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 			if (err < 0)
 				break;
 
+			/* simple hierarchies stop at the PMC level */
+			if (event->irq == 0) {
+				err = irq_domain_disconnect_hierarchy(domain->parent, virq);
+				break;
+			}
+
 			spec.fwnode = &pmc->dev->of_node->fwnode;
 			spec.param_count = 3;
 			spec.param[0] = GIC_SPI;
@@ -2263,6 +2281,7 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 			break;
 		}
 
+		/* GPIO wake events */
 		if (fwspec->param_count == 3) {
 			if (event->gpio.instance != fwspec->param[0] ||
 			    event->gpio.pin != fwspec->param[1])
-- 
2.36.1

