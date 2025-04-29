Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E331EDA13;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891539; cv=none; b=ShHaLxKrVRUeqfxLyEbswQ7mkMEitXKn32d3KO5++rE8zFPv9Y/PaefhNp6mmSR8BNBjDY2aWpoMJLbQvXtubx89L9FhtscIUogp2Owds+ZBWLMLgsHYt0lvZZQ3+AMnWtmPmc4nTKFA0VuH4lGhG1ei7UhGZEyAaD3W+vBgTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891539; c=relaxed/simple;
	bh=Oh5hsB248ia9xiD81xfy2g0RGcpUxU9Q7w3n+I5yS/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIxXPJYG2C7nIhcZG8zp8nf0wsKWYQIXJVvFh1rgWyupZkRt45SQtlYmIngzWvlaf5GWEP0livsZ+n3EnMUhVk0SJ+WLh1c6U/HWNrYoYnTNlgKAAg9DStMVfz691BAtWqOKLWbhAiSExxvSZ1S7UUWIZNvPs9ujv/7ZY84HPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XATG5vfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XATG5vfy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD5F2C4CEED;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745891538;
	bh=Oh5hsB248ia9xiD81xfy2g0RGcpUxU9Q7w3n+I5yS/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XATG5vfy6gNxTjYxBgSD1jw0bFNBfDzBn3R6xBIBXCc7mP6qpih/+rmnYTCFG1B3S
	 Ejjnu2ReRQXRbnr7FSUq9H0aJmr31TrllrRYHS8yjbV8iyIJbRp4Ua+euwSD+Y6w+D
	 LO3owI6E7znzEhY2IgrQ/q2jTVYO5yp5BVCW52fNdnroV2SZCK5hW2Ndmxk0hZhamD
	 mqtCSqmwUaRJjMvBIfL76rRVq7dxtNeZDbvpuZIhECwGqFThDIxRqCJxty6el1CArk
	 wxkGwBwdIGXHI37aRCz5LJll1ymkAF/CbR/jJMG4EexcgzH0Oc6aLgN2dY/szYw8Um
	 DCZpIGmsF4TOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8EEC369D9;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 28 Apr 2025 20:51:47 -0500
Subject: [PATCH 1/2] arm64: tegra: Drop remaining serial clock-names and
 reset-names
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-tegra-serial-fixes-v1-1-4f47c5d85bf6@gmail.com>
References: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
In-Reply-To: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745891537; l=4584;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=eZgsqtgI2wjk8mEi6fSSMzvJTrY9eFnl6/QsD8CXeDg=;
 b=d7TW/6bz7WnPHJjlcCS82wdm1DG6j05mfhTpDXghdwdfSXr37VLM97vfi7QKY1WfHEzjuZXPU
 x6pPsxiqGhuDBL6BvweJNq5P7tqzFSk5B+O2VTrqIi5e+s6BIB3VpMK
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The referenced commit only removed some of the names, missing all that
weren't in use at the time. The commit removes the rest.

Fixes: 71de0a054d0e ("arm64: tegra: Drop serial clock-names and reset-names")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ------------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 12 ------------
 2 files changed, 24 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..f0b7949df92c0583d0e710e5e2b93818434a913f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -621,9 +621,7 @@ uartb: serial@3110000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTB>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTB>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -633,9 +631,7 @@ uartd: serial@3130000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTD>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTD>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -645,9 +641,7 @@ uarte: serial@3140000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTE>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTE>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -657,9 +651,7 @@ uartf: serial@3150000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTF>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTF>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -1236,9 +1228,7 @@ uartc: serial@c280000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTC>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTC>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -1248,9 +1238,7 @@ uartg: serial@c290000 {
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_UARTG>;
-		clock-names = "serial";
 		resets = <&bpmp TEGRA186_RESET_UARTG>;
-		reset-names = "serial";
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 33f92b77cd9d9e530eae87a4bb8ba61993ceffeb..c3695077478514708933934f06f25ef7dbe6f923 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -766,9 +766,7 @@ uartd: serial@3130000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTD>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTD>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 
@@ -778,9 +776,7 @@ uarte: serial@3140000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTE>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTE>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 
@@ -790,9 +786,7 @@ uartf: serial@3150000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTF>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTF>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 
@@ -817,9 +811,7 @@ uarth: serial@3170000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTH>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTH>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 
@@ -1616,9 +1608,7 @@ uartc: serial@c280000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTC>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTC>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 
@@ -1628,9 +1618,7 @@ uartg: serial@c290000 {
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTG>;
-			clock-names = "serial";
 			resets = <&bpmp TEGRA194_RESET_UARTG>;
-			reset-names = "serial";
 			status = "disabled";
 		};
 

-- 
2.48.1


