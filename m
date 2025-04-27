Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4674A47;
	Sun, 27 Apr 2025 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745714737; cv=none; b=P9cQKJm0vjDVa9M6oKzoY569QmGh2HxIz3CYnk1sQBrEjbWv5ta1i46rjQs5bGAecFdoGfsoNW+aFwjrRO4ZUYccktcsteQ5h0RuP9Vx/XGqdz0XQUQ/rZU2aT6x9uudsUq0O2uNI84YqPvds6nJXhSBqZKbeLMMTxAJ76z1vI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745714737; c=relaxed/simple;
	bh=26Qjma/8UuPLK7Tg65G2MQ/UyfPdHlfAwlbBsBDewHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pYOX0pv57i0ELHRMFusVrc2uGCKmsTHQg8EBhOuFUYMq4qh4XwScAmO47MSxMqAB0holYX2mlstLQVHGTlNe3ZgiiMLHPQ7xpx54bJPtEdL18R85csY+cQsp+PsVgymCOSvCXlJBApEWJxu4iPB/gFE6WXyPsDX8emerkzixG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrPxreGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrPxreGA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9D0C4CEE2;
	Sun, 27 Apr 2025 00:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745714736;
	bh=26Qjma/8UuPLK7Tg65G2MQ/UyfPdHlfAwlbBsBDewHo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QrPxreGAJeXfe7C375mGS/OvlfL4x+6hDBnV42y4Dp5+ktDIHCR8K4kgkoSbfY264
	 0uoA/52fG/TWQED2XySueg1WKg2snJuE3/3vbsfGdAxFAHy6wQFDgGOBhbmMoaaDzc
	 1N5v6c1EObn4Hvv2J1gYcF1J5PS+bFg89e/CvJ9bVLIyOaXuvcHduT5V9NKCGsGelH
	 t0yOQn8LLv2+kikfm4APBcoq9mgGAT41+o2m2k2NINDcmkT1/aBYXj32S49caE0nPg
	 WFw2aWhX6JXHDZ/VtV12mm9vOY8dlqlng0lkXeYIp9UjZ77SoZZr4Akbm0ad3RRyEF
	 ZI/PZUoUVWHLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDC5C369CB;
	Sun, 27 Apr 2025 00:45:36 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 26 Apr 2025 19:45:32 -0500
Subject: [PATCH] arm64: tegra: p3310: Explicitly enable GPU
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-tx2-gpu-v1-1-fa1c78dcdbdc@gmail.com>
X-B4-Tracking: v=1; b=H4sIACt+DWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMz3ZIKI930glJdw5S0lBQLE0OLJENDJaDqgqLUtMwKsEnRsbW1AHc
 nTzZZAAAA
X-Change-ID: 20250426-tx2-gpu-1dfdd8418b11
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745714735; l=1085;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1qwq1cir+VfwVl8dxdzM8N5/93zGvcNjh8ZMxb/dTUA=;
 b=/3z+hRDAhqVhbJV7GtS0ycYT8SD07OitzJS9dZ0VpCAlSDVL13n+LmOziCze6bnicQ5Io0DDN
 he4ClbHSx2YA1sOUozlsS8qjeR/rhh6ql13r1nOWL3VI+WjQuigWeyd
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The gpu node originally was explicitly left disabled as it was expected
for the bootloader to enable it. However, this is only done in u-boot.
If u-boot is not in the boot chain, this will never be enabled. Other
Tegra186 devices already explicitly enable the gpu, so make p3310 match.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index e2d6857a37097c5acc38dcbfd12800d59510f1c6..8aec6999603059107ba05cdbbe8bb497e3824a06 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -191,6 +191,10 @@ pmc@c360000 {
 		nvidia,invert-interrupt;
 	};
 
+	gpu@17000000 {
+		status = "okay";
+	};
+
 	bpmp {
 		i2c {
 			status = "okay";

---
base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
change-id: 20250426-tx2-gpu-1dfdd8418b11

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


