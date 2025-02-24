Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8F219301;
	Mon, 24 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399980; cv=none; b=FSpBoxlYsvDrwda+EDV2c6tmCGSxL/h3PcMt0RimRFufJsKco2CiMIX5DuXgpLVzOCfI0cwqS4d+5TGRL9XA9twgTxfs+pn5P0vMhE1a1Ied9p2cNNmdGFB4uzhiqZpOfWDlcTF8kUqYClJ+PYhaMP0yBhenZTn5yfsdchg0oEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399980; c=relaxed/simple;
	bh=cHIhxV2ckoBoy7s+cMk8QGhfffhwC+SKiOLZpFLtQmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdcqyvtGOqzyMYz8wJ8ltZFTjubPHqNgNY3UHSamfh6Uxgl1Wr+3hZ3LoWKb/eFD7tIRSPJQq3Td0bkn6oCjIaA9OOvTsfjhNdL5Ye8ybcLscZDZ7HzEb+KtaM8vP/3dof2ncB2h7nk14xVZVJZETI2iNT2UG4J9N6P1l8Ci7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=lX1yvIQP; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="lX1yvIQP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 74B4F6000257;
	Mon, 24 Feb 2025 12:17:53 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 2_y5GjxFLWF3; Mon, 24 Feb 2025 12:17:51 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2148260010B7;
	Mon, 24 Feb 2025 12:17:50 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1740399470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FIchYGd+ZEGC+cTepd6O3wMzNGHE5HkmVKFiIATJvg=;
	b=lX1yvIQPBxV/+QSM7YLBBm0g61A29PJx/7U9ov/1MLgDVtOz6oeSdjYwSaAFv/cTNzhNrC
	bNNfyFCcaUNNZ6s0qL3hfTB884JXSxbRoPkudfFEBOMDTuBWr64WnS59MiDOSLDzo1VnUm
	V8wNRUp6FocXNG0mSAilwZQN5DvDrMs=
Received: from [192.168.1.72] (unknown [IPv6:2001:8a0:fbe2:fb00:fc96:36d2:d34:1e80])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E008D360138;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 24 Feb 2025 12:17:38 +0000
Subject: [PATCH 3/4] arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-diogo-gpio_exp-v1-3-80fb84ac48c6@tecnico.ulisboa.pt>
References: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
In-Reply-To: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740399469; l=1294;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=cHIhxV2ckoBoy7s+cMk8QGhfffhwC+SKiOLZpFLtQmc=;
 b=HhUz2xea/ZhgzxlCnZaQKUxLIPDhaBzmP3ewi61JzxEEEusJKrd39A1WUgGh1TfaGjdTitMU+
 qCEGTsKNVm6BZrRohTB4rJ472z2j27zvhJ1iJZgyE9PmVF2oyBnHvXX
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Fill out the DT nodes enabling both TCA9539 chips as IRQ controllers.

Proper functionality was tested for both instances.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 38d49d612c0c19181ec63790112f7a73597b8a82..83ed6ac2a8d8f403fb588edce83dc401065c162f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1375,6 +1375,15 @@ exp1: gpio@74 {
 
 			#gpio-cells = <2>;
 			gpio-controller;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(L, 1) IRQ_TYPE_EDGE_FALLING>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio_1v8>;
 		};
 
 		exp2: gpio@77 {
@@ -1383,6 +1392,15 @@ exp2: gpio@77 {
 
 			#gpio-cells = <2>;
 			gpio-controller;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Z, 2) IRQ_TYPE_EDGE_FALLING>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio_1v8>;
 		};
 	};
 

-- 
2.48.1

