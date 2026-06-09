Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61547D922;
	Tue,  9 Jun 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017734; cv=none; b=L9ER4lgOnSN7fI3JCeG22d2/aQOpzDHXiIdqpWBVjHvvOm4/xzCXgUIGFJvkBc7qvvrhdBykZn4YTua+WQwET3xBRXXOTPPmQP3un4A4CdHCK6qxl54L26P4SofCHOW4R4nRhC5ZdSyHYwLNsHaatFQqiiJBnwByU5e7bdmCI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017734; c=relaxed/simple;
	bh=SsgcI2ex5y479ZaXsVwXM4muoKoLvUOJjEjpijHTZQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNgHiONIAxRT9t2uPsgPyZIzNxykMGuIfsoDjGzgf9DWWF6/beU4oo7ooDGYI6In3z6vhL5PwelWDTrjnxViKBTXgxe1doJKPmyV0uCHgF/qtVPHdrAlROJ8xCMBqaWPgiLQRd4I9jVPPph7488UFpQK5p+jtVUvynwBFRk8/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FA01F00898;
	Tue,  9 Jun 2026 15:08:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Prathamesh Shete <pshete@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: tegra: PINCTRL_TEGRA264 should depend on ARCH_TEGRA
Date: Tue,  9 Jun 2026 17:08:35 +0200
Message-ID: <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVIDIA Tegra264 MAIN, AON, and UPHY pin controllers are only present
on NVIDIA Tegra264 SoCs.  Hence add a dependency on ARCH_TEGRA, to
prevent asking the user about this driver when configuring a kernel
without NVIDIA Tegra SoC support.

Fixes: c98506206912dd0d ("pinctrl: tegra: Add Tegra264 pinmux driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index eea7ec9688b6460b..39a93733efa2f0a9 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -50,6 +50,7 @@ config PINCTRL_TEGRA238
 
 config PINCTRL_TEGRA264
 	tristate "NVIDIA Tegra264 pinctrl driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
 	default m if ARCH_TEGRA_264_SOC
 	select PINCTRL_TEGRA
 	help
-- 
2.43.0

