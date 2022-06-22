Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7C8CCA47D
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 11:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357460AbiFVLhz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 07:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349856AbiFVLhv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 07:37:51 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2954C3C73B;
        Wed, 22 Jun 2022 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=hAGGcw/SOg7X5CrJwFzinyDfIvPa2up8kxxxfJmr9MY=; b=olo7AVQ/z2D+28RGJI7Bl3jOeC
        JxCIejLKe7MSwyew1QFGqWk9JyWepl8TMdGdW8Bp4tmAe4j00+pP1gTPiPMSVNLGT1HS8fnxSpJNG
        /fVpfwPQMgH9LUOZPt6d133ykmg92Ee2tyRVW/HwiqSh9kqqlE6jnL2Dh99QiLMveW0yFh0N3hA7e
        cQ1dSH3U+nqN3xmLzTHOwZszayGroZdwkNhbVU+uJMjCEHQek4gTnOdBffrFZ5zNnsUMCWv9ftHS9
        riT3MAa1MKrzxzgbIPlWReRk1HD60RFb+liPUejqgfXaWnKljy9i8r8p6+cziBEnpff8Vbr469CL3
        PlL0pU/A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o3yg3-0001Xl-Ul; Wed, 22 Jun 2022 14:37:42 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 08/13] gpu: host1x: Program interrupt destinations on Tegra234
Date:   Wed, 22 Jun 2022 14:37:28 +0300
Message-Id: <20220622113733.1710471-9-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622113733.1710471-1-cyndis@kapsi.fi>
References: <20220622113733.1710471-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra234, each Host1x VM has 8 interrupt lines. Each syncpoint
can be configured with which interrupt line should be used for
threshold interrupt, allowing for load balancing.

For now, to keep backwards compatibility, just set all syncpoints
to the first interrupt.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/intr_hw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index f56375ee6e71..9acccdb139e6 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -76,6 +76,17 @@ static void intr_hw_init(struct host1x *host, u32 cpm)
 	/* update host clocks per usec */
 	host1x_sync_writel(host, cpm, HOST1X_SYNC_USEC_CLK);
 #endif
+#if HOST1X_HW >= 8
+	u32 id;
+
+	/*
+	 * Program threshold interrupt destination among 8 lines per VM,
+	 * per syncpoint. For now, just direct all to the first interrupt
+	 * line.
+	 */
+	for (id = 0; id < host->info->nb_pts; id++)
+		host1x_sync_writel(host, 0, HOST1X_SYNC_SYNCPT_INTR_DEST(id));
+#endif
 }
 
 static int
-- 
2.36.1

