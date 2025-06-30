Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6023F41A;
	Mon, 30 Jun 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273903; cv=none; b=JBJNGjl54yAxiAwFQnBKm40i9Xhe1TdZ9k58Hu5WfdK4HqrET6yd35Chue8BxnBlXUYc/nTAZRVbZuGWdbG0x8AS5Lor1Bxtm2f9B6V1uWspbe5ioZXK9OY/QP43Pgdf3erz3SlCLIj+Pd1x8ZGMOIP9XekoPzyAD8XUYDLe4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273903; c=relaxed/simple;
	bh=/HZgvuisIfLWm4oYjEwmKUUiuxsFFNB7OUIbwfAJ8CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APbUOYIndbOHP7ZNclCg/pYZhaRhZTfOzjQAO8A+jFPaq2Gg/P1y+e0lyYiBlPMP1dJ2tfsG9jUPUlLVpQZ+jSoM9FodMGKpCPVwk5gRsOqTWrd9i5ORtWi99NBTj24V7aS47jYeRAcTqVjuzO6urRo9yMZh6OMi9q3R9cxnmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=pyZQpbZr; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="pyZQpbZr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E13AC6000256;
	Mon, 30 Jun 2025 09:49:23 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Bqp_2Y1ihYB3; Mon, 30 Jun 2025 09:49:21 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 669D16000867;
	Mon, 30 Jun 2025 09:49:21 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1751273361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCTCtbJiF3BmOb1hgp2abe8fETWSITM45X9nykcOFUY=;
	b=pyZQpbZrDtlTQh6A5Zp2UVg+a9+pztTNBZw6sgtRqyRJFJkWSDGbvFYz60J2Uy0Icte371
	aDcz/6hdX/WSjZH5ulbKKFA6qActciesGLPiHSD5yRnN4P7OsVR/X+asQL60qF6Car4DaZ
	USKItKARSTDyaIBVlAThCBn19KfQBSc=
Received: from [192.168.1.69] (unknown [92.56.11.86])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 31D57360084;
	Mon, 30 Jun 2025 09:49:20 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 30 Jun 2025 09:48:44 +0100
Subject: [PATCH v3 3/3] arm64: tegra: Add NVJPG node for Tegra210 platforms
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-diogo-nvjpg-v3-3-a553c7e91354@tecnico.ulisboa.pt>
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
In-Reply-To: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751273350; l=1266;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=/HZgvuisIfLWm4oYjEwmKUUiuxsFFNB7OUIbwfAJ8CI=;
 b=sR7AhyALXiAhK9pLgfAfjbtvFFugf3e1qywNfAHVoWUea5UMSa+xRtFaTVcZ4juxRojQT+X2C
 2JuoXnXN6vuCW1uK2WPAmbW8QnnjJVMG6t3o/MAwHbGXSTbfwUeWWQY
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The Tegra X1 chip contains a NVJPG accelerator capable of
encoding/decoding JPEG files in hardware. Complete its DT node
and enable it.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

---
v1->v2:
- Collect R-b from Mikko
- Explicitly mention Tegra210 in commit subject
- Be more precise in commit message about filling in an already existing
  DT node.
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -253,7 +253,13 @@ vic@54340000 {
 		nvjpg@54380000 {
 			compatible = "nvidia,tegra210-nvjpg";
 			reg = <0x0 0x54380000 0x0 0x00040000>;
-			status = "disabled";
+			clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
+			clock-names = "nvjpg";
+			resets = <&tegra_car 195>;
+			reset-names = "nvjpg";
+
+			iommus = <&mc TEGRA_SWGROUP_NVJPG>;
+			power-domains = <&pd_nvjpg>;
 		};
 
 		dsib: dsi@54400000 {

-- 
2.50.0

