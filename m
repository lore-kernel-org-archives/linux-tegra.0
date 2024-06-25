Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880714AD2B
	for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319906; cv=none; b=dAZtiZjegbeSFNR1Q/zq2xoHZeWX3VfPQLAebehKmZqfnqpQVxc2Sxa17cttn3CvJPZolwGTPYV/ZajT/Y92+bex7XQOwdxDlVzkbOD1vak/8tA3nbz7lhf/pUdFnTv7R0wtTLvjD34IN0b2n1e+xkXTDWgVbMLt1UhyKMGLFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319906; c=relaxed/simple;
	bh=5wgmUWPtNHEugHE9/ecP9fIUWqYMmyFgWiaSpdA3veQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o51R3VVrGz0MaooNarfpHPscFfLHTmtHlsq531t4Ne+U0TUb4UK4gZScoQSmSXgVQ2FcCnmOeEYk2Vozl6CW57r+bsYEtQy1oXvkJs1Kr5t2giVDS293rmt0RkK3FDWaukobvznXsWW90ZCOz5PfQ4dUPa7L2Cy5xRao3Fu8S1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sM5e9-0006jk-Cm; Tue, 25 Jun 2024 14:51:41 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 25 Jun 2024 14:51:41 +0200
Subject: [PATCH] reset: tegra-bpmp: allow building under COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-reset-compile-bpmp-v1-1-647e846303d8@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAFy9emYC/x3MTQqAIBBA4avErBsoM4WuEi3SxhroRzQiEO+et
 PwW7yWIFJgiDFWCQA9Hvs6Ctq7AbvO5EvJSDKIRslGix0CRbrTX4XknNP7waDonlZG6t1pACX0
 gx+8/HaecP6DiP3tkAAAA
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org

The Tegra BPMP reset driver can be compiled without TEGRA_BPMP being
enabled. Allow it to be built under COMPILE_TEST.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/Makefile      | 2 +-
 drivers/reset/tegra/Kconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 1b814f08fed7..27b0bbdfcc04 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -3,7 +3,7 @@ obj-y += core.o
 obj-y += hisilicon/
 obj-y += starfive/
 obj-y += sti/
-obj-$(CONFIG_ARCH_TEGRA) += tegra/
+obj-y += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
diff --git a/drivers/reset/tegra/Kconfig b/drivers/reset/tegra/Kconfig
index e4a9a389e98c..4a2d26d1210a 100644
--- a/drivers/reset/tegra/Kconfig
+++ b/drivers/reset/tegra/Kconfig
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RESET_TEGRA_BPMP
-	def_bool TEGRA_BPMP
+	bool "Tegra BPMP Reset Driver" if COMPILE_TEST
+	default TEGRA_BPMP

---
base-commit: eb5d88b1538850c6d9ddfcd0b59dc7c84831b530
change-id: 20240625-reset-compile-bpmp-b3f46b475c72

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

