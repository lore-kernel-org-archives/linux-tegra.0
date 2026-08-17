Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967A3DAACA
	for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977132; cv=none; b=C79lrkA1MeGY+KFQQMpefTsnFXr0YYW0yx6sCvY00DaqR9toffJh2HQ24NdtYBVRehehzu+SOPXiEYqO3J3RbKzuCFlZtOY8u+Z41HdHF4KRtZZHCxT9U9PRE95XcSNLilszJADTRGs9rWZwlu+8Ckup0KkYM1WWjgCdrhyq8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977132; c=relaxed/simple;
	bh=J+Vagil8Dh++v3QLtptmahfxoprD2ifDM3nwN0F00sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFF7fHy7MTvyggrCHywok0hOqSs8i/meAN898zRLXJ+YvsuLIhxS8dhv/W9mO2Xk9gKcCk/KitHOf14Bb4j4qyx1dolx7Umjrynqrn0nbjwqPl69mFTnHGzffG1AaFkVGt6WDQ7dIrYzXutujfA0pynI/W9qAPYVcEHNTzbQmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnSMx2nU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnSMx2nU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23D21F000E9;
	Mon, 17 Aug 2026 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786977131;
	bh=ik+BN2Q09uzPyakRTsJGzn2r/tUrpCcYIBvJhMv+rWE=;
	h=From:To:Cc:Subject:Date;
	b=jnSMx2nUgMkJQeWctAUT29IJWl9o0DsQ/R+fNngwnTX0RKOWpX9IuWRBUn0EMVc8O
	 LYrWqta9t7b0U9u9F4fMbHzFRo7ufbjzwH6OaHVDxzJ/FMU9yOqegyS5Zfso8qYJkx
	 Z+bgzkmnZC/aNoL9I4Y1R/lT/PtBZBDG+8/Mfthl3ZD1Cg8ckQ6C+XFjnZfIO0oBZ7
	 77Ay8wI5cL2HDfPP2ZIWibW+1WMlU55lrZsaExfZihbE/uSAjAt6y3Hhx2oLddDmOk
	 5wcGGfpz065K7O4v79ZNo7+EJDXXEts6hmz0XyUhQ/LWdnPF1xpVtmjWNw24b4MrzX
	 4dJsW9BAU7w1g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
Date: Mon, 17 Aug 2026 16:32:05 +0200
Message-ID: <20260817143205.287870-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The built-in RTC is mostly useful for testing suspend/resume cycles.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index c4ba3322ed9a..113ecf297378 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -13,6 +13,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	bus@0 {
+		rtc@c2c0000 {
+			status = "okay";
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.55.0

