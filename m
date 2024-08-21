Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50E13A24D;
	Wed, 21 Aug 2024 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267186; cv=none; b=gM/x50B/YLxeXcogBX4Ff0ejCOwQz2kACkfRa+KUGLkE25vZ1zy4PuE9phwX7Cs06rKC3vmVPvvQbYXB+A2jZzRnh3M+qgqb2nw13TW84LX3G5xcQwnS9YV3snpO3n4JlEj5XSVtS3uqs7pBFCQK81GSWnDvi5qIiYwApZATuCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267186; c=relaxed/simple;
	bh=hd9wkcPN4CmAARSYR+3zLHtDIyZfHClpBM/3EtyxlK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJ4eWBkO3FB5monCyeSXRQV3abms8/1yz95azUNjG0mD2h6QC7jKrqJcsv8UFeiu/TKxdDHQOtwF+wvgUQeVDjJwjhDFS5QzjXZdCYb+n7sLm5HnsyqISlQSdwhq3SuHb3dn1Z1kJNr+Vz6SRL//hz5T7kGt6A2ObY97v2Kw3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=dkEopwhy; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="dkEopwhy"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id 92009203EC;
	Wed, 21 Aug 2024 20:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1724266718; bh=hd9wkcPN4CmAARSYR+3zLHtDIyZfHClpBM/3EtyxlK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dkEopwhyq/Fsxyy9feLabgSDb98P3zxOLUuEhkStx/7eIFRbNsX6mvhwRKKsouMaL
	 qcrne96JvPrzJeTiKPYonuy+GQSaLoPiUVgf76/KbHS07TN/cREakHaDAtMiUdAHg1
	 tTl/TWiF6Q5bB2I0UOEi+sYlkIDwPwAJfWkz7RcvwZG0Kak+OAs8/tLWrkLiWX7Q5J
	 MQVjPrRO2r3lsMSta4gC67xplCrIFUAe2rbaT6boLqflHPbgQrbS2S+XxS5xl11wHy
	 xpa60cP7d2adQb512FRShPPPjjOvFg4GwzW0UmRyKs4jcgugJL9q3XZHGv2Up6Xt0P
	 f3CYYYqvSyPYQ==
From: Tomasz Maciej Nowak <tmn505@terefe.re>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolas Chauvet <kwizart@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH 3/3] arm64: tegra: wire up WiFi on Jetson TX1 module
Date: Wed, 21 Aug 2024 20:58:05 +0200
Message-ID: <20240821185829.20997-4-tmn505@terefe.re>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821185829.20997-1-tmn505@terefe.re>
References: <20240821185829.20997-1-tmn505@terefe.re>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Maciej Nowak <tmn505@gmail.com>

P2180 modules have WiFi in form of BCM4354 chip, and kernel driver
supports this one, so enable it for all users. The necessary calibration
file can be obtained from Jetson Linux Archive. nvram.txt file is located
in "Driver Package (BSP)" in
nv_tegra/l4t_deb_packages/nvidia-l4t-firmware_<version>_arm64.deb
archive. The rest of necessary blobs can be obtained from official
Linux Firmware repository or (newer ones) from Infineon
ifx-linux-firmware repository (look in older releases).

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 64b8668fcdcd..c00db75e3910 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -340,6 +340,25 @@ pmc@7000e400 {
 		nvidia,sys-clock-req-active-high;
 	};
 
+	mmc@700b0200 {
+		status = "okay";
+		bus-width = <4>;
+		non-removable;
+		power-gpios = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+		vqmmc-supply = <&vdd_1v8>;
+		vmmc-supply = <&vdd_3v3_sys>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		wifi@1 {
+			compatible = "brcm,bcm4354-fmac";
+			reg = <1>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 2) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
 	/* eMMC */
 	mmc@700b0600 {
 		status = "okay";
-- 
2.46.0

