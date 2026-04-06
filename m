Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05935E923;
	Mon,  6 Apr 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457560; cv=none; b=j/tWjhQEeg+dPfCOxXulVjlr04El8vy3f2tU4ed9znILpUblN0v2CLNiBXWdvltnq8kTkCLEqDw1PrUH/tVa3lOcUb/8iI4J0xfsFNvhCrie0vYG265GPc1T7CYpu4AjNYvAexXt0VKoH9CIUb3xfrHycQf/aiDy22azyLN4O8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457560; c=relaxed/simple;
	bh=rtujjDdRKaTE4jIqLF/2YN55iKCGGeVYc/RhEPogby4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j1z7/yUiUMqcE9jW43i1pK8C5wjVj1p2EGG4XQz4820voNmbiMpWR3ricmT6EHZdsiIYNsEnzDBP0QfXkZgPPNk+/0aRnuvdBxW+tJng7NpEyZocqBo+JQ0xwdBNgJlCCtMPqOSjhKq9PSW4/rkGIYuIX/VkzFE4TqaTvHigBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdYYCH4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdYYCH4R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBB99C4CEF7;
	Mon,  6 Apr 2026 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775457559;
	bh=rtujjDdRKaTE4jIqLF/2YN55iKCGGeVYc/RhEPogby4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mdYYCH4ReG7NZHkgA3910aR0aRNQTuNI3YZKcnIFw/OgC9QmE3kQDUmVmvF2F3BQD
	 NcMubMEVTcsz+qA1/JsxkMTtDJqBN5cLvlvR8knGne7Kf58Qz5ivrBIykwyqHGk5NK
	 WBMNcKwtKLu5DKta33N3LGnOB6DbUQbuv6S953oHiXAuzdh3aa9G2CONa4erkhcTaa
	 iISBw4+t9KNl38opZH/UusIEZfVcT65Pzvy24KyNUs5lzaWZA2uxg88+JqHk274UTS
	 C215wvSJYgzce5pGE0yKYcwbeRvrxkEcjnMw07gBC8y/b6TvDI3BzvFGX/4xIfe0jc
	 6vvVN5GojgthA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC14EF4EAE;
	Mon,  6 Apr 2026 06:39:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 06 Apr 2026 01:39:18 -0500
Subject: [PATCH] arm64: tegra: Enable interconnect for MC and EMC on
 Tegra210
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-tegra210-actmon-dt-fixup-v1-1-6b6149b76eaf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQrCQAxEf6XkbCANbWX9FfGwbGPNwW3NbotQ+
 u8G9fhmeDM7FDGVApdmB5NNi87ZoT01kB4xT4I6OgMTD9RRj1Umi9wSxlSfc8ax4l3f64JDoHT
 uQs8cAri+mHjxnb7efmzyWv2h/sPj+AADDHgtfwAAAA==
X-Change-ID: 20260405-tegra210-actmon-dt-fixup-690c74952299
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775457559; l=2268;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=gyXAVSoHIXIcTUJk7cMRiRQgVTvpFrxg/mZlvuJD8to=;
 b=fvVZsQOBO01S3p+Rl40KVaAfU07CaNl5IhZUl9HawSK/LN/ypmUJNxJ2VQTZpYFKnAAZYklv0
 zLcQV3um12kDvFrmXLVyCzHxu/5Zy8mLLgjjq3PErkU9HFXwCyv8Jqo
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

These are being referenced by actmon, but are not currently enabled.

Fixes: 654427e0b9b7 ("arm64: tegra: Add OPP tables on Tegra210")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
When the opp tables were added to tegra210 [0], there was a previous
commit [1] that enabled interconnect on the mc and emc nodes. This was
later reverted [2] because some setups such as the Nvidia regression
test bench do not pass emc training data and thus the emc driver cannot
probe. Since interconnects cannot be optionally routed, the dc
interconnect routes cannot be enabled if the kernel is to support
bootloader setups that do not properly pass emc training data. Thus this
only fixes the routes enough for actmon to operate, because actmon
failing to probe is no more fatal than an emc failure.

This depends on the mc/emc driver patch to add interconnect support [3],
which should be merged first.

[0] https://lore.kernel.org/linux-tegra/20251021-t210-actmon-p4-v5-3-4a4dbc49fbc8@gmail.com/
[1] https://lore.kernel.org/linux-tegra/20251021-t210-actmon-p4-v5-2-4a4dbc49fbc8@gmail.com/
[2] https://lore.kernel.org/linux-tegra/20251217104744.184153-1-jonathanh@nvidia.com/
[3] https://lore.kernel.org/linux-tegra/20260406-t210-actmon-p2-v7-1-91adf535cf8f@gmail.com/
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d70966918943232acab8992bf91ec42a..a5537a5c472c4bf5d649cc52372e531452b594f7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1028,6 +1028,7 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -1041,6 +1042,7 @@ emc: external-memory-controller@7001b000 {
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 
+		#interconnect-cells = <0>;
 		#cooling-cells = <2>;
 	};
 

---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260405-tegra210-actmon-dt-fixup-690c74952299

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


