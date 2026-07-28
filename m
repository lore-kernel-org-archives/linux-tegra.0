Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797892D0614;
	Tue, 28 Jul 2026 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203865; cv=none; b=uuhs8EI8dw3D0ebs+XgqZTPFgy3otQDwyCrmvh5Vp6zO8dcH/Ch5ARYEUmBpjNSl3JL4+bP/cC+yFCBOI0q3iV0A7XV3z8LTDqRb1H0kms6ssJ4LAtly58jReA38VgkfzSgaQs6uzYOgJjDJsY4tZTOBsJ45FAoQ12b0YNoiENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203865; c=relaxed/simple;
	bh=NAaO6g0nm/m2QKWjl9rTZn2gDp6gUtE7pIK9W8/8wnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVAL+h53oATsH+9JfuH9FeuDttZclAP/JxR4ot/lt3ksWyWuV1NRMgvNcKVSfw2trGb1u0QuaVfcKOyhOrmQ4MDv7UcXa4jMT/c3gviFizj7obDwnaSgENrpe0ddpKOkWxBUTHhDRTJo3pq8RWqvshkeKqzBofgPlY2N9rNuj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEkpeLRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEkpeLRm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F7D0C2BCFC;
	Tue, 28 Jul 2026 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785203865;
	bh=NAaO6g0nm/m2QKWjl9rTZn2gDp6gUtE7pIK9W8/8wnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hEkpeLRm10NclpVk3gN2XeEB9FkAzLxfs1b6MMj55OndD+8ledijmOEDL+ED445/t
	 Nk/jDnG5MxJRzLuxZPC/8WuJktJyv2XGvp0DVl2cQkvCB6n97ZkMwDGtuJhkfOQLrJ
	 5xZBIGEOzVZtHy2KsvX2sFm9NItjgje4cvyTDpXe5GA6aITSwxF11tzYOTlus4VXUQ
	 f8hMm0L3ORBIg5SRRJv2ohJLKss+XHaW3DfFqPKTd1vfzjnLw2XasuIG8n2bQz7K+l
	 SQZIu80cyYux85PN2Sf64eMGKr7jZDJ9IUVC2O4jehtw9h9gTUk3FUyNIz3oDOaPN2
	 2hg0FSxZ4Iqsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F276C531D0;
	Tue, 28 Jul 2026 01:57:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 20:57:36 -0500
Subject: [PATCH v2 2/2] soc/tegra: fuse: speedo-tegra210: Support revision
 B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-t210b01-speedo-v2-2-4f287a3dab72@gmail.com>
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
In-Reply-To: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, Alex Frid <afrid@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785203864; l=1864;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=VxU37xckYtNrvl4zdEjsAkIv4u2CSVJlt2LBjQhhA24=;
 b=sLwzwZ4QNo66hkggLWXOCvvxdiLfwB1fawvYs7ok8l5XgveewMOSL4b+xKAzMz9tX7t0n3Qiy
 TwSxsXkDlEaCbdNdkhz1dD2EPlR3SEq8QhYpkbCFr+Itp+fNSuPESk5
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Tegra210B01 has a separate set of skus and speedo tables

Based-on: https://gitlab.com/nvidia/nv-tegra/linux-5.10/-/commit/8555ef4988d3b39d91791794825c354b3c9377ba
Based-on-patch-by: Alex Frid <afrid@nvidia.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 06c2bcbee5734..699751f4bd0c0 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 	sku_info->gpu_speedo_id = 0;
 	*threshold = THRESHOLD_INDEX_0;
 
-	if (sku_info->revision >= TEGRA_REVISION_A02) {
+	if (sku_info->revision >= TEGRA_REVISION_B01) {
+		sku_info->gpu_speedo_id = 1;
+
+		switch (sku) {
+		case 0x00: /* Engineering SKU */
+		case 0x01: /* Engineering SKU */
+		case 0x83:
+			break;
+
+		case 0x87:
+			sku_info->cpu_speedo_id = 3;
+			break;
+
+		default:
+			pr_err("Tegra210B01: unknown SKU %#04x\n", sku);
+			/* Using the default for the error case */
+			break;
+		}
+	} else if (sku_info->revision >= TEGRA_REVISION_A02) {
 		switch (sku) {
 		case 0x00: /* Engineering SKU */
 		case 0x01: /* Engineering SKU */
@@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
 	speedo_revision = get_speedo_revision();
 	pr_info("Speedo Revision %u\n", speedo_revision);
 
-	if (speedo_revision >= 3) {
+	if (sku_info->revision == TEGRA_REVISION_B01 || speedo_revision >= 3) {
 		sku_info->cpu_speedo_value = cpu_speedo[0];
 		sku_info->gpu_speedo_value = cpu_speedo[2];
 		sku_info->soc_speedo_value = soc_speedo[0];

-- 
2.54.0


