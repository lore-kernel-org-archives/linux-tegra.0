Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FFE1B1512;
	Thu, 15 Aug 2024 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737573; cv=none; b=tHzfYv6QIbGfgdz2iq8s7XZ9Ba3l5X3hNO+4PTGGbODhNRN4yHTgtQYNRM7lIChnSrVGgNPNKRsBlu8WOm12KapJlZpYNiQUwItgZyje0yLty6cAy1ggvnsoqrP4dn3tjGILxXLYkXEC+SVh7+wtNaT68vWwkvUgzjYXRcM4qCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737573; c=relaxed/simple;
	bh=6kT1YX4EZoYoMCGt8N59fpEgjUPM1yOUHW6SYfWm1nA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOcAtN7Vy541qgu9OuGXWWTt+M3u8vUfHF35CxM8nKv8w0kbJywFBtr4pu9k9OkdTZtcBragKd4Ohm1Y3MSflkw9t2s6IHEHdumdY06yB2QcF5uwN8YQV8zPyxabdj/5mIMFAip9xFmtuRZy3UO6IXXfqyOctnF6F+OM+e4+fkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=pTMlL6yY; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="pTMlL6yY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4B6356002405;
	Thu, 15 Aug 2024 16:51:27 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 2ESdrbFJg9SU; Thu, 15 Aug 2024 16:51:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0FD326002409;
	Thu, 15 Aug 2024 16:51:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1723737085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zw8sTA1RkuHjHV/tQHc2+4lUq3i7SSQ+SfhAYL620MI=;
	b=pTMlL6yY3HBRF+8UeUWhpwh1ISj8LYJQekjtWWxf0Zebp326wAGjAkPMX3jtMUPl104Mmk
	KecIWwzUhVg7k+xXGhw62qNpyB25ChUNBBzM7p00ZX+f7H+EbEcNjmF8VHxVfqqkH/l0uR
	JZSdh2JquR7mjNyr9LRn/+GygwMr9hE=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:a82d:2c2b:d13b:a86a])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id DEA623600F5;
	Thu, 15 Aug 2024 16:51:24 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 15 Aug 2024 16:50:39 +0100
Subject: [PATCH 1/2] arm64: tegra: Fix gpio for P2597 vmmc regulator
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-tx1_sdmmc-v1-1-7856ac25a204@tecnico.ulisboa.pt>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
In-Reply-To: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723737084; l=917;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=6kT1YX4EZoYoMCGt8N59fpEgjUPM1yOUHW6SYfWm1nA=;
 b=u0alfFPb8m+R5Afmmi7xhP/75h6knzUBLJAnzkVd6N8RfIODKS7CYum4Wvh6/y+DHfSIxVChM
 ZV6Bs90Vp0fAIZZkA/DBIWbI80J27fCoWFeAzWgczNyZBox7+dx8xAT
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The current declaration is off-by-one and actually corresponds to the
wp-gpio of the external slot.

Tested on a P2597 board.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b4a1108c2dd7..3662b513d623 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1603,7 +1603,7 @@ vdd_3v3_sd: regulator-vdd-3v3-sd {
 		regulator-name = "VDD_3V3_SD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio TEGRA_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 

-- 
2.46.0

