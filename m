Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E861A317A;
	Mon, 24 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399980; cv=none; b=AH5Hs+U6MRN2RmNPDmW28Cw8EjAiKgj51fXmp2DjONoJIykjXBLmtEjIULXbnE/KI+9su4kDFtuZDTC3q5+n2Jzcy9pHW+rg//EGEB0KyNx0OibuOO2/9c7Jknwk72jTl3LEDLsGMhb9xp1vh86ux+6Oc3peq59k4R5LCo96oCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399980; c=relaxed/simple;
	bh=V9fX9MC63IdLcgDds7S/X0mAm39y0aVt6nTbAytcSxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8F19lxruwHeh4QDQ0MY8R1BknXuK1IPaam2sHw8Vom7/JGixMmWd2ONH04CdDTWzFL9H+mBx2gg1seuLvp5fR2vqKxHd4on1GF6i5dwn97mlampxFXaJIuJ/7YhZKXlszKG/xs6kpT1vRffrUiQj4YVSDSghKAsXu4ZmFhsrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=bvrad16R; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="bvrad16R"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F22B8600025A;
	Mon, 24 Feb 2025 12:17:51 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id zmPYzzhLvcO6; Mon, 24 Feb 2025 12:17:49 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B2F0D60010B0;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1740399469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJhIq3G0oAMOoKzG9yIQ+ICi9P7tZVxdwc4UlZPp6no=;
	b=bvrad16RGd/2qH5ZgrhTRdH/RgcBMTte9NoiIRPdyEhNNpgn86H6DcyuHorUuHp4XLd+W9
	Nle1ZiX/oPZxd7NeB3v7JNH/Zsj2g4nkl2AMhTZkzI8SR4mgOCePwIaysmbfCjHUcNotjg
	tbaKCQLTT8pQRqpVdfGYTdefPOiz4a0=
Received: from [192.168.1.72] (unknown [IPv6:2001:8a0:fbe2:fb00:fc96:36d2:d34:1e80])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 7CE97360138;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 24 Feb 2025 12:17:36 +0000
Subject: [PATCH 1/4] arm64: tegra: p2597: Fix gpio for vdd-1v8-dis
 regulator
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-diogo-gpio_exp-v1-1-80fb84ac48c6@tecnico.ulisboa.pt>
References: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
In-Reply-To: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740399469; l=970;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=V9fX9MC63IdLcgDds7S/X0mAm39y0aVt6nTbAytcSxc=;
 b=GdbCZ1GKnjk1LrUpW/cpB6YQ2/ygj8xgxY3N8lT8YOAboIMHRsKx2uSEx6JhSqaoKgj6+z/pV
 yMJzus6WqLuAzGQq5nrJ1fI63JHSowkDFuRMfNCad7jQpOQLVpIQEzK
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

According to the board schematics the enable pin of this regulator is
connected to gpio line #9 of the first instance of the TCA9539
GPIO expander, so adjust it.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 63b94a04308e86bd442d6c1d6558bdcf2fc65825..38d49d612c0c19181ec63790112f7a73597b8a82 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1686,7 +1686,7 @@ vdd_1v8_dis: regulator-vdd-1v8-dis {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
-		gpio = <&exp1 14 GPIO_ACTIVE_HIGH>;
+		gpio = <&exp1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_1v8>;
 	};

-- 
2.48.1

