Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D30C001DD
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 18:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjFUS0s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 14:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjFUS0o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 14:26:44 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E531BC3
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 11:26:25 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f90b8acefdso39703245e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687371984; x=1689963984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NBfwHB1m61Ki4N8NOLCZ9xwyv+VdQ6tisfULtxIs/U=;
        b=LY91tvjlXk3daG/tLcZWF2pMIfSIzSCKA0T+epijk0I7ZiwuP4ZGz08colioCb/vr2
         D2tUvRqXuzXQkx5wxuJhQlOP9zYOfCfoCDY8vQcJPh1Pj4a/hha39stPhklXPBJD72L7
         3KYhPskTABWgRxKJcwUiSbzOn+tesu1H8esz8vNCmcGx8OInSgQrSn65nDRqV2G4zzal
         aHHdpbo1Oz6kJzunPhv54dFV1VTv96G3zxljTC9OWzF7f+CSwhtxDSABeuaA8tBPqP9l
         LHaOeuH/7rBjbTCeg4DubTv8dvMGDEwiayO/+xnJO7bh3XtwgqXRduI8dgqcYYUsfkF/
         BLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371984; x=1689963984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NBfwHB1m61Ki4N8NOLCZ9xwyv+VdQ6tisfULtxIs/U=;
        b=YCehUBCamkXXFtYcnffwLbsp1m0xSARW5IiBq8+/dhq8ZEJRa5zW2k3DQKyA0xfm2+
         YtmWf4svx2G4uatNP4e+HK8RSENZb1Aasv3FZoPLOKvcnHUNhDqzE7mU/c4SlyU3vSlW
         q764mMapEfP4kb+kOxZy96pqVyt7ikDVeErvuD6b39KCLNgs+JfJiehJ7G/talLbAnlm
         U6hpqUqic2HWliGSBUTbo3I4XD2cCWirc5AsDQqVzHbiauQU5k1hUhIDmE+ORDvhedap
         KtE7qZov5HxEzEQaNOgmTxap8F7DCnOf8/LTuw/DyP1tYmGdpOyKRk1yBW1G/B+URCSN
         S1cg==
X-Gm-Message-State: AC+VfDw8uiJFTmzrQSZQF8K4rx1RXRZR7meAOytv9edZIEdsSsNOoX28
        XWRQ4oV9neuEY4gkMn6JFxzSRQ==
X-Google-Smtp-Source: ACHHUZ7DgL1GaivyZZPW9f+esDGdjAfgT1i2Cblkr3bjb5WIOeh+R1SaUPjjGdazaJvf/hqXE9/+aA==
X-Received: by 2002:a1c:4c0b:0:b0:3f9:b950:bb7b with SMTP id z11-20020a1c4c0b000000b003f9b950bb7bmr4150674wmf.41.1687371983980;
        Wed, 21 Jun 2023 11:26:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
        by smtp.gmail.com with ESMTPSA id z13-20020adff74d000000b0030af15d7e41sm5176994wrp.4.2023.06.21.11.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:26:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next 09/12] net: stmmac: replace the ext_snapshot_en field with a flag
Date:   Wed, 21 Jun 2023 20:25:55 +0200
Message-Id: <20230621182558.544417-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621182558.544417-1-brgl@bgdev.pl>
References: <20230621182558.544417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c      | 5 ++++-
 include/linux/stmmac.h                                | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index d8bcf9452197..a3d0da4e9e91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -326,7 +326,7 @@ static int intel_crosststamp(ktime_t *device,
 	/* Both internal crosstimestamping and external triggered event
 	 * timestamping cannot be run concurrently.
 	 */
-	if (priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
 	priv->plat->int_snapshot_en = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 8b50f03056b7..afd81aac6644 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -195,7 +195,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	 */
 	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
 
-	if (!priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return;
 
 	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index b4388ca8d211..3d7825cb30bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -192,7 +192,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	case PTP_CLK_REQ_EXTTS:
-		priv->plat->ext_snapshot_en = on;
+		if (on)
+			priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
+		else
+			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
 		acr_value &= ~PTP_ACR_MASK;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 3365b8071686..0a77e8b05d3a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -212,6 +212,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
+#define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	int int_snapshot_num;
 	int ext_snapshot_num;
 	bool int_snapshot_en;
-	bool ext_snapshot_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

