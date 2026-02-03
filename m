Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50430DEB8;
	Tue,  3 Feb 2026 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138105; cv=none; b=SSls4N35bWvUC12IdWq1gpf+pRUf+Yg0ItyYCGWWtH4smBQy6nJZDlOGaeFcBlW0o/1plHJCdWHbGTQMoc4/22cWcAFLXgOLMjoOKFMsfTnFXPM8g4mpKR9RRFJ+CNNwKuPdh1+3nIDn4D5xc/2wGQRLknJZYC1vhhi/7wVylbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138105; c=relaxed/simple;
	bh=fbzGbl+je1VKV/PYJGqy3uiZx4BgtMzUgAFzVA/cTOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bovETNb2AwqlUtoxAS0NG2FGLwYu9lXy+PDxSeFNFgvCO+rMxhujoFefnv4tYbKnLxUhqoynYdQndrGL8VyRw9Vc4VlKSo4YmLyDKKrfx+dbsqKHbB25EDl+RymtH2idCS50r186ZYhDQdBis3f4MjmE2Pdxj01+Ef/IxP4gXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=m0dcOo1e; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="m0dcOo1e"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6224060022E6;
	Tue,  3 Feb 2026 17:01:33 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id kHA046Egqy9R; Tue,  3 Feb 2026 17:01:30 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 15C736002990;
	Tue,  3 Feb 2026 17:01:25 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1770138085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vqu/FwnvyJVXHnJ5PCEZjTwGHYz8nMj6bIYb98fIBo8=;
	b=m0dcOo1eHV/LhNDnd9lBzHjMoqmct6XN3xOUKp5YjYFZiIDU1DNJh28F8lrVNGqQp9Akor
	7JKDAoTLzD53PCPQlz1nzQ+/iBoMetE1OzH3mjdT8OtSUtSZ/XJXT0GCnvptk4QNmP4Eh/
	fqiNdKl3WrxnJOk8/hIed8cxPXZk6Q1q8KdgFbJsltt++DXJ9Qf4SsFc+qf9AmpBy5gr63
	eQcjB3XXWyydRX3iIOLQ89SbiYrWoRQafg4XlxzWbg84bV5KOgEE3cbwaFXvOHFCDeCwY/
	g0cqDDKtWZG477ToPzU8lzDLjxxIRHhzs8xlnPZfYDXodbZ8AsGA9wSTVceSng==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B475C36013F;
	Tue,  3 Feb 2026 17:01:24 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 03 Feb 2026 17:01:17 +0000
Subject: [PATCH] arm64: tegra: smaug: Enable SPI-NOR flash
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-smaug-spi_flash-v1-1-a6d477ac7055@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0auUrC20EV14FREJNdWAPxoUQXp3i
 8u3mHlBOQkrdOaFxLeoHHuBrwyEhfaZrUzFgA5bh662utE1Wz1ljCvpYkPjI1EbvEOEUp2Jozz
 /sR9y/gAwnKdfYQAAAA==
X-Change-ID: 20260203-smaug-spi_flash-c51faa6c1022
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770138084; l=1039;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=fbzGbl+je1VKV/PYJGqy3uiZx4BgtMzUgAFzVA/cTOw=;
 b=/23J7MAZaOJ/XjIXdEcjussxU+uomlK4UvMvhHxBtBCV5fF376ULFMDsNsA5AaefLbzZj6TPg
 OwJL2YAxqaWAGtBFpqMGsG4Z/eG4TD3CGw6JFOE4G5ZT8cZvRIFJ95T
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-Spam: Yes

Add support for the SPI-NOR flash found in Pixel C devices.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index b88428aa831e..f0b8c2c80aa5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1892,6 +1892,18 @@ interrupt-controller@702f9000 {
 		};
 	};
 
+	spi@70410000 {
+		status = "okay";
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <104000000>;
+			spi-tx-bus-width = <2>;
+			spi-rx-bus-width = <2>;
+		};
+	};
+
 	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;

---
base-commit: 9a55406e2eb67b27eb5bb0f2d5a3afdea7d1f5df
change-id: 20260203-smaug-spi_flash-c51faa6c1022

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

