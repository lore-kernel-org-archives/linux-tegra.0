Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111A1A0705;
	Mon, 23 Sep 2024 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115937; cv=none; b=OhD59aBLh6M3je8L18pXzIgjnMiiLwMTZjC4TqATKmP9JKSOl141XspeY6szU51qx6zR/s7LjJVcIogpmyVWWTiyaPXn+Fnh0kAVtj51N/i5X0oBdut/L+DIsM9J2HZZBZMlZnjYSF0OrJ6Lm4sD78pt1y8La8mxiiqn1QZ5hhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115937; c=relaxed/simple;
	bh=rgY/vVl37tp0D3IIw585H/GDi1MMkXIhiTN/63FpNmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MS8lQCVrSf4Km1XOoSEy+/0GlrVf7RGkhWWIfFIsYl8xdPUgbCwKOYEWye/bOphlsyzqA2+ixskL3ddw6gmS9/gdlUGDfcjtpMqn9dS2044adQaIC0UunaaMq3s3zWg/EWpal1GMKL+jkwJt1R0zr91CayZMH7zoRenyHY8uqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=MoWAEKAG; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="MoWAEKAG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0E216600231E;
	Mon, 23 Sep 2024 19:25:25 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id U7aY_7lLMOXz; Mon, 23 Sep 2024 19:25:22 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E9BB960029B6;
	Mon, 23 Sep 2024 19:24:58 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1727115899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TRSmLjrAR22kYsud3ztBVUWZY/lz/kb9Ctk04S0sog8=;
	b=MoWAEKAGm+r02j+TTrsqfmgXxFmnZPddBbSDUnskMpujgZmIO92mRH1USNSt/jWVY63GqU
	NdKptSANrSFnuYgG9SqpUePWZD5MpVZxIPSAopQm+RFYITn8uRXof3CjoORt6ltTxmG56M
	Of8LgNxDaC5nRJdFS0FVKi/YmCeYD2o=
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:6a67:5600:aca0:c311:d240:b169])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A542A36011E;
	Mon, 23 Sep 2024 19:24:58 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 23 Sep 2024 19:24:51 +0100
Subject: [PATCH] arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-sdr104-v1-1-ec7b3394f880@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAHKy8WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNj3eKUIkMDE11js+TkRFPzREsDE0sloOKCotS0zAqwQdGxtbUACqK
 PNlgAAAA=
X-Change-ID: 20240923-sdr104-36cca57a9049
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727115898; l=1337;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=rgY/vVl37tp0D3IIw585H/GDi1MMkXIhiTN/63FpNmE=;
 b=M3J/ITte7MRVZdkbs49/Vl/+YYNyUfrPHUQdfl6ucPE9rPm7zvs1016mthrc3Ij+Rl7wHcoSK
 S4MjK+5/e5MAdMMNw9UT55hR+0n6ToqsbKQYLuwtfKYQlhhQsKyXh+7
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Define the sdr104-specific offsets, preventing the driver from
defaulting to the 1.8V offsets, which cause the system to hang during
the SDR104 mode calibration.

The zeroing of these values was chosen since it restores functionality
and no better suggestions are provided by the Tegra X1 TRM.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 882b1d1f4ada8d9e275e5a6bee633a21cc6cdb2d..942e3a0f81ed768021d2ac25f6369998a9fbfd76 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1218,6 +1218,8 @@ mmc@700b0000 {
 		nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
 		nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
 		nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
+		nvidia,pad-autocal-pull-up-offset-sdr104 = <0x0>;
+		nvidia,pad-autocal-pull-down-offset-sdr104 = <0x0>;
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x4>;
 		assigned-clocks = <&tegra_car TEGRA210_CLK_SDMMC4>,

---
base-commit: de5cb0dcb74c294ec527eddfe5094acfdb21ff21
change-id: 20240923-sdr104-36cca57a9049

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

