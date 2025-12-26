Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C431DD90;
	Fri, 26 Dec 2025 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766752011; cv=none; b=Mk0R6yWqdJ77RiEVJ9wHHrQNAISoHt1hAIlXO+AF096dYnfgNYxWVmnrqa60rGgQoU///LO7U/EPM7OgccyVJ1CQRmDDTkn68zv3Y1zJ/ZP8nC8ydoro46uB91U4df4yukUhLRVFmOvUhKbt0Z9vws4GfoShV61AzDotfF0MIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766752011; c=relaxed/simple;
	bh=LPmJ0dRpHT4hBfwUFXbURMPSiWdJTgqaXBAHigZnfOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=meejlI9FYR2UC8s/KjL+H8ucvIn/7PcpbJjZWnnsQNv0HkMD6Cj7HrhMm6RQP5ZTABvjR4Jc/PaaOGGLg8RW9booYnoSGvj14dbszBxeHVkIgou2TU/lUYKdWz16kUVGdDhfSUPGWCl19lK/38rSwomPcPgoGLg//PxsR/FTykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=j/NhIEhS; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="j/NhIEhS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 531166002994;
	Fri, 26 Dec 2025 12:18:01 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Wkz6qmqDOtHM; Fri, 26 Dec 2025 12:17:59 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 61E8760029AE;
	Fri, 26 Dec 2025 12:17:58 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1766751478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lrAiZQajxWmr2L28Pelew79G5nZQAOdnG1+Yoi4Mu78=;
	b=j/NhIEhSLKwBNFtnUk+tPXENkZR6TgiJvPXu6xtGDebnFTIiuTrF3PkU2zifpjGVddDKNU
	tfwP0H97C2Mn+g8wE67efwYjX/Jy7gcFuyKqqdgfM/rbi27m3omPknrVbyvXtJzR8ir7ER
	u911aha3XR0awD7QR+I0VuIoXyGRJyqSAJWNjni/TUf7lqYDzt/r0/azZSBQY2tOS93+u9
	YYeAD9v5CKLIHuQpdukj4ftAr1G2/jmErRVcDoMmZj1IFUzCQyKjVIugRjADDCIGeUHkls
	s0QQUWBMoxK5skIT5geX+u6jCVmjB80rP0r4MwKaTogdWv5M08iRjKgkRSA3XQ==
Received: from [192.168.1.95] (unknown [IPv6:2001:8a0:fbec:a900:d4fe:ebe9:e3bd:bbef])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6B13536011F;
	Fri, 26 Dec 2025 12:17:57 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Fri, 26 Dec 2025 12:17:32 +0000
Subject: [PATCH] arm64: tegra: smaug: Enable DisplayPort via USB-C port
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-smaug-typec_dp-v1-1-7eabcd59da4c@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIANx8TmkC/x3MQQqAIBBA0avErBN0oKKuEhFDTjaLSrSikO6et
 HyL/xNEDsIRuiJB4Eui7FuGKQuYFtocK7HZgBorg1iruNLp1PF4nkbrlWkb1IaILDHkyAee5f6
 H/fC+H9RLTdZgAAAA
X-Change-ID: 20251226-smaug-typec_dp-197201aaadae
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766751477; l=1281;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20251226; h=from:subject:message-id;
 bh=LPmJ0dRpHT4hBfwUFXbURMPSiWdJTgqaXBAHigZnfOY=;
 b=dJTztMjVfwSTIPq3fQzE8mne3qNcFrCE9KZCc7ZMXtgysCsE5tHNQmARE6UOG6ZOlXGy2cgdw
 ZdycZ/1iUsEBYiUpIC6X/lFd0Al3cPc6P6ycK7hLgs//nEAh/5ccM/w
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=x42OmbZ3iy1p2ofzTP2fyOiZoFfRm462OA8WYYqsVUg=

Enable both SOR and DPAUX modules allowing the USB-C port to transmit
video in DP altmode. Tested on several monitors with USB-C to HDMI
adapter.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 49bf23d6f593..b88428aa831e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,11 @@ memory@80000000 {
 	};
 
 	host1x@50000000 {
+		dpaux1: dpaux@54040000 {
+			vdd-supply = <&pp3300>;
+			status = "okay";
+		};
+
 		dsia: dsi@54300000 {
 			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			status = "okay";
@@ -58,6 +63,13 @@ link1: panel@0 {
 			};
 		};
 
+		sor1: sor@54580000 {
+			avdd-io-hdmi-dp-supply = <&pp1800>;
+			vdd-hdmi-dp-pll-supply = <&avddio_1v05>;
+			nvidia,dpaux = <&dpaux1>;
+			status = "okay";
+		};
+
 		dpaux: dpaux@545c0000 {
 			status = "okay";
 		};

---
base-commit: c100317dc8c40c71bfb572353d87ca1735d39fd5
change-id: 20251226-smaug-typec_dp-197201aaadae

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

