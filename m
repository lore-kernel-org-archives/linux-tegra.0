Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A554219FF;
	Thu, 14 May 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770534; cv=none; b=EwVUMlghU3zUdNx38wNe8X+PalfUXlI+108IbO1iTWunFBrkGrj/XcS9zO0MWU4hjfjp1NA43ltQuqXKW1m57rxrDpzzZ7G+bhE1eEmYpJ/iHevKBgMlMlFgJfNzLkje4PvfHhk9H6pROu/7ydYNvD08n322UCX216rBQfViOxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770534; c=relaxed/simple;
	bh=8xZjmEb0d95N1+sb8980A/vPSc/pHkMH8Oys2etbVAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+0TstC87YVoUMmxhXxWCQEX2Jqp0aEioh4D7qNIKZrBloBJlx103x5c+3+Om12UucCytjHxbUVRZ3dgW5D++8gSx4XiAf0r+5XKykMFumhME4N2mhXhvDVSWBpM5/5IPbKX2cX34x/MO5kLAqVbF6OEnplTOz+eM8f0ePUtRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=efsLmlWd; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="efsLmlWd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AF71760020C9;
	Thu, 14 May 2026 15:47:31 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id OinNfQWH81a8; Thu, 14 May 2026 15:47:29 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id A955060020D6;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcd1JbPtrEgwdOAeh0HthnUl2Zq4Rk56InIYU9qFrKI=;
	b=efsLmlWdYYNiU5dA0Dot0WXBUlxQX7fnGCJX1BPRVzeCxzDCPaal+fsDSvYvjyuq8DTU2I
	iGciiVW/QoqWxmBIIjMujMUemOWvs6xnKrRaBe1wIn+U1LvaSuG2pzcc26ozW8tTIchpVP
	F4zaFcGR6NBGYEeBthuy+uJblWiVzJ5OKendEPZUS5p73YUkQHPo2iDdJtKNBX/Kk14Du3
	ql62isxTd0a6jMrLpG4vi77nTIUTcI9AU7UQjpINp8cqFKejJ+uyztiF6N3zeoLq3iTDpO
	GY2Qkd0deq81AjpmivAQRP35pUDR4B4AyfcbBh+0m2W9BDhC2V4xz1OpqNjnig==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 16B61360249;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:22 +0200
Subject: [PATCH 4/4] arm64: tegra: smaug: mark MAX77620 as system power
 controller
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-4-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=857;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=8xZjmEb0d95N1+sb8980A/vPSc/pHkMH8Oys2etbVAM=;
 b=fAg7sGCuUVA0iqnWf++Tln0G9BLmwunVozYRTTAPsp51y1pPfrbVXJeU21dWwC8wa8i8qLzU1
 RSAjLik/GjCBtFgrjC/UcDxwZVxEQlg6mU1osM6V+Jtt3GBIBV27s9a
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Register the MAX77620 PMIC as the system power controller on
Pixel C so the driver can install its sys-off handler.

This allows the PMIC poweroff sequence to override the non-working
PSCI SYSTEM_OFF implementation on this platform.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..1791b47f0a73 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1467,6 +1467,8 @@ pmic: pmic@3c {
 			gpio-controller;
 			#gpio-cells = <2>;
 
+			system-power-controller;
+
 			pinctrl-names = "default";
 			pinctrl-0 = <&max77620_default>;
 

-- 
2.54.0

