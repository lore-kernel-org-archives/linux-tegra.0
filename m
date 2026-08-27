Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7383DC4AF;
	Thu, 27 Aug 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842487; cv=none; b=cy2uFneno+VqLzSt00isB20Eay00SjORSejaeJqI2pwqNYNN34AL89/Gx/Q1HwrEg19xDle42HUx6Xjjzmi2QwzeWtj8AOcV7sxbgTru1rbthQa9qVC1smMcfgtItxLwGQEhK7ETlFwvmUZkzk9q9I0Lcz48tS/8ciSZWXvJBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842487; c=relaxed/simple;
	bh=WncUy45zR/q2KT72/mK0sOiFVim8JVOJqwp+RpliJoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NV6f5yBlFPQL5phOg+oXHJ/0s/DiCEqoZ2NuCto9w8hBKmhx+beZDRkuoJzwzj3j8neHRLk4PiDlqLocBD1FZjvnSYPxSZTWSJp76fEzED61GL4mRT6R5+QEmaNsDctmkjczAgKMRKVG+hZxe/KRuO33ADD7h06FLRyYqHjfnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DX1tY0Jw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DX1tY0Jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38231F00A3A;
	Thu, 27 Aug 2026 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842478;
	bh=dmq4QhwUvwmzfoOddBiwVFdy7jpDLZJTDtUl9pZqcks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DX1tY0Jwxo1gWGUXs3l2o+NSWeu7K1vQ1mpuU/cI484rpXK3IWlotItodj0VxtRup
	 AEJ3G0Wqili8CH4UqPV3D6T0RQVkC4opqp07Z5NU6skR1Uvny7C0fTdfx9LtEDngAZ
	 8fQksmZDN60vxCRqEn5tGnnDsZuKBGt0dIgyLu5VcK1fkknXQ+ALPxv2Nld5LOZEP2
	 gKCG/33LUjQU9KJ9NLEnCameHc7gYCm3D2UK8K2rUvbNoMIMC3n1NMt25P5ZGiN098
	 D875q2ZkquQz2mYsUbf3E8gGUnJGwEqBZeq0wGazW6QPPy0473221twpUkbAQDzVGX
	 8s+0sN4V8J4Kg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 27 Aug 2026 16:54:18 +0200
Subject: [PATCH 1/2] arm64: tegra: Use consistent key code for
 force-recovery button
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-tegra264-gpio-keys-v1-1-89518c5fb29f@nvidia.com>
References: <20260827-tegra264-gpio-keys-v1-0-89518c5fb29f@nvidia.com>
In-Reply-To: <20260827-tegra264-gpio-keys-v1-0-89518c5fb29f@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689; i=treding@nvidia.com;
 h=from:subject:message-id; bh=+eszOeKaeLNYqoRatXlnypVyJS37GXfbktAZ5UsPsiU=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkE+oM3LfCbQfaNSoBAcX/RkFDIG8mQG1Y+7gX
 RL/521nEkOJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapBPqAAKCRDdI6zXfz6z
 odGvEACh2XkL8kOBqL7/YJNu66vx2X2ZE66L/XR2mUGUUV+xP55pQvVRlV3XgzUR9+zVglf8B6t
 FTBNEMKNVe7NVKyipdn2JUm6eoWon1p/TmDECrU+1zSXgl8vs18fiU9AYX4GhNIdCWhHKtkC7dc
 e3eLTI1+TFSI4d9u293R7xgPaTGudWVSxud2Q5GoBGlhtcttNxl1sVooMYZkFlu+0TXr7Uagxbd
 UkTo1ench8jYwxPbjMWGmWAhmt0cEvjiAY0Dumw60UO9ckbLc2pc1t3apERzUbmx7dC3rnU+zc4
 igics2N5doGxyt66UpOoarZIfLTdc7hxhAQoiebviGS+rdR/kHYhnsbP1+dX5LydDezbV6oeWiH
 jESVkdpcuW8ezM4d4VO449PwHyKMkOusigUqcxHq4eVSVV38mYwhNUpKpaETxlfy8TAfJp61CIN
 tRhlhX2QQQYlOw5HI2K6NfGpQjIPDMUuRkj6iD5YCfkHpoNHVEagtn763rD9pTheMpInGWiLndP
 uuy/uLiSce9T753zZqfVFvCRauKpS5pZA5mwTaoPA8q/zoTtFiZF6uB1a5dfbS9DtX2jRME3x8M
 7syZKT1DAFprCeAM04b9PxNkQhZPNJgmQ4PAY4IKE+zDsPKQHqXitZ1hxWae4MKhcL9Jlg8xxbG
 XFa4Qjew+MLJR0Q==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Some boards use the KEY_SLEEP input key code for the force-recovery
button, whereas others use BTN_1. The latter isn't valid because it only
applies to devices marked CAP_POINTER. Use KEY_SLEEP consistently for
all devices.

On certain Tegra234 devices there are definitions for a suspend key that
uses KEY_SLEEP, but I couldn't find any references to this key in any of
the board documents, so remove them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts            | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi     | 9 +--------
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 9 +--------
 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi     | 2 +-
 4 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d78b9bd45df6..6c5f1b4765fc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1750,7 +1750,7 @@ key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA_GPIO(X, 6) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
+			linux,code = <KEY_SLEEP>;
 			debounce-interval = <30>;
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
index 420858a8f4a8..9b990d1cef3f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -391,7 +391,7 @@ key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
+			linux,code = <KEY_SLEEP>;
 		};
 
 		key-power {
@@ -402,13 +402,6 @@ key-power {
 			wakeup-event-action = <EV_ACT_ASSERTED>;
 			wakeup-source;
 		};
-
-		key-suspend {
-			label = "Suspend";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_SLEEP>;
-		};
 	};
 
 	fan: pwm-fan {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 97cede1fcb70..f5fb2d327650 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -337,7 +337,7 @@ key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
+			linux,code = <KEY_SLEEP>;
 		};
 
 		key-power {
@@ -348,13 +348,6 @@ key-power {
 			wakeup-event-action = <EV_ACT_ASSERTED>;
 			wakeup-source;
 		};
-
-		key-suspend {
-			label = "Suspend";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_SLEEP>;
-		};
 	};
 
 	serial {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 41821354bbda..9b93074e5aed 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -216,7 +216,7 @@ key-force-recovery {
 			label = "Force Recovery";
 			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
+			linux,code = <KEY_SLEEP>;
 		};
 
 		key-power {

-- 
2.55.0

