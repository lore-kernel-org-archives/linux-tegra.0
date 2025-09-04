Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8471C6B4;
	Thu,  4 Sep 2025 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756951148; cv=none; b=XfUgn5bJ6oG+l0xMBNRdSvg5Ka1izkk8qaHfmx8T8WdcuU+k4GOel2UfDRR2FZKR/MaAeW9xb37kXSwDeJSGRUgK5Wu/tKO/HaHDfSzUEY6UF0LAAtQB0Go2sd229z3plToYCXkIZ4Bok1BdyMGehYDtgJ8qC2LuAvDacidCxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756951148; c=relaxed/simple;
	bh=COr4rVD1Rbl6LzzAujkyKf5egCLVDLyy5/J9/B88ioE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M87KBzW3VumrUcu6cK6iNZaPp8eA9h5pKk2rq6ovg39yc7rwIdA0fmZGLm/mAPKiJIVr3fLsXAw2gm3Ac9RQhpr3CFbjifJgtq7UMcYc/YlsFMBQxnibAgusLbuTV1WSLOI3RGD2Ylk1zwOtQf7p75APMkAZ6GUA5r+WWo9UK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/E7rQoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/E7rQoc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D8E6C4CEE7;
	Thu,  4 Sep 2025 01:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756951148;
	bh=COr4rVD1Rbl6LzzAujkyKf5egCLVDLyy5/J9/B88ioE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=V/E7rQoc3zvXbaVDNlvicgIqxzFopvyJbGOyfG+yQrPjKML8krjMLFNquXRU9MiOY
	 3QGGoTrEXU4rS5uj5mzf3+6UZhbvwrDj+oYwpWuBrKgdibaMQEuvp9R4ORcqKPL/Cs
	 uWDsG3KxksO8CofaHld0CAqkvGJDlE4Xx28unZY8YqP2Wl3goZNYnpvB3NRVfAHzVV
	 pvx2gz4Di428GC3VlbBAaefL39yq9LARibXsAs0QRejzA5CQ/N/fEPsiwqgDzfh+48
	 rtMf1EUPHZ3XZ2hKfduVe0cpVMH5+vfwdRUcPkk4cOamL0X8rT7vgL0LUeMwKVvIZm
	 MyRp5CXCj152g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1912ACA1015;
	Thu,  4 Sep 2025 01:59:08 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 03 Sep 2025 20:58:58 -0500
Subject: [PATCH v3] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGHyuGgC/2WN0QqDIBhGXyW8nkN/m+mu9h5jF2Z/JawMDdmI3
 n0WjA26PB+c8y0kYnAYybVYSMDkovNjBnEqiO3N2CF1TWYCDC5McaAzdsEAZzROiI2nZcWk5qh
 qZS3J1hSwda+9eH9k7l2cfXjvB4lv67clD63EKaNGKy4kM42F6tYNxj3P1g9kayX4+ZqJow/ZV
 xplq2StdAn//rquH8g0yjLuAAAA
X-Change-ID: 20250812-tegra210-speedo-470691e8b8cc
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756951147; l=3689;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=RDXctTbmGxlSSv4dmzycEd2KLlflflCn0kxYFTnBz+U=;
 b=e6WTY/oNHOtWBHpCY4U/f+KyFymNrmKE7TuAmaL9HV0ch8628dgXWr2YCOEiRnI8eQ3sdrRBB
 oEnwbVA1IRzAAjIT2T/b6WlLzgS7mARcpaXNSHpvnUnSoy9k/suKWRw
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
index 695d0b7f9a8abe53c497155603147420cda40b63..60356159e00d2059e55eaacba27b5ca63bf96c90 100644
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
+	if (speedo_rev >= 2) {
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


