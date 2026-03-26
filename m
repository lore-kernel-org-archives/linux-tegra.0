Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADDA28314C
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493296; cv=none; b=kxm7t+VGR+29Dzpr309vqlR1EhdHSzegdjqxo1FDVGKGCxzp46qtLbpzkFSqfuomUuCI1lSKdZcDJLGCjDlS7Fmp4AK/Z3ycR8ZWrxNmiisxXgnPV+k6Xk7MK2ES+mGor4mSDlAiM0Urr/K5iz6ldDuqdhPvxf79s6N47nc6flI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493296; c=relaxed/simple;
	bh=RrqD1NoUe4djEyb0fe5dsQb/o25xg9vxMy7cCsdcd7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hf7WY02i4JK4ZL7nh2xnsPW1Wu3UQRIA8lJfLkhQgvgnXxsNlmEyxCuFodnx2mEORWC1SO+Nn9E/CnP9Dl1wR48VX6iFVBL1O7wGDOE7YV+tRpfN//MuKn/tb/TQswxvgAA2FpUB2qpwN4Yw6fZ28CxjduwiPps07dt/rxygK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl2PEuoi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl2PEuoi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aaed195901so2062555ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774493295; x=1775098095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dMEzcnIaH8BHyFA6RpTtAAlerD4BYMa9dkJNVe48taA=;
        b=rl2PEuoizce2K29EK6r2vqeTUBfL6H5P8X+z8m/6spCgKm+v0Lnot03Y270GSVUTxJ
         O2Vtm61MiVljiRN5YUq+WuGh+VjvsvCldrvTA3cHd1jDJ87p+R1g5voINnIuHl3TJKfA
         N3eXliS3XuUtqUsgvU3ZVP3qYjWAO3AOW4Hl55ao9QwrIHjD28VQfASwWBACB/PHRwjx
         W7OYpZJ2jBTTsZ9Y33S8MSiKoEuruMVscMfMzEiNchgt32VsaofcffaVaaaUPQdgFtME
         9yRouzxLbqzEx7y14VZY7G6mGXeaOTKz5mYee27L17XU+NBIS86/RgV8lTh6eDfRl5+b
         yx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774493295; x=1775098095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMEzcnIaH8BHyFA6RpTtAAlerD4BYMa9dkJNVe48taA=;
        b=RGcuWP/GFw6lt6j9O6YxX+D/jYheqQbD6xelEyWZwFkp/V5imjCqAGcTpYCKXoOhNF
         YnxUB1C5bJj3zw3aOagytlCrTgKT/iCJ+rg1ZoSasURtImgmLz56sJRDaCwAhBJR0StJ
         cMUWHDu7nJbKmdDg4ebobVkn6jbZJkVIQPc/AuSQzQKR8ZRknkxa+9otxqsb4xtrJs9n
         LsTkvMeVMagVdntPdsWQys92z14yNStIlJiBnzTd72+sQ4OpH+bX2SEoWK2t7nccn9wL
         mLhTLgJ7X2r93K/9KRLk0Sz1KPrKWqnmfpRr65OZ6z5jFM3fqLUVIucKr72Fz1j9LOcg
         p/cQ==
X-Gm-Message-State: AOJu0YxzppWT6L9a7SzfwMo0JdDxthwNEy84AZWY8KlTED88XTIwUnun
	DxCejN/bAthiutIYowYrJJ28cFXyhGe9BwhttRlcDYR8tclJifRcteKkauKXdBzV
X-Gm-Gg: ATEYQzyt87aTzeC1+V7VPUy66Oz0sePCt76WNh+JjnZh83sSd2NYfasL6RGnS4+oUUm
	f45oGQElODDZ75EH8cAKm1oUGcdoj9YRLck5EXnabAS7FJjebJArQ7QNHwKMkLhNhkoTHbMUWu5
	spVxmvLP7IZOzmlrENKPyjrRrfobZByCjzbGnc/acePekq/AiKyd/xTVRStfvI9AQoZXvXkS7G7
	QSxU7YLxFPJmet8br+LNarb7NhJjxak8k2sLJbhcjDUfZKZ/NJg0Rd2ZQaeDAvvjKBqIAXyWx2i
	ybu0w9srkztbTRcx2ghOCA5uj4VXmsuOeEy1eWZFsNp+HOtBIxIzw/CILDP57XjdfTMFDW6b8E6
	cyJYbAniL+jk2dwxpWbJ6gg2UC7wjk/+R2TbAM6s9zlyW5/ZmUmm5Q+DIQa3EjIhISexRuAEWl0
	qFG48JjmvGUnZP0j1cK0Ot7lqmh54BtYYcRHci90ldKViZM0OkighVJkc/b83RUC3xlQ==
X-Received: by 2002:a17:902:ebcb:b0:2ae:5eab:132e with SMTP id d9443c01a7336-2b0b0a35055mr67436305ad.12.1774493294597;
        Wed, 25 Mar 2026 19:48:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76bbdcsm13039695ad.5.2026.03.25.19.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:48:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] firmware/tegra: add COMPILE_TEST
Date: Wed, 25 Mar 2026 19:47:56 -0700
Message-ID: <20260326024756.63502-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this driver specifically, there's no arch specific stuff needed.

Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
CLK_TEGRA_BPMP also depends on TEGRA_BPMP.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add a Kconfig symbol instead.
 v2: also build the tegra clk stuff.
 drivers/clk/Kconfig            | 7 +++++++
 drivers/clk/Makefile           | 2 +-
 drivers/firmware/tegra/Kconfig | 4 ++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5f..56295cc2b74f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -335,6 +335,13 @@ config CLK_LS1028A_PLLDIG
           features of the PLL are currently supported by the driver. By default,
           configured bypass mode with this PLL.

+config CLK_TEGRA
+	bool "Clock driver for Nvidia Tegra platforms"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	help
+	  This adds the clock driver support for Nvidia Tegra platforms
+	  using common clock framework.
+
 config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
 	default ARCH_XGENE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3416eea558c6..0e1331bd6295 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)		+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f..ae21f460807d 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra firmware driver"

 config TEGRA_IVC
 	bool "Tegra IVC protocol" if COMPILE_TEST
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
@@ -13,7 +13,7 @@ config TEGRA_IVC

 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
+	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
--
2.53.0

