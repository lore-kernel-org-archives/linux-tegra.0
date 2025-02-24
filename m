Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD4EEB5;
	Mon, 24 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399979; cv=none; b=aicCpLwxpbKH8bH3f7VGIiDUEN+d5K0+hSBq/oO9/rPLtI8Bwj+il9Pn6S++kT7xX+2ZH4MxVf0l1J+hUk0zJCwPkfzOHoOSNMHpIzkgh83Mf9rQzuJ9RATWzG4uAUZWvgcnPCSs+B8QeFDTR9xp7r9ZUoHt7wFiiq4kk35HuC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399979; c=relaxed/simple;
	bh=m2TAUiacPWUW4Y3x9jGWtKlSbY+whLQ/EDPgRZ3y1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3FFKMQEGG/UzSback1qyvdbvBimj7ffzUQxeUEn0nxjrZNixuf+O9eeX5qeZhA/RFk1yNwOAAT5KEqReSuYERB5sv5PsZivyetfej6d7UbMIAl/+8Yg3BhMLdyfLHsv0pDTyYyeUNReV9NYhMXePEu19HZ2X7QPx7JZMJR/ocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=EYgcry+z; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="EYgcry+z"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 37C09600141E;
	Mon, 24 Feb 2025 12:17:52 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id V6nBZ0iJ7Q9S; Mon, 24 Feb 2025 12:17:50 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E49B660010B6;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1740399469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUZ9fx0+xG9gwxcdkMydjW+NFqmD/HZhD3j5xEC5uQ=;
	b=EYgcry+zXYEN07TXmvghqZwPV4ovDXW971oLg6Wv0fuPiCW1MownPydeTWxRJ04oCsQqCV
	emSwEP4ilsXSqk05PQtFx1bqJgOEcFMzphsm/7EjAHR2C5nirgx/PvB1RROEXVdSE4lnF3
	U7BUW7jg1qXmIkGeLAjd0f/d2OpBLGw=
Received: from [192.168.1.72] (unknown [IPv6:2001:8a0:fbe2:fb00:fc96:36d2:d34:1e80])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id AE3B836012D;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 24 Feb 2025 12:17:37 +0000
Subject: [PATCH 2/4] arm64: tegra: Define pinmuxing for gpio pads on
 Tegra210
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-diogo-gpio_exp-v1-2-80fb84ac48c6@tecnico.ulisboa.pt>
References: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
In-Reply-To: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740399469; l=1037;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=m2TAUiacPWUW4Y3x9jGWtKlSbY+whLQ/EDPgRZ3y1sU=;
 b=UmjZ5rjihaWuJLTiuB61btVFkIhpkjTyxgdG5BTytbHwmdq7LYMlwITx/p52De/RFTqCs1YcD
 MgbCH0S9YCiDaPhomvrNzuTvMxh4UKuVuPtyj+2a0iJ6v/al5RPGCx6
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

As the gpio pads are capable of operating at either 1.8V or 3.3V add
both options to the pinmuxing so that the appropriate level can be set
depending on the voltage of the regulator driving the pads.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 942e3a0f81ed768021d2ac25f6369998a9fbfd76..b6c84d195c0ef9ae90721fada09ffd46a9c11fa3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -874,6 +874,16 @@ sdmmc3_3v3: sdmmc3-3v3 {
 				pins = "sdmmc3";
 				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
 			};
+
+			gpio_1v8: gpio-1v8 {
+				pins = "gpio";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
+
+			gpio_3v3: gpio-3v3 {
+				pins = "gpio";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
 		};
 
 		powergates {

-- 
2.48.1

