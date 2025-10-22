Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BA41C63;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102806; cv=none; b=FEEtQrquwWcAx7I5OP4ohqhwN1l/CN02lHfWw7Uhnt52dh6D8+IbLNn7QFIW/7ZURNoVVQtFPsw2uMwF8z+5kGccsQovpdqSt1OXroKNCEykf5JDAoF9bmz2OiEsWbd+oyfQW73dAr5LHAkgPrpCLMS3fQ2+9gMSWTCqeub4pQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102806; c=relaxed/simple;
	bh=318UfLgLWeVCCVkculraQF4zJFJU9xGx6cX42rAYGXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qu7U95uvPFwCuiRTkcSz4t5IoDsOqveI0SDpW0NyMZeDhSY6jMSeFZZ3GJzlzUI3BFj2t1gQScyO5L91f8Lrx/AvBr9s4duyjFIqk5zPm+Ov30pqj0LjTeBkR8x/VJJzHe3+Z1R3J5uF0yu3BxkqPqyuAIpvra9O1S3MnBvWkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiH/IfsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiH/IfsV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 649B7C4CEFF;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761102806;
	bh=318UfLgLWeVCCVkculraQF4zJFJU9xGx6cX42rAYGXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiH/IfsVw7CEhV7/8SpnZvfODwiyPa8jfd8FY925Ic9mGAHNhcWzISpMBKvlHPw+l
	 8yl78ha6LH81ALRaHnxVo8BnxVtbnxp+0K2DqUAugJFZyGOUNJSC8TiQwQS3LWWf8y
	 q1H0fjyXS24K03ShDn3rlDUQyBgio9ctSYrrLh7LLwZHDiLjc1oBosT+SlnjasYlrn
	 gA0i5eowcFrFOWkKMeCXqhjKMOBEc5yLIkwlwOTdOoxTpg2exPVHqXu4q4B6phrpYX
	 mMinZ87g747o/dxYxKbzjmKUveMlobT1f833HLo/JMSlgkfSxcss0YnyJf7Y9oJUr/
	 /FzYXDOl6xp4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55327CCD1BF;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 22:13:23 -0500
Subject: [PATCH v5 2/3] arm64: tegra: Add interconnect properties to
 Tegra210 device-tree
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-t210-actmon-p4-v5-2-4a4dbc49fbc8@gmail.com>
References: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
In-Reply-To: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761102805; l=2042;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ow4cANazhCY0RP1MyRkdGrzne1APbjCWzT7QbzRnuww=;
 b=ss7sobl98EUAMDh1knMp3o/3+tYfmRvFsY8qj5urx5AO7h74HqoJt6zA0DVUITFNzSWNkDXmm
 tjDF+vMA5MkBmicwhziUnl0WKrDvSihFgdKsPI9m+FNGQqdK27cDAIa
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6da10db893add44a98fde1666c382511212fd43c..2fcc7a28690f7100d49e8b93c4fb77de7947b002 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -202,6 +202,19 @@ dc@54200000 {
 
 			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <0>;
+
+			interconnects = <&mc TEGRA210_MC_DISPLAY0A &emc>,
+					<&mc TEGRA210_MC_DISPLAY0B &emc>,
+					<&mc TEGRA210_MC_DISPLAY0C &emc>,
+					<&mc TEGRA210_MC_DISPLAYHC &emc>,
+					<&mc TEGRA210_MC_DISPLAYD &emc>,
+					<&mc TEGRA210_MC_DISPLAYT &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor",
+					     "wind",
+					     "wint";
 		};
 
 		dc@54240000 {
@@ -217,6 +230,15 @@ dc@54240000 {
 
 			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <1>;
+
+			interconnects = <&mc TEGRA210_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA210_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA210_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA210_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
 		};
 
 		dsia: dsi@54300000 {
@@ -990,6 +1012,7 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -1001,6 +1024,7 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,memory-controller = <&mc>;
+		#interconnect-cells = <0>;
 		#cooling-cells = <2>;
 	};
 

-- 
2.51.0


