Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F46F2F8;
	Sun, 15 Sep 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726440488; cv=none; b=qHZ/dmUPEP76SfxfU1OcUjNUY9o/EYayqpxC9T920R7QcAVDPnNongV3KgpsG9Ms71YsV4VQDdt8zd3jr8i+e3FBOr+C4gUgqbsjKC8VNtqaWoxuY6Kq6OngaZdXSP1AwU+1gFUdXUdgVD8/ps39+IzIF806yQHO6bq4tx/iPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726440488; c=relaxed/simple;
	bh=Tw4YFLv5KGzPhjNFzyPeFKKPiik8CYlQKqceKFtvFhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kC8gSgwdCQy9BwagG1EjQscXVjc4/qoEKdWvmQOAFpyQX9sOFg1U6Z2ltbCxFEvAF6MSBDdADVmuvtgJpq5IeAldwuXI0rfasOCvHWsrMbsEEZiekA14tAXjDTtJJn1w59/NtoNMN8X1fg7mrR8/5MwYIMoBedn95qZXteo+ZQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmR2oEGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmR2oEGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4B96C4CECC;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726440488;
	bh=Tw4YFLv5KGzPhjNFzyPeFKKPiik8CYlQKqceKFtvFhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gmR2oEGJESHVZof1rcfEXrRnsXEAZZ9D1Wf1AJW2Gp80whqBPEa5xRLJpWYq6RL4G
	 dCxlCGYPjwC4VdKpgpsgQYqAnWQYnjQ+WausaaiH0MwYWEoUNkfaTpRyiz/hslwAi2
	 7+Zlbx6YxSYMCqTiOP2fEsKRR0bLW/p5CRTyoY0XUZN3gGK/shZQnIaxZzpMrrrdJ7
	 qYGnhm/KywS0BkGhKgb/Ca1y57XbgKgwRsR5waRafPo6DrgENMcdyGSUYR41ewgOO3
	 yREW6DFSUMb+goGHgg6+nUdgAl1cwuPDK23gZe5KBy/jPrDtFxb2IqvF/nvrNLYWOR
	 ZPxd9+tuKA9Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BBBC3ABB2;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
From: Jasper Korten via B4 Relay <devnull+jja2000.gmail.com@kernel.org>
Date: Mon, 16 Sep 2024 00:48:14 +0200
Subject: [PATCH 2/2] arm64: dts: nvidia: tegra210-smaug: Add TMP451
 temperature sensor node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240916-touch-temp-v1-2-5a008b2acbc8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726440502; l=1092;
 i=jja2000@gmail.com; s=20240916; h=from:subject:message-id;
 bh=bYRs+oTSlXN9NAJLiXE80By1YDR7fhYWaFKCs20PGS8=;
 b=ZeKzeV/Lb0PWjkv6ZN8ArjPpFKgoBtyxJe2gDH5S/UqnreuqZ/4dGEwyfUjR7BPszHFZEK0XG
 0NQgB3qh8Q0AjaQY2viy6oX4DqvMOn6YbNWh5NWLqmXE6ORhcRwvKhu
X-Developer-Key: i=jja2000@gmail.com; a=ed25519;
 pk=NV6r6q/S3nZILZkoOEuEM7F+uxANotfAYeXyNZTniJc=
X-Endpoint-Received: by B4 Relay for jja2000@gmail.com/20240916 with
 auth_id=210
X-Original-From: Jasper Korten <jja2000@gmail.com>
Reply-To: jja2000@gmail.com

From: Jasper Korten <jja2000@gmail.com>

The Google Pixel C contains a TI TMP451 temperature sensor.
Add a DT node for temperature sensor.

Information gathered from downstream tree.
Link: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo-m8/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi#1000

Signed-off-by: Jasper Korten <jja2000@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 6f77540fd397..c724cb4d5ad8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1732,6 +1732,15 @@ audio-codec@2d {
 			#gpio-cells = <2>;
 			status = "okay";
 		};
+
+		tmp451: temperature-sensor@4c {
+			compatible = "ti,tmp451";
+			reg = <0x4c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 4) IRQ_TYPE_LEVEL_LOW>;
+			vcc-supply = <&pp1800>;
+			#thermal-sensor-cells = <1>;
+		};
 	};
 
 	pmc@7000e400 {

-- 
2.46.0


