Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DAA2F90EA;
	Tue, 23 Sep 2025 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758646692; cv=none; b=sv8dc5Bt3beZdTziO6aAPEeUUq36wMsMGhfiwymmu7HwI62+3CTQHJQzTo3jUgCQ/A7O84Nltnlj1VegCKij/DFfCrYBhOyzVW+Q9YrbnSd3CyldKRR9iBPrPwqPBewfx39y2168LxnmSKKykLRyS6jRqfy8mEwmdKZntH7gs7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758646692; c=relaxed/simple;
	bh=KYJzykyrRmeDBScIUj6YJCymPAepZ3baXdoOSniMjsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L9WSCLFZ0L/EqsbJ78BAMMUKEOTlhkh2f02CD/ZSHq4jCkc3QKfFSTdeZyk75sUm3DyYVktpyoqNq/Bp1i8GIFstTtTiiC2NiDvl5HL2bLQvsUb0nPAuN0qfzr2zq7cS9YExxsxdUzcNHczjeq+wU9MoYqaW0cRPFTJXcdrUyMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgCw0uSB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgCw0uSB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85E34C4CEF7;
	Tue, 23 Sep 2025 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758646691;
	bh=KYJzykyrRmeDBScIUj6YJCymPAepZ3baXdoOSniMjsk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lgCw0uSBX2cenkBGbachKlzTBRNMRveXRZhpFq7hU2fSm0/TX3nj0b5K0ZfLHAkq0
	 m3Cl5xiUYB+VpOKEMTNFCq/uJ9SkOdOiMvKK8KcOC1j9IGE7PaytNlEAad8fpG8Vdt
	 /yAVSZbfONFS5lwA7C3WsEnWB795qicHptLncl35NEWfFdjnDEKtJo2YrOh0I9Mnjb
	 bqTQHFlyiE5duhF5BHAsJOlfuj5B48135U5YP/CFmQetysspxfzYuD2pAh2ApUTx4O
	 N8vkKsTdzli93z9X9WBq6Tk2mSCLF1oSdxYKNjlT8XDrMjz9L6/ZckClo0i9sGTOe7
	 25E1ETR7do40A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F0BCAC5A5;
	Tue, 23 Sep 2025 16:58:11 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 23 Sep 2025 11:58:05 -0500
Subject: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJzR0mgC/4XN0QqCMBTG8VeRXbc422xuXfUe0cWcRx2kk02kE
 N+9KUSRF11+B37/M5OIwWEk52wmAScXne/TyA8Zsa3pG6SuSptw4CdQjNMRm2A4AxoHxMrTvAC
 pGapSWUuSGgLW7rEVr7e0WxdHH57bg4mt13dL7loTo0CNVkxIMJXlxaXpjLsfre/I2pr4x2sQe
 8+TVxplrWSpdM5/vfjjBWW0EAgaoS5LIb/9siwvliuo2C4BAAA=
X-Change-ID: 20250812-tegra210-speedo-470691e8b8cc
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758646690; l=3907;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=SiEd93vSO5dn+t0YuAV9jSFCu4bFUsC1WsQK0UT2860=;
 b=z3Ik+c+D6z1y4LobgQ55xWUWutuIQY5AVuHWT0YUc83dy4lmfL8kqHbiVg63RVspaYXAU3gaE
 nKvrwDjo0OCDkjhTJobYFeOIJH98Xbaxj0GBuLf43Kbr3vIfYNMzBLb
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
code supports 11 ids and nouveau supports 5. This aligns with what the
downstream vendor kernel supports. Align skus with the downstream list.

The Tegra210 CVB tables were added in the first referenced fixes commit.
Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
Overclocking should not be the default state.

Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
Overclocking should not be the default state.
---
Changes in v4:
- Check soc chip revision instead of speedo revision in speedo id
  conversion
- Link to v3: https://lore.kernel.org/r/20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com

Changes in v3:
- Drop all patches related to limiting cpu frequency from a dt property
- Link to v2: https://lore.kernel.org/r/20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com

Changes in v2:
- Define units in patch 1
- Update patch 1 commit message to better explain the need
- Pull all downstream sku's into patch 2, which eliminates patch 3
- Update patch 4 commit message to indicate the limit is due to thermal
  constraints.
- Link to v1: https://lore.kernel.org/r/20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 62 ++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 695d0b7f9a8abe53c497155603147420cda40b63..a8cc3632977230fbfda0f8c3bfa7b7b25c2378fe 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -65,27 +65,51 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 	sku_info->gpu_speedo_id = 0;
 	*threshold = THRESHOLD_INDEX_0;
 
-	switch (sku) {
-	case 0x00: /* Engineering SKU */
-	case 0x01: /* Engineering SKU */
-	case 0x07:
-	case 0x17:
-	case 0x27:
-		if (speedo_rev >= 2)
+	if (sku_info->revision >= TEGRA_REVISION_A02) {
+		switch (sku) {
+		case 0x00: /* Engineering SKU */
+		case 0x01: /* Engineering SKU */
+		case 0x13:
+			sku_info->cpu_speedo_id = 5;
+			sku_info->gpu_speedo_id = 2;
+			break;
+
+		case 0x07:
+		case 0x17:
+		case 0x1F:
+			sku_info->cpu_speedo_id = 7;
+			sku_info->gpu_speedo_id = 2;
+			break;
+
+		case 0x27:
+			sku_info->cpu_speedo_id = 1;
+			sku_info->gpu_speedo_id = 2;
+			break;
+
+		case 0x83:
+			sku_info->cpu_speedo_id = 3;
+			sku_info->gpu_speedo_id = 3;
+			break;
+
+		case 0x87:
+			sku_info->cpu_speedo_id = 2;
 			sku_info->gpu_speedo_id = 1;
-		break;
-
-	case 0x13:
-		if (speedo_rev >= 2)
-			sku_info->gpu_speedo_id = 1;
-
-		sku_info->cpu_speedo_id = 1;
-		break;
-
-	default:
+			break;
+
+		case 0x8F:
+			sku_info->cpu_speedo_id = 9;
+			sku_info->gpu_speedo_id = 2;
+			break;
+
+		default:
+			pr_err("Tegra210: unknown revision 2 or newer SKU %#04x\n", sku);
+			/* Using the default for the error case */
+			break;
+		}
+	} else if (sku == 0x00 || sku == 0x01 || sku == 0x07 || sku == 0x13 || sku == 0x17) {
+		sku_info->gpu_speedo_id = 1;
+	} else {
 		pr_err("Tegra210: unknown SKU %#04x\n", sku);
-		/* Using the default for the error case */
-		break;
 	}
 }
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-tegra210-speedo-470691e8b8cc

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


