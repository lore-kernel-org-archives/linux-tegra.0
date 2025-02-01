Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0401547DC
	for <linux-tegra@vger.kernel.org>; Sat,  1 Feb 2025 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407443; cv=none; b=KelMEbE5bnYU7xQIuaQTnYreKU8jmwXl9INVI9m6bUe3B7a+qc+r5yM5pzL7qrQE+p50FsXvtljNvhogOUjty3CkCBAINEID3/1j7iRcdznxcpZiL0fAjQAsTXanF3v9Ss2yz4ygpdIJBMUp42ciq22KcpsG3sZr8G3HyHDUG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407443; c=relaxed/simple;
	bh=oza66ny8W9ZMdYyaKAil1aCd0/2GgLMMrKhemo08/Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhPg4QF3tKZeg41pVnZHYa82on45RqgBdYWmty2Bqhj+adebeyuzZE3dhGLKRCLo+W4hWTFQarihBwy/aleZ7V08n61OHBpahjS7k3T8QbmvezvIo6KuW1Mc7339a0jbZw1M8dZGdnNVAfCcCTxTvFCU6zJMD82d8vFUSDuh12w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 0IPnWRwWSWmmJOQyAE+X1w==
X-CSE-MsgGUID: y9uTlkrySuuy7uEnJ3u8lA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2025 19:57:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C42884009A0D;
	Sat,  1 Feb 2025 19:57:01 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Date: Sat,  1 Feb 2025 10:56:56 +0000
Message-ID: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/tegra/rgb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 1e8ec50b759e..6e540291a960 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
-	struct device_node *np;
+	struct device_node *np _free(device_node) =
+		of_get_available_child_by_name(dc->dev->of_node, "rgb");
 	struct tegra_rgb *rgb;
 	int err;
 
-	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
+	if (!np)
 		return -ENODEV;
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-- 
2.43.0

