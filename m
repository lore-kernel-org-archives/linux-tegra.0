Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254A287510
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 02:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120561; cv=none; b=QKdKoI+j/XVdW5mlERis8v9WK2kgIbaTTOMYlUny56IMkDGqbTuBrmqfMjnnlplSqXTS96PqOFuKr7+2xkutATGkEnNcgAWtnFZ0V771S5Mu/tREEm7BRghKQomcVFHY8FHt6MzCs7FYzRiEh1OGFCimdTqBHYxWe6ddY9on/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120561; c=relaxed/simple;
	bh=Zl68Je2THxiwdgrtmVgPoRyHAnq26RpEGmiXgHyG+i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QM7yzd6Iw/znsga0ULUClnoiUHVWmJsEShpsfz6PXD/cqFMzEUX9KBbfI9fh0gAYxfpy5Zh/syHPEGYrObXoPAt4eJW3tx+ZbM+6jlfv6W+zTzCusJhxdoeKHBzwU0Fzn7fp6ovQ6bEE3pTGSzzvCRIoLv+9AXitHlAUnRzZ7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHo+0TwY; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHo+0TwY"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c8f9846c8so584766c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778120559; x=1778725359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2A7OPcIfEOOgPo/hUvss5p4sYWrcq7D2ShgndF76WM=;
        b=fHo+0TwYIMwabPTXEjFVd0tLPEN+rVmK8+bmjbgcvwbyMDarTb1h69oYOnq8wP8K1V
         v7eVsGYsjNBonkym+o0FYItFvEtdCAEwQdiu4Eep3N8PO8/apxtxmlOxFbK9/tVXRNFl
         ZAEgxXV+HH1wE2a5eQxkt8zsqbsDBX9WN6NPw7HCeYBg/I6xlf4npo9IsmVuHKGSJpG4
         Hvs4UZMqn8vSrWCcXKmKjUqHaJtWgWRdY6iUYVaebiC2We384hIsPVXaY/diy2BlHqOS
         jSCeJSFqF+KGBxuMGRA1BzghY8dAbb2JZhVqUAxUiFe1WkFoAy+A8W1tm8NNC4865KtN
         559g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120559; x=1778725359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2A7OPcIfEOOgPo/hUvss5p4sYWrcq7D2ShgndF76WM=;
        b=LNmlrnbjTnnBri7RUTu8r/XQGpT8IdpHrTx1bsa6VP2P/89yYTi3vaHYKJcqOF4bvi
         fQ3djooLbU3ua0Hc+i/sGhR7JJvxXQiusBdP3cezc8zkH7QGtGPsmhvlmuD3st+E6c7K
         WEctRvBPkxIjqRzMsLrVWhJdwEU60j1/5Lh5xIZCWoZl30/xeT/uuzFKgL17FjAfk+ZO
         8sGZO/uslSWatHvDUGTKSzWArPO/OPbIqi9AQ5PGYMhuRzE30ljZppWxxGSX9LIeY7Iz
         5a4UeQ6euodczxCndcKHEjMcT02alrFYJ37SN1bfxGrZFVr1HPk1b3f9L/V6klQUNmSR
         PRqg==
X-Forwarded-Encrypted: i=1; AFNElJ+tP0AWJShS+T7y1QMBN+884wMijZuajhzxMp6eSXpQE239SoXzWQP2BeSLfpgUNJejoo0yVGGpCQSN7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy72gOtNHRC1xtfkjqptBHCWSTg5kQGf7nkf0RkygFzAQllpJJq
	7rl71U+Wgmj1he+2NSDJFzwhy5AoUXi8+mFjgykZWK9TupbOcaFMjuLi
X-Gm-Gg: AeBDiesCECM/k48K55w5x9XGDhVsREQY53UCFAiCeUDKVzKsSkel89yi8jgRSObB6R9
	N+ZfARJk//7pkMQOmxGORPoHnqBrhQjhiV4KC97GXkf2n81QMvO0f8RynbTEBUlor6uTQZ1wWWA
	uHNrrNLpRpWo+sMbfQDiC/FnAbKWHPeO1rbXNiUeYLy1eBeTF+LpdsB0nml7yLBTuzDBlRyzT6c
	cnfZr4jKyM3U/O39JUcLKgoa/iMXzEE8uQv9l9K3etIRJV5n0TWoUcHbta50rSI//3gD70y6GY6
	JOA9Mc7o+GEYJNtmiSZBX91llKTmKCHp/yUb5hrcpX+7YA2rkNR++R85SgrSCVZlzM/WbuJ9dCW
	pfzmfxs6LowPwDYPE7GLnIdKlXDhSZDYh2XY1vQ/wfiMcS63zth7Zv+MdzvlPtx5XoRpAaepjv8
	tOtAFxMTfW++olz9mTNM5c2rEc3bHv70RTk8gJ3w81ZUi2fCLZnudmywKpeOKgo5RESA==
X-Received: by 2002:a05:7300:ec08:b0:2e6:e916:70ff with SMTP id 5a478bee46e88-2f54aa81abemr3065260eec.28.1778120559210;
        Wed, 06 May 2026 19:22:39 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6658192eec.26.2026.05.06.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:22:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	digetx@gmail.com,
	hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Thu,  7 May 2026 02:22:13 +0000
Message-Id: <20260507022213.29290-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507022213.29290-1-dennylin0707@gmail.com>
References: <20260507022213.29290-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Returning 0 is not a valid fourcc either. This condition should
never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
access and return a valid fallback format instead.

Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..456134a9e8cf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
+	if (WARN_ON_ONCE(index >= vi->soc->nformats))
+		return vi->soc->video_formats[0].fourcc;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

