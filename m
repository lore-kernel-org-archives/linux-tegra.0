Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0E7C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Aug 2021 13:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5C1F610CF
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Aug 2021 13:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239972AbhHSNcd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Aug 2021 09:32:33 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:41934
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230136AbhHSNcd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Aug 2021 09:32:33 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DA5F23F044;
        Thu, 19 Aug 2021 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629379915;
        bh=QNrlCPUm5xY2lORj8En3iXz+Yo+rOOaxovjyl8qzhhU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=onGuGVPIoYamLAqrNVuuvH/3eeZxDBEYyN/NCvX/e2/oJOmv8l1sTnNRA7+91I8MT
         PF5kQYDC1wAtggkfg31PFUkPecTEfnz0V6HZG+2V9vrbiqsuy7xICtAZfvW65p7Ym+
         12lNK7I8Gqa6kVgRjjbwoCKONKGCOBgb42K0k7wRZaNbMkJA+2Px/PUnLedKTxHNxi
         KSQEp8cY7pK/er4i4aQY9zxqq0ktAqspCX87W0CovthZhY9UHTzUPkjx7X7epACfsm
         wnO76210RGTt1ZHgHQ381huhBQXFruiagzVz/gTaQuVbcJq3pWjw51PTvRDTu8eyBj
         IpJqnhl0t1AOQ==
From:   Colin King <colin.king@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: make the array list static const, makes object smaller
Date:   Thu, 19 Aug 2021 14:31:55 +0100
Message-Id: <20210819133155.10441-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array list on the stack but instead it
static const. Makes the object code smaller by 110 bytes:

Before:
   text    data     bss     dec     hex filename
  37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o

After:
   text    data     bss     dec     hex filename
  37539   22056      64   59659    e90b .../tegra/tegra210-emc-cc-r21021.o

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 0ebfa8eccf0c..550d6b2dda30 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -478,7 +478,7 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 {
 	u32 emc_cfg, emc_cfg_o, emc_cfg_update, del, value;
-	u32 list[] = {
+	static const u32 list[] = {
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2,
-- 
2.32.0

