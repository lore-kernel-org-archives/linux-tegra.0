Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A685389471;
	Fri, 17 Jul 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330388; cv=none; b=JGB3iHJ81MkUcNW/XxqP7dQWB8FlbwMTRpBL7mndM+AzqZhoFDoxb5fGW92n/6WJUJ+UdPUkHud/XAmAAWd4exYdE0B8Gi+suseynYxl14ZiGpRsVsdomYF4trNYQ7Gz65h0+zXt8qAgzJYMNhdhdiJ+qWpF5j1neFOZf/umfPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330388; c=relaxed/simple;
	bh=HAi12lhRbXl91ATA4GxEtmQNji+T9Yu1kkJGXIudQo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAuZTWfbxtIGPR7OFga3/MpcTBAHo+cBfw94Oq+enSuqb1GpVWDmFg775GHXPVxBwTxFUPEfb8WXmvJE4Jnj1buKDoe0qIzbn9L/Tk6XVHgTnI0l7pAi0sAruh5hSucgTzdReTVQBgqhbt/AvOsms7NCbnhaD/0fnN5EVwtYu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfKHGChw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfKHGChw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEC78C2BCF4;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784330387;
	bh=HAi12lhRbXl91ATA4GxEtmQNji+T9Yu1kkJGXIudQo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hfKHGChwxa7cppwE7uyL25gPvHhtEaYQlTcAwLKsd6+6W+or54ZNfx53/zDLRToEk
	 LNRmczg5MYU4bkIq6F4v7tyDEybAGdSUF8SHCN/ckHGR3mdlkbA6d9HfrqwiDFHqf1
	 ia2jBeu/ZC+DGmeUxsl2JVEKyHt80hnM/c9D79I091Wrmfqfr3JQ+o0Y+Pp28o4wpQ
	 D9h0MQjur3b98+qzON8o1NJjkCwhxJo0m0UWNsaVXHSdREXlAn0nvB0fL4+eTJ4fBp
	 HL71aQiDQV9rlD6UOpn6V5Q5Hk5xQFo54MHZF/2C4k0qa0N6LjLy8lERH1O9+YhhLI
	 jag9cfX+W3xXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD412C4451B;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 18:19:40 -0500
Subject: [PATCH 1/2] soc/tegra: fuse: Support revision B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-t210b01-speedo-v1-1-f04a8bd4d997@gmail.com>
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
In-Reply-To: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784330387; l=3002;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FKp8/VRReoJzWZbxx2BvL20l5ZVhWyHdTYk/Zcef/PI=;
 b=3RE7Z2uSWAOfMgC6QCc7+8lAZNGtB8bqfOoi8Q61fsd/LBwsDqBgMLNVwDaJ8S4Qz4h3I1g5m
 qLfG+St+cn1AthgRACMSEAWD6l3PasF3w38udJdZ/mV5Mg5D6OHgkmb
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This is used by Tegra210B01

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  1 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 45 +++++++++++++++++++---------------
 include/soc/tegra/fuse.h               |  1 +
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 78b054d43a422..a37642dc92c61 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -34,6 +34,7 @@ static const char *tegra_revision_name[TEGRA_REVISION_MAX] = {
 	[TEGRA_REVISION_A03]     = "A03",
 	[TEGRA_REVISION_A03p]    = "A03 prime",
 	[TEGRA_REVISION_A04]     = "A04",
+	[TEGRA_REVISION_B01]     = "B01",
 };
 
 static const char *tegra_platform_name[TEGRA_PLATFORM_MAX] = {
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 6af69ccaa295c..8df3bcd148ba7 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -167,30 +167,35 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 
 void __init tegra_init_revision(void)
 {
-	u8 chip_id, minor_rev;
+	u8 chip_id, major_rev, minor_rev;
 
 	chip_id = tegra_get_chip_id();
+	major_rev = tegra_get_major_rev();
 	minor_rev = tegra_get_minor_rev();
 
-	switch (minor_rev) {
-	case 1:
-		tegra_sku_info.revision = TEGRA_REVISION_A01;
-		break;
-	case 2:
-		tegra_sku_info.revision = TEGRA_REVISION_A02;
-		break;
-	case 3:
-		if (chip_id == TEGRA20 && (tegra_fuse_read_spare(18) ||
-					   tegra_fuse_read_spare(19)))
-			tegra_sku_info.revision = TEGRA_REVISION_A03p;
-		else
-			tegra_sku_info.revision = TEGRA_REVISION_A03;
-		break;
-	case 4:
-		tegra_sku_info.revision = TEGRA_REVISION_A04;
-		break;
-	default:
-		tegra_sku_info.revision = TEGRA_REVISION_UNKNOWN;
+	if (major_rev > 1) {
+		tegra_sku_info.revision = TEGRA_REVISION_B01;
+	} else {
+		switch (minor_rev) {
+		case 1:
+			tegra_sku_info.revision = TEGRA_REVISION_A01;
+			break;
+		case 2:
+			tegra_sku_info.revision = TEGRA_REVISION_A02;
+			break;
+		case 3:
+			if (chip_id == TEGRA20 && (tegra_fuse_read_spare(18) ||
+						   tegra_fuse_read_spare(19)))
+				tegra_sku_info.revision = TEGRA_REVISION_A03p;
+			else
+				tegra_sku_info.revision = TEGRA_REVISION_A03;
+			break;
+		case 4:
+			tegra_sku_info.revision = TEGRA_REVISION_A04;
+			break;
+		default:
+			tegra_sku_info.revision = TEGRA_REVISION_UNKNOWN;
+		}
 	}
 
 	tegra_sku_info.sku_id = tegra_fuse_read_early(FUSE_SKU_INFO);
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 8f421b9f7585c..30db79f7f17fd 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -33,6 +33,7 @@ enum tegra_revision {
 	TEGRA_REVISION_A03,
 	TEGRA_REVISION_A03p,
 	TEGRA_REVISION_A04,
+	TEGRA_REVISION_B01,
 	TEGRA_REVISION_MAX,
 };
 

-- 
2.54.0


