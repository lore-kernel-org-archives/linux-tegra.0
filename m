Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2D19F121;
	Mon, 24 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399979; cv=none; b=O6zF75v1BpVkNMLpT92sC/dkWw3q3PdAoFZhlgtYOovuCGQz4KYqOXe4x8FE2d/KfBIHnBH3IoKZt3u9jhzsOafkKQi9VZUcS+RcBxCjofcmdE0zTmo0AeqXOFbVG+NnCM/GjdJRoSfrQ2MJ7ETZLlpkW6FfESiKvLw3hCToXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399979; c=relaxed/simple;
	bh=Lg4EBOxfqs+Acc/x6WAt/cXhbt+U271Lsg+0HOHakoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qv/mwWvJoJYOLkfaWsWTunQj3Fw47iDho3YvAVJEUjhul6n8dMTT7SuAX5bC7RWZPguRi6k+SEaf4NGtKyGCAi37lezmJiT3cCpNDxpDoUQnVLvO10/j+7B56pgITbouG2nFzCaO3Og5M58gitFuH8Bwb+XAc7RE+y7oghPggtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=tXqZTsHS; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="tXqZTsHS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BC0B66001423;
	Mon, 24 Feb 2025 12:17:52 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 8KL2mytgH8aT; Mon, 24 Feb 2025 12:17:50 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 54F58600023B;
	Mon, 24 Feb 2025 12:17:50 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1740399470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBqsy8P9gxIHnzKQ8cjeMy25Dgn3QvMhFYKw+rj3qdA=;
	b=tXqZTsHS0f2AJl9lf4mGfWsVJMeOrOGL3IPZPhslzU/1FNnu/QphyoIuygCFPePoT3dubG
	v8S2iaiX1MVtN12L7fAtYOYxOVtiklws3dxEGj6wvtxdMVqqBNmAiZwN2cJv+gXihU4r+m
	X3J6mASuTxmJ3OJRz0sgIidQSk6kVnM=
Received: from [192.168.1.72] (unknown [IPv6:2001:8a0:fbe2:fb00:fc96:36d2:d34:1e80])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1E78A36012D;
	Mon, 24 Feb 2025 12:17:50 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 24 Feb 2025 12:17:39 +0000
Subject: [PATCH 4/4] arm64: tegra: p2180: Add TMP451 temperature sensor
 node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-diogo-gpio_exp-v1-4-80fb84ac48c6@tecnico.ulisboa.pt>
References: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
In-Reply-To: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740399469; l=974;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=Lg4EBOxfqs+Acc/x6WAt/cXhbt+U271Lsg+0HOHakoE=;
 b=K6BHr9DjohhySOjS/18XUgoVw36431RsEtq+4sNAC5mw72hWFiSo7TempBBS5qoTzjLjPGdqX
 nQ/nSWZJAZJCgxsaZ/9BCDLDiwh74w3lvnY4HJ0Ah/3rA2kUhgsJ0Ow
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The Jetson TX1 module contains a TI TMP451 temperature sensor.
Add a DT node for it.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 1c53ccc5e3cbf3ba213535713af44a2a0d909f10..9b9d1d15b0c7eafd3895f02db1bc747d7cc8923c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -49,6 +49,19 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		status = "okay";
+
+		tmp451: temperature-sensor@4c {
+			compatible = "ti,tmp451";
+			reg = <0x4c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 4) IRQ_TYPE_LEVEL_LOW>;
+			vcc-supply = <&vdd_1v8>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
 	i2c@7000c400 {
 		status = "okay";
 

-- 
2.48.1

