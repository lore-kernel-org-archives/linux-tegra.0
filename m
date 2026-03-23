Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435AA1DED63
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271291; cv=none; b=lTbYw0UaOJqN/vwJAC2LqGMYaPK8HYiXijOCeRh80pJd/NWNck4pAKl1KegXmCbE4lhtufbbaSozQvbc9YdvIrlgtmvjMFHLkWZwctcqL2dvQDQR3uMmQbc23WnxOXaK1+pAjl1lmDdxxSS79cEMJrUaYxpp7+6I1WJUhMqPzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271291; c=relaxed/simple;
	bh=Bl2DdRIqKZcG7iOBBUYjQ+FGP8Qyp4jh1rOCmFGMnh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVc632ctJ3lFE5BHe34LwMCUwSykyx60A7HEIBm8K9yT9VFXt5RlmjWx5dZ++rSil8ktsSPGUOqlv/282Qjx111spIvVZ4fsI42285KLV8BlL6vmXI6WXBP48RcvrYaIANGcBz7kXEBq+O/l7ll9zJAw28WqINnUg4rayNhFZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKEfITAN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKEfITAN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so1372381f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271288; x=1774876088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GL/n4R0Qme0jlsiRwDN2Xf4l/bzKJrmsbnUQG943gyA=;
        b=CKEfITAN3R6EghzYci0Cq1d+JGhxxGDMISAKfA3An84iw8cQkQU/hdzrPMiq8gqKg4
         aoFQzU3culL0MoMDK7/Na2ffYbiXiX5yQQoF3a8M58IP56qAs9Y6Ix+CNnQVL/o1j+rj
         gFjmR8kKX0g6no+6ZOpxmbkOBATilyjKFwKwNCzXJWP89VkE/lBE3Z9leuDlO5aJcx5G
         NszTiE8qlNh0/Qxnkr2VuCBI97Cm+vDJfICWAKcjlJdgiUP/NQOOj0jFS1bHOUqf8ZPk
         ohkO0GcVf5T6zHhJHBYiQL0s29dI87L2LT0AeViU60pkH71rt6WfqdNPK2HQD8jTjgbv
         YKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271288; x=1774876088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL/n4R0Qme0jlsiRwDN2Xf4l/bzKJrmsbnUQG943gyA=;
        b=sPwYc3Cb8pMCRSBsie0p1B4xkWvB77+8Y0srMUbpEGfTNIhu4snwhiSRO3ydfmruI1
         doCPGrE7aujFZGRWsW/D8/p7uUalYtPcND916FDPDayvd90R6a5BFvo1ibTTCsq8doHv
         5pZh12xgA4NUvloPgOX5pv6GjrgQEi9NgwMG50VIywCSezxhJRDV40Gc3apZZBpT8pZL
         F8An9jsXtQaDnkm4QMZwgnqLtflOxiYnatnu/0LWpX+zfhiQF7Yvjvb1PY+/sH8LWFH4
         Z6jiWflqcXEa2rS4Ikr7U8TL3P5xqo6Raw9ATZ8s/T4Zhv4OeOFGUfw/Cqq6SdVnm7dF
         0a+A==
X-Gm-Message-State: AOJu0YybhdbxKumO0lyizNHfU0Se3obD/0LQ3b9MiIIMmyNXeBih7PBI
	Fn+UuTsnlk8JZpqJjvcX18rYMAZPC+lOvtGSBokk6p73DwS8wcOrbsGB
X-Gm-Gg: ATEYQzzfKT+wRvq1TVMRmLP5G4vs8YkvqG7ENW6obQ1JI30LbaKRpDAi4k7znBMVVvH
	6kybePm1aOwrI3nW3OSlYCZ0pJs6LXNGOj9dRN/DalJ6iSFYUZLVt2YUjAGMASqPP4Ho4f6q3s9
	1cTl/+j3nGq5FBwEsOBxFmV3iTIA7diuKEbafx/yhALqaqSNB1j/c6soc9IBl1PaXviPYk3bEUy
	h+zS099RV/3f15mPiyvVC97GettW3UzxUhDtIWXmmC6FL29F9+7nRXOkrTFpL5Mpq+acA2NWPHJ
	bAx7XpCCVYD6lw88Lub8E62Vsb8COaB2x3nKuZveOZ+28uiHLggWJ2t+NII3cJ+SoaFP4/KA1mm
	y1hlBh34YvY4bSUw/rQXTolHrW21sHPud1nkTo/TOm6TjBFGnlgFgOQphApB9fzP6yh9DIvac93
	SX7xbXV8a63FqjQIeqAsRZueIDcVV+EVTCplE8pXJq0OzAd7EoUbihL74=
X-Received: by 2002:a05:6000:400b:b0:43b:4966:744a with SMTP id ffacd0b85a97d-43b6428ab1amr19734587f8f.50.1774271288424;
        Mon, 23 Mar 2026 06:08:08 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm29561633f8f.18.2026.03.23.06.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:08:07 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for tegra210
Date: Mon, 23 Mar 2026 14:07:29 +0100
Message-ID: <20260323130804.67936-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.53.0
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

