Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308805684;
	Tue,  3 Sep 2024 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370335; cv=none; b=VubInlK43bXgNLiITt4kEp5bKr+lkAWHn1o1TNnwCHJ1EtkHLq3VmjvLZczeJ9NsGhaitLJnuFy0f+ZzDJGrv/2BuSAodW8jvyFUGWckiaSoJZXR4xi4FvzdffsP6LDsQjKBMysPaQTL6wc9UKNBofnsw/wkIl/BXRU6YKXUzNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370335; c=relaxed/simple;
	bh=MMjjOmscQiumevRnZT3RgPpiEGiI+t4U1IBVrmUKeCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAEKcr/Qa9xnzb1gHexXBqwHG4tUvLPjfMMaQi2F+0cLuG0jmek7fphYakSu8wJMQY0PfKwI9q6azlSkUlF1dCcPNZM+fsV1brOOiba8tD52UPYNbwYXX0xgol0YHRnAaNTpEcYcHdw75PRLsWJyDxWUNH6NmCTGjNZZNgpOXMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=BEhArPy+; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="BEhArPy+"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id CAA7A200DF;
	Tue,  3 Sep 2024 15:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1725369741; bh=MMjjOmscQiumevRnZT3RgPpiEGiI+t4U1IBVrmUKeCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEhArPy+VtVGdzNZ4kl0FsJvgdbtkMWAnMJUOAduey84uUeKcoJab+53ogm9OdyC/
	 mW9XLPWdRgm9r4cBhGphT4wW+16te9nzSY537hG7OpG/i6IS+yYtWH4WsWYGxWsG8Y
	 IfqcdzEk1zuziRco5qUCUtWarKHAhKXvSZn9IYH62+AasPGMrOPImzqBDWKHjv135A
	 341ZMxdcMg5kRQ8fHoHuVWWscvcLk3d8pNq6KeeTKtciwVu1/wJEzzT2lhP8+0o+4Q
	 sLIMLnMv17JhchiQ5SZWS/daHy0cRQqrtFPddHNql3uD2vL4ewlOxOXnimbMkzsFeS
	 brRpcaT5Ao2JA==
From: Tomasz Maciej Nowak <tmn505@terefe.re>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-mm@kvack.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] arm64: tegra: p2180: Add mandatory compatible for WiFi node
Date: Tue,  3 Sep 2024 15:21:48 +0200
Message-ID: <20240903132200.3350-1-tmn505@terefe.re>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <202409030438.8tumAnp1-lkp@intel.com>
References: <202409030438.8tumAnp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Maciej Nowak <tmn505@gmail.com>

The dtschema requires to specify common ancestor which all SDIO chips are
derived from, so add accordingly.

Fixes: a50d5dcd2815 ("arm64: tegra: Wire up WiFi on Jetson TX1 module")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409030438.8tumAnp1-lkp@intel.com
Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index c00db75e3910..1c53ccc5e3cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -351,7 +351,7 @@ mmc@700b0200 {
 		#size-cells = <0>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4354-fmac";
+			compatible = "brcm,bcm4354-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(H, 2) IRQ_TYPE_LEVEL_HIGH>;
-- 
2.46.0

