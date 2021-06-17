Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CBCC2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57C59610A2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhFQMPX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbhFQMPX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 08:15:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A83C061574
        for <linux-tegra@vger.kernel.org>; Thu, 17 Jun 2021 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9uJYou9eTY5vQhRoyPu0Gb6W2btlkcgZi93WLQabwSQ=; b=x7H34sss7fIG9j92S4sJR814ZO
        y7g6fB4JHAsnH3InZg2nNgdd6Q0Ux052rPWrsDIEMKLA8Mnz0mEEqWR2V35FUpx3jFYupeF6fGyjs
        b2ng0Rw2ASLY9wcKvlmFGALTMVuolVo1/joW4hy0QZq3oUqAO6qyNr3tUFKhQIQXwo6RUDQAyZ1JC
        bUOfLNtjw40bAGoiBqVN4rZfL2qR2rzh6dGDIzDpF8NKtUROESSyQkaorvEnPzTX9wpNcG6zV9V5y
        XDP2JJSxwJ+/y8c0es+IHS2P+S9GClTTag9KzHaI89dEjHA8zbkR1zysbVQZ77sa9ve1WZLMILUGb
        fSJ7fVuQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1ltqtV-0007KY-6I; Thu, 17 Jun 2021 15:13:13 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2] soc: tegra: Add Tegra186 ARI driver
Date:   Thu, 17 Jun 2021 15:13:07 +0300
Message-Id: <20210617121307.792386-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a driver to hook into panic notifiers and print machine check
status for debugging. Status information is retrieved via SMC. This
is supported by upstream ARM Trusted Firmware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Changed to use panic notifier instead of serror hook
---
 drivers/soc/tegra/Makefile       |  1 +
 drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 drivers/soc/tegra/ari-tegra186.c

diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index 9c809c1814bd..054e862b63d8 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
 obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
 obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
 obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
+obj-$(CONFIG_ARCH_TEGRA_186_SOC) += ari-tegra186.o
diff --git a/drivers/soc/tegra/ari-tegra186.c b/drivers/soc/tegra/ari-tegra186.c
new file mode 100644
index 000000000000..02577853ec49
--- /dev/null
+++ b/drivers/soc/tegra/ari-tegra186.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/panic_notifier.h>
+
+#define SMC_SIP_INVOKE_MCE			0xc2ffff00
+#define MCE_SMC_READ_MCA			12
+
+#define MCA_ARI_CMD_RD_SERR			1
+
+#define MCA_ARI_RW_SUBIDX_STAT			1
+#define SERR_STATUS_VAL				BIT_ULL(63)
+
+#define MCA_ARI_RW_SUBIDX_ADDR			2
+#define MCA_ARI_RW_SUBIDX_MSC1			3
+#define MCA_ARI_RW_SUBIDX_MSC2			4
+
+static const char * const bank_names[] = {
+	"SYS:DPMU", "ROC:IOB", "ROC:MCB", "ROC:CCE", "ROC:CQX", "ROC:CTU",
+};
+
+static void read_uncore_mca(u8 cmd, u8 idx, u8 subidx, u8 inst, u64 *data)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(SMC_SIP_INVOKE_MCE | MCE_SMC_READ_MCA,
+		      ((u64)inst << 24) | ((u64)idx << 16) |
+			      ((u64)subidx << 8) | ((u64)cmd << 0),
+		      0, 0, 0, 0, 0, 0, &res);
+
+	*data = res.a2;
+}
+
+static int tegra186_ari_panic_handler(struct notifier_block *nb,
+				      unsigned long code, void *unused)
+{
+	u64 status;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bank_names); i++) {
+		read_uncore_mca(MCA_ARI_CMD_RD_SERR, i, MCA_ARI_RW_SUBIDX_STAT,
+				0, &status);
+
+		if (status & SERR_STATUS_VAL) {
+			u64 addr, misc1, misc2;
+
+			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
+					MCA_ARI_RW_SUBIDX_ADDR, 0, &addr);
+			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
+					MCA_ARI_RW_SUBIDX_MSC1, 0, &misc1);
+			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
+					MCA_ARI_RW_SUBIDX_MSC2, 0, &misc2);
+
+			pr_crit("Machine Check Error in %s\n"
+				"  status=0x%llx addr=0x%llx\n"
+				"  msc1=0x%llx msc2=0x%llx\n",
+				bank_names[i], status, addr, misc1, misc2);
+		}
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block tegra186_ari_panic_nb = {
+	.notifier_call = tegra186_ari_panic_handler,
+};
+
+static int __init tegra186_ari_init(void)
+{
+	if (of_machine_is_compatible("nvidia,tegra186"))
+		atomic_notifier_chain_register(&panic_notifier_list, &tegra186_ari_panic_nb);
+
+	return 0;
+}
+early_initcall(tegra186_ari_init);
-- 
2.30.1

