Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E6C286887;
	Fri,  6 Jun 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206767; cv=none; b=RSRpSLP3G8YLcDtU/Y5nJjnZPLda8SnIvJUv3ZpOGkRcqEXnMA0y0Cj/Wwx18KuYVCWDg7FFxOQsjFeQrgF6FL3KiSHYz87jSmEd659Jx7RH8KDLpBxPQlLFMrb+Zy0tYnBREyjyJKscb+miUSnD88BbN/MX2Wkk06BuzY4qly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206767; c=relaxed/simple;
	bh=q9+0oSCFBDd2MWoVLijNz55CY4fughnVcsPn8mNInYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkwa5uASRYz6QfKn32AEihFeyFC6xijAYe9nfkoH/v70QAW4aC6iyU71S2sveoAK+poaj0B9LRypWG7ykeVc487BXx6M2F/sutx/F95q+Vdzf0bZ3/b8DbepFZfwpYY1PifiXAEtIiMdlldv7Y5spg3ALFqjhZ30CPTZtj/Lya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nN76/b5F; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nN76/b5F"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 1313E600025B;
	Fri,  6 Jun 2025 11:45:57 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id SKFrJ_ufbfh2; Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 669866003C38;
	Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749206751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaEG+cKz+JD7aGSqShRfi6WuHINMdAa8GgHkpLiaHhg=;
	b=nN76/b5Fc9fyfazu0yO0KBn+vM+8+8tl9N5fWxOVFy+I8pjCzdBXaUeivJaffJjKVYtolc
	GJgeZsZoA4bPsjYmOgWHdtjBMn9vbhI4SIvReWQUEBaQJJHRSB0mB7Hib5d5/YHpbtmxKz
	5bTrPnw7B1V9JV999yBWUGIWTmhZexE=
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 42E1036008A;
	Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Fri, 06 Jun 2025 11:45:35 +0100
Subject: [PATCH 2/3] arm64: tegra: Add NVJPG power-domain node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749206748; l=837;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=q9+0oSCFBDd2MWoVLijNz55CY4fughnVcsPn8mNInYs=;
 b=t8KGWayT1F1ZRaHRceA/xKDnrS5cgasfW6I8W+gARg/gYoalH/NIMfV+R8JL2J5vnJPiZDmpj
 drsywr+cHJzCOkrYb0fzGtqS+sBMw0GedI2DZjsU7tLm4/sCmTTve2r
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Add the NVJPG power-domain node in order to support the NVJPG
accelerator.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
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

