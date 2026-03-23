Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4721E2614
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271296; cv=none; b=alwkMzNBn3m1pJaF3Kpt7qnRC4OMsSdAvIOk/DC28ucBP02blS3/eULjfUmZRAYFqD+l133Rtyw0JsOyOKqtaahWNloTq7vO1zOC5mu5uh+XbUx4utYeleiiMEnhxHYZKJVys78fSyzzMtzUbcE1FqbQhKsiWGLmKeelhXbIdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271296; c=relaxed/simple;
	bh=Bl2DdRIqKZcG7iOBBUYjQ+FGP8Qyp4jh1rOCmFGMnh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltKZzC3RohEQtTHikTajLBt2XQG9LfRqi5lf9XsUVK6SWUNwZPzDcYyegk8AlVjqBzVDvqDYpND7vXbIZI3yGWqPjvo9enP5bESU9KWCK4jo0/Pz9HwdyhqiwA89J/NaBaS8lSpGxslf1O+zaSao4MhyZi0GUJVL33qAaUzBTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPRfC7d2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPRfC7d2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c56e822eso143614f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271294; x=1774876094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL/n4R0Qme0jlsiRwDN2Xf4l/bzKJrmsbnUQG943gyA=;
        b=kPRfC7d2e5td1JoId7bMuoeR6s0vYEJsWWiK76J+KrgWlQ51iO2x2MkVKpPStTJQHj
         Tr/PFWxy1sYdFuV4EYTKt4P0WvZ02njFhImwiElDtcKafEIZ1rtZvTwmGlzVEsmOqeLp
         GZxdZbFnMINDzbVyz6iLTPNsbusVQu5YkBftLOHz4cUNg0QLNQJPXL9B4XgD0zHdD5CW
         qeFENquhYc1CiaL0M4Jyjy7CYepfE2x4TuFWpEX/z9ZmbL9zdJljtTTLddgEFoY0wNsz
         nfPSmspM3W85eRhtECR4XaOvgEFwmCOgr9PPiCRoHU/ZQ4DOism1pI/MJANPVUNaXyU+
         CExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271294; x=1774876094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GL/n4R0Qme0jlsiRwDN2Xf4l/bzKJrmsbnUQG943gyA=;
        b=Z8vigFVdunE+3jzsZP0Wzh9KcDcxOrwHR0UXA/AxqBBuxkued2RnFc5gqGVkz8esSe
         i2pRztGn6NDnAplIH9VBKPhm4q8OYImkWP64IfjIFKOtf+kGlzXfmG+K/KSj3tqD9fmZ
         7eqr7q4kyx9Hp0sTXsUIPq1YfUWfDkwH+Jtilijl1/NSUDBu34s5KkHW0y5XB4YZlU/s
         hhZBp9KGorjQm4keX3XZbrn0JoaJsVFwrUxdSiEHXyOlBAGItnJ3he0nRuJC8EbVICB/
         XFQvLiA2SnvDhTe+hRq0M6/OKxuQ/gobxuyPKmWkf1VUinyPXgVRuQJeEKnIDMyR9K2U
         oqFA==
X-Gm-Message-State: AOJu0YyUuJmNp4utQygMffGhAW1MDqGc6ZfbZPdqw7jw+LxMD6ImVnBo
	KqTBhJfm1fEgz98ngI2Dv0N1BH42OQULt6arXA4MsWVUc2DU1SfiLgHE83x1viaX
X-Gm-Gg: ATEYQzx4rwEZAE/l0CFDdphUJ1WGQcLV6ddsg3ZDDlkl6y/P/3Znd5Btl5EtGe0w5oU
	dYqPCJGk/SylnO+M3L8tUl0v9VaoaU4uIELRXsNmcHq8Nrox1a79wr2yVlgMM60dviHv6A9q6FC
	nMHblItbo7GvHE1uO0zwe+6bwMz/MFykZEUGrPZrKgszIlci+edNP/2xJ4GMQbsNgOb0HkBJesu
	skWzuuIbtexRYN2Sc6wBxoE3DsWeeM+anyto8ZRxTLNZBmwtj8cL0Xb/p45JnxZRYLhWoiApi78
	KMl+QeHBzxEoeLlI+UJohnxs+FayVBIHnLd+VBrwpYpoDhrVEZcmcc5gYe6EvATLCQD1Sz2Fryl
	UmJzOKJjtGdzFcvod7WmTni5MT/xazZuts9HdmT0gnWsTurWgbb4QiXTAD9f6cM2XNcz9Yrq7va
	YofGIm8ry/AcbQ53ej13/QzPXunX7c9Vreppo+jt9jB+hnWLUyf8HnwRQ=
X-Received: by 2002:a05:6000:26c5:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43b64279659mr17830345f8f.44.1774271293778;
        Mon, 23 Mar 2026 06:08:13 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm29561633f8f.18.2026.03.23.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:08:12 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for tegra210
Date: Mon, 23 Mar 2026 14:07:30 +0100
Message-ID: <20260323130804.67936-2-kwizart@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323130804.67936-1-kwizart@gmail.com>
References: <20260323130804.67936-1-kwizart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The primary_format and overlay_format were picked from earlier tegra114
generation instead of using the previous tegra124 format leading to
missing format.

This patch is RFC because while it's unlikely that format availability
have skipped to earlier tegra210 soc generation I haven't confirmed
any runtime error nor experienced any regression by the lack of
availability of theses format.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 06370b7e0e56..d5896f12f25f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2942,10 +2942,10 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.has_powergate = true,
 	.coupled_pm = false,
 	.has_nvdisplay = false,
-	.num_primary_formats = ARRAY_SIZE(tegra114_primary_formats),
-	.primary_formats = tegra114_primary_formats,
-	.num_overlay_formats = ARRAY_SIZE(tegra114_overlay_formats),
-	.overlay_formats = tegra114_overlay_formats,
+	.num_primary_formats = ARRAY_SIZE(tegra124_primary_formats),
+	.primary_formats = tegra124_primary_formats,
+	.num_overlay_formats = ARRAY_SIZE(tegra124_overlay_formats),
+	.overlay_formats = tegra124_overlay_formats,
 	.modifiers = tegra124_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_b_vfilter_mem_client = false,
-- 
2.53.0

