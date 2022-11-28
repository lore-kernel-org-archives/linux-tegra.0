Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F206CC4321E
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Nov 2022 16:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbiK1Q3i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Nov 2022 11:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiK1Q3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 11:29:36 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11D31FCC1;
        Mon, 28 Nov 2022 08:29:34 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5472C600C80B;
        Mon, 28 Nov 2022 16:29:32 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id VH-4vYs0rA65; Mon, 28 Nov 2022 16:29:29 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4BBF6600883E;
        Mon, 28 Nov 2022 16:29:29 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1669652969;
        bh=rLPSMEa5QR4W2bAIa2PZGeA+BLLtvrDQHBpWE5Lx8n4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EwmjsxDGiaQOZHZPj63B1zT0PDO2Td/MDoTKsjCPWkCggCiEFe9uNcqAxBWq2z2wJ
         ziwo4JY/UIwczppRNKIrwTeVB3PXGOZg/3fnbQaRVBysMlRbFzp1YGDKSvsXt2YIdt
         CLRvm/U1NGUMDpZxFZ2w76AzwNHAE8pzJSO/HaA8=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1E7EC360073;
        Mon, 28 Nov 2022 16:29:29 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 RESEND 2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
Date:   Mon, 28 Nov 2022 16:28:49 +0000
Message-Id: <20221128162851.110611-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
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

