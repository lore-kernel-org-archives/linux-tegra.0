Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60C3624D4;
	Fri, 17 Jul 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330388; cv=none; b=YvXvu18GKqJIG4YgTCOAhz0gnRd1WTSHtQ0yaXoWcSJBZqoCoRHMDswhL1vDRBN0F9b1h/57XO9LQUTY7JjSKC5elpIMkmNlDBWIkI05T89ECNpMQbX520DZQVHPvPV6wkEA04qzeeHJDxeiV3YYVl4u9BEodw5/eGFY0OZHN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330388; c=relaxed/simple;
	bh=LY83cZmxXl2/cIIjWcWk0b0AWrSxcUTwngaVE+J9YuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GijY33QratogVyxhgaIxRgerO4Mvn9VxdmGZo96rZ/bXu00pRWWjzSAnxvyd7Q8VWbq6NMKTYvlC6C3Eb57Kbg7gJ6n8R9Jr6vfrvMlF+LLqROcy6kS+uuJstZiRQ8sWUOPFbUrZgtSpSfG5fobkkaeSZbL5RPycw4ai+ECdk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdUNFM6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdUNFM6u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2606C2BCF6;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784330387;
	bh=LY83cZmxXl2/cIIjWcWk0b0AWrSxcUTwngaVE+J9YuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EdUNFM6uG/aFEnsjpPpqLG4hgcOqo6GCh7AouZbKBBl7jpoDRjk8D7iOZ23UAoKT3
	 0180nNn4sdzERCQR90VQA/p5ZMgZ3JzSwi7QFdjngA+Qc+gjdyCPJZhFVAjwBL8D3/
	 APgUk5GaRrQTS9PXYJ1PcN6FGqgTMVcYI8NGjKXbT9NQvG0nSnW6U6WftWl/HXVQM/
	 ZiVbFYJplrdicUd48HDyjvlx9TQLuMkSjVTyiHnjMIA6KSgt3jQQB6KSYe7S437XsL
	 4xQpqxdm05feHhQbOjlKlkwABs35HriiE+wAAxR+wCFlLXUmG6y4TcNTqaofrRTAFN
	 BRyzJpHfpgrIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CA6C44516;
	Fri, 17 Jul 2026 23:19:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 18:19:41 -0500
Subject: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision B01
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
In-Reply-To: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784330387; l=1708;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=MpCNnuZSFyAPViuCGbeytNZEJEmN7vi9xjmNQDzdJC4=;
 b=XUgFStjWOacAnaXYRDUKGpg6DUaSW9k6OeaT98gjvmf+hZUOJI8mY4CX7fpiCc22iRAOVrXGL
 1pRBwtTjZ3tDn77v3nJRiVbB0QsCN9RgRMxl8Ze8OJjy80MgQN1Tso+
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Tegra210B01 has a separate set of skus and speedo tables

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


