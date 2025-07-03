Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C092F49E9;
	Thu,  3 Jul 2025 18:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567678; cv=none; b=rpPjpjouISi6yPb/Kk8JpSIVJlGqPI5PJLY3/6rvr3iZ6HbvTQcCRLmerl50Vh3lE5iFSMbbn7z2AMCYtG+fSFEkynjFM8xiQRM2ltiJSzswk3AEjRX6siHe5ASlxF+RcKyyl4hoIC0p7qSQ8iL2rmSDyFRERMW2oWsWHb8zOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567678; c=relaxed/simple;
	bh=g7POMhw96QU+mXBi8j3TwNitxPHH2PNGKX62YzX/+30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKwP1xujCBLbN/6YVpsvqp3kwu/+rg8M8qs7p8Kf8KPqcfUhv5HK1n5v1zCPR8sh3/pIhKotXV/Uwur3cSBZDdgzIBAajFMO2fpQ6k6Vk82KxedrdvKch/0vSGACMPHyAbzVBDMhmi3FnOKToX32ZFrRNBZwAgs9wCp9JAnzGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiED5EfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiED5EfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3582C4CEE3;
	Thu,  3 Jul 2025 18:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567678;
	bh=g7POMhw96QU+mXBi8j3TwNitxPHH2PNGKX62YzX/+30=;
	h=From:To:Cc:Subject:Date:From;
	b=JiED5EfYPutK+z3jWTxQCPCEONyfwxZ0olrSLTE6SVKMjRUMkMD+AsKWBZOWUwagE
	 NRJDGgzZahvrGp5Z+an7ilsnjUtl7o6Jy/kD0ZL+EOx1pUHnnQXDxc0B8c2z25Wxtf
	 S7qGQ/aMmAcfQ2i2IuarAIxq0EncIBFbZDUYqlxeb/ZiLP9iB0OsBQuAOkZ5V/UoWP
	 uZEW+mNZ82I8PuiXKnVTaQIANee7S2SH+Xcd9Fk4JuH+tpAFAKuiXdjVnww5jNlIO2
	 rUAsTNG+/Zw9MY1+AxSG/FYEQl7TtRl9ApTyP6qQj9uXSsZ0k/u4Rft+EoLezLUo3r
	 IpsAQPBZGs2sA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:34:34 -0500
Message-ID: <20250703183434.2073375-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 6f0d0511b486..7cfc5fdfa49d 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -6,7 +6,7 @@
 #include <linux/genalloc.h>
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
 #include <soc/tegra/bpmp.h>
@@ -192,16 +192,11 @@ static void tegra186_bpmp_teardown_channels(struct tegra_bpmp *bpmp)
 static int tegra186_bpmp_dram_init(struct tegra_bpmp *bpmp)
 {
 	struct tegra186_bpmp *priv = bpmp->priv;
-	struct device_node *np;
 	struct resource res;
 	size_t size;
 	int err;
 
-	np = of_parse_phandle(bpmp->dev->of_node, "memory-region", 0);
-	if (!np)
-		return -ENODEV;
-
-	err = of_address_to_resource(np, 0, &res);
+	err = of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0, &res);
 	if (err < 0) {
 		dev_warn(bpmp->dev, "failed to parse memory region: %d\n", err);
 		return err;
-- 
2.47.2

