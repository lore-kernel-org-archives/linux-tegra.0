Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469B1F5423;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762038076; cv=none; b=fDANcznnOFvkzRQiC/17FKuj+tB9mUfwT8A/yA/SZjn8EiHyxod1Ehx8xXTimVWaHHVS3wde1KZtCDNw2IBEZlAWSJYjsp35ZIE5J62wjWJ5r0LM1XKq4B7V3CChjaW7pJ4Wrg+8dw3uXmEj7Jg+CtN06Sy56r0LVuGZbweSZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762038076; c=relaxed/simple;
	bh=HP348GXMMLocI1+NF0qt+gt0s1owWd7k86qH46w3fS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gb8D2P4ozWlvRz76hfYoxfjeJ6UCDT/PYs5UrPggz3Z9/mY709tT4Ko8KMkPL6LzoL0QAM2jp1/7pfZBDcxJVbK3nzkZsbDHHxCn8slqG96q+U1ZWuOf2G74DqqDup7wpxqXKBPxjdUdOBE2rX96OXkk8Vg+19RA5MNWiSpVy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQHVgZi5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQHVgZi5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5A71C116D0;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762038075;
	bh=HP348GXMMLocI1+NF0qt+gt0s1owWd7k86qH46w3fS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iQHVgZi5WgMaRvRddnYJ2VLfXS8nVoCYsQL4dwCS7JvcjEu6if1YSc5hr1VLUlZGm
	 +pPAjoCRjj2ElnNxNbRAmAoJSR9bxKut+oUhCz8oAi1w36saZ0Wo8oiPsfj3AWmVio
	 EDkqYn7/LFld+6J1y08RYaZLIhrcvjte3l5k7U9OVRuSpbIo/rasueBW29NDj0IE9v
	 yVBT+Oeb6dP0UglYBVoMWh28XF9700qpkB2J1xrdEHRZsmNBhWZKu7ijQXDUQ5LJxi
	 WD8UofMT5eWJBYayZJvCp/HH47lVR/yQ+mqL5Jht0s5ykMNSfsS5QjmSvq+vbgJHl+
	 RMxvpC/JBU2Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8942CCFA04;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 01 Nov 2025 18:01:11 -0500
Subject: [PATCH 2/2] arm64: tegra: Enable mmu on Tegra194 display
 controllers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tegra194-dc-mmu-v1-2-8401c45d8f13@gmail.com>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
In-Reply-To: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762038074; l=2239;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=gIFvvjKC8J9h0M+DsoDhgCl08bhHOHnaUk5WvYxThAE=;
 b=cTgCrSMGDYH+R8928UWZ8Nk9WaqnORNRo6olgy2CKkepQ2H5hq4JUcgroXewOiEiL33vvm1av
 87lgcCzirukCtVLbfJwkgQUqovoDciBFJ/hxtjqwhBbUuKbCjw8ZSjg
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

These use a separate mmu instance compared to everything else currently
enabled for the soc.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 854ed6d46aa1d8eedcdfbae1fdde1374adf40337..e75b0af81ab76fec5b7531e9c0932a629cbd8768 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1734,7 +1734,7 @@ bpmp-noc@d600000 {
 			status = "okay";
 		};
 
-		iommu@10000000 {
+		smmu_iso: iommu@10000000 {
 			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
 			reg = <0x0 0x10000000 0x0 0x800000>;
 			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
@@ -1975,6 +1975,7 @@ display@15200000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <0>;
@@ -1993,6 +1994,7 @@ display@15210000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <1>;
@@ -2011,6 +2013,7 @@ display@15220000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <2>;
@@ -2029,6 +2032,7 @@ display@15230000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <3>;

-- 
2.51.0


