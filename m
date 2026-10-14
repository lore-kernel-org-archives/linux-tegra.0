Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB35F397923
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998981; cv=none; b=WSB6q6wX6gzCLbuPHg1HtZNNib9ziBVtMMHZE2op+1T3udl9uno05ri9LokgWG4jET3mBbRO9wJ5oId+SQGLiDl/m+2vjRkxhQHXcUzz0lZlFLzROaBcf9ksf8Zr/SmEW0zikxrPMJSdgjBsdZXxUW37X5WFOCxPzqQL0tMktmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998981; c=relaxed/simple;
	bh=ohxyR8811Rxwnrjns3rsGOInr2lwuC7iTykGMO7lGu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOJAwl+BGFsJ+t+uZY3GjyTkczHbKyQT+gmyziJFWh3JXoWNV5Tcx+6afWpazFwd0r34unvOdrN4fCIxny15zqPx3n4zK7zwMfa1tosvEdiJE58CSTPLN747iqur/1Ai2hQz3ubJg/cdnHv94eVgVboCYdS5svKBMQ3UHWUsCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be2sfbOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be2sfbOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF971F000C4;
	Wed, 14 Oct 2026 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998977;
	bh=LVGAt9osW9rPVCHXcRYFCZYehIOW2LVw+Zc430E+S08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Be2sfbOs6Dm/f3s6/f1AwqN5nNA4rMj94xSjT+q7VwElh3vzncgZivnGv3Hz4iL0O
	 JXu41hwXxaNQHrAjLhKfAvpg3NRZZ59DDmKfdFLSx91H4ly0gEdWV/Sfuvl1jRGu7n
	 xrLjGtA27ABk7NmJisg84unh3TeQlOBPLPPeWARS0Nl5t623W2KV8zkUpjVnp2LezF
	 hFP+zjakD5cdaeAAWvYJHWRVwqrTzT8ckYZKZOTKLu9bK8ywZX1JWAGuS52//P3Ig7
	 oJW+wniSrTEfaFZQJR+Ab03V845K1wlJb1EVQ2w5YicGhjHoqKZMCFnlxA+4ZF6SPu
	 J5cnS9EPiD3QQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:03 +0200
Subject: [PATCH 40/75] drm/tegra: Switch to
 drm_atomic_helper_connector_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-40-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ohxyR8811Rxwnrjns3rsGOInr2lwuC7iTykGMO7lGu4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd8dM6T/5Y60LK3/KpfZz3a/nmpbNV7+k0/d7ib39x
 jK++MfbOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBENmowNhznefhV4u6/2s2/
 Cxfu7uRtrPmbZ/xuF8O0rXt0/x8NlWNa81vJYlLq9qjzBo9WShe2z2Zs+MS34UJl56Q2cY3Ca4c
 qe/gErZJ++b+Ol1s2qXjZYsFDE+N9V1mdPHr14rp6/TmlLwt3AAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e..edf31bf8db1d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1128,11 +1128,11 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 	kfree(hdmi->debugfs_files);
 	hdmi->debugfs_files = NULL;
 }
 
 static const struct drm_connector_funcs tegra_hdmi_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.detect = tegra_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = tegra_output_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

