Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3648551995;
	Wed, 23 Sep 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181931; cv=none; b=dbrg25loNWNkeaXSmC5+wNXFDDWF4Hv6gTIPXncjfPHxvJlSbsyfE2bdiqdRPglrVK++h5gUrVCtbbHhO1BjKCl5U3pDgZr+NEMWKb4QlZmscoMMlrrswc1hkMFXCLHQIoLKA4OPwEwj91w+4FrnslK/Sa/Ipkklm/PcIrrslRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181931; c=relaxed/simple;
	bh=tQr3CiBv0lFCLb/judz4EZN8kzjAJTlXEsNR9YXHWv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6FodhKKxnY9+WkoDp2vH2iqIIUeY+QW5DBRZpY8zdjHpcZ6nFKc01Kzx7ThC4ObDKssGCKTl+DA2dQhodQafnEWuBPBfNp9uocnUVnFVKyQ2QpoWXObdfH/HubV5LMfuUsYGNDKPq83cmDnYGUUPGfmVPE+NtpZd9lrfJBmzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Kb+DEL3c; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Kb+DEL3c"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 96287600540B;
	Wed, 23 Sep 2026 17:45:18 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id fLmbxB2QhJ79; Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 719AE6005417;
	Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790181916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSEIX5Fj3xnU8zMOJVL9DqRfDlZSug5NVXWVuygHjPg=;
	b=Kb+DEL3cD/rfUqvZAix+3ZRdf/N5pa7kP9eYMDzB1dcOmYHGmWqJCaZqy4Aq0DeyykFWd9
	/q6UfMGwtNXpDpDWg/vnZPHLcEH//wJfpiuPPYPDKg0wXzDVGkOpZyB4pCtkhOnz9whCmL
	UcbI8r/RCha1rSqvsGvdMIUbwSJQfS2nMHCUAgRWYsTc3KAX7ZZciwh/zHyEaK2ufoyGEQ
	aQj6xg8HLbAeHGzgppXiNFel/zxgZY2NG+I1Mc0UO1x3D7nptBayhfctCBrpgeaLt1JxSH
	oCQ9RJsxxg/byfMFCgcl1DUPQzWFQI8Lh3RhrT/aSsqWS0/e9VecQpxbf6OFeg==
Received: from [192.168.1.82] (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 370CC360131;
	Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Wed, 23 Sep 2026 17:45:11 +0100
Subject: [PATCH v2 2/2] arm64: tegra: smaug: Add rt5677 mclk1 input
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rt5677-mclk-v2-2-6ca31e8f68a4@tecnico.ulisboa.pt>
References: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
In-Reply-To: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Ben Zhang <benzh@chromium.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790181915; l=801;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=tQr3CiBv0lFCLb/judz4EZN8kzjAJTlXEsNR9YXHWv8=;
 b=RZjH8nz2xFlTzW9X1RM09RTK5UyX457l8J6+2yaBBEPI2YKkA1uARc1QzYim3dtLxV/Uv6RSU
 6EpHDGE08wMC/ByArXaO9rcmg15upUXScFokhr1Wtw+kgaL92ezvRyT
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The codec's MCLK1 input is driven by the first audio clock output of
the PMC. Describe it in the codec's node.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index e0fde65a552b..ae8ce941f20d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1754,6 +1754,8 @@ audio-codec@2d {
 			realtek,reset-gpio = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_LOW>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk1";
 			status = "okay";
 		};
 

-- 
2.55.0

