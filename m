Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2332FEB64D7
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 18:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjFUS0S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 14:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjFUS0Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 14:26:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361F31738
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 11:26:13 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-312826ffedbso2004674f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687371971; x=1689963971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YRCkfxlgVhLag2qZdreYDwQ2ugrCPfdILJ7ghjkiVg=;
        b=u8ZAQRyJzdnE2piUbuVRCJwKkURKjchpnXy+eFI1urxv6Cd5d3XsXcG66xfVnGnxon
         XDt32nCwF3aUUMgkmVUyFjUEM9VwRuNlkR3pcnz9eWy/Q5ZQK8v+G41ZrPc9qD9pZU3g
         RZ0HcmroxwkfHdkQ/EkPDf/v5z98rhagKx57MVxw79caWc0Fb+f93WtwduDRjZs+NGa2
         cxWgGQRrXI6MC/TtWBuNdmTxbcygfzeUVkYYs5f1NVZU02WReLQSCZSO52HASJvEo/B+
         N5o0ao2itbeBnosegCy7tG8QlsBdbiJq/mgUjDBaFT3ZokQvbaYFB6+CIWNRcx+rxYnw
         v/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371971; x=1689963971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YRCkfxlgVhLag2qZdreYDwQ2ugrCPfdILJ7ghjkiVg=;
        b=UY6BQCqb8mOea2J8P9VuKVS4cOLuT3Edh7Fm86/iQCLo6XO0jgpYPqK9YAk6UwVWJd
         orp9dJRWdFofhi+QMnsEj+WoFtU9uew51ZFmHshPuiQzkpTu6s9xC+FCtLZK+sZoaRuB
         wUgjvQJRxWjdGfDzEiasy9J7awg5KX0OxGlqIZQp9/0+mpaHaLKj0M/aXNHevyX5K29m
         +hgzuCu27vQs6puB9+v8Qi8yTCUuL6HFFpwYw0VBZpUUi+IRowwzGbTDoy70g4nXPerX
         OfkVdSY+Aay8mRpbpxmhu1hSTBLZ8ZqT57uyioba8eEzIFt558FvogfzOfTKJT1T2Pdu
         x+oQ==
X-Gm-Message-State: AC+VfDyN9l3NMhPPIhto87Oe2sBK1T0xNRri7bwjIVYEro0ZIxymO9KC
        fijccTKUrKShIfB9pwUBqPQcYQ==
X-Google-Smtp-Source: ACHHUZ7AU0YR6t8YRNVDFi1hgZ+p3KaefWogW+t3JyVHWxfXMFp6sDeW7fgBuhh/aFdqIV4RQ9+IGw==
X-Received: by 2002:adf:e4cd:0:b0:30e:3d5a:b2be with SMTP id v13-20020adfe4cd000000b0030e3d5ab2bemr12500462wrm.44.1687371971502;
        Wed, 21 Jun 2023 11:26:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
        by smtp.gmail.com with ESMTPSA id z13-20020adff74d000000b0030af15d7e41sm5176994wrp.4.2023.06.21.11.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:26:11 -0700 (PDT)
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
Subject: [PATCH net-next 00/12] net: stmmac: replace boolean fields in plat_stmmacenet_data with flags
Date:   Wed, 21 Jun 2023 20:25:46 +0200
Message-Id: <20230621182558.544417-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As suggested by Jose Abreu: let's drop all 12 boolean fields in
plat_stmmacenet_data and replace them with a common bitfield.

Bartosz Golaszewski (12):
  net: stmmac: replace has_integrated_pcs field with a flag
  net: stmmac: replace the sph_disable field with a flag
  net: stmmac: replace the use_phy_wol field with a flag
  net: stmmac: replace the has_sun8i field with a flag
  net: stmmac: replace the tso_en field with a flag
  net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
  net: stmmac: replace the vlan_fail_q_en field with a flag
  net: stmmac: replace the multi_msi_en field with a flag
  net: stmmac: replace the ext_snapshot_en field with a flag
  net: stmmac: replace the int_snapshot_en field with a flag
  net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
  net: stmmac: replace the en_tx_lpi_clockgating field with a flag

 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
 include/linux/stmmac.h                        | 26 ++++++------
 12 files changed, 76 insertions(+), 57 deletions(-)

-- 
2.39.2

