Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69ED1FFC41;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323660; cv=none; b=IG7yBvLox28e2tQ26hEftPbPyyYBDKG1zmLdQADMvRooDH2FLWSEGADYV70F38HT2TNUpoIjNFPqaoVqXHvdkVdtwMjjX5l7grxtUl8bBhVP8Mld3hSzsdy95xDWTIKrY7isjhT9w6dRciBXWL6ncXnuETOjWBArNK1TiHM0j7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323660; c=relaxed/simple;
	bh=v9/DprQXu1Orp8O2tW51C5gJxOsix4kY869zpymYn20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kavr93jh7K4JqjwEX0+l99ZEJMEycHWQK29T4Oso19x8RE3FykY3RsMujB8JF1uFkD5ChTW39IaQ3ALcy6X+00XXxZvODO0Shc7/Zy8gZxZYWjm2Blla6oJb7jIzmzMprS7pyB9HiCF/gGytQeaE9uSsrMMIOTJanOM/XnFL7i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKXGWhuf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKXGWhuf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B851C4CEFC;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755323659;
	bh=v9/DprQXu1Orp8O2tW51C5gJxOsix4kY869zpymYn20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RKXGWhufXinkH7S7ODTw2OU/BXCIQyjsaO83N16UgK4XRGbdNKIdLwvlJURE1FOY6
	 aTcT3ak3405nBvlDIHBuzSkBkrma/ddOeZ49zYL53ChGZwtU6NwDZ9zt7erwZ/7wUG
	 ydY6heDuAuaDjtWZfyFQrWIPD4E5gpdFXO/ebAVbAxKsTHkk8SXggeskgjltRoORfU
	 ZgLs0tGXGDU17sjdvhReiUnQJDnoz2Kgbp8LVndEBsosWartPcDoEcsF0oefPcpwln
	 0yRXuMcSqPMQqnFoKuI3FQ8JVBAKtNqBkms6ZfXle/kAzZt9XfZT/zB1JtZCZvJOJc
	 1IyOSCXPbAxmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3378ACA0EE9;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 16 Aug 2025 00:53:37 -0500
Subject: [PATCH 5/5] arm64: tegra: Limit max cpu frequency on P3450
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-tegra210-speedo-v1-5-a981360adc27@gmail.com>
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
In-Reply-To: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755323658; l=935;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=JtR2frb8U61WYYSqhxHsZ+WqeNipPuKmeW1w+OFmzpU=;
 b=c8aF1tlFVKvuMAgjpH17Vx+W6YJ9ly6+2UZTmDmo879riiX6BemOb25Mah5RxcSAtHIDCI+VW
 kPtnx+v5hAcB7G6R9kog0SaaaP/PtAG4t6pc175XEY1HjM4RniK+1dA
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

P3450's cpu is only rated for 1.4 GHz while the CVB table it uses tries
to scale to 1.5 GHz. Set an appropriate limit on the maximum scaling
frequency.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef9bf8f0e52e2958db33666813917c..10f878d3f50815d1f0297d15669048ab9cad73ee 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -594,6 +594,7 @@ clock@70110000 {
 		nvidia,droop-ctrl = <0x00000f00>;
 		nvidia,force-mode = <1>;
 		nvidia,sample-rate = <25000>;
+		nvidia,dfll-max-freq = <1479000000>;
 
 		nvidia,pwm-min-microvolts = <708000>;
 		nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */

-- 
2.50.1


