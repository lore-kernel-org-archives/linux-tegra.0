Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D04418CC;
	Tue,  9 Jun 2026 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017723; cv=none; b=PVyhE15espQi5F2TCwEVoJ+M6A0VM02UR4V47wxiQOHP3rbESW8LcmRdfkx4UTC1HErNwrYc5u8anaPXo2KapgShQkCG7izCQYpQUvVatrcvMdYIxNnE+At+lAGS0vyvuCs0hqxnJCdx+niPe+kmlvaRlfxT9geMNcKjEbsJ5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017723; c=relaxed/simple;
	bh=y9XfLGpO2F9+W6YO/LJ0IOSOkJDaULwimy+6X8W02ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLOyeGUJfP7FU8U4TwJahrXpk/TVquhmnJ87+er379bv2OBZQNeVXP5CZVxGHZ3EEtg9J9VzLdO7+ssKofQYC938wAdbJCZBS5NgNd8wxWq7ZdJmUzYBCXpvfyrh5AVldffhW4zEH+HVH7GEIJO2nzqkbb/NhBmgPWIVnR3ctgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB981F00893;
	Tue,  9 Jun 2026 15:08:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Prathamesh Shete <pshete@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
Date: Tue,  9 Jun 2026 17:08:34 +0200
Message-ID: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
asking the user about this driver when configuring a kernel without
NVIDIA Tegra SoC support.

Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index c7507193044f4af3..eea7ec9688b6460b 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
 
 config PINCTRL_TEGRA238
 	tristate "NVIDIA Tegra238 pinctrl driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
 	default m if ARCH_TEGRA_238_SOC
 	select PINCTRL_TEGRA
 	help
-- 
2.43.0

