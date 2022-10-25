Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0F7C38A2D
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Oct 2022 15:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbiJYPiw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Oct 2022 11:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiJYPiv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 11:38:51 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FA8189538;
        Tue, 25 Oct 2022 08:38:48 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 434016008764;
        Tue, 25 Oct 2022 16:38:47 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id h9NZeVGhtjag; Tue, 25 Oct 2022 16:38:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9CA006008790;
        Tue, 25 Oct 2022 16:38:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1666712323;
        bh=rLPSMEa5QR4W2bAIa2PZGeA+BLLtvrDQHBpWE5Lx8n4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WzZtI1aiSjFPDTDQA3ObLNWAX5xJb0l8isR7FxOHTPVgWRbn6rIHszEwQeCyJ358G
         DQny2Tk84sfFHUQIMmHo2l7vVAeOo18kd9pEHsKovoqBOYAgcZ9193tEwf5Vz7n25U
         u9ukXcUHKLVfQ1dvH1MHOC5IquZ0kqyfhpn5bjhI=
Received: from localhost.localdomain (unknown [89.207.171.77])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A8454360085;
        Tue, 25 Oct 2022 16:38:40 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
Date:   Tue, 25 Oct 2022 16:37:47 +0100
Message-Id: <20221025153746.101278-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In cases where the DSI module is left on by the bootloader
some panels may fail to initialize if the enable register is not cleared
before the panel's initialization sequence is sent, so clear it if that
is the case. 

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - detect if the DSI module is on based on the register value,
   instead of a DT property.
 - remove Display Controller clear, since it is redundant.

 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index de1333dc0d86..5954676a7ab1 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -912,6 +912,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
+
+	if (value & DSI_POWER_CONTROL_ENABLE)
+		tegra_dsi_disable(dsi);
+
 	err = tegra_dsi_prepare(dsi);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to prepare: %d\n", err);
-- 
2.38.1

