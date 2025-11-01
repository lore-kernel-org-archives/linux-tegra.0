Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470020296C;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762038076; cv=none; b=aWFjvelm0/35AoVMySYCED3dnP9QlTVsS24G+4QRgKxRGTfxiaYPx2OBytQI5mKfaYoRXwpwodrpgoL9xYCawz8Q53cJLPHpdjyfC/Tk4Cu4wmyiRT5ktBiq80Yw7/NJSgIEyp2OPqio/IkBSeI8faKvqEVWSXluOAHTNJBKerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762038076; c=relaxed/simple;
	bh=mhaFCWkanHPAU9jbb82OOeB9KLHLkw0bkXjRKYTQgA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5N1nw5LsAOzBri9At1/13J8Qub3Or5LvzO9tFRJoMlfL3/5f8/LzGVoSyj3fJeNkgvMqOSLXawMpkyjNmk+Fe8Y/o2DzbeiQH/zoQvzRny6yEHd6Tf+3RA+SP5Gwh+HESnB0KnuokN8DOWK3PZRow6h6oQEtJeh+TwwCrmakMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvnC6sLg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvnC6sLg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B56CFC113D0;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762038075;
	bh=mhaFCWkanHPAU9jbb82OOeB9KLHLkw0bkXjRKYTQgA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HvnC6sLggCNHOqZVAobYWIbWtdDPGUvJKEVWraUuj2IRxioNJZsM7ldXIXudcWlC4
	 UGn94z3aO6EqHftJbESOrp0Z7G+DfIIqZgHMnePyggdLFTGtOEZ1SPfo3UzlzqUG5A
	 Avjwp41xy7IxwtAbUJLj0/2VZ25wvlXUTgRGL8GGYa1oOwdsEAwJ/miJrdxzKw8kC4
	 8U/gwomy7IDIbLRJrMv4RHqn8/FoAxtOKyNV8af18EsWjvikWPSJz8V6dAs3jTwOVo
	 SxiRmxQ4nDP33M5ZD3BAe84/CeaE7PgWhCTOjjipRWh0yiI0nfFme5QC6qF0P0Zaew
	 N1hQgsIj+pLpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C2FCCFA00;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 01 Nov 2025 18:01:10 -0500
Subject: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
In-Reply-To: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762038074; l=777;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=tSEVVrjmjzXWa99QYResO+0NLnexlM0Fps9xvorBbTQ=;
 b=LU265OZErldUjW+6ZPeacgw0HtOeNpzWN1g6nhVHbnmaSjr2riFW+4X9WjrSzX3ekna0w9vv3
 /LUz78GQc+vDGQ9T6kFdsd8zMValgbjWTAj1JbpdXGFKG96KTr7X2wh
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.

Mmu is now being enabled for the display controllers.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eedcdfbae1fdde1374adf40337 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1807,7 +1807,7 @@ iommu@10000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "disabled";
+			status = "okay";
 		};
 
 		smmu: iommu@12000000 {

-- 
2.51.0


