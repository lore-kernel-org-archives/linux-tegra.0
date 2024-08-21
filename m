Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15D1607A1;
	Wed, 21 Aug 2024 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267186; cv=none; b=QtWLXZdB9TEzpjsT7cGLV/sUobwT4PzPQxaiTcZB6KKtdVdqgFE5tOAKHymAfwlrBOvy+8WRV2g/oLu4qVo95YqKyORBjhgw3/gDE1kvfuYagjahkdCDaZe1szbV8WG4cBM30O0bWvQe5fEVHdt4lsxd5LrWBL6akLwHsCD1S0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267186; c=relaxed/simple;
	bh=fcyVkeBqILTYJFgyq9igStQjjXNj/PBSoqZEcgR5KQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lD1SOhAIOZjws3GkE3LJj3fZyuB0EIhOEucbvaQBuucKpuQJTL4Crh96/0lTcexJ8tHCyUxeZKzjmCY5CceV3Iayu1oD7ljs96Eqbui200szwmas0gQhIpa7/iE6lBqI13YYI0AXKalBfHFFHFjxt6AyoP8uNzF44cXFrwkAopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=i8RUkTgI; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="i8RUkTgI"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id 0FC88203EB;
	Wed, 21 Aug 2024 20:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1724266717; bh=fcyVkeBqILTYJFgyq9igStQjjXNj/PBSoqZEcgR5KQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i8RUkTgIpf3IW2WvMJgmExcEOZOeO5Axtse78UFaZOEqdouYo3fL9USeulWJwpg6H
	 2PlQ6nNC4WI9Gy+l/ZYDgUei5C/Tzig6JvWiTmB2py1dgVX6hmvtcfwdAmC3W24tTK
	 KbpckTff9+DJzpd4qZSTH8EtWGaaFwZF/Syn+PJqbeUsr9bl3tQTuDbGRbdgQKvaaF
	 rLhfqSqRbEGuSCBeLU6Jquh1FJeTs7Vv4eQ2hJXzKuwxgcNqD/hiq1y/YV6THvWHRA
	 rs8aljgSwaLMoPU6kdqr8jr7f7RvNE/r9iz9F+px353ib+DdPY9uZxXZMh3pCrEgk2
	 T6vgyNRt3gP0Q==
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
Subject: [PATCH 2/3] arm64: tegra: wire up Bluetooth on Jetson TX1 module
Date: Wed, 21 Aug 2024 20:58:04 +0200
Message-ID: <20240821185829.20997-3-tmn505@terefe.re>
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

P2180 modules have Bluetooth in form of BCM4354 chip, and kernel driver
supports this one, so enable it for all users. The necessary firmware
can be obtained from Jetson Linux Archive. bcm4354.hcd file is located
in "Driver Package (BSP)" in
nv_tegra/l4t_deb_packages/nvidia-l4t-firmware_<version>_arm64.deb
archive.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index f8b20af1fd3d..64b8668fcdcd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -33,6 +33,22 @@ serial@70006000 {
 		status = "okay";
 	};
 
+	serial@70006300 {
+		/delete-property/ reg-shift;
+		status = "okay";
+		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+
+		bluetooth {
+			compatible = "brcm,bcm43540-bt";
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 5) IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "host-wakeup";
+		};
+	};
+
 	i2c@7000c400 {
 		status = "okay";
 
-- 
2.46.0

