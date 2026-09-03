Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6432D3D47A8
	for <linux-tegra@vger.kernel.org>; Thu,  3 Sep 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429298; cv=none; b=Vm3jUGbDhiuHLiN+XdA3pt+m3VvrwJktjnOm3jo6oNpkI8Eqq4BIZjjB1lpIriuGXb1nOCP1D8koHTCTj7TDFpI6M2KKhbzCyDmf9r/tEW+rhYdZLo3MHJPN/JwX5DQVTwO9tdUOvkPY8Y3ANLcveEUlOFhv8hH21YwXLggg72Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429298; c=relaxed/simple;
	bh=Rof4/Jbo7HzdkcbgHbJl3z849CHYpyRMf0U8nm+Qr04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rmwvY5vEj/V0wSn7y3pBVBUmQwechCZIDwXcO7ktXtOXeh7JvPp3olSnZSMSlg/FhRaCox6n0n8PAfaa2mEtEUoDgG1BPIIb1AOWPDVZHU7MF/0PZv+Cu/32P148PAi+7QN9VDCD8HLIGTr5OOSiSKM8hHWu75RTv08ScPvUXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rd/boRIB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rd/boRIB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F9F44E414EB;
	Thu,  3 Sep 2026 09:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62149602B8;
	Thu,  3 Sep 2026 09:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4954A11C79654;
	Thu,  3 Sep 2026 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788429285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HLsKVkGq4oCMeGMkNuP8sFb8B9v4aAwyP3aQx40Sv4Y=;
	b=rd/boRIB9nVFS7rHul+v93+rMvyBfX02Y5oNA0nmYvuGSSY/jzfT1RvGng19PYthbEpg3c
	7oUsimnTMZ8KxQYoKSMrbM5an57mm7tpAtB1GQ7wVsCHxOCqxFC/gfYVo0dq8jXSe06kRa
	LWgrU707hKGbTtWUOfqzg02vJO7FRqRA15SqtppkXnJ6G2VgtJd299OQL2KnPthwEVWf9w
	zVxURurrmAFVGbZsJTfkbkX1tS8UfNmsc3GMp00X0QVMTciU/rzbAvcF63sg+jSNU2oP1K
	1/fweltqTxmel5/yaZhFLdNTs0SWP0g2zwdlDbCgyaq5vgmhEHq3CC00V0rvEQ==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Date: Thu, 03 Sep 2026 11:54:10 +0200
Subject: [PATCH v2] arm64: tegra: Move Tegra210 AHUB audio ports/endpoints
 to SoC DTSI
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-smaug-audio_ports-v2-1-aeadeb500145@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU0pT135H4aY0g4wRhjSKURD+
 HcB9y5Pcu65i2DwCCyu0SI8zMhIwwb6FAnbmaEFiW5joZXO1UUlknsztdJMDukxkg8sC8jSomm
 MKq0V22700OD7aN6rH/NUP8GGPbQbHXIg/zlO53j3/vXnWMbSpbnKkkS70qW3mii8cDhb6kW1r
 usX9z1UYsYAAAA=
X-Change-ID: 20260903-smaug-audio_ports-7e547ffa08cc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=69083;
 i=diogo.ivo@bootlin.com; h=from:subject:message-id;
 bh=Rof4/Jbo7HzdkcbgHbJl3z849CHYpyRMf0U8nm+Qr04=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqmUPj/RCZKbWsXZIAmemxcG2CMFB40hXYe+c61
 VvOA8OOTCSJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCaplD4wAKCRAGvnxbVl7J
 Ra3tEACIHfpWNcfJiOtTAuTAUs4c54nP/5y5RDj0bI3VEl/A1BaMDBwpS6D0OaZaZs1Q+FpnCsk
 AkeQWoZVdwm5kyevylvBDcEyhtpN5V0wNvIij5u/1T8ub0eJDEh6bR/ZJYMDP8tFSTISUzpU7Z3
 WsWmoKU2dRdwzs/Jb50VYhG3LGnE7H7Rh1dJL1vyPA4EqD+aLwGijihVZB3yQ0k4FeVfb84x/A2
 n4NAB/sn1b+m6FEFFCWcBauCCnBhKHMpRx2sAnBNTspkYe8xuKI7xMqIqrvdGOAUaBQhJD8vi1P
 H0aOMoiR8sseBwKmWKDhmzGniQmXg9OzQ6/qFR/wZH0CMB2MRjcldN3jdkvnPdGVPS487KoQDdx
 bxdU36T1MNYwXGytvGMdZVVSWfunekNnbp7UqBCt5sLNitwAU+4IOTmVcjZbNHI8wlX82aEtYWn
 VYlHCOmLepfoMAaNyboxIfgnip4mheIoSWIUhNEIO9FENyQzbMj3DyyI1rGuPF2BO06xez7u29E
 cGFF2sQ6PcoC/CtCAqoRIkAvNaQegJj0JtJP6BhBFZklVpIIr8bUmRsgZBtSS6D5bqZmk5abGCo
 0Kx1ToT4aj6vfu0XEeOiJBAm35UeOG3OLJfEHCOmtJ0Q8Tssh1fKUpRt1zaE5zYkbWxBdZZkxNs
 JMFT7fbif7wKhSA==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3

The AHUB internal audio ports and endpoints (crossbar connections
between I2S, DMIC, SFC, MVC, AMX, ADX, MIXER, OPE, and the AHUB)
describe the SoC's internal audio routing fabric, not board-specific
wiring. Move them into tegra210.dtsi so they can be shared by all
Tegra210-based boards.

No functional changes intended.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
Changes in v2:
- Remove the port definitions also in tegra210-p3450-0000.dtb as pointed
  out by Sashiko and adjust commit message accordingly.
- Link to v1: https://patch.msgid.link/20260903-smaug-audio_ports-v1-1-d4605332d8d4@bootlin.com
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1120 --------------------
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1001 -----------------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 1120 +++++++++++++++++++-
 3 files changed, 1119 insertions(+), 2122 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 627abf51a5a4..9610781e4417 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -129,1206 +129,86 @@ admaif@702d0000 {
 
 			i2s@702d1000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s1_ep>;
-						};
-					};
-
-					i2s1_port: port@1 {
-						reg = <1>;
-
-						i2s1_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			i2s@702d1100 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s2_ep>;
-						};
-					};
-
-					i2s2_port: port@1 {
-						reg = <1>;
-
-						i2s2_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			i2s@702d1200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s3_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s3_ep>;
-						};
-					};
-
-					i2s3_port: port@1 {
-						reg = <1>;
-
-						i2s3_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			i2s@702d1300 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s4_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s4_ep>;
-						};
-					};
-
-					i2s4_port: port@1 {
-						reg = <1>;
-
-						i2s4_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			i2s@702d1400 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s5_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s5_ep>;
-						};
-					};
-
-					i2s5_port: port@1 {
-						reg = <1>;
-
-						i2s5_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			sfc@702d2000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc1_in_ep>;
-						};
-					};
-
-					sfc1_out_port: port@1 {
-						reg = <1>;
-
-						sfc1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc1_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc2_in_ep>;
-						};
-					};
-
-					sfc2_out_port: port@1 {
-						reg = <1>;
-
-						sfc2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc2_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2400 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc3_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc3_in_ep>;
-						};
-					};
-
-					sfc3_out_port: port@1 {
-						reg = <1>;
-
-						sfc3_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc3_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2600 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc4_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc4_in_ep>;
-						};
-					};
-
-					sfc4_out_port: port@1 {
-						reg = <1>;
-
-						sfc4_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc4_out_ep>;
-						};
-					};
-				};
 			};
 
 			amx@702d3000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						amx1_in1_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-
-						amx1_in2_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in2_ep>;
-						};
-					};
-
-					port@2 {
-						reg = <2>;
-
-						amx1_in3_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in3_ep>;
-						};
-					};
-
-					port@3 {
-						reg = <3>;
-
-						amx1_in4_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in4_ep>;
-						};
-					};
-
-					amx1_out_port: port@4 {
-						reg = <4>;
-
-						amx1_out_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_out_ep>;
-						};
-					};
-				};
 			};
 
 			amx@702d3100 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						amx2_in1_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-
-						amx2_in2_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in2_ep>;
-						};
-					};
-
-					amx2_in3_port: port@2 {
-						reg = <2>;
-
-						amx2_in3_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in3_ep>;
-						};
-					};
-
-					amx2_in4_port: port@3 {
-						reg = <3>;
-
-						amx2_in4_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in4_ep>;
-						};
-					};
-
-					amx2_out_port: port@4 {
-						reg = <4>;
-
-						amx2_out_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_out_ep>;
-						};
-					};
-				};
 			};
 
 			adx@702d3800 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						adx1_in_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_in_ep>;
-						};
-					};
-
-					adx1_out1_port: port@1 {
-						reg = <1>;
-
-						adx1_out1_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out1_ep>;
-						};
-					};
-
-					adx1_out2_port: port@2 {
-						reg = <2>;
-
-						adx1_out2_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out2_ep>;
-						};
-					};
-
-					adx1_out3_port: port@3 {
-						reg = <3>;
-
-						adx1_out3_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out3_ep>;
-						};
-					};
-
-					adx1_out4_port: port@4 {
-						reg = <4>;
-
-						adx1_out4_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out4_ep>;
-						};
-					};
-				};
 			};
 
 			adx@702d3900 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						adx2_in_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_in_ep>;
-						};
-					};
-
-					adx2_out1_port: port@1 {
-						reg = <1>;
-
-						adx2_out1_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out1_ep>;
-						};
-					};
-
-					adx2_out2_port: port@2 {
-						reg = <2>;
-
-						adx2_out2_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out2_ep>;
-						};
-					};
-
-					adx2_out3_port: port@3 {
-						reg = <3>;
-
-						adx2_out3_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out3_ep>;
-						};
-					};
-
-					adx2_out4_port: port@4 {
-						reg = <4>;
-
-						adx2_out4_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out4_ep>;
-						};
-					};
-				};
 			};
 
 			dmic@702d4000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						dmic1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic1_ep>;
-						};
-					};
-
-					dmic1_port: port@1 {
-						reg = <1>;
-
-						dmic1_dap_ep: endpoint {
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			dmic@702d4100 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						dmic2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic2_ep>;
-						};
-					};
-
-					dmic2_port: port@1 {
-						reg = <1>;
-
-						dmic2_dap_ep: endpoint {
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			dmic@702d4200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						dmic3_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic3_ep>;
-						};
-					};
-
-					dmic3_port: port@1 {
-						reg = <1>;
-
-						dmic3_dap_ep: endpoint {
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			processing-engine@702d8000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						ope1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_ope1_in_ep>;
-						};
-					};
-
-					ope1_out_port: port@1 {
-						reg = <0x1>;
-
-						ope1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_ope1_out_ep>;
-						};
-					};
-				};
 			};
 
 			processing-engine@702d8400 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						ope2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_ope2_in_ep>;
-						};
-					};
-
-					ope2_out_port: port@1 {
-						reg = <0x1>;
-
-						ope2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_ope2_out_ep>;
-						};
-					};
-				};
 			};
 
 			mvc@702da000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						mvc1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_mvc1_in_ep>;
-						};
-					};
-
-					mvc1_out_port: port@1 {
-						reg = <1>;
-
-						mvc1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_mvc1_out_ep>;
-						};
-					};
-				};
 			};
 
 			mvc@702da200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						mvc2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_mvc2_in_ep>;
-						};
-					};
-
-					mvc2_out_port: port@1 {
-						reg = <1>;
-
-						mvc2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_mvc2_out_ep>;
-						};
-					};
-				};
 			};
 
 			amixer@702dbb00 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						mixer_in1_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <0x1>;
-
-						mixer_in2_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in2_ep>;
-						};
-					};
-
-					port@2 {
-						reg = <0x2>;
-
-						mixer_in3_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in3_ep>;
-						};
-					};
-
-					port@3 {
-						reg = <0x3>;
-
-						mixer_in4_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in4_ep>;
-						};
-					};
-
-					port@4 {
-						reg = <0x4>;
-
-						mixer_in5_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in5_ep>;
-						};
-					};
-
-					port@5 {
-						reg = <0x5>;
-
-						mixer_in6_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in6_ep>;
-						};
-					};
-
-					port@6 {
-						reg = <0x6>;
-
-						mixer_in7_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in7_ep>;
-						};
-					};
-
-					port@7 {
-						reg = <0x7>;
-
-						mixer_in8_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in8_ep>;
-						};
-					};
-
-					port@8 {
-						reg = <0x8>;
-
-						mixer_in9_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in9_ep>;
-						};
-					};
-
-					port@9 {
-						reg = <0x9>;
-
-						mixer_in10_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in10_ep>;
-						};
-					};
-
-					mixer_out1_port: port@a {
-						reg = <0xa>;
-
-						mixer_out1_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out1_ep>;
-						};
-					};
-
-					mixer_out2_port: port@b {
-						reg = <0xb>;
-
-						mixer_out2_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out2_ep>;
-						};
-					};
-
-					mixer_out3_port: port@c {
-						reg = <0xc>;
-
-						mixer_out3_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out3_ep>;
-						};
-					};
-
-					mixer_out4_port: port@d {
-						reg = <0xd>;
-
-						mixer_out4_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out4_ep>;
-						};
-					};
-
-					mixer_out5_port: port@e {
-						reg = <0xe>;
-
-						mixer_out5_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out5_ep>;
-						};
-					};
-				};
-			};
-
-			ports {
-				xbar_i2s1_port: port@a {
-					reg = <0xa>;
-
-					xbar_i2s1_ep: endpoint {
-						remote-endpoint = <&i2s1_cif_ep>;
-					};
-				};
-
-				xbar_i2s2_port: port@b {
-					reg = <0xb>;
-
-					xbar_i2s2_ep: endpoint {
-						remote-endpoint = <&i2s2_cif_ep>;
-					};
-				};
-
-				xbar_i2s3_port: port@c {
-					reg = <0xc>;
-
-					xbar_i2s3_ep: endpoint {
-						remote-endpoint = <&i2s3_cif_ep>;
-					};
-				};
-
-				xbar_i2s4_port: port@d {
-					reg = <0xd>;
-
-					xbar_i2s4_ep: endpoint {
-						remote-endpoint = <&i2s4_cif_ep>;
-					};
-				};
-
-				xbar_i2s5_port: port@e {
-					reg = <0xe>;
-
-					xbar_i2s5_ep: endpoint {
-						remote-endpoint = <&i2s5_cif_ep>;
-					};
-				};
-
-				xbar_dmic1_port: port@f {
-					reg = <0xf>;
-
-					xbar_dmic1_ep: endpoint {
-						remote-endpoint = <&dmic1_cif_ep>;
-					};
-				};
-
-				xbar_dmic2_port: port@10 {
-					reg = <0x10>;
-
-					xbar_dmic2_ep: endpoint {
-						remote-endpoint = <&dmic2_cif_ep>;
-					};
-				};
-
-				xbar_dmic3_port: port@11 {
-					reg = <0x11>;
-
-					xbar_dmic3_ep: endpoint {
-						remote-endpoint = <&dmic3_cif_ep>;
-					};
-				};
-
-				xbar_sfc1_in_port: port@12 {
-					reg = <0x12>;
-
-					xbar_sfc1_in_ep: endpoint {
-						remote-endpoint = <&sfc1_cif_in_ep>;
-					};
-				};
-
-				port@13 {
-					reg = <0x13>;
-
-					xbar_sfc1_out_ep: endpoint {
-						remote-endpoint = <&sfc1_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc2_in_port: port@14 {
-					reg = <0x14>;
-
-					xbar_sfc2_in_ep: endpoint {
-						remote-endpoint = <&sfc2_cif_in_ep>;
-					};
-				};
-
-				port@15 {
-					reg = <0x15>;
-
-					xbar_sfc2_out_ep: endpoint {
-						remote-endpoint = <&sfc2_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc3_in_port: port@16 {
-					reg = <0x16>;
-
-					xbar_sfc3_in_ep: endpoint {
-						remote-endpoint = <&sfc3_cif_in_ep>;
-					};
-				};
-
-				port@17 {
-					reg = <0x17>;
-
-					xbar_sfc3_out_ep: endpoint {
-						remote-endpoint = <&sfc3_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc4_in_port: port@18 {
-					reg = <0x18>;
-
-					xbar_sfc4_in_ep: endpoint {
-						remote-endpoint = <&sfc4_cif_in_ep>;
-					};
-				};
-
-				port@19 {
-					reg = <0x19>;
-
-					xbar_sfc4_out_ep: endpoint {
-						remote-endpoint = <&sfc4_cif_out_ep>;
-					};
-				};
-
-				xbar_mvc1_in_port: port@1a {
-					reg = <0x1a>;
-
-					xbar_mvc1_in_ep: endpoint {
-						remote-endpoint = <&mvc1_cif_in_ep>;
-					};
-				};
-
-				port@1b {
-					reg = <0x1b>;
-
-					xbar_mvc1_out_ep: endpoint {
-						remote-endpoint = <&mvc1_cif_out_ep>;
-					};
-				};
-
-				xbar_mvc2_in_port: port@1c {
-					reg = <0x1c>;
-
-					xbar_mvc2_in_ep: endpoint {
-						remote-endpoint = <&mvc2_cif_in_ep>;
-					};
-				};
-
-				port@1d {
-					reg = <0x1d>;
-
-					xbar_mvc2_out_ep: endpoint {
-						remote-endpoint = <&mvc2_cif_out_ep>;
-					};
-				};
-
-				xbar_amx1_in1_port: port@1e {
-					reg = <0x1e>;
-
-					xbar_amx1_in1_ep: endpoint {
-						remote-endpoint = <&amx1_in1_ep>;
-					};
-				};
-
-				xbar_amx1_in2_port: port@1f {
-					reg = <0x1f>;
-
-					xbar_amx1_in2_ep: endpoint {
-						remote-endpoint = <&amx1_in2_ep>;
-					};
-				};
-
-				xbar_amx1_in3_port: port@20 {
-					reg = <0x20>;
-
-					xbar_amx1_in3_ep: endpoint {
-						remote-endpoint = <&amx1_in3_ep>;
-					};
-				};
-
-				xbar_amx1_in4_port: port@21 {
-					reg = <0x21>;
-
-					xbar_amx1_in4_ep: endpoint {
-						remote-endpoint = <&amx1_in4_ep>;
-					};
-				};
-
-				port@22 {
-					reg = <0x22>;
-
-					xbar_amx1_out_ep: endpoint {
-						remote-endpoint = <&amx1_out_ep>;
-					};
-				};
-
-				xbar_amx2_in1_port: port@23 {
-					reg = <0x23>;
-
-					xbar_amx2_in1_ep: endpoint {
-						remote-endpoint = <&amx2_in1_ep>;
-					};
-				};
-
-				xbar_amx2_in2_port: port@24 {
-					reg = <0x24>;
-
-					xbar_amx2_in2_ep: endpoint {
-						remote-endpoint = <&amx2_in2_ep>;
-					};
-				};
-
-				xbar_amx2_in3_port: port@25 {
-					reg = <0x25>;
-
-					xbar_amx2_in3_ep: endpoint {
-						remote-endpoint = <&amx2_in3_ep>;
-					};
-				};
-
-				xbar_amx2_in4_port: port@26 {
-					reg = <0x26>;
-
-					xbar_amx2_in4_ep: endpoint {
-						remote-endpoint = <&amx2_in4_ep>;
-					};
-				};
-
-				port@27 {
-					reg = <0x27>;
-
-					xbar_amx2_out_ep: endpoint {
-						remote-endpoint = <&amx2_out_ep>;
-					};
-				};
-
-				xbar_adx1_in_port: port@28 {
-					reg = <0x28>;
-
-					xbar_adx1_in_ep: endpoint {
-						remote-endpoint = <&adx1_in_ep>;
-					};
-				};
-
-				port@29 {
-					reg = <0x29>;
-
-					xbar_adx1_out1_ep: endpoint {
-						remote-endpoint = <&adx1_out1_ep>;
-					};
-				};
-
-				port@2a {
-					reg = <0x2a>;
-
-					xbar_adx1_out2_ep: endpoint {
-						remote-endpoint = <&adx1_out2_ep>;
-					};
-				};
-
-				port@2b {
-					reg = <0x2b>;
-
-					xbar_adx1_out3_ep: endpoint {
-						remote-endpoint = <&adx1_out3_ep>;
-					};
-				};
-
-				port@2c {
-					reg = <0x2c>;
-
-					xbar_adx1_out4_ep: endpoint {
-						remote-endpoint = <&adx1_out4_ep>;
-					};
-				};
-
-				xbar_adx2_in_port: port@2d {
-					reg = <0x2d>;
-
-					xbar_adx2_in_ep: endpoint {
-						remote-endpoint = <&adx2_in_ep>;
-					};
-				};
-
-				port@2e {
-					reg = <0x2e>;
-
-					xbar_adx2_out1_ep: endpoint {
-						remote-endpoint = <&adx2_out1_ep>;
-					};
-				};
-
-				port@2f {
-					reg = <0x2f>;
-
-					xbar_adx2_out2_ep: endpoint {
-						remote-endpoint = <&adx2_out2_ep>;
-					};
-				};
-
-				port@30 {
-					reg = <0x30>;
-
-					xbar_adx2_out3_ep: endpoint {
-						remote-endpoint = <&adx2_out3_ep>;
-					};
-				};
-
-				port@31 {
-					reg = <0x31>;
-
-					xbar_adx2_out4_ep: endpoint {
-						remote-endpoint = <&adx2_out4_ep>;
-					};
-				};
-
-				xbar_mixer_in1_port: port@32 {
-					reg = <0x32>;
-
-					xbar_mixer_in1_ep: endpoint {
-						remote-endpoint = <&mixer_in1_ep>;
-					};
-				};
-
-				xbar_mixer_in2_port: port@33 {
-					reg = <0x33>;
-
-					xbar_mixer_in2_ep: endpoint {
-						remote-endpoint = <&mixer_in2_ep>;
-					};
-				};
-
-				xbar_mixer_in3_port: port@34 {
-					reg = <0x34>;
-
-					xbar_mixer_in3_ep: endpoint {
-						remote-endpoint = <&mixer_in3_ep>;
-					};
-				};
-
-				xbar_mixer_in4_port: port@35 {
-					reg = <0x35>;
-
-					xbar_mixer_in4_ep: endpoint {
-						remote-endpoint = <&mixer_in4_ep>;
-					};
-				};
-
-				xbar_mixer_in5_port: port@36 {
-					reg = <0x36>;
-
-					xbar_mixer_in5_ep: endpoint {
-						remote-endpoint = <&mixer_in5_ep>;
-					};
-				};
-
-				xbar_mixer_in6_port: port@37 {
-					reg = <0x37>;
-
-					xbar_mixer_in6_ep: endpoint {
-						remote-endpoint = <&mixer_in6_ep>;
-					};
-				};
-
-				xbar_mixer_in7_port: port@38 {
-					reg = <0x38>;
-
-					xbar_mixer_in7_ep: endpoint {
-						remote-endpoint = <&mixer_in7_ep>;
-					};
-				};
-
-				xbar_mixer_in8_port: port@39 {
-					reg = <0x39>;
-
-					xbar_mixer_in8_ep: endpoint {
-						remote-endpoint = <&mixer_in8_ep>;
-					};
-				};
-
-				xbar_mixer_in9_port: port@3a {
-					reg = <0x3a>;
-
-					xbar_mixer_in9_ep: endpoint {
-						remote-endpoint = <&mixer_in9_ep>;
-					};
-				};
-
-				xbar_mixer_in10_port: port@3b {
-					reg = <0x3b>;
-
-					xbar_mixer_in10_ep: endpoint {
-						remote-endpoint = <&mixer_in10_ep>;
-					};
-				};
-
-				port@3c {
-					reg = <0x3c>;
-
-					xbar_mixer_out1_ep: endpoint {
-						remote-endpoint = <&mixer_out1_ep>;
-					};
-				};
-
-				port@3d {
-					reg = <0x3d>;
-
-					xbar_mixer_out2_ep: endpoint {
-						remote-endpoint = <&mixer_out2_ep>;
-					};
-				};
-
-				port@3e {
-					reg = <0x3e>;
-
-					xbar_mixer_out3_ep: endpoint {
-						remote-endpoint = <&mixer_out3_ep>;
-					};
-				};
-
-				port@3f {
-					reg = <0x3f>;
-
-					xbar_mixer_out4_ep: endpoint {
-						remote-endpoint = <&mixer_out4_ep>;
-					};
-				};
-
-				port@40 {
-					reg = <0x40>;
-
-					xbar_mixer_out5_ep: endpoint {
-						remote-endpoint = <&mixer_out5_ep>;
-					};
-				};
-
-				xbar_ope1_in_port: port@41 {
-					reg = <0x41>;
-
-					xbar_ope1_in_ep: endpoint {
-						remote-endpoint = <&ope1_cif_in_ep>;
-					};
-				};
-
-				port@42 {
-					reg = <0x42>;
-
-					xbar_ope1_out_ep: endpoint {
-						remote-endpoint = <&ope1_cif_out_ep>;
-					};
-				};
-
-				xbar_ope2_in_port: port@43 {
-					reg = <0x43>;
-
-					xbar_ope2_in_ep: endpoint {
-						remote-endpoint = <&ope2_cif_in_ep>;
-					};
-				};
-
-				port@44 {
-					reg = <0x44>;
-
-					xbar_ope2_out_ep: endpoint {
-						remote-endpoint = <&ope2_cif_out_ep>;
-					};
-				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d78b9bd45df6..1be0d27500cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -624,1071 +624,70 @@ admaif@702d0000 {
 
 			i2s@702d1200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s3_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s3_ep>;
-						};
-					};
-
-					i2s3_port: port@1 {
-						reg = <1>;
-
-						i2s3_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			i2s@702d1300 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						i2s4_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s4_ep>;
-						};
-					};
-
-					i2s4_port: port@1 {
-						reg = <1>;
-
-						i2s4_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			sfc@702d2000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc1_in_ep>;
-						};
-					};
-
-					sfc1_out_port: port@1 {
-						reg = <1>;
-
-						sfc1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc1_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc2_in_ep>;
-						};
-					};
-
-					sfc2_out_port: port@1 {
-						reg = <1>;
-
-						sfc2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc2_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2400 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc3_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc3_in_ep>;
-						};
-					};
-
-					sfc3_out_port: port@1 {
-						reg = <1>;
-
-						sfc3_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc3_out_ep>;
-						};
-					};
-				};
 			};
 
 			sfc@702d2600 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						sfc4_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_sfc4_in_ep>;
-						};
-					};
-
-					sfc4_out_port: port@1 {
-						reg = <1>;
-
-						sfc4_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_sfc4_out_ep>;
-						};
-					};
-				};
 			};
 
 			amx@702d3000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						amx1_in1_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-
-						amx1_in2_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in2_ep>;
-						};
-					};
-
-					port@2 {
-						reg = <2>;
-
-						amx1_in3_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in3_ep>;
-						};
-					};
-
-					port@3 {
-						reg = <3>;
-
-						amx1_in4_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_in4_ep>;
-						};
-					};
-
-					amx1_out_port: port@4 {
-						reg = <4>;
-
-						amx1_out_ep: endpoint {
-							remote-endpoint = <&xbar_amx1_out_ep>;
-						};
-					};
-				};
 			};
 
 			amx@702d3100 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						amx2_in1_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-
-						amx2_in2_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in2_ep>;
-						};
-					};
-
-					amx2_in3_port: port@2 {
-						reg = <2>;
-
-						amx2_in3_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in3_ep>;
-						};
-					};
-
-					amx2_in4_port: port@3 {
-						reg = <3>;
-
-						amx2_in4_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_in4_ep>;
-						};
-					};
-
-					amx2_out_port: port@4 {
-						reg = <4>;
-
-						amx2_out_ep: endpoint {
-							remote-endpoint = <&xbar_amx2_out_ep>;
-						};
-					};
-				};
 			};
 
 			adx@702d3800 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						adx1_in_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_in_ep>;
-						};
-					};
-
-					adx1_out1_port: port@1 {
-						reg = <1>;
-
-						adx1_out1_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out1_ep>;
-						};
-					};
-
-					adx1_out2_port: port@2 {
-						reg = <2>;
-
-						adx1_out2_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out2_ep>;
-						};
-					};
-
-					adx1_out3_port: port@3 {
-						reg = <3>;
-
-						adx1_out3_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out3_ep>;
-						};
-					};
-
-					adx1_out4_port: port@4 {
-						reg = <4>;
-
-						adx1_out4_ep: endpoint {
-							remote-endpoint = <&xbar_adx1_out4_ep>;
-						};
-					};
-				};
 			};
 
 			adx@702d3900 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						adx2_in_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_in_ep>;
-						};
-					};
-
-					adx2_out1_port: port@1 {
-						reg = <1>;
-
-						adx2_out1_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out1_ep>;
-						};
-					};
-
-					adx2_out2_port: port@2 {
-						reg = <2>;
-
-						adx2_out2_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out2_ep>;
-						};
-					};
-
-					adx2_out3_port: port@3 {
-						reg = <3>;
-
-						adx2_out3_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out3_ep>;
-						};
-					};
-
-					adx2_out4_port: port@4 {
-						reg = <4>;
-
-						adx2_out4_ep: endpoint {
-							remote-endpoint = <&xbar_adx2_out4_ep>;
-						};
-					};
-				};
 			};
 
 			dmic@702d4000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						dmic1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic1_ep>;
-						};
-					};
-
-					dmic1_port: port@1 {
-						reg = <1>;
-
-						dmic1_dap_ep: endpoint {
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			dmic@702d4100 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						dmic2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic2_ep>;
-						};
-					};
-
-					dmic2_port: port@1 {
-						reg = <1>;
-
-						dmic2_dap_ep: endpoint {
-							/* Placeholder for external Codec */
-						};
-					};
-				};
 			};
 
 			processing-engine@702d8000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						ope1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_ope1_in_ep>;
-						};
-					};
-
-					ope1_out_port: port@1 {
-						reg = <0x1>;
-
-						ope1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_ope1_out_ep>;
-						};
-					};
-				};
 			};
 
 			processing-engine@702d8400 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						ope2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_ope2_in_ep>;
-						};
-					};
-
-					ope2_out_port: port@1 {
-						reg = <0x1>;
-
-						ope2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_ope2_out_ep>;
-						};
-					};
-				};
 			};
 
 			mvc@702da000 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						mvc1_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_mvc1_in_ep>;
-						};
-					};
-
-					mvc1_out_port: port@1 {
-						reg = <1>;
-
-						mvc1_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_mvc1_out_ep>;
-						};
-					};
-				};
 			};
 
 			mvc@702da200 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-
-						mvc2_cif_in_ep: endpoint {
-							remote-endpoint = <&xbar_mvc2_in_ep>;
-						};
-					};
-
-					mvc2_out_port: port@1 {
-						reg = <1>;
-
-						mvc2_cif_out_ep: endpoint {
-							remote-endpoint = <&xbar_mvc2_out_ep>;
-						};
-					};
-				};
 			};
 
 			amixer@702dbb00 {
 				status = "okay";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0x0>;
-
-						mixer_in1_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in1_ep>;
-						};
-					};
-
-					port@1 {
-						reg = <0x1>;
-
-						mixer_in2_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in2_ep>;
-						};
-					};
-
-					port@2 {
-						reg = <0x2>;
-
-						mixer_in3_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in3_ep>;
-						};
-					};
-
-					port@3 {
-						reg = <0x3>;
-
-						mixer_in4_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in4_ep>;
-						};
-					};
-
-					port@4 {
-						reg = <0x4>;
-
-						mixer_in5_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in5_ep>;
-						};
-					};
-
-					port@5 {
-						reg = <0x5>;
-
-						mixer_in6_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in6_ep>;
-						};
-					};
-
-					port@6 {
-						reg = <0x6>;
-
-						mixer_in7_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in7_ep>;
-						};
-					};
-
-					port@7 {
-						reg = <0x7>;
-
-						mixer_in8_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in8_ep>;
-						};
-					};
-
-					port@8 {
-						reg = <0x8>;
-
-						mixer_in9_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in9_ep>;
-						};
-					};
-
-					port@9 {
-						reg = <0x9>;
-
-						mixer_in10_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_in10_ep>;
-						};
-					};
-
-					mixer_out1_port: port@a {
-						reg = <0xa>;
-
-						mixer_out1_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out1_ep>;
-						};
-					};
-
-					mixer_out2_port: port@b {
-						reg = <0xb>;
-
-						mixer_out2_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out2_ep>;
-						};
-					};
-
-					mixer_out3_port: port@c {
-						reg = <0xc>;
-
-						mixer_out3_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out3_ep>;
-						};
-					};
-
-					mixer_out4_port: port@d {
-						reg = <0xd>;
-
-						mixer_out4_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out4_ep>;
-						};
-					};
-
-					mixer_out5_port: port@e {
-						reg = <0xe>;
-
-						mixer_out5_ep: endpoint {
-							remote-endpoint = <&xbar_mixer_out5_ep>;
-						};
-					};
-				};
-			};
-
-			ports {
-				xbar_i2s3_port: port@c {
-					reg = <0xc>;
-
-					xbar_i2s3_ep: endpoint {
-						remote-endpoint = <&i2s3_cif_ep>;
-					};
-				};
-
-				xbar_i2s4_port: port@d {
-					reg = <0xd>;
-
-					xbar_i2s4_ep: endpoint {
-						remote-endpoint = <&i2s4_cif_ep>;
-					};
-				};
-
-				xbar_dmic1_port: port@f {
-					reg = <0xf>;
-
-					xbar_dmic1_ep: endpoint {
-						remote-endpoint = <&dmic1_cif_ep>;
-					};
-				};
-
-				xbar_dmic2_port: port@10 {
-					reg = <0x10>;
-
-					xbar_dmic2_ep: endpoint {
-						remote-endpoint = <&dmic2_cif_ep>;
-					};
-				};
-
-				xbar_sfc1_in_port: port@12 {
-					reg = <0x12>;
-
-					xbar_sfc1_in_ep: endpoint {
-						remote-endpoint = <&sfc1_cif_in_ep>;
-					};
-				};
-
-				port@13 {
-					reg = <0x13>;
-
-					xbar_sfc1_out_ep: endpoint {
-						remote-endpoint = <&sfc1_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc2_in_port: port@14 {
-					reg = <0x14>;
-
-					xbar_sfc2_in_ep: endpoint {
-						remote-endpoint = <&sfc2_cif_in_ep>;
-					};
-				};
-
-				port@15 {
-					reg = <0x15>;
-
-					xbar_sfc2_out_ep: endpoint {
-						remote-endpoint = <&sfc2_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc3_in_port: port@16 {
-					reg = <0x16>;
-
-					xbar_sfc3_in_ep: endpoint {
-						remote-endpoint = <&sfc3_cif_in_ep>;
-					};
-				};
-
-				port@17 {
-					reg = <0x17>;
-
-					xbar_sfc3_out_ep: endpoint {
-						remote-endpoint = <&sfc3_cif_out_ep>;
-					};
-				};
-
-				xbar_sfc4_in_port: port@18 {
-					reg = <0x18>;
-
-					xbar_sfc4_in_ep: endpoint {
-						remote-endpoint = <&sfc4_cif_in_ep>;
-					};
-				};
-
-				port@19 {
-					reg = <0x19>;
-
-					xbar_sfc4_out_ep: endpoint {
-						remote-endpoint = <&sfc4_cif_out_ep>;
-					};
-				};
-
-				xbar_mvc1_in_port: port@1a {
-					reg = <0x1a>;
-
-					xbar_mvc1_in_ep: endpoint {
-						remote-endpoint = <&mvc1_cif_in_ep>;
-					};
-				};
-
-				port@1b {
-					reg = <0x1b>;
-
-					xbar_mvc1_out_ep: endpoint {
-						remote-endpoint = <&mvc1_cif_out_ep>;
-					};
-				};
-
-				xbar_mvc2_in_port: port@1c {
-					reg = <0x1c>;
-
-					xbar_mvc2_in_ep: endpoint {
-						remote-endpoint = <&mvc2_cif_in_ep>;
-					};
-				};
-
-				port@1d {
-					reg = <0x1d>;
-
-					xbar_mvc2_out_ep: endpoint {
-						remote-endpoint = <&mvc2_cif_out_ep>;
-					};
-				};
-
-				xbar_amx1_in1_port: port@1e {
-					reg = <0x1e>;
-
-					xbar_amx1_in1_ep: endpoint {
-						remote-endpoint = <&amx1_in1_ep>;
-					};
-				};
-
-				xbar_amx1_in2_port: port@1f {
-					reg = <0x1f>;
-
-					xbar_amx1_in2_ep: endpoint {
-						remote-endpoint = <&amx1_in2_ep>;
-					};
-				};
-
-				xbar_amx1_in3_port: port@20 {
-					reg = <0x20>;
-
-					xbar_amx1_in3_ep: endpoint {
-						remote-endpoint = <&amx1_in3_ep>;
-					};
-				};
-
-				xbar_amx1_in4_port: port@21 {
-					reg = <0x21>;
-
-					xbar_amx1_in4_ep: endpoint {
-						remote-endpoint = <&amx1_in4_ep>;
-					};
-				};
-
-				port@22 {
-					reg = <0x22>;
-
-					xbar_amx1_out_ep: endpoint {
-						remote-endpoint = <&amx1_out_ep>;
-					};
-				};
-
-				xbar_amx2_in1_port: port@23 {
-					reg = <0x23>;
-
-					xbar_amx2_in1_ep: endpoint {
-						remote-endpoint = <&amx2_in1_ep>;
-					};
-				};
-
-				xbar_amx2_in2_port: port@24 {
-					reg = <0x24>;
-
-					xbar_amx2_in2_ep: endpoint {
-						remote-endpoint = <&amx2_in2_ep>;
-					};
-				};
-
-				xbar_amx2_in3_port: port@25 {
-					reg = <0x25>;
-
-					xbar_amx2_in3_ep: endpoint {
-						remote-endpoint = <&amx2_in3_ep>;
-					};
-				};
-
-				xbar_amx2_in4_port: port@26 {
-					reg = <0x26>;
-
-					xbar_amx2_in4_ep: endpoint {
-						remote-endpoint = <&amx2_in4_ep>;
-					};
-				};
-
-				port@27 {
-					reg = <0x27>;
-
-					xbar_amx2_out_ep: endpoint {
-						remote-endpoint = <&amx2_out_ep>;
-					};
-				};
-
-				xbar_adx1_in_port: port@28 {
-					reg = <0x28>;
-
-					xbar_adx1_in_ep: endpoint {
-						remote-endpoint = <&adx1_in_ep>;
-					};
-				};
-
-				port@29 {
-					reg = <0x29>;
-
-					xbar_adx1_out1_ep: endpoint {
-						remote-endpoint = <&adx1_out1_ep>;
-					};
-				};
-
-				port@2a {
-					reg = <0x2a>;
-
-					xbar_adx1_out2_ep: endpoint {
-						remote-endpoint = <&adx1_out2_ep>;
-					};
-				};
-
-				port@2b {
-					reg = <0x2b>;
-
-					xbar_adx1_out3_ep: endpoint {
-						remote-endpoint = <&adx1_out3_ep>;
-					};
-				};
-
-				port@2c {
-					reg = <0x2c>;
-
-					xbar_adx1_out4_ep: endpoint {
-						remote-endpoint = <&adx1_out4_ep>;
-					};
-				};
-
-				xbar_adx2_in_port: port@2d {
-					reg = <0x2d>;
-
-					xbar_adx2_in_ep: endpoint {
-						remote-endpoint = <&adx2_in_ep>;
-					};
-				};
-
-				port@2e {
-					reg = <0x2e>;
-
-					xbar_adx2_out1_ep: endpoint {
-						remote-endpoint = <&adx2_out1_ep>;
-					};
-				};
-
-				port@2f {
-					reg = <0x2f>;
-
-					xbar_adx2_out2_ep: endpoint {
-						remote-endpoint = <&adx2_out2_ep>;
-					};
-				};
-
-				port@30 {
-					reg = <0x30>;
-
-					xbar_adx2_out3_ep: endpoint {
-						remote-endpoint = <&adx2_out3_ep>;
-					};
-				};
-
-				port@31 {
-					reg = <0x31>;
-
-					xbar_adx2_out4_ep: endpoint {
-						remote-endpoint = <&adx2_out4_ep>;
-					};
-				};
-
-				xbar_mixer_in1_port: port@32 {
-					reg = <0x32>;
-
-					xbar_mixer_in1_ep: endpoint {
-						remote-endpoint = <&mixer_in1_ep>;
-					};
-				};
-
-				xbar_mixer_in2_port: port@33 {
-					reg = <0x33>;
-
-					xbar_mixer_in2_ep: endpoint {
-						remote-endpoint = <&mixer_in2_ep>;
-					};
-				};
-
-				xbar_mixer_in3_port: port@34 {
-					reg = <0x34>;
-
-					xbar_mixer_in3_ep: endpoint {
-						remote-endpoint = <&mixer_in3_ep>;
-					};
-				};
-
-				xbar_mixer_in4_port: port@35 {
-					reg = <0x35>;
-
-					xbar_mixer_in4_ep: endpoint {
-						remote-endpoint = <&mixer_in4_ep>;
-					};
-				};
-
-				xbar_mixer_in5_port: port@36 {
-					reg = <0x36>;
-
-					xbar_mixer_in5_ep: endpoint {
-						remote-endpoint = <&mixer_in5_ep>;
-					};
-				};
-
-				xbar_mixer_in6_port: port@37 {
-					reg = <0x37>;
-
-					xbar_mixer_in6_ep: endpoint {
-						remote-endpoint = <&mixer_in6_ep>;
-					};
-				};
-
-				xbar_mixer_in7_port: port@38 {
-					reg = <0x38>;
-
-					xbar_mixer_in7_ep: endpoint {
-						remote-endpoint = <&mixer_in7_ep>;
-					};
-				};
-
-				xbar_mixer_in8_port: port@39 {
-					reg = <0x39>;
-
-					xbar_mixer_in8_ep: endpoint {
-						remote-endpoint = <&mixer_in8_ep>;
-					};
-				};
-
-				xbar_mixer_in9_port: port@3a {
-					reg = <0x3a>;
-
-					xbar_mixer_in9_ep: endpoint {
-						remote-endpoint = <&mixer_in9_ep>;
-					};
-				};
-
-				xbar_mixer_in10_port: port@3b {
-					reg = <0x3b>;
-
-					xbar_mixer_in10_ep: endpoint {
-						remote-endpoint = <&mixer_in10_ep>;
-					};
-				};
-
-				port@3c {
-					reg = <0x3c>;
-
-					xbar_mixer_out1_ep: endpoint {
-						remote-endpoint = <&mixer_out1_ep>;
-					};
-				};
-
-				port@3d {
-					reg = <0x3d>;
-
-					xbar_mixer_out2_ep: endpoint {
-						remote-endpoint = <&mixer_out2_ep>;
-					};
-				};
-
-				port@3e {
-					reg = <0x3e>;
-
-					xbar_mixer_out3_ep: endpoint {
-						remote-endpoint = <&mixer_out3_ep>;
-					};
-				};
-
-				port@3f {
-					reg = <0x3f>;
-
-					xbar_mixer_out4_ep: endpoint {
-						remote-endpoint = <&mixer_out4_ep>;
-					};
-				};
-
-				port@40 {
-					reg = <0x40>;
-
-					xbar_mixer_out5_ep: endpoint {
-						remote-endpoint = <&mixer_out5_ep>;
-					};
-				};
-
-				xbar_ope1_in_port: port@41 {
-					reg = <0x41>;
-
-					xbar_ope1_in_ep: endpoint {
-						remote-endpoint = <&ope1_cif_in_ep>;
-					};
-				};
-
-				port@42 {
-					reg = <0x42>;
-
-					xbar_ope1_out_ep: endpoint {
-						remote-endpoint = <&ope1_cif_out_ep>;
-					};
-				};
-
-				xbar_ope2_in_port: port@43 {
-					reg = <0x43>;
-
-					xbar_ope2_in_ep: endpoint {
-						remote-endpoint = <&ope2_cif_in_ep>;
-					};
-				};
-
-				port@44 {
-					reg = <0x44>;
-
-					xbar_ope2_out_ep: endpoint {
-						remote-endpoint = <&ope2_cif_out_ep>;
-					};
-				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..4702a279b6f1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1586,6 +1586,28 @@ tegra_i2s1: i2s@702d1000 {
 				assigned-clock-rates = <1536000>;
 				sound-name-prefix = "I2S1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s1_ep>;
+						};
+					};
+
+					i2s1_port: port@1 {
+						reg = <1>;
+
+						i2s1_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_i2s2: i2s@702d1100 {
@@ -1599,6 +1621,28 @@ tegra_i2s2: i2s@702d1100 {
 				assigned-clock-rates = <1536000>;
 				sound-name-prefix = "I2S2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s2_ep>;
+						};
+					};
+
+					i2s2_port: port@1 {
+						reg = <1>;
+
+						i2s2_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_i2s3: i2s@702d1200 {
@@ -1612,6 +1656,28 @@ tegra_i2s3: i2s@702d1200 {
 				assigned-clock-rates = <1536000>;
 				sound-name-prefix = "I2S3";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s3_ep>;
+						};
+					};
+
+					i2s3_port: port@1 {
+						reg = <1>;
+
+						i2s3_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_i2s4: i2s@702d1300 {
@@ -1625,6 +1691,28 @@ tegra_i2s4: i2s@702d1300 {
 				assigned-clock-rates = <1536000>;
 				sound-name-prefix = "I2S4";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s4_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s4_ep>;
+						};
+					};
+
+					i2s4_port: port@1 {
+						reg = <1>;
+
+						i2s4_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_i2s5: i2s@702d1400 {
@@ -1638,6 +1726,28 @@ tegra_i2s5: i2s@702d1400 {
 				assigned-clock-rates = <1536000>;
 				sound-name-prefix = "I2S5";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s5_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s5_ep>;
+						};
+					};
+
+					i2s5_port: port@1 {
+						reg = <1>;
+
+						i2s5_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_sfc1: sfc@702d2000 {
@@ -1645,6 +1755,27 @@ tegra_sfc1: sfc@702d2000 {
 				reg = <0x702d2000 0x200>;
 				sound-name-prefix = "SFC1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_in_ep>;
+						};
+					};
+
+					sfc1_out_port: port@1 {
+						reg = <1>;
+
+						sfc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_sfc2: sfc@702d2200 {
@@ -1652,6 +1783,27 @@ tegra_sfc2: sfc@702d2200 {
 				reg = <0x702d2200 0x200>;
 				sound-name-prefix = "SFC2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_in_ep>;
+						};
+					};
+
+					sfc2_out_port: port@1 {
+						reg = <1>;
+
+						sfc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_sfc3: sfc@702d2400 {
@@ -1659,6 +1811,27 @@ tegra_sfc3: sfc@702d2400 {
 				reg = <0x702d2400 0x200>;
 				sound-name-prefix = "SFC3";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc3_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_in_ep>;
+						};
+					};
+
+					sfc3_out_port: port@1 {
+						reg = <1>;
+
+						sfc3_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_sfc4: sfc@702d2600 {
@@ -1666,6 +1839,27 @@ tegra_sfc4: sfc@702d2600 {
 				reg = <0x702d2600 0x200>;
 				sound-name-prefix = "SFC4";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc4_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_in_ep>;
+						};
+					};
+
+					sfc4_out_port: port@1 {
+						reg = <1>;
+
+						sfc4_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_amx1: amx@702d3000 {
@@ -1673,6 +1867,51 @@ tegra_amx1: amx@702d3000 {
 				reg = <0x702d3000 0x100>;
 				sound-name-prefix = "AMX1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx1_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx1_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx1_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx1_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in4_ep>;
+						};
+					};
+
+					amx1_out_port: port@4 {
+						reg = <4>;
+
+						amx1_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_amx2: amx@702d3100 {
@@ -1680,6 +1919,51 @@ tegra_amx2: amx@702d3100 {
 				reg = <0x702d3100 0x100>;
 				sound-name-prefix = "AMX2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx2_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx2_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in2_ep>;
+						};
+					};
+
+					amx2_in3_port: port@2 {
+						reg = <2>;
+
+						amx2_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in3_ep>;
+						};
+					};
+
+					amx2_in4_port: port@3 {
+						reg = <3>;
+
+						amx2_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in4_ep>;
+						};
+					};
+
+					amx2_out_port: port@4 {
+						reg = <4>;
+
+						amx2_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_adx1: adx@702d3800 {
@@ -1687,6 +1971,51 @@ tegra_adx1: adx@702d3800 {
 				reg = <0x702d3800 0x100>;
 				sound-name-prefix = "ADX1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx1_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_in_ep>;
+						};
+					};
+
+					adx1_out1_port: port@1 {
+						reg = <1>;
+
+						adx1_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out1_ep>;
+						};
+					};
+
+					adx1_out2_port: port@2 {
+						reg = <2>;
+
+						adx1_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out2_ep>;
+						};
+					};
+
+					adx1_out3_port: port@3 {
+						reg = <3>;
+
+						adx1_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out3_ep>;
+						};
+					};
+
+					adx1_out4_port: port@4 {
+						reg = <4>;
+
+						adx1_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out4_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_adx2: adx@702d3900 {
@@ -1694,6 +2023,51 @@ tegra_adx2: adx@702d3900 {
 				reg = <0x702d3900 0x100>;
 				sound-name-prefix = "ADX2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx2_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_in_ep>;
+						};
+					};
+
+					adx2_out1_port: port@1 {
+						reg = <1>;
+
+						adx2_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out1_ep>;
+						};
+					};
+
+					adx2_out2_port: port@2 {
+						reg = <2>;
+
+						adx2_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out2_ep>;
+						};
+					};
+
+					adx2_out3_port: port@3 {
+						reg = <3>;
+
+						adx2_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out3_ep>;
+						};
+					};
+
+					adx2_out4_port: port@4 {
+						reg = <4>;
+
+						adx2_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out4_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_dmic1: dmic@702d4000 {
@@ -1706,7 +2080,28 @@ tegra_dmic1: dmic@702d4000 {
 				assigned-clock-rates = <3072000>;
 				sound-name-prefix = "DMIC1";
 				status = "disabled";
-			};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic1_ep>;
+						};
+					};
+
+					dmic1_port: port@1 {
+						reg = <1>;
+
+						dmic1_dap_ep: endpoint {
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
 
 			tegra_dmic2: dmic@702d4100 {
 				compatible = "nvidia,tegra210-dmic";
@@ -1718,6 +2113,27 @@ tegra_dmic2: dmic@702d4100 {
 				assigned-clock-rates = <3072000>;
 				sound-name-prefix = "DMIC2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic2_ep>;
+						};
+					};
+
+					dmic2_port: port@1 {
+						reg = <1>;
+
+						dmic2_dap_ep: endpoint {
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_dmic3: dmic@702d4200 {
@@ -1730,6 +2146,27 @@ tegra_dmic3: dmic@702d4200 {
 				assigned-clock-rates = <3072000>;
 				sound-name-prefix = "DMIC3";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic3_ep>;
+						};
+					};
+
+					dmic3_port: port@1 {
+						reg = <1>;
+
+						dmic3_dap_ep: endpoint {
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
 			tegra_ope1: processing-engine@702d8000 {
@@ -1750,6 +2187,27 @@ dynamic-range-compressor@702d8200 {
 					compatible = "nvidia,tegra210-mbdrc";
 					reg = <0x702d8200 0x200>;
 				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						ope1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_ope1_in_ep>;
+						};
+					};
+
+					ope1_out_port: port@1 {
+						reg = <0x1>;
+
+						ope1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_ope1_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_ope2: processing-engine@702d8400 {
@@ -1770,6 +2228,27 @@ dynamic-range-compressor@702d8600 {
 					compatible = "nvidia,tegra210-mbdrc";
 					reg = <0x702d8600 0x200>;
 				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						ope2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_ope2_in_ep>;
+						};
+					};
+
+					ope2_out_port: port@1 {
+						reg = <0x1>;
+
+						ope2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_ope2_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_mvc1: mvc@702da000 {
@@ -1777,6 +2256,27 @@ tegra_mvc1: mvc@702da000 {
 				reg = <0x702da000 0x200>;
 				sound-name-prefix = "MVC1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_in_ep>;
+						};
+					};
+
+					mvc1_out_port: port@1 {
+						reg = <1>;
+
+						mvc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_mvc2: mvc@702da200 {
@@ -1784,6 +2284,27 @@ tegra_mvc2: mvc@702da200 {
 				reg = <0x702da200 0x200>;
 				sound-name-prefix = "MVC2";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_in_ep>;
+						};
+					};
+
+					mvc2_out_port: port@1 {
+						reg = <1>;
+
+						mvc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_out_ep>;
+						};
+					};
+				};
 			};
 
 			tegra_amixer: amixer@702dbb00 {
@@ -1791,6 +2312,131 @@ tegra_amixer: amixer@702dbb00 {
 				reg = <0x702dbb00 0x800>;
 				sound-name-prefix = "MIXER1";
 				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						mixer_in1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <0x1>;
+
+						mixer_in2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <0x2>;
+
+						mixer_in3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <0x3>;
+
+						mixer_in4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in4_ep>;
+						};
+					};
+
+					port@4 {
+						reg = <0x4>;
+
+						mixer_in5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in5_ep>;
+						};
+					};
+
+					port@5 {
+						reg = <0x5>;
+
+						mixer_in6_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in6_ep>;
+						};
+					};
+
+					port@6 {
+						reg = <0x6>;
+
+						mixer_in7_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in7_ep>;
+						};
+					};
+
+					port@7 {
+						reg = <0x7>;
+
+						mixer_in8_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in8_ep>;
+						};
+					};
+
+					port@8 {
+						reg = <0x8>;
+
+						mixer_in9_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in9_ep>;
+						};
+					};
+
+					port@9 {
+						reg = <0x9>;
+
+						mixer_in10_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in10_ep>;
+						};
+					};
+
+					mixer_out1_port: port@a {
+						reg = <0xa>;
+
+						mixer_out1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out1_ep>;
+						};
+					};
+
+					mixer_out2_port: port@b {
+						reg = <0xb>;
+
+						mixer_out2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out2_ep>;
+						};
+					};
+
+					mixer_out3_port: port@c {
+						reg = <0xc>;
+
+						mixer_out3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out3_ep>;
+						};
+					};
+
+					mixer_out4_port: port@d {
+						reg = <0xd>;
+
+						mixer_out4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out4_ep>;
+						};
+					};
+
+					mixer_out5_port: port@e {
+						reg = <0xe>;
+
+						mixer_out5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out5_ep>;
+						};
+					};
+				};
 			};
 
 			ports {
@@ -1874,6 +2520,478 @@ xbar_admaif10_ep: endpoint {
 						remote-endpoint = <&admaif10_ep>;
 					};
 				};
+
+				xbar_i2s1_port: port@a {
+					reg = <0xa>;
+
+					xbar_i2s1_ep: endpoint {
+						remote-endpoint = <&i2s1_cif_ep>;
+					};
+				};
+
+				xbar_i2s2_port: port@b {
+					reg = <0xb>;
+
+					xbar_i2s2_ep: endpoint {
+						remote-endpoint = <&i2s2_cif_ep>;
+					};
+				};
+
+				xbar_i2s3_port: port@c {
+					reg = <0xc>;
+
+					xbar_i2s3_ep: endpoint {
+						remote-endpoint = <&i2s3_cif_ep>;
+					};
+				};
+
+				xbar_i2s4_port: port@d {
+					reg = <0xd>;
+
+					xbar_i2s4_ep: endpoint {
+						remote-endpoint = <&i2s4_cif_ep>;
+					};
+				};
+
+				xbar_i2s5_port: port@e {
+					reg = <0xe>;
+
+					xbar_i2s5_ep: endpoint {
+						remote-endpoint = <&i2s5_cif_ep>;
+					};
+				};
+
+				xbar_dmic1_port: port@f {
+					reg = <0xf>;
+
+					xbar_dmic1_ep: endpoint {
+						remote-endpoint = <&dmic1_cif_ep>;
+					};
+				};
+
+				xbar_dmic2_port: port@10 {
+					reg = <0x10>;
+
+					xbar_dmic2_ep: endpoint {
+						remote-endpoint = <&dmic2_cif_ep>;
+					};
+				};
+
+				xbar_dmic3_port: port@11 {
+					reg = <0x11>;
+
+					xbar_dmic3_ep: endpoint {
+						remote-endpoint = <&dmic3_cif_ep>;
+					};
+				};
+
+				xbar_sfc1_in_port: port@12 {
+					reg = <0x12>;
+
+					xbar_sfc1_in_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_in_ep>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					xbar_sfc1_out_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc2_in_port: port@14 {
+					reg = <0x14>;
+
+					xbar_sfc2_in_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_in_ep>;
+					};
+				};
+
+				port@15 {
+					reg = <0x15>;
+
+					xbar_sfc2_out_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc3_in_port: port@16 {
+					reg = <0x16>;
+
+					xbar_sfc3_in_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_in_ep>;
+					};
+				};
+
+				port@17 {
+					reg = <0x17>;
+
+					xbar_sfc3_out_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc4_in_port: port@18 {
+					reg = <0x18>;
+
+					xbar_sfc4_in_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_in_ep>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					xbar_sfc4_out_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc1_in_port: port@1a {
+					reg = <0x1a>;
+
+					xbar_mvc1_in_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_in_ep>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					xbar_mvc1_out_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc2_in_port: port@1c {
+					reg = <0x1c>;
+
+					xbar_mvc2_in_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_in_ep>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					xbar_mvc2_out_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_out_ep>;
+					};
+				};
+
+				xbar_amx1_in1_port: port@1e {
+					reg = <0x1e>;
+
+					xbar_amx1_in1_ep: endpoint {
+						remote-endpoint = <&amx1_in1_ep>;
+					};
+				};
+
+				xbar_amx1_in2_port: port@1f {
+					reg = <0x1f>;
+
+					xbar_amx1_in2_ep: endpoint {
+						remote-endpoint = <&amx1_in2_ep>;
+					};
+				};
+
+				xbar_amx1_in3_port: port@20 {
+					reg = <0x20>;
+
+					xbar_amx1_in3_ep: endpoint {
+						remote-endpoint = <&amx1_in3_ep>;
+					};
+				};
+
+				xbar_amx1_in4_port: port@21 {
+					reg = <0x21>;
+
+					xbar_amx1_in4_ep: endpoint {
+						remote-endpoint = <&amx1_in4_ep>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					xbar_amx1_out_ep: endpoint {
+						remote-endpoint = <&amx1_out_ep>;
+					};
+				};
+
+				xbar_amx2_in1_port: port@23 {
+					reg = <0x23>;
+
+					xbar_amx2_in1_ep: endpoint {
+						remote-endpoint = <&amx2_in1_ep>;
+					};
+				};
+
+				xbar_amx2_in2_port: port@24 {
+					reg = <0x24>;
+
+					xbar_amx2_in2_ep: endpoint {
+						remote-endpoint = <&amx2_in2_ep>;
+					};
+				};
+
+				xbar_amx2_in3_port: port@25 {
+					reg = <0x25>;
+
+					xbar_amx2_in3_ep: endpoint {
+						remote-endpoint = <&amx2_in3_ep>;
+					};
+				};
+
+				xbar_amx2_in4_port: port@26 {
+					reg = <0x26>;
+
+					xbar_amx2_in4_ep: endpoint {
+						remote-endpoint = <&amx2_in4_ep>;
+					};
+				};
+
+				port@27 {
+					reg = <0x27>;
+
+					xbar_amx2_out_ep: endpoint {
+						remote-endpoint = <&amx2_out_ep>;
+					};
+				};
+
+				xbar_adx1_in_port: port@28 {
+					reg = <0x28>;
+
+					xbar_adx1_in_ep: endpoint {
+						remote-endpoint = <&adx1_in_ep>;
+					};
+				};
+
+				port@29 {
+					reg = <0x29>;
+
+					xbar_adx1_out1_ep: endpoint {
+						remote-endpoint = <&adx1_out1_ep>;
+					};
+				};
+
+				port@2a {
+					reg = <0x2a>;
+
+					xbar_adx1_out2_ep: endpoint {
+						remote-endpoint = <&adx1_out2_ep>;
+					};
+				};
+
+				port@2b {
+					reg = <0x2b>;
+
+					xbar_adx1_out3_ep: endpoint {
+						remote-endpoint = <&adx1_out3_ep>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					xbar_adx1_out4_ep: endpoint {
+						remote-endpoint = <&adx1_out4_ep>;
+					};
+				};
+
+				xbar_adx2_in_port: port@2d {
+					reg = <0x2d>;
+
+					xbar_adx2_in_ep: endpoint {
+						remote-endpoint = <&adx2_in_ep>;
+					};
+				};
+
+				port@2e {
+					reg = <0x2e>;
+
+					xbar_adx2_out1_ep: endpoint {
+						remote-endpoint = <&adx2_out1_ep>;
+					};
+				};
+
+				port@2f {
+					reg = <0x2f>;
+
+					xbar_adx2_out2_ep: endpoint {
+						remote-endpoint = <&adx2_out2_ep>;
+					};
+				};
+
+				port@30 {
+					reg = <0x30>;
+
+					xbar_adx2_out3_ep: endpoint {
+						remote-endpoint = <&adx2_out3_ep>;
+					};
+				};
+
+				port@31 {
+					reg = <0x31>;
+
+					xbar_adx2_out4_ep: endpoint {
+						remote-endpoint = <&adx2_out4_ep>;
+					};
+				};
+
+				xbar_mixer_in1_port: port@32 {
+					reg = <0x32>;
+
+					xbar_mixer_in1_ep: endpoint {
+						remote-endpoint = <&mixer_in1_ep>;
+					};
+				};
+
+				xbar_mixer_in2_port: port@33 {
+					reg = <0x33>;
+
+					xbar_mixer_in2_ep: endpoint {
+						remote-endpoint = <&mixer_in2_ep>;
+					};
+				};
+
+				xbar_mixer_in3_port: port@34 {
+					reg = <0x34>;
+
+					xbar_mixer_in3_ep: endpoint {
+						remote-endpoint = <&mixer_in3_ep>;
+					};
+				};
+
+				xbar_mixer_in4_port: port@35 {
+					reg = <0x35>;
+
+					xbar_mixer_in4_ep: endpoint {
+						remote-endpoint = <&mixer_in4_ep>;
+					};
+				};
+
+				xbar_mixer_in5_port: port@36 {
+					reg = <0x36>;
+
+					xbar_mixer_in5_ep: endpoint {
+						remote-endpoint = <&mixer_in5_ep>;
+					};
+				};
+
+				xbar_mixer_in6_port: port@37 {
+					reg = <0x37>;
+
+					xbar_mixer_in6_ep: endpoint {
+						remote-endpoint = <&mixer_in6_ep>;
+					};
+				};
+
+				xbar_mixer_in7_port: port@38 {
+					reg = <0x38>;
+
+					xbar_mixer_in7_ep: endpoint {
+						remote-endpoint = <&mixer_in7_ep>;
+					};
+				};
+
+				xbar_mixer_in8_port: port@39 {
+					reg = <0x39>;
+
+					xbar_mixer_in8_ep: endpoint {
+						remote-endpoint = <&mixer_in8_ep>;
+					};
+				};
+
+				xbar_mixer_in9_port: port@3a {
+					reg = <0x3a>;
+
+					xbar_mixer_in9_ep: endpoint {
+						remote-endpoint = <&mixer_in9_ep>;
+					};
+				};
+
+				xbar_mixer_in10_port: port@3b {
+					reg = <0x3b>;
+
+					xbar_mixer_in10_ep: endpoint {
+						remote-endpoint = <&mixer_in10_ep>;
+					};
+				};
+
+				port@3c {
+					reg = <0x3c>;
+
+					xbar_mixer_out1_ep: endpoint {
+						remote-endpoint = <&mixer_out1_ep>;
+					};
+				};
+
+				port@3d {
+					reg = <0x3d>;
+
+					xbar_mixer_out2_ep: endpoint {
+						remote-endpoint = <&mixer_out2_ep>;
+					};
+				};
+
+				port@3e {
+					reg = <0x3e>;
+
+					xbar_mixer_out3_ep: endpoint {
+						remote-endpoint = <&mixer_out3_ep>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					xbar_mixer_out4_ep: endpoint {
+						remote-endpoint = <&mixer_out4_ep>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					xbar_mixer_out5_ep: endpoint {
+						remote-endpoint = <&mixer_out5_ep>;
+					};
+				};
+
+				xbar_ope1_in_port: port@41 {
+					reg = <0x41>;
+
+					xbar_ope1_in_ep: endpoint {
+						remote-endpoint = <&ope1_cif_in_ep>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					xbar_ope1_out_ep: endpoint {
+						remote-endpoint = <&ope1_cif_out_ep>;
+					};
+				};
+
+				xbar_ope2_in_port: port@43 {
+					reg = <0x43>;
+
+					xbar_ope2_in_ep: endpoint {
+						remote-endpoint = <&ope2_cif_in_ep>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					xbar_ope2_out_ep: endpoint {
+						remote-endpoint = <&ope2_cif_out_ep>;
+					};
+				};
 			};
 		};
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-smaug-audio_ports-7e547ffa08cc

Best regards,
--  
Diogo Ivo <diogo.ivo@bootlin.com>

