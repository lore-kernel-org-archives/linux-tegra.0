Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532722F7EF1;
	Tue, 28 Jul 2026 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203867; cv=none; b=lktFO6tuewxhnJ9Qya8UYS0z8qk72DP9pifRoDlL/67a7v/W6PA+oZU/CQ137lo7OsKOfP6NOi7EES6LMXMQ4mxb9UY7dDiijtFPWiz3od9vVt47u512FinKXGr2UGedkjTGaTgtxEyOMnTnAmAckoKrPkSGzgxwoIhOGuk1ybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203867; c=relaxed/simple;
	bh=bY6aYB+9DvPLeNpruhyCIrNEWP+sGWQISisPmPk5JCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lD3C6c2MwoL4dFaG68CfRBDwGZ6WxkcHHi07pwZSEhxQyI5Qj2eCBoA15Kef6edg+RK7D5HFS+eBt0aVg6IsgRuGyxiSZiwCXzUwh7OpJAaULDDs0ueN6u/DEZDlL0Wr9UUQCmZex1BgUagT7iXNj5541msPXljYYWMRVpVjb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkTkFhpG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkTkFhpG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19A0EC19425;
	Tue, 28 Jul 2026 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785203867;
	bh=bY6aYB+9DvPLeNpruhyCIrNEWP+sGWQISisPmPk5JCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VkTkFhpGJi/nYN6Cc6+sEgv1vnqIQyFrwuvDpx8otcJQpB/TrUGyMLQAeNpHurJZw
	 F7ut0OSntWNkYdIliuEGrFJpIWv4+IP6EMIUd8GOZldbfVh1wyjPhViFcssV+EIp+O
	 Q7s6EshFP6HSwvQ32+CKC6u2nqsuz8bFdxlu42SdCLRg16r93wqv+3ehT9ETJtx80r
	 fGWvguKGIG1m+uuv9sZuxE1Oj1n2uvUkoCmg1qBRqbniJ9I32EbibHdbGBV5NlhfNg
	 iIOejsYBgjZY7BudU91drimQ1r93D3IlMEthvurLAHGPwil/sQp+W0+R8YVUTy5b7m
	 c6QbkyYNQEl6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E754BC53219;
	Tue, 28 Jul 2026 01:57:44 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 20:57:35 -0500
Subject: [PATCH v2 1/2] soc/tegra: fuse: Support revision B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-t210b01-speedo-v2-1-4f287a3dab72@gmail.com>
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
In-Reply-To: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785203864; l=3236;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=9p+4K4Xb7RRednfp4tslCrog2SNThKpscmVNathI/aU=;
 b=kKPuxugq/cLSex9aANZ38LwMzdHdZDEZpMwzeVgNl5sIbNmtFBqwspULJ1F7HF4gDX9rNmjpn
 7S2f4wp0QxbDLmPEn5T0gF0CvQuT5VWdcRIb7ykXFh2IPee22wFBMIH
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Previously, all supported SoCs only used the A major revision. The
Tegra210B01 SoC incremented the major revision. Add support for this.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  1 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 51 +++++++++++++++++++++-------------
 include/soc/tegra/fuse.h               |  1 +
 3 files changed, 33 insertions(+), 20 deletions(-)

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
index 6af69ccaa295c..a4fb0ecd15cf3 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -167,30 +167,41 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 
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
+		switch (minor_rev) {
+		case 1:
+			tegra_sku_info.revision = TEGRA_REVISION_B01;
+			break;
+		default:
+			tegra_sku_info.revision = TEGRA_REVISION_UNKNOWN;
+		}
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


