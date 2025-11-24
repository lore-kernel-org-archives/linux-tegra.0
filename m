Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64E25F7B9
	for <linux-tegra@vger.kernel.org>; Mon, 24 Nov 2025 03:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955198; cv=none; b=i1y3q0oxPS/WlIuccM3l/I5jmruCil8oOOeuhrb6OVq84vd+F67oveAPuqRIGLq02tnUSF6cV4NAOrRnmoUe7U0zBEhjFm9Pt7GH5XctmKouaimkH5nnTZ3W5dbNz0Gbt/LWj35+xL6vu88wPxed4n4oXMxto2L8D1DC6ZeduDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955198; c=relaxed/simple;
	bh=8B+XYAT2wwADtTmX18WVfBgck72yLxoAtcknl15v4h0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tWbqIQcvthJGOy+BuVOVdDBCZmXIrEZEZKp8/Z90Tjkhx/JbYWllBh/NxyvsgXj7Hc2j1YmUj2XjSoxZmz0lVFPYtJb/T7DsHCviDJJ3Hs4mEvFhm0GdjrvUXiBNb6/ioXNZQLWmoxcmNyB73g/MPmJbYXr+N0RhWuodPef1Zxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0oJ/J4++; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0oJ/J4++"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=n5U7jpt3t1560U3NetE1JfILJnu5vieGsmBVulfauV0=; b=0oJ/J4++2bogNZJoQQ8Bayj7TX
	XzRrQ8CFWZjS1I5N4BlMq0TaG7OBpJXct8QX0RgmDhVXOuPLkMnf1SNfDiZegWXEeNDixKq+rJBxN
	6cwzBBylI2DTwJm8nO6gqadXiGLi7rGAS2JXrLc6a7b24y7hmwxmG/yOow7l4BwAHdyOoRrMF+4yp
	HygX5mqzbcbevyIgqLUqLw3h10RAncWjbzbYbsWEMoAssKxdy0xDad+/KZcgab4S4S/KPJgsOkJq+
	E5MnVmwVRHNCSrUowKacBJei4ZB+i3YFgI7n4x69NlFQgLbl8CgtMSxQW8GqHVwF5g7cRS5izbnd0
	GCoB1+5A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNK9-0000000B28p-1l2m;
	Mon, 24 Nov 2025 03:33:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tegra: dp: fix kernel-doc warnings in dp.h
Date: Sun, 23 Nov 2025 19:33:08 -0800
Message-ID: <20251124033308.2987174-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use correct kernel-doc format and add missing nested struct entries to
eliminate kernel-doc warnings:

Warning: drivers/gpu/drm/tegra/dp.h:28 Incorrect use of kernel-doc format:
 * tps3_supported:
Warning: drivers/gpu/drm/tegra/dp.h:54 struct member 'tps3_supported'
 not described in 'drm_dp_link_caps'
dp.h:73: warning: Function parameter or struct member 'apply_training'
 not described in 'drm_dp_link_ops'
dp.h:73: warning: Function parameter or struct member 'configure'
 not described in 'drm_dp_link_ops'
dp.h:160: warning: Excess struct member 'cr' description in 'drm_dp_link'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/tegra/dp.h |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- linux-next-20251121.orig/drivers/gpu/drm/tegra/dp.h
+++ linux-next-20251121/drivers/gpu/drm/tegra/dp.h
@@ -26,7 +26,7 @@ struct drm_dp_link_caps {
 	bool enhanced_framing;
 
 	/**
-	 * tps3_supported:
+	 * @tps3_supported:
 	 *
 	 * training pattern sequence 3 supported for equalization
 	 */
@@ -62,12 +62,12 @@ void drm_dp_link_caps_copy(struct drm_dp
  */
 struct drm_dp_link_ops {
 	/**
-	 * @apply_training:
+	 * @apply_training: apply the link training
 	 */
 	int (*apply_training)(struct drm_dp_link *link);
 
 	/**
-	 * @configure:
+	 * @configure: configure the DP link
 	 */
 	int (*configure)(struct drm_dp_link *link);
 };
@@ -113,6 +113,8 @@ struct drm_dp_link_train {
  * @max_lanes: maximum number of lanes supported on the link
  * @caps: capabilities supported on the link (see &drm_dp_link_caps)
  * @aux_rd_interval: AUX read interval to use for training (in microseconds)
+ * @aux_rd_interval.cr: clock recovery read interval
+ * @aux_rd_interval.ce: channel equalization read interval
  * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
@@ -126,10 +128,6 @@ struct drm_dp_link {
 
 	struct drm_dp_link_caps caps;
 
-	/**
-	 * @cr: clock recovery read interval
-	 * @ce: channel equalization read interval
-	 */
 	struct {
 		unsigned int cr;
 		unsigned int ce;
