Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE31C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFD2C61958
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhFBQdX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFBQdX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:33:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04092C061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 09:31:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qq22so4733113ejb.9
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zRN4Pk4tPa5YedCLAICskXFksBK88CQ1NzOVmYm6Nfg=;
        b=qaOLxTrOrtsdblumNPBTRHC/UOfILYQ40gia7mthQUYdgmglvaJW455pks1qrRnkg7
         EweFkFn0vR8kInTroB550kUt7BEcRtXIyG+xhQhGpTe65Bn90ll0+eRV7PrO+lcszQG3
         9/dT1/gDFzWJVnahys+e7wZFoaXH6C+RzJRKCNaHqjIUHQUhVY93VmZ7tf2y25hoXLcT
         wswgDZYNUw/YA1XZQvjJRNMXpQaqnDJLlxC86tdnI7nLd9EwxBHSz9R6+8RACbsztAxx
         A/b9rjAq+TVI0ds4pJjVlzJLFb7CzmPOMZ9CwuQ600mpz9bgJtNeeANZDOKKbzmRp32n
         bMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zRN4Pk4tPa5YedCLAICskXFksBK88CQ1NzOVmYm6Nfg=;
        b=dhPvguVkqEmRbBsVqvlNvtsNehD+zKBymRzx9+QGlrOSsPKLKrHxFtBavGPYq/dZwV
         9QuJr+qKdJujam2IMVr045tZJHCL3/s6qK8hy3VKGS40SrZl8c/qpf+VivF0TRiHxvSp
         abtTLpF/e2EbjXs1x4qD/YMvfELYdvR7m7yTyZaCcNF34dqOUp18t/1i3RjgQ4lK9nvl
         lO8FABRe/Vd3zn4Zaqjt8tcm8rBJOl2hG+YgoFa3SccYrNAOTRVQQR+UaKb5waTtwHqD
         wVil+QpoW3lz/hjsly6P2l0uhaqAbVdB7hTSbgtEjPFmWBatUKCEeyI9oijW9ML1aJ5o
         C/7g==
X-Gm-Message-State: AOAM532jgzJE7m0fHsKCVCLhnhg/X0TSSpeDzOeJWLqhWfSNQip4rjN6
        KZpCTuTERmBjwlrBbsQkV2aq73OfvBs=
X-Google-Smtp-Source: ABdhPJxkfUxCGR4WjOLQM5otsuS3SVrPLSqtU0R9uK4h+grXjsBuvPcnthVMU+0nuGCX4VgXTRDmlg==
X-Received: by 2002:a17:906:39c6:: with SMTP id i6mr35717969eje.334.1622651491821;
        Wed, 02 Jun 2021 09:31:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o21sm242947ejh.57.2021.06.02.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/12] memory: tegra: Consolidate register fields
Date:   Wed,  2 Jun 2021 18:32:51 +0200
Message-Id: <20210602163302.120041-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Subsequent patches will add more register fields to the tegra_mc_client
structure, so consolidate all register field definitions into a common
sub-structure for coherency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c      |   16 +-
 drivers/memory/tegra/mc.c       |   10 +-
 drivers/memory/tegra/tegra114.c | 1244 +++++++++++++++------------
 drivers/memory/tegra/tegra124.c | 1304 +++++++++++++++-------------
 drivers/memory/tegra/tegra210.c | 1432 +++++++++++++++++--------------
 drivers/memory/tegra/tegra30.c  | 1291 +++++++++++++++-------------
 include/soc/tegra/mc.h          |   30 +-
 7 files changed, 2933 insertions(+), 2394 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1e98dc63ad13..0a281833f611 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -376,9 +376,9 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		if (client->swgroup != swgroup)
 			continue;
 
-		value = smmu_readl(smmu, client->smmu.reg);
-		value |= BIT(client->smmu.bit);
-		smmu_writel(smmu, value, client->smmu.reg);
+		value = smmu_readl(smmu, client->regs.smmu.reg);
+		value |= BIT(client->regs.smmu.bit);
+		smmu_writel(smmu, value, client->regs.smmu.reg);
 	}
 }
 
@@ -404,9 +404,9 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 		if (client->swgroup != swgroup)
 			continue;
 
-		value = smmu_readl(smmu, client->smmu.reg);
-		value &= ~BIT(client->smmu.bit);
-		smmu_writel(smmu, value, client->smmu.reg);
+		value = smmu_readl(smmu, client->regs.smmu.reg);
+		value &= ~BIT(client->regs.smmu.bit);
+		smmu_writel(smmu, value, client->regs.smmu.reg);
 	}
 }
 
@@ -1042,9 +1042,9 @@ static int tegra_smmu_clients_show(struct seq_file *s, void *data)
 		const struct tegra_mc_client *client = &smmu->soc->clients[i];
 		const char *status;
 
-		value = smmu_readl(smmu, client->smmu.reg);
+		value = smmu_readl(smmu, client->regs.smmu.reg);
 
-		if (value & BIT(client->smmu.bit))
+		if (value & BIT(client->regs.smmu.bit))
 			status = "yes";
 		else
 			status = "no";
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index e58c3e5baea0..b7e104bf6614 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -316,13 +316,13 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 
 	/* write latency allowance defaults */
 	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra_mc_la *la = &mc->soc->clients[i].la;
+		const struct tegra_mc_client *client = &mc->soc->clients[i];
 		u32 value;
 
-		value = mc_readl(mc, la->reg);
-		value &= ~(la->mask << la->shift);
-		value |= (la->def & la->mask) << la->shift;
-		mc_writel(mc, value, la->reg);
+		value = mc_readl(mc, client->regs.la.reg);
+		value &= ~(client->regs.la.mask << client->regs.la.shift);
+		value |= (client->regs.la.def & client->regs.la.mask) << client->regs.la.shift;
+		mc_writel(mc, value, client->regs.la.reg);
 	}
 
 	/* latch new values */
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index ed376ba2d2fe..1f2054d34bf5 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -15,883 +15,1013 @@ static const struct tegra_mc_client tegra114_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
-		.la = {
-			.reg = 0x34c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0,
+		.regs = {
+			.la = {
+				.reg = 0x34c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0,
+			},
 		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x02,
 		.name = "display0ab",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x03,
 		.name = "display0b",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x04,
 		.name = "display0bb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x05,
 		.name = "display0c",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x2ec,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x2ec,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x06,
 		.name = "display0cb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x2f8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x2f8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 	}, {
 		.id = 0x09,
 		.name = "eppup",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 9,
-		},
-		.la = {
-			.reg = 0x300,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x33,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 9,
+			},
+			.la = {
+				.reg = 0x300,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x33,
+			},
 		},
 	}, {
 		.id = 0x0a,
 		.name = "g2pr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x308,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x09,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x308,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x09,
+			},
 		},
 	}, {
 		.id = 0x0b,
 		.name = "g2sr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x308,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x09,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x308,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x09,
+			},
 		},
 	}, {
 		.id = 0x0f,
 		.name = "avpcarm7r",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x10,
 		.name = "displayhc",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x68,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x68,
+			},
 		},
 	}, {
 		.id = 0x11,
 		.name = "displayhcb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2fc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x68,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2fc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x68,
+			},
 		},
 	}, {
 		.id = 0x12,
 		.name = "fdcdrd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x334,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x334,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 	}, {
 		.id = 0x13,
 		.name = "fdcdrd2",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x33c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x33c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 	}, {
 		.id = 0x14,
 		.name = "g2dr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x30c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x30c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 	}, {
 		.id = 0x15,
 		.name = "hdar",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x16,
 		.name = "host1xdmar",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 	}, {
 		.id = 0x17,
 		.name = "host1xr",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x18,
 		.name = "idxsrd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 24,
-		},
-		.la = {
-			.reg = 0x334,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0b,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 24,
+			},
+			.la = {
+				.reg = 0x334,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0b,
+			},
 		},
 	}, {
 		.id = 0x1c,
 		.name = "msencsrd",
 		.swgroup = TEGRA_SWGROUP_MSENC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x1d,
 		.name = "ppcsahbdmar",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x1e,
 		.name = "ppcsahbslvr",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xe8,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xe8,
+			},
 		},
 	}, {
 		.id = 0x20,
 		.name = "texl2srd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x338,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x338,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 	}, {
 		.id = 0x22,
 		.name = "vdebsevr",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x23,
 		.name = "vdember",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x24,
 		.name = "vdemcer",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xb8,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xb8,
+			},
 		},
 	}, {
 		.id = 0x25,
 		.name = "vdetper",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xee,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xee,
+			},
 		},
 	}, {
 		.id = 0x26,
 		.name = "mpcorelpr",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x27,
 		.name = "mpcorer",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x28,
 		.name = "eppu",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 8,
-		},
-		.la = {
-			.reg = 0x300,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x33,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 8,
+			},
+			.la = {
+				.reg = 0x300,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x33,
+			},
 		},
 	}, {
 		.id = 0x29,
 		.name = "eppv",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 9,
-		},
-		.la = {
-			.reg = 0x304,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x6c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 9,
+			},
+			.la = {
+				.reg = 0x304,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x6c,
+			},
 		},
 	}, {
 		.id = 0x2a,
 		.name = "eppy",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x304,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x6c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x304,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x6c,
+			},
 		},
 	}, {
 		.id = 0x2b,
 		.name = "msencswr",
 		.swgroup = TEGRA_SWGROUP_MSENC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x2c,
 		.name = "viwsb",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x364,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x47,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x364,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x47,
+			},
 		},
 	}, {
 		.id = 0x2d,
 		.name = "viwu",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x368,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x368,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x2e,
 		.name = "viwv",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x368,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x368,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x2f,
 		.name = "viwy",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x36c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x47,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x36c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x47,
+			},
 		},
 	}, {
 		.id = 0x30,
 		.name = "g2dw",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x30c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x9,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x30c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x9,
+			},
 		},
 	}, {
 		.id = 0x32,
 		.name = "avpcarm7w",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 	}, {
 		.id = 0x33,
 		.name = "fdcdwr",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x338,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x338,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 	}, {
 		.id = 0x34,
 		.name = "fdcdwr2",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x340,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x340,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 	}, {
 		.id = 0x35,
 		.name = "hdaw",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x36,
 		.name = "host1xw",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x314,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x25,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x314,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x25,
+			},
 		},
 	}, {
 		.id = 0x37,
 		.name = "ispw",
 		.swgroup = TEGRA_SWGROUP_ISP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x31c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x31c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x38,
 		.name = "mpcorelpw",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x39,
 		.name = "mpcorew",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 	}, {
 		.id = 0x3b,
 		.name = "ppcsahbdmaw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x3c,
 		.name = "ppcsahbslvw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xe8,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xe8,
+			},
 		},
 	}, {
 		.id = 0x3e,
 		.name = "vdebsevw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x3f,
 		.name = "vdedbgw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x40,
 		.name = "vdembew",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x89,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x89,
+			},
 		},
 	}, {
 		.id = 0x41,
 		.name = "vdetpmw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x59,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x59,
+			},
 		},
 	}, {
 		.id = 0x4a,
 		.name = "xusb_hostr",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x4b,
 		.name = "xusb_hostw",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x4c,
 		.name = "xusb_devr",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x4d,
 		.name = "xusb_devw",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x4e,
 		.name = "fdcdwr3",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 	}, {
 		.id = 0x4f,
 		.name = "fdcdrd3",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x384,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x384,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 	}, {
 		.id = 0x50,
 		.name = "fdcwr4",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 	}, {
 		.id = 0x51,
 		.name = "fdcrd4",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x384,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x384,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 	}, {
 		.id = 0x52,
 		.name = "emucifr",
 		.swgroup = TEGRA_SWGROUP_EMUCIF,
-		.la = {
-			.reg = 0x38c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x38c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x53,
 		.name = "emucifw",
 		.swgroup = TEGRA_SWGROUP_EMUCIF,
-		.la = {
-			.reg = 0x38c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.la = {
+				.reg = 0x38c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 	}, {
 		.id = 0x54,
 		.name = "tsecsrd",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x55,
 		.name = "tsecswr",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	},
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 459211f50c08..8a8485ceb789 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -16,921 +16,1055 @@ static const struct tegra_mc_client tegra124_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
-		.la = {
-			.reg = 0x34c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0,
+		.regs = {
+			.la = {
+				.reg = 0x34c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0,
+			},
 		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xc2,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xc2,
+			},
 		},
 	}, {
 		.id = 0x02,
 		.name = "display0ab",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xc6,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xc6,
+			},
 		},
 	}, {
 		.id = 0x03,
 		.name = "display0b",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x04,
 		.name = "display0bb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x05,
 		.name = "display0c",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x2ec,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x2ec,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x06,
 		.name = "display0cb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x2f8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x2f8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x0e,
 		.name = "afir",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 	}, {
 		.id = 0x0f,
 		.name = "avpcarm7r",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x10,
 		.name = "displayhc",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x11,
 		.name = "displayhcb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2fc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2fc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x15,
 		.name = "hdar",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x24,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x24,
+			},
 		},
 	}, {
 		.id = 0x16,
 		.name = "host1xdmar",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x17,
 		.name = "host1xr",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x1c,
 		.name = "msencsrd",
 		.swgroup = TEGRA_SWGROUP_MSENC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x23,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x23,
+			},
 		},
 	}, {
 		.id = 0x1d,
 		.name = "ppcsahbdmar",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x1e,
 		.name = "ppcsahbslvr",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x1f,
 		.name = "satar",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x65,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x65,
+			},
 		},
 	}, {
 		.id = 0x22,
 		.name = "vdebsevr",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4f,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4f,
+			},
 		},
 	}, {
 		.id = 0x23,
 		.name = "vdember",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x3d,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x3d,
+			},
 		},
 	}, {
 		.id = 0x24,
 		.name = "vdemcer",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x66,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x66,
+			},
 		},
 	}, {
 		.id = 0x25,
 		.name = "vdetper",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xa5,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xa5,
+			},
 		},
 	}, {
 		.id = 0x26,
 		.name = "mpcorelpr",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x27,
 		.name = "mpcorer",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x2b,
 		.name = "msencswr",
 		.swgroup = TEGRA_SWGROUP_MSENC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x31,
 		.name = "afiw",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x32,
 		.name = "avpcarm7w",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x35,
 		.name = "hdaw",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x36,
 		.name = "host1xw",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x314,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x314,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x38,
 		.name = "mpcorelpw",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x39,
 		.name = "mpcorew",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3b,
 		.name = "ppcsahbdmaw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3c,
 		.name = "ppcsahbslvw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3d,
 		.name = "sataw",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x65,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x65,
+			},
 		},
 	}, {
 		.id = 0x3e,
 		.name = "vdebsevw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3f,
 		.name = "vdedbgw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x40,
 		.name = "vdembew",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x41,
 		.name = "vdetpmw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x44,
 		.name = "ispra",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x370,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x18,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x370,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x18,
+			},
 		},
 	}, {
 		.id = 0x46,
 		.name = "ispwa",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x374,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x374,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x47,
 		.name = "ispwb",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x374,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x374,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4a,
 		.name = "xusb_hostr",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x39,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x39,
+			},
 		},
 	}, {
 		.id = 0x4b,
 		.name = "xusb_hostw",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4c,
 		.name = "xusb_devr",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x39,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x39,
+			},
 		},
 	}, {
 		.id = 0x4d,
 		.name = "xusb_devw",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4e,
 		.name = "isprab",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x384,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x18,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x384,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x18,
+			},
 		},
 	}, {
 		.id = 0x50,
 		.name = "ispwab",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x51,
 		.name = "ispwbb",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x54,
 		.name = "tsecsrd",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x9b,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x9b,
+			},
 		},
 	}, {
 		.id = 0x55,
 		.name = "tsecswr",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x56,
 		.name = "a9avpscr",
 		.swgroup = TEGRA_SWGROUP_A9AVP,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x3a4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x3a4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x57,
 		.name = "a9avpscw",
 		.swgroup = TEGRA_SWGROUP_A9AVP,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x3a4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x3a4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x58,
 		.name = "gpusrd",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0x230,
-			.bit = 24,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0x230,
+				.bit = 24,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x59,
 		.name = "gpuswr",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0x230,
-			.bit = 25,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0x230,
+				.bit = 25,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x5a,
 		.name = "displayt",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 26,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 26,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x60,
 		.name = "sdmmcra",
 		.swgroup = TEGRA_SWGROUP_SDMMC1A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x3b8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x3b8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x61,
 		.name = "sdmmcraa",
 		.swgroup = TEGRA_SWGROUP_SDMMC2A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x3bc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x3bc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x62,
 		.name = "sdmmcr",
 		.swgroup = TEGRA_SWGROUP_SDMMC3A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x3c0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x3c0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x63,
 		.swgroup = TEGRA_SWGROUP_SDMMC4A,
 		.name = "sdmmcrab",
-		.smmu = {
-			.reg = 0x234,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x3c4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x3c4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x64,
 		.name = "sdmmcwa",
 		.swgroup = TEGRA_SWGROUP_SDMMC1A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x3b8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x3b8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x65,
 		.name = "sdmmcwaa",
 		.swgroup = TEGRA_SWGROUP_SDMMC2A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x3bc,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x3bc,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x66,
 		.name = "sdmmcw",
 		.swgroup = TEGRA_SWGROUP_SDMMC3A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x3c0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x3c0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x67,
 		.name = "sdmmcwab",
 		.swgroup = TEGRA_SWGROUP_SDMMC4A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x3c4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x3c4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x6c,
 		.name = "vicsrd",
 		.swgroup = TEGRA_SWGROUP_VIC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x394,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x394,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x6d,
 		.name = "vicswr",
 		.swgroup = TEGRA_SWGROUP_VIC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x394,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x394,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x72,
 		.name = "viw",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x398,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x398,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x73,
 		.name = "displayd",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	},
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index b3bbc5a05ba1..08f3a08cd743 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -16,1005 +16,1149 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 		.id = 0x01,
 		.name = "display0a",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x02,
 		.name = "display0ab",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x03,
 		.name = "display0b",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x04,
 		.name = "display0bb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x05,
 		.name = "display0c",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x2ec,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x2ec,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x06,
 		.name = "display0cb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x2f8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x2f8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x0e,
 		.name = "afir",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x2e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x2e,
+			},
 		},
 	}, {
 		.id = 0x0f,
 		.name = "avpcarm7r",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x10,
 		.name = "displayhc",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x11,
 		.name = "displayhcb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2fc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2fc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x15,
 		.name = "hdar",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x24,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x24,
+			},
 		},
 	}, {
 		.id = 0x16,
 		.name = "host1xdmar",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x17,
 		.name = "host1xr",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x1c,
 		.name = "nvencsrd",
 		.swgroup = TEGRA_SWGROUP_NVENC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x23,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x23,
+			},
 		},
 	}, {
 		.id = 0x1d,
 		.name = "ppcsahbdmar",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x1e,
 		.name = "ppcsahbslvr",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x1f,
 		.name = "satar",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x65,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x65,
+			},
 		},
 	}, {
 		.id = 0x27,
 		.name = "mpcorer",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x2b,
 		.name = "nvencswr",
 		.swgroup = TEGRA_SWGROUP_NVENC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x31,
 		.name = "afiw",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x32,
 		.name = "avpcarm7w",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x35,
 		.name = "hdaw",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x36,
 		.name = "host1xw",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x314,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x314,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x39,
 		.name = "mpcorew",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3b,
 		.name = "ppcsahbdmaw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3c,
 		.name = "ppcsahbslvw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x3d,
 		.name = "sataw",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x44,
 		.name = "ispra",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x370,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x18,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x370,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x18,
+			},
 		},
 	}, {
 		.id = 0x46,
 		.name = "ispwa",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x374,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x374,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x47,
 		.name = "ispwb",
 		.swgroup = TEGRA_SWGROUP_ISP2,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x374,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x374,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4a,
 		.name = "xusb_hostr",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x7a,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x7a,
+			},
 		},
 	}, {
 		.id = 0x4b,
 		.name = "xusb_hostw",
 		.swgroup = TEGRA_SWGROUP_XUSB_HOST,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x37c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x37c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4c,
 		.name = "xusb_devr",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x39,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x39,
+			},
 		},
 	}, {
 		.id = 0x4d,
 		.name = "xusb_devw",
 		.swgroup = TEGRA_SWGROUP_XUSB_DEV,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x380,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x380,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x4e,
 		.name = "isprab",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x384,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x18,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x384,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x18,
+			},
 		},
 	}, {
 		.id = 0x50,
 		.name = "ispwab",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x51,
 		.name = "ispwbb",
 		.swgroup = TEGRA_SWGROUP_ISP2B,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x388,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x388,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x54,
 		.name = "tsecsrd",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x9b,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x9b,
+			},
 		},
 	}, {
 		.id = 0x55,
 		.name = "tsecswr",
 		.swgroup = TEGRA_SWGROUP_TSEC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x390,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x390,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x56,
 		.name = "a9avpscr",
 		.swgroup = TEGRA_SWGROUP_A9AVP,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x3a4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x3a4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 	}, {
 		.id = 0x57,
 		.name = "a9avpscw",
 		.swgroup = TEGRA_SWGROUP_A9AVP,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x3a4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x3a4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x58,
 		.name = "gpusrd",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0x230,
-			.bit = 24,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0x230,
+				.bit = 24,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x59,
 		.name = "gpuswr",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0x230,
-			.bit = 25,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0x230,
+				.bit = 25,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x5a,
 		.name = "displayt",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 26,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x1e,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 26,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x1e,
+			},
 		},
 	}, {
 		.id = 0x60,
 		.name = "sdmmcra",
 		.swgroup = TEGRA_SWGROUP_SDMMC1A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x3b8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x3b8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x61,
 		.name = "sdmmcraa",
 		.swgroup = TEGRA_SWGROUP_SDMMC2A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x3bc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x5a,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x3bc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x5a,
+			},
 		},
 	}, {
 		.id = 0x62,
 		.name = "sdmmcr",
 		.swgroup = TEGRA_SWGROUP_SDMMC3A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x3c0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x49,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x3c0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x49,
+			},
 		},
 	}, {
 		.id = 0x63,
 		.swgroup = TEGRA_SWGROUP_SDMMC4A,
 		.name = "sdmmcrab",
-		.smmu = {
-			.reg = 0x234,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x3c4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x5a,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x3c4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x5a,
+			},
 		},
 	}, {
 		.id = 0x64,
 		.name = "sdmmcwa",
 		.swgroup = TEGRA_SWGROUP_SDMMC1A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x3b8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x3b8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x65,
 		.name = "sdmmcwaa",
 		.swgroup = TEGRA_SWGROUP_SDMMC2A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x3bc,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x3bc,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x66,
 		.name = "sdmmcw",
 		.swgroup = TEGRA_SWGROUP_SDMMC3A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x3c0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x3c0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x67,
 		.name = "sdmmcwab",
 		.swgroup = TEGRA_SWGROUP_SDMMC4A,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x3c4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x3c4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x6c,
 		.name = "vicsrd",
 		.swgroup = TEGRA_SWGROUP_VIC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x394,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x394,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x6d,
 		.name = "vicswr",
 		.swgroup = TEGRA_SWGROUP_VIC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x394,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x394,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x72,
 		.name = "viw",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x398,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x398,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x73,
 		.name = "displayd",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x3c8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x3c8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 	}, {
 		.id = 0x78,
 		.name = "nvdecsrd",
 		.swgroup = TEGRA_SWGROUP_NVDEC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 24,
-		},
-		.la = {
-			.reg = 0x3d8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x23,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 24,
+			},
+			.la = {
+				.reg = 0x3d8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x23,
+			},
 		},
 	}, {
 		.id = 0x79,
 		.name = "nvdecswr",
 		.swgroup = TEGRA_SWGROUP_NVDEC,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 25,
-		},
-		.la = {
-			.reg = 0x3d8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 25,
+			},
+			.la = {
+				.reg = 0x3d8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x7a,
 		.name = "aper",
 		.swgroup = TEGRA_SWGROUP_APE,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 26,
-		},
-		.la = {
-			.reg = 0x3dc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 26,
+			},
+			.la = {
+				.reg = 0x3dc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x7b,
 		.name = "apew",
 		.swgroup = TEGRA_SWGROUP_APE,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x3dc,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x3dc,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x7e,
 		.name = "nvjpgsrd",
 		.swgroup = TEGRA_SWGROUP_NVJPG,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x3e4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x23,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x3e4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x23,
+			},
 		},
 	}, {
 		.id = 0x7f,
 		.name = "nvjpgswr",
 		.swgroup = TEGRA_SWGROUP_NVJPG,
-		.smmu = {
-			.reg = 0x234,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x3e4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x234,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x3e4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x80,
 		.name = "sesrd",
 		.swgroup = TEGRA_SWGROUP_SE,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x3e0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x2e,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x3e0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x2e,
+			},
 		},
 	}, {
 		.id = 0x81,
 		.name = "seswr",
 		.swgroup = TEGRA_SWGROUP_SE,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x3e0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x3e0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x82,
 		.name = "axiapr",
 		.swgroup = TEGRA_SWGROUP_AXIAP,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x3a0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x3a0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x83,
 		.name = "axiapw",
 		.swgroup = TEGRA_SWGROUP_AXIAP,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x3a0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x3a0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x84,
 		.name = "etrr",
 		.swgroup = TEGRA_SWGROUP_ETR,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x3ec,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x3ec,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 	}, {
 		.id = 0x85,
 		.name = "etrw",
 		.swgroup = TEGRA_SWGROUP_ETR,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x3ec,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x3ec,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x86,
 		.name = "tsecsrdb",
 		.swgroup = TEGRA_SWGROUP_TSECB,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x3f0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x9b,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x3f0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x9b,
+			},
 		},
 	}, {
 		.id = 0x87,
 		.name = "tsecswrb",
 		.swgroup = TEGRA_SWGROUP_TSECB,
-		.smmu = {
-			.reg = 0xb98,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x3f0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0xb98,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x3f0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	}, {
 		.id = 0x88,
 		.name = "gpusrd2",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0xb98,
-			.bit = 8,
-		},
-		.la = {
-			.reg = 0x3e8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x1a,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0xb98,
+				.bit = 8,
+			},
+			.la = {
+				.reg = 0x3e8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x1a,
+			},
 		},
 	}, {
 		.id = 0x89,
 		.name = "gpuswr2",
 		.swgroup = TEGRA_SWGROUP_GPU,
-		.smmu = {
-			/* read-only */
-			.reg = 0xb98,
-			.bit = 9,
-		},
-		.la = {
-			.reg = 0x3e8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				/* read-only */
+				.reg = 0xb98,
+				.bit = 9,
+			},
+			.la = {
+				.reg = 0x3e8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 	},
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index ea849003014b..1922ab64e686 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -37,970 +37,1102 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
-		.la = {
-			.reg = 0x34c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0,
+		.regs = {
+			.la = {
+				.reg = 0x34c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x01,
 		.name = "display0a",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x02,
 		.name = "display0ab",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x03,
 		.name = "display0b",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x2e8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x2e8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x04,
 		.name = "display0bb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x2f4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x2f4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x05,
 		.name = "display0c",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x2ec,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x2ec,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x06,
 		.name = "display0cb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 6,
-		},
-		.la = {
-			.reg = 0x2f8,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 6,
+			},
+			.la = {
+				.reg = 0x2f8,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x07,
 		.name = "display1b",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 7,
-		},
-		.la = {
-			.reg = 0x2ec,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 7,
+			},
+			.la = {
+				.reg = 0x2ec,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x08,
 		.name = "display1bb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 8,
-		},
-		.la = {
-			.reg = 0x2f8,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x4e,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 8,
+			},
+			.la = {
+				.reg = 0x2f8,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x4e,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x09,
 		.name = "eppup",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 9,
-		},
-		.la = {
-			.reg = 0x300,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x17,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 9,
+			},
+			.la = {
+				.reg = 0x300,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x17,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0a,
 		.name = "g2pr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x308,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x09,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x308,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x09,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x0b,
 		.name = "g2sr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x308,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x09,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x308,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x09,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x0c,
 		.name = "mpeunifbr",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0d,
 		.name = "viruv",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x364,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x2c,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x364,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x2c,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0e,
 		.name = "afir",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x0f,
 		.name = "avpcarm7r",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x10,
 		.name = "displayhc",
 		.swgroup = TEGRA_SWGROUP_DC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x2f0,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x2f0,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x11,
 		.name = "displayhcb",
 		.swgroup = TEGRA_SWGROUP_DCB,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2fc,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2fc,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x12,
 		.name = "fdcdrd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x334,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x334,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x13,
 		.name = "fdcdrd2",
 		.swgroup = TEGRA_SWGROUP_NV2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x33c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x33c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x14,
 		.name = "g2dr",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x30c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x30c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x15,
 		.name = "hdar",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x16,
 		.name = "host1xdmar",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x05,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x05,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x17,
 		.name = "host1xr",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x310,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x50,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x310,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x50,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x18,
 		.name = "idxsrd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 24,
-		},
-		.la = {
-			.reg = 0x334,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 24,
+			},
+			.la = {
+				.reg = 0x334,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x19,
 		.name = "idxsrd2",
 		.swgroup = TEGRA_SWGROUP_NV2,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 25,
-		},
-		.la = {
-			.reg = 0x33c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 25,
+			},
+			.la = {
+				.reg = 0x33c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x1a,
 		.name = "mpe_ipred",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 26,
-		},
-		.la = {
-			.reg = 0x328,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x80,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 26,
+			},
+			.la = {
+				.reg = 0x328,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x80,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x1b,
 		.name = "mpeamemrd",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x32c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x42,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x32c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x42,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x1c,
 		.name = "mpecsrd",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x32c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x32c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x1d,
 		.name = "ppcsahbdmar",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x1e,
 		.name = "ppcsahbslvr",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x344,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x12,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x344,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x12,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x1f,
 		.name = "satar",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x228,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x33,
+		.regs = {
+			.smmu = {
+				.reg = 0x228,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x33,
+			},
 		},
 		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x20,
 		.name = "texsrd",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x338,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x338,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x21,
 		.name = "texsrd2",
 		.swgroup = TEGRA_SWGROUP_NV2,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x340,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x340,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x22,
 		.name = "vdebsevr",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 2,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 2,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x23,
 		.name = "vdember",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 3,
-		},
-		.la = {
-			.reg = 0x354,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xd0,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 3,
+			},
+			.la = {
+				.reg = 0x354,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xd0,
+			},
 		},
 		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x24,
 		.name = "vdemcer",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 4,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x2a,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 4,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x2a,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x25,
 		.name = "vdetper",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 5,
-		},
-		.la = {
-			.reg = 0x358,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x74,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 5,
+			},
+			.la = {
+				.reg = 0x358,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x74,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x26,
 		.name = "mpcorelpr",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 		.fifo_size = 16 * 14,
 	}, {
 		.id = 0x27,
 		.name = "mpcorer",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x04,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x04,
+			},
 		},
 		.fifo_size = 16 * 14,
 	}, {
 		.id = 0x28,
 		.name = "eppu",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 8,
-		},
-		.la = {
-			.reg = 0x300,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x6c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 8,
+			},
+			.la = {
+				.reg = 0x300,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x6c,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x29,
 		.name = "eppv",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 9,
-		},
-		.la = {
-			.reg = 0x304,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x6c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 9,
+			},
+			.la = {
+				.reg = 0x304,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x6c,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2a,
 		.name = "eppy",
 		.swgroup = TEGRA_SWGROUP_EPP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 10,
-		},
-		.la = {
-			.reg = 0x304,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x6c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 10,
+			},
+			.la = {
+				.reg = 0x304,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x6c,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2b,
 		.name = "mpeunifbw",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 11,
-		},
-		.la = {
-			.reg = 0x330,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x13,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 11,
+			},
+			.la = {
+				.reg = 0x330,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x13,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x2c,
 		.name = "viwsb",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 12,
-		},
-		.la = {
-			.reg = 0x364,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x12,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 12,
+			},
+			.la = {
+				.reg = 0x364,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x12,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2d,
 		.name = "viwu",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 13,
-		},
-		.la = {
-			.reg = 0x368,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xb2,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 13,
+			},
+			.la = {
+				.reg = 0x368,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xb2,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2e,
 		.name = "viwv",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 14,
-		},
-		.la = {
-			.reg = 0x368,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xb2,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 14,
+			},
+			.la = {
+				.reg = 0x368,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xb2,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2f,
 		.name = "viwy",
 		.swgroup = TEGRA_SWGROUP_VI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 15,
-		},
-		.la = {
-			.reg = 0x36c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x12,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 15,
+			},
+			.la = {
+				.reg = 0x36c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x12,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x30,
 		.name = "g2dw",
 		.swgroup = TEGRA_SWGROUP_G2,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 16,
-		},
-		.la = {
-			.reg = 0x30c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x9,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 16,
+			},
+			.la = {
+				.reg = 0x30c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x9,
+			},
 		},
 		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x31,
 		.name = "afiw",
 		.swgroup = TEGRA_SWGROUP_AFI,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 17,
-		},
-		.la = {
-			.reg = 0x2e0,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0c,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 17,
+			},
+			.la = {
+				.reg = 0x2e0,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0c,
+			},
 		},
 		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x32,
 		.name = "avpcarm7w",
 		.swgroup = TEGRA_SWGROUP_AVPC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 18,
-		},
-		.la = {
-			.reg = 0x2e4,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 18,
+			},
+			.la = {
+				.reg = 0x2e4,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x33,
 		.name = "fdcdwr",
 		.swgroup = TEGRA_SWGROUP_NV,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 19,
-		},
-		.la = {
-			.reg = 0x338,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 19,
+			},
+			.la = {
+				.reg = 0x338,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x34,
 		.name = "fdcdwr2",
 		.swgroup = TEGRA_SWGROUP_NV2,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 20,
-		},
-		.la = {
-			.reg = 0x340,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0a,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 20,
+			},
+			.la = {
+				.reg = 0x340,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0a,
+			},
 		},
 		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x35,
 		.name = "hdaw",
 		.swgroup = TEGRA_SWGROUP_HDA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 21,
-		},
-		.la = {
-			.reg = 0x318,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 21,
+			},
+			.la = {
+				.reg = 0x318,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x36,
 		.name = "host1xw",
 		.swgroup = TEGRA_SWGROUP_HC,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 22,
-		},
-		.la = {
-			.reg = 0x314,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 22,
+			},
+			.la = {
+				.reg = 0x314,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x37,
 		.name = "ispw",
 		.swgroup = TEGRA_SWGROUP_ISP,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 23,
-		},
-		.la = {
-			.reg = 0x31c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 23,
+			},
+			.la = {
+				.reg = 0x31c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x38,
 		.name = "mpcorelpw",
 		.swgroup = TEGRA_SWGROUP_MPCORELP,
-		.la = {
-			.reg = 0x324,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.la = {
+				.reg = 0x324,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 		.fifo_size = 16 * 24,
 	}, {
 		.id = 0x39,
 		.name = "mpcorew",
 		.swgroup = TEGRA_SWGROUP_MPCORE,
-		.la = {
-			.reg = 0x320,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x0e,
+		.regs = {
+			.la = {
+				.reg = 0x320,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x0e,
+			},
 		},
 		.fifo_size = 16 * 24,
 	}, {
 		.id = 0x3a,
 		.name = "mpecswr",
 		.swgroup = TEGRA_SWGROUP_MPE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 26,
-		},
-		.la = {
-			.reg = 0x330,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 26,
+			},
+			.la = {
+				.reg = 0x330,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x3b,
 		.name = "ppcsahbdmaw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 27,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x10,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 27,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x10,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x3c,
 		.name = "ppcsahbslvw",
 		.swgroup = TEGRA_SWGROUP_PPCS,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 28,
-		},
-		.la = {
-			.reg = 0x348,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x06,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 28,
+			},
+			.la = {
+				.reg = 0x348,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x06,
+			},
 		},
 		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x3d,
 		.name = "sataw",
 		.swgroup = TEGRA_SWGROUP_SATA,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 29,
-		},
-		.la = {
-			.reg = 0x350,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x33,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 29,
+			},
+			.la = {
+				.reg = 0x350,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x33,
+			},
 		},
 		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x3e,
 		.name = "vdebsevw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 30,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 30,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x3f,
 		.name = "vdedbgw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x22c,
-			.bit = 31,
-		},
-		.la = {
-			.reg = 0x35c,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0xff,
+		.regs = {
+			.smmu = {
+				.reg = 0x22c,
+				.bit = 31,
+			},
+			.la = {
+				.reg = 0x35c,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0xff,
+			},
 		},
 		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x40,
 		.name = "vdembew",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 0,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 0,
-			.mask = 0xff,
-			.def = 0x42,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 0,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 0,
+				.mask = 0xff,
+				.def = 0x42,
+			},
 		},
 		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x41,
 		.name = "vdetpmw",
 		.swgroup = TEGRA_SWGROUP_VDE,
-		.smmu = {
-			.reg = 0x230,
-			.bit = 1,
-		},
-		.la = {
-			.reg = 0x360,
-			.shift = 16,
-			.mask = 0xff,
-			.def = 0x2a,
+		.regs = {
+			.smmu = {
+				.reg = 0x230,
+				.bit = 1,
+			},
+			.la = {
+				.reg = 0x360,
+				.shift = 16,
+				.mask = 0xff,
+				.def = 0x2a,
+			},
 		},
 		.fifo_size = 16 * 16,
 	},
@@ -1089,7 +1221,6 @@ static void tegra30_mc_tune_client_latency(struct tegra_mc *mc,
 					   unsigned int bandwidth_mbytes_sec)
 {
 	u32 arb_tolerance_compensation_nsec, arb_tolerance_compensation_div;
-	const struct tegra_mc_la *la = &client->la;
 	unsigned int fifo_size = client->fifo_size;
 	u32 arb_nsec, la_ticks, value;
 
@@ -1149,12 +1280,12 @@ static void tegra30_mc_tune_client_latency(struct tegra_mc *mc,
 	 * request.
 	 */
 	la_ticks = arb_nsec / mc->tick;
-	la_ticks = min(la_ticks, la->mask);
+	la_ticks = min(la_ticks, client->regs.la.mask);
 
-	value = mc_readl(mc, la->reg);
-	value &= ~(la->mask << la->shift);
-	value |= la_ticks << la->shift;
-	mc_writel(mc, value, la->reg);
+	value = mc_readl(mc, client->regs.la.reg);
+	value &= ~(client->regs.la.mask << client->regs.la.shift);
+	value |= la_ticks << client->regs.la.shift;
+	mc_writel(mc, value, client->regs.la.reg);
 }
 
 static int tegra30_mc_icc_set(struct icc_node *src, struct icc_node *dst)
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d2fbe6a8b25b..dd26505464c2 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -17,25 +17,12 @@ struct clk;
 struct device;
 struct page;
 
-struct tegra_smmu_enable {
-	unsigned int reg;
-	unsigned int bit;
-};
-
 struct tegra_mc_timing {
 	unsigned long rate;
 
 	u32 *emem_data;
 };
 
-/* latency allowance */
-struct tegra_mc_la {
-	unsigned int reg;
-	unsigned int shift;
-	unsigned int mask;
-	unsigned int def;
-};
-
 struct tegra_mc_client {
 	unsigned int id;
 	const char *name;
@@ -43,8 +30,21 @@ struct tegra_mc_client {
 
 	unsigned int fifo_size;
 
-	struct tegra_smmu_enable smmu;
-	struct tegra_mc_la la;
+	struct {
+		/* Tegra SMMU enable */
+		struct {
+			unsigned int reg;
+			unsigned int bit;
+		} smmu;
+
+		/* latency allowance */
+		struct {
+			unsigned int reg;
+			unsigned int shift;
+			unsigned int mask;
+			unsigned int def;
+		} la;
+	} regs;
 };
 
 struct tegra_smmu_swgroup {
-- 
2.31.1

