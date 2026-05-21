Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1637E2ED
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392901; cv=none; b=UX2MjiI5vBSi4tqdUuHQOmvTwF3BkpHh1chFdShXpzjWcC8sWiSop8eiFBKOofYO0BSXWveI7EFVSHlbcYQ1vnRMwwL5SNWn6rK6Sd52WHURuHu55Slm0gKg9/MV1CUFKJXGrBzZN/fGoccmumD631bh4vzBpYOPeG3QWMpAqtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392901; c=relaxed/simple;
	bh=pRCXFdGi9s622ImYkQNgba2+/ovbSQJWewde8xOLc4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2PiPBFwRmVDr81XBIX9Bkl9OHV5iSD0zu39lbFKNPyVVURXu3GDzj1WeSZpwdi2yKGAozBUfJow51eAw+HVcuTLq5phnZWzX+puCTcmpN9wlVjqaAL4Aw9L0rVmuWDWJdYLDBun+MmrctA+9rUraCgTf6FJA1wwhqNitIYpmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uqZb1z2L; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uqZb1z2L"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779392895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wU6zsubCn0ah+j+4xU4qCKcCbrwywE58iPsoguqJF4A=;
	b=uqZb1z2LgEXezxp4m5BmoZRQwh5Fs/jJeFvuMow8RplrkkR7miQyr54bJ3kT5lvAUq9oU7
	l176qordYBHMO5Rla12gbpaj1i2RGriHpjcB32LzIgr3wz3iE/xbbBOP3jTCnlCaILbswQ
	wdL+g1PcarFBpfF6l7kIzovQVQdX2BM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: dp: use str_plural in drm_dp_link_train_{full,fast}
Date: Thu, 21 May 2026 21:46:59 +0200
Message-ID: <20260521194658.366737-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=thorsten.blum@linux.dev; h=from:subject; bh=pRCXFdGi9s622ImYkQNgba2+/ovbSQJWewde8xOLc4Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn8iUb6gsHcAkx/v9zxfCm5Nm1piorB/wUVqtXLHqbNX bP2J+/ajlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIIR+Gf7aVGTE/zFhcngba mwqv6D5QkDLVVmqCj1GsyAJtnf/LBRh+s7MKHGXOfZeiGDnFcR7rrOKg8hcqF7tPfZirFrNx+sY 2TgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the manual ternary "s" pluralizations with str_plural() to
simplify the code. This also corrects the "0 lanes" case.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/tegra/dp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 990e744b0923..3cb194f5ce36 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2015 Rob Clark
  */
 
+#include <linux/string_choices.h>
+
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_print.h>
@@ -668,7 +670,7 @@ static int drm_dp_link_train_full(struct drm_dp_link *link)
 
 retry:
 	DRM_DEBUG_KMS("full-training link: %u lane%s at %u MHz\n",
-		      link->lanes, (link->lanes > 1) ? "s" : "",
+		      link->lanes, str_plural(link->lanes),
 		      link->rate / 100);
 
 	err = drm_dp_link_configure(link->aux, link);
@@ -724,7 +726,7 @@ static int drm_dp_link_train_fast(struct drm_dp_link *link)
 	int err;
 
 	DRM_DEBUG_KMS("fast-training link: %u lane%s at %u MHz\n",
-		      link->lanes, (link->lanes > 1) ? "s" : "",
+		      link->lanes, str_plural(link->lanes),
 		      link->rate / 100);
 
 	err = drm_dp_link_configure(link->aux, link);
