Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF75B216;
	Sun, 15 Sep 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726440488; cv=none; b=TX5d+tL2xwjIr78vEVArfyxpYNe6epYpJiMrPQs7tBmZwsqQRASPA8Kbdgw4DbDIHIf+c0tjhoL6v5kTA/x61SrAdpgBQdHxX+gUyadxjbTOncMoat2f83yuqxPNdn7gyl2rWQvxxj5GFi2YsYAIe6ikHfA7STPzwksOcOJOcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726440488; c=relaxed/simple;
	bh=A5gmCGk6wjjVat1CCMtzmUFixbs9K8glOQ8cDA8fW44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oktH8ZfTmrZdJFmfDiQWypnDmdK7DmzlhjVxWq67RB55R1S76wKRR4uTocM9Xh/0x5zHLFgo0mcv1UGrsJr8QdY9YS2FiFcWPFNj4tfb1b0EmUv4XZMbTA5Bj5K1qx5otWsVZfDb4pIM3a6ewru18/goY9CD6m+cNOLvV3GTCqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwjb6X0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwjb6X0x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7A59C4CECD;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726440487;
	bh=A5gmCGk6wjjVat1CCMtzmUFixbs9K8glOQ8cDA8fW44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zwjb6X0xjbE9bWTwLBJ6S0kpku0JrbZtLtuIHrUw71vEB/j65wAjxrYoUzjgqr7ya
	 y+mYeSzCGRO0aRl4AEEZnxK6vU8FHmooR75J9MmZcdjvseF4U24zDRLM2uCQmea8+M
	 hPZRqPOqqhD8nDc4XdOMh2GCkUoFC3vXat1cYivho0J/RZ+CzBJay8ZNs0zY7hN2AR
	 XLGs4ON1LBZMrTU/gIKzvD+SbAdsqLCg/pQ1ISSto+4jzrDvDzkq2pZxdMAEctfMUH
	 7plyZmK2hSu+WmgzQt0rX6wvQdEz+VbyQxNEZpiLQvA6ZPU535q1yC1QA1IYl8GYKp
	 4fJ6PsFtVIuZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EF8C3ABAF;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
From: Jasper Korten via B4 Relay <devnull+jja2000.gmail.com@kernel.org>
Date: Mon, 16 Sep 2024 00:48:13 +0200
Subject: [PATCH 1/2] arm64: dts: nvidia: tegra210-smaug: Add touchscreen
 node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240916-touch-temp-v1-1-5a008b2acbc8@gmail.com>
References: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
In-Reply-To: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Jasper Korten <jja2000@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726440502; l=1157;
 i=jja2000@gmail.com; s=20240916; h=from:subject:message-id;
 bh=6mK996nKHGO6KB4fA8zD2TKs8erLyGTuSaVELErvZ74=;
 b=K7zIyR+AKL4IAWMMntVNlIcMsY14XFP0GGL6wY0Iw4hKElB5bXLmsx2VXUv0ETKdmZHAm4K5U
 TIW81mUuxX4Cv3lRNtSKBcw0n7TMIPK+KPZFuTr/NjSeQsIBBh0CCOc
X-Developer-Key: i=jja2000@gmail.com; a=ed25519;
 pk=NV6r6q/S3nZILZkoOEuEM7F+uxANotfAYeXyNZTniJc=
X-Endpoint-Received: by B4 Relay for jja2000@gmail.com/20240916 with
 auth_id=210
X-Original-From: Jasper Korten <jja2000@gmail.com>
Reply-To: jja2000@gmail.com

From: Jasper Korten <jja2000@gmail.com>

The Google Pixel C contains a RMI4 HID over I2C touchscreen.
Add a DT node for the touchscreen.

Information gathered from downstream tree.
Link: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo-m8/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi#542

Signed-off-by: Jasper Korten <jja2000@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 2e5b6b2c1f56..6f77540fd397 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1362,6 +1362,19 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <1000000>;
+
+		touchscreen: i2c-hid-dev@20 {
+				compatible = "hid-over-i2c";
+				reg = <0x20>;
+				hid-descr-addr = <0x0020>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+
 	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <1000000>;

-- 
2.46.0


