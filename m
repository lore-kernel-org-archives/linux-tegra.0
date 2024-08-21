Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A916E86F;
	Wed, 21 Aug 2024 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267187; cv=none; b=VwtSRTkdzbFzu6rr7+4uhUUQ7RmlIq1lhJbs4VpBKDdEvIiwHDwamWtRh1ouC5nuvS5yRXOBulqTE5bNDvnfS7WR1HyuFo20Hl3IlUKWhnrDRdOC9D8Wl3tYRF+Tg2RhLdJWchAy3vB34MSAuKZ+oeQvmoxi1+D814X/6x0b978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267187; c=relaxed/simple;
	bh=c7tSgeaLvoQaC7WKtAwIRpIwIKeaEobr9xJ0nf2lvfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWi3uSHocea9dHf6ybzbBkAgsIc6SYBCWkEUbXw5FhTgqmpQfh84FPQ4fJevszxrus1iw26qsqRJtCxXR0RG6B1ElQXzKrVk2Cf/OmGXqxCBmHFoG8fOW0t50LfSa0ebCgSzQH1Zygb/2SX2xJqaioAVtZFyqNZK8uS/5uR49e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=p1jb1+ti; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="p1jb1+ti"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id 7C9B3202CA;
	Wed, 21 Aug 2024 20:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1724266716; bh=c7tSgeaLvoQaC7WKtAwIRpIwIKeaEobr9xJ0nf2lvfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1jb1+tiXCqgPP4fE37+Q8THQIBiYBm4i11mh5KdZ3uhtIWCmyvAfcNhdPOBeQw59
	 vV4vcybsuw9aIipI8olKywyTkAQgDf7JDvgeQaP+8M3NhphxWmi97fn6dBQLKZh7BG
	 73+Mu8cxWbkk2BJxIKpcVlIdqDvQCWf2FMjkAa2y/j461Ufq52tRRuk1Ag8WBUcYDv
	 SMOMNhB7Hh5j/c413aI7AZ1/j0lisUnxF25bh80bjkMBJy9dQkmhfBsT2yzEGrRTJH
	 7rV0koPg+PwewebADh478vTIVgObeTphRP7EHzBPTX5EMjun0o65HoxVGi2OnxO4Rn
	 u3V2mNSvo3SYg==
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
Subject: [PATCH 1/3] arm64: tegra: wire up power sensors on Jetson TX1 DevKit
Date: Wed, 21 Aug 2024 20:58:03 +0200
Message-ID: <20240821185829.20997-2-tmn505@terefe.re>
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

One INA3221 sensor is located on P2180 module and the other two are on
P2597 base board.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 29 +++++++++++
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 50 +++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 0ae5a44f7d07..f8b20af1fd3d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -33,6 +33,35 @@ serial@70006000 {
 		status = "okay";
 	};
 
+	i2c@7000c400 {
+		status = "okay";
+
+		power-sensor@40 {
+			compatible = "ti,ina3221";
+			reg = <0x40>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			input@0 {
+				reg = <0x0>;
+				label = "VDD_IN";
+				shunt-resistor-micro-ohms = <20000>;
+			};
+
+			input@1 {
+				reg = <0x1>;
+				label = "VDD_GPU";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			input@2 {
+				reg = <0x2>;
+				label = "VDD_CPU";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+		};
+	};
+
 	i2c@7000c500 {
 		status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b4a1108c2dd7..e97f31c1f625 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1319,6 +1319,56 @@ i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		power-sensor@42 {
+			compatible = "ti,ina3221";
+			reg = <0x42>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			input@0 {
+				reg = <0x0>;
+				label = "VDD_MUX";
+				shunt-resistor-micro-ohms = <20000>;
+			};
+
+			input@1 {
+				reg = <0x1>;
+				label = "VDD_5V_IO_SYS";
+				shunt-resistor-micro-ohms = <5000>;
+			};
+
+			input@2 {
+				reg = <0x2>;
+				label = "VDD_3V3_SYS";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+		};
+
+		power-sensor@43 {
+			compatible = "ti,ina3221";
+			reg = <0x43>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			input@0 {
+				reg = <0x0>;
+				label = "VDD_3V3_IO";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			input@1 {
+				reg = <0x1>;
+				label = "VDD_1V8_IO";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			input@2 {
+				reg = <0x2>;
+				label = "VDD_M2_IN";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+		};
+
 		exp1: gpio@74 {
 			compatible = "ti,tca9539";
 			reg = <0x74>;
-- 
2.46.0

