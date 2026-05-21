Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09A408009
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392903; cv=none; b=ERbuT2TOcHbH+bYhmaM5HX4J/Zp7zhr4uIfguXDo/hHfSpXM5SczJ9VvTY8qfx3+FgrxfnJvGVqApAkJw+8Bj3ytGnsnhAyT6wqj01WzQy73mJkwW/wBHIiUdblTtVMEl1it09qDl0EkpOh42d4PBDMD+Z8xB/Or+grfj8N7sX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392903; c=relaxed/simple;
	bh=cuEE8mJZ2JCkrLzPutO2sbOWRw90RT1D++ufnmzO2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkTBn27fpZLCE4ENlwu2WBpubinhkXdDcJQYwLQ4EaGoWfJ+pNM7N6tH6QoYE4b9FeKIwaVKe2Ilp28eTDbQL/zHCyprg4+ovKcN1Z3tSTum9E5jKiyOjdY1qpQAgZg8/tZbYuX+gB/ktShtNLEI6h3f9+IwNAhFs2Uwzxoqias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T9owrkld; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T9owrkld"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779392896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlU3IQM2OYRl7N1ScizGGel8YM6cCC0xlGR922rswK4=;
	b=T9owrkldtadUvPGu8pwURLc9gsNTEL9Qm7UZVCYUFVQfdNGO0fCp0oV0sDk4Oc4QCnLWDA
	zSrY9twWH2HXrEOGXgp4tVmdmeqpv9qqhoDGZB/o3u5dhz7JVWzkn6Jzt+fbaaqo7C+YjJ
	ULlOO2U+X3TjImM6fEo3UyRVrFS8pPk=
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
Subject: [PATCH 2/2] drm/tegra: sor: use str_plural in tegra_sor_dp_link_configure
Date: Thu, 21 May 2026 21:47:00 +0200
Message-ID: <20260521194658.366737-4-thorsten.blum@linux.dev>
In-Reply-To: <20260521194658.366737-3-thorsten.blum@linux.dev>
References: <20260521194658.366737-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=thorsten.blum@linux.dev; h=from:subject; bh=cuEE8mJZ2JCkrLzPutO2sbOWRw90RT1D++ufnmzO2EY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn8iRbnLlZcPPHS/qKsleH3J7U6oQkpEnyCV8s+rdpu8 WalUkVYRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyE7R0jw6fOrRMObJVirV6S sC+7MIpP6nkI02m7RxePHV6eExNSsYjhn6nbYadNNfxnnOKzNpgUTzyxhvXym/3yjzLOXv5oeOH rTE4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the manual ternary "s" pluralization with str_plural() to
simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/tegra/sor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index de8b2dfc4984..93e5ffd4f206 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 
 #include <soc/tegra/pmc.h>
 
@@ -940,7 +941,7 @@ static int tegra_sor_dp_link_configure(struct drm_dp_link *link)
 	err = tegra_sor_power_up_lanes(sor, lanes);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to power up %u lane%s: %d\n",
-			lanes, (lanes != 1) ? "s" : "", err);
+			lanes, str_plural(lanes), err);
 		return err;
 	}
 
