Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7F137742;
	Sun, 20 Apr 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745187921; cv=none; b=DrgG9VGe1W6RXKQmp7WLiiIPQaVV+RgMQpwTe5sQlTORmCEV0M5oPn5abHvxxQ6vT/4Ao55Vi89pGBR09ZkaSpLLbAMx8cF2ijNjRhj1k1luUPEELfkJEssMVlESYUW6mE5Uhh9OrSKV1m6ro9G33HyTSNy+o5wKyZD+IVMA2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745187921; c=relaxed/simple;
	bh=PlAj422fu21xPwshqi8NrvX+Jh08YMVZ7po0ZvzpsQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LGevkwAUpdGdfE2h8NcZQMOHrE3/u2AspIGDBjdHMozgir1LonjkyCnF0KgYD4kVPo9WL7bnP5uOVDBxJN3jiyMzku7mV9l2+UCap4k5egyD+Fqmg2bR6nXiV2BeXONGMMp36qJbNia2esJTj6oapfpJnHqmilLCn7VTGZYl0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6jPJ2iF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6jPJ2iF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66B44C4CEE2;
	Sun, 20 Apr 2025 22:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745187920;
	bh=PlAj422fu21xPwshqi8NrvX+Jh08YMVZ7po0ZvzpsQA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=o6jPJ2iFWwyehGEC6ryWqKsY6jdZXfkJ0K8CwC8KlZ1SoTUit/xG5vprhaXWE83Cn
	 SNahbqTXuSCGaMwi0GmY+Cqw6XdjBzq15ezQe8y2CYrwxm0UqOnPwWxiGFCh5n4jZf
	 JOC2jJ37h3Achd0ms1sMnw6+CpzHBie/CGb9ffL+EVTsyK0YuGNnsUIa9Ea0zSchwZ
	 STgPFlJReR9C15IlVJ1IhwNXR3uyiJAK2jMCbtkCy2Z3+Kd9SvV0AYs+5mVjUAgkbX
	 SePZUJLvlHVAqmMd5iIRkfn1UiyYVUizAck5dUpWl+FMt1/QZ1PCgehKlS3ES7YFPY
	 wQlkdYMX9vG7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524ABC369C2;
	Sun, 20 Apr 2025 22:25:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 20 Apr 2025 17:25:17 -0500
Subject: [PATCH] arm64: tegra: p2180: Explicitly enable GPU
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-tx1-gpu-v1-1-d500de18e43e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEx0BWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMD3ZIKQ930glJdc+PEZDOzxOSkNHMTJaDqgqLUtMwKsEnRsbW1ACk
 6xWJZAAAA
X-Change-ID: 20250420-tx1-gpu-73ac66acbf74
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745187919; l=1054;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xOP1qorYfIKy/JD/vdHL6TqHyXFrVOD0GptP/g0JEGI=;
 b=9vXoeUCh0EbCHiSvINcUZYlQArbvwD5xwC86x0cvYvS4Q04j8Q03UoJR1QPBXfqHJ6CQYA2+i
 gaSrOY0tvV4CK7LVW9Q7EOUJL/hvvOatysjCWm4sde9rYmcv9iiEUVF
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
Tegra210 devices already explicitly enable the gpu, so make p2180 match.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 9b9d1d15b0c7eafd3895f02db1bc747d7cc8923c..c57bd1356381933a16fc1ee64773961bedae957f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -24,6 +24,7 @@ memory@80000000 {
 
 	gpu@57000000 {
 		vdd-supply = <&vdd_gpu>;
+		status = "okay";
 	};
 
 	/* debug port */

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250420-tx1-gpu-73ac66acbf74

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


