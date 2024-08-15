Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F631AED29;
	Thu, 15 Aug 2024 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737572; cv=none; b=JxJdClZFTlRFUpPeFlE42pavQltMjC7QfjXagULzb65eKcMjbXHXOLgCCOHxHMItCa4N4sVEmR4YAyox1jdBtdupkWpAWx7h0cRpXpxy/uguu01nfswkxnWYVc2Eyy84AJDG24B68s4otsE5rl/4YgnjHCchivQyZcPXmxHmeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737572; c=relaxed/simple;
	bh=fRqLuTmEelW+w0c011C0VYoP3EAF+MoUlyRStcfUlcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYxODJGAWIGRQu6yS4qxJ1D3xQ7oEqNgouFuey0XXqOF9knRS6lAJW6ciwuverDLDOTLkOCqk22zi5C8rJD8NTOPyU6UqLthEqs5VfBGAu4JlzwvBhaMHiUiygqK2RdggubWhM55OtiQuaOM9J+2kpj7YM5CIyqUac7DnCp6ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=YAV2Vb7K; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="YAV2Vb7K"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5C3B36002409;
	Thu, 15 Aug 2024 16:51:29 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 2OUNG7mwsLfk; Thu, 15 Aug 2024 16:51:27 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2D2796002411;
	Thu, 15 Aug 2024 16:51:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1723737085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtY7FGOKCAlIw7I4zmdPazEazYglMMBS9NF+OqQhFiQ=;
	b=YAV2Vb7KVF95e0rjNlCUNJMIkZVMgtMGmXQ3X0u1EiSUT0R5KVOtQgpZGFL54JscGPjiA4
	mJU3SkCfyc/EPaKGdBJUOeLYywdDUa5JB/LuF+7uwxNitfI36ssDGbK72+L9SyMVOz+kLS
	IT7Hv7IhJ707SuM/Sfmy+Jzno71412Q=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:a82d:2c2b:d13b:a86a])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 05A333600F3;
	Thu, 15 Aug 2024 16:51:25 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 15 Aug 2024 16:50:40 +0100
Subject: [PATCH 2/2] arm64: tegra: Add wp-gpio for P2597's external card
 slot
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-tx1_sdmmc-v1-2-7856ac25a204@tecnico.ulisboa.pt>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
In-Reply-To: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723737084; l=805;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=fRqLuTmEelW+w0c011C0VYoP3EAF+MoUlyRStcfUlcg=;
 b=fmbBR2wGHLhCcngPS4Uuf7z++gjBKMRUP/jWHSDp3gAegnKciFh1PW+PXvXISbIXg4da+O6Ik
 NEjZwxyUN8iAFUWlgekFjrT37gi2XQmsrtNBOo/AX0KugAR7t2Qc5Ts
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Add the definition for the wp-gpio of the P2597's external card slot,
enabling this functionality.

Tested on a P2597 board.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 3662b513d623..73ae63628f83 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1517,6 +1517,7 @@ mmc@700b0000 {
 		bus-width = <4>;
 
 		cd-gpios = <&gpio TEGRA_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
 
 		vqmmc-supply = <&vddio_sdmmc>;
 		vmmc-supply = <&vdd_3v3_sd>;

-- 
2.46.0

