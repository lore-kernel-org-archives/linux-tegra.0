Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA281A5B92;
	Fri, 11 Jul 2025 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222255; cv=none; b=FsZCwAZ9eNxcMQ5+wHsIX6Mk/7iNp6dfWbLcLxQf5d6nJrnoslFvqDK5V+v/jTI8vFvZ2fyZEFTc+k4uSsLEmEss+RdsLKgDzQdqmP0s1Ar37wePEEwS2XhoXw6Wu5CY6FWnAA1B+pYxDhL1ZGhRedB4xqBruTmdfv3LP4qhh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222255; c=relaxed/simple;
	bh=37Pgz+r75whpZc7QV2kqBUgQDwQOZLFhYZc/hTLJoLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZqAi//j9G4WGAKtBgr8jxwDsDc8WicDhOSte4S6G7BeJ/ho0GK88YF+evVdHJEG47wnGiEa1C+t4A76F5vE4J9Hl/oBZThsWQpiefLKyA4K58ftWt17PEs6gcjHq8JcSttBpUUaXmhMrH2tdAbmjAHA7C1+jcvJHxLtLNy78YjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOij50Uc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOij50Uc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59F6C4CEF5;
	Fri, 11 Jul 2025 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752222254;
	bh=37Pgz+r75whpZc7QV2kqBUgQDwQOZLFhYZc/hTLJoLQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EOij50UcYEeB+STt1VGIRyBdBwBbU78nGG4mqqUMx7oeNwElaXggFO7vg7XvZ8PGb
	 F2fkxD+ZWK78buAQxTekgiOPNljNz5gweyrPxmyZu4tAdBVLJSr/Z9RDNuhrXfFgOc
	 oRYdl75f9cgb1VZalUwl+v6Ob3tyUD/Z0ePq8pPRf5y8froOQS5dDKOH2bvBnGfRDu
	 7VSyHmMvQTy4fiy4cKxwZnYasugOxIOxTojLlbbma4kdjCziBviAB7Qt4mwYvGN7Je
	 sutjpGCq4smw/BgX95DgkQxvqhWD9I+na/5SUXmBO6I8tTgkNGgI0IGlResa+fKTIm
	 p3b+GriIFl8SQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: bpmp: fix build failure for tegra264-only config
Date: Fri, 11 Jul 2025 10:24:03 +0200
Message-Id: <20250711082409.1398497-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The definition of tegra186_bpmp_ops was not updated in sync with the use
in bpmp.c:

drivers/firmware/tegra/bpmp.c:856:17: error: 'tegra186_bpmp_ops' undeclared here (not in a function); did you mean 'tegra_bpmp_ops'?
  856 |         .ops = &tegra186_bpmp_ops,
aarch64-linux-ld: drivers/firmware/tegra/bpmp.o:(.rodata+0x2f0): undefined reference to `tegra186_bpmp_ops'

Update the Makefile as needed.

There is really no need to hide the declaration based on the configuration,
so just expose it unconditionally so it never has to be updated again
for the next SoC.

Fixes: 94bce2cf7cf6 ("firmware: tegra: bpmp: Add support on Tegra264")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/tegra/Makefile       | 1 +
 drivers/firmware/tegra/bpmp-private.h | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 620cf3fdd607..41e2e4dc31d6 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
 obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 182bfe396516..07c3d46abb87 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -23,13 +23,7 @@ struct tegra_bpmp_ops {
 	int (*resume)(struct tegra_bpmp *bpmp);
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
-#endif
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
-#endif
 
 #endif
-- 
2.39.5

