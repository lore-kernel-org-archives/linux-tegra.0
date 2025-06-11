Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15123AB86;
	Wed, 11 Jun 2025 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644330; cv=none; b=bqq0knJflcxI8Erw5RXJuzexImsCGyCfBzMGUpyxVI0M7FrnTUozc57uGrU8qmNzS2PRpi7sXpXwqReCfQOp/vg4eHux44Rs5EAv2B0aZNCqi/iQrk5ZUrrvtOeznxcTq9EH6Kc0DsDAm5QwA01xw46PbzMEl+3e8U4bQd1URss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644330; c=relaxed/simple;
	bh=sUvx/wvck3DWwoM60UZ5EmBz0+FG0Dh0VqEpqwsxli4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsIWOHA5gCHzFu0/z3Tp6RLJY5S/S2RmMirZGJFzgy6jhTE4XGmogMjIlVsllDhfZdkcMNLSimKHkLauNmlxAdtTKKBTM1rU6Za5xIjCeAJWT7TS6soKtdbjaiE3Dh/xMtRHqSscjd8trMCQS+XkCwDPMHhDqWK+93yECDbGZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=YHZj2Vpa; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="YHZj2Vpa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F2CE36000256;
	Wed, 11 Jun 2025 13:18:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id LtTk1-sK5NCj; Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 93B62600230B;
	Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749644323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAtd41PYA0O9EEUsoW42ZStHHiWie6FshW9WnJwDDxE=;
	b=YHZj2VpaTlyFAhfnmGGR3n+7zymDMVCuokdRLig65XlSXguLKH6otTg7hB3vmhyWf02/G2
	har2uBDlyBremadaeTvh1pmmnaTcDD4jCvOD19DgjMvrwc1M6z1FksR1XT/93g0zkEflgh
	/cCu7HoryYvq5m9r3gI8NGTBVbtRVmE=
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 7037A360090;
	Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:18:02 +0100
Subject: [PATCH v2 2/3] arm64: tegra: Add Tegra210 NVJPG power-domain node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-diogo-nvjpg-v2-2-01f8c76ea90f@tecnico.ulisboa.pt>
References: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
In-Reply-To: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749644321; l=1004;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=sUvx/wvck3DWwoM60UZ5EmBz0+FG0Dh0VqEpqwsxli4=;
 b=NwhZrSUIPsgNI1PyVHcPW0K9X7DuiUWPfeKNiU8AnjB8EHuko2/JWysHsLayhHE2NtuM0fii0
 hmdvuWzTupWCrMlrDpyc+lA0ri3L4DPbZlByYhE4+AHPqZGlbvOt2K7
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Add the NVJPG power-domain node in order to support the NVJPG
accelerator in Tegra210 platforms.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

---
v1->v2:
- Collect R-b from Mikko
- Explicitly mention Tegra210 in commit subject
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472af625d9d9e811f5af306d436cc98..6f8cdf012f0f12a16716e9d479c46b330bbb7dda 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -947,6 +947,12 @@ pd_xusbhost: xusbc {
 				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
 				#power-domain-cells = <0>;
 			};
+
+			pd_nvjpg: nvjpg {
+				clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
+				resets = <&tegra_car 195>;
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 

-- 
2.49.0

