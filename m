Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E8309EFA;
	Tue,  9 Sep 2025 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403242; cv=none; b=rJ1M36KCykQNk+Z1ICDNL8IOkRUx8aHEDnY7irPZN3R1cFxKQcYQ3D2X8hlA2217o7M36IJXXW/b7r7d56jG3FLbQfUu4dWv+VO7bd5oNsEP+l19Aa0rM4LAwEj2Qi6SEMXV3bbkpWDOS2EOmQWxeeknUv2TfwY7H89+HIP41fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403242; c=relaxed/simple;
	bh=ggGdRmXLBbjArTvqcF72EClkwv1lqIc94ZhVFK9wFgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjUkVAZTGnSz6vV6+Z7Qgl5O5B/iRc6Chg83K3nqPWWpVdwC/Ik1woTiFOiqc1iwRE/k6Tdjg6b3BU7DPQrDuQIypnGXuXQ+4U1B2MFjzxH9VC3iUw336rYzK3dYfzVkPEgtwrcHyH4M9c+IeErmmqd/U1PfnftOsnccC3nxRXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7/QIzLz; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7/QIzLz"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso20141881fa.3;
        Tue, 09 Sep 2025 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757403238; x=1758008038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
        b=a7/QIzLzSIxma+TBe6YDSP2sNRNMZxsOjYLtUq0zQf/e3nIfRrMHQvZJC61PqBpbEX
         a9WuKidH/6ZCjWi3cFm7b/6Cs458OC7XKoZRhJlUEjvPP5ZuLHXFwzKecqrxio6jXVMX
         6iYzAGrbngRpCO3KIJw08VDoh7TK50GRok21ijBuxXsFQR8XQlEf0S6Pk2l/Om/NrlTY
         bPk8YuL7vX+HaQwdhr3+JvMvW6zPADw252YTMo3txUn/HzihRDAKiBoWdxJ8MSBOqLkc
         wDxHuQsD7K+tS48xiN0hxLQO1iK2mY+UUKda3JiYOJfI0IhCwEjPr/J8Cd3T2GGEkhvt
         bhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403238; x=1758008038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
        b=xVUr/D+bl8oaudUv/zRKoiUHksJSIV+YFrm3AydqjKj59huW9lKU7bcydWrwB4PjJR
         qytgCksFeBLm2JJIvprRDYM1AoT7j/C/9o+PLZN1YALrjfnsMkUGZiDkj4fefx81poi+
         75RssQUTYqDeUQS7xi0EsWnAxD+DNt28u6ucwKiKtrBSRsQ0/hWSzkoIxuuS9az3ylvg
         q3FAuhoC4rWYxaYAOVh9KUYge1h3DU6tU0rxsEGS0WcToYpdBk88qR4vQQc0v4g4wKAy
         6WTRl6vA280YMnAz2kuLO0k0Af5FrPPVTtsFRP5thEKkvXkWVw9PsXzyCUMA0XqPpMIc
         MnZw==
X-Forwarded-Encrypted: i=1; AJvYcCW/r3NXRtQ5NLEiAuGbaTBpdj3tgwS3dhkugIA2+kZC9jaa26f8IyNqHlFTspWtefRuLSV6eaHGcnMFdaE=@vger.kernel.org, AJvYcCWhsZfiJl6jpXYGev9r/PB8hv7B5qFK7lP323mMLBReqYkZ86o46In3thdtG70fKJmGwR7IYYOd2j/CwMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+iwpfhj1Ho/1kdHimulla/yHa1tP+f4sQ3YSp0gHVhewvntiz
	LooL6PT+5TOHkL+Rv7GTex6eXuifuuzVLSSJ04qkZjVlPuZ6yzwwXkfy
X-Gm-Gg: ASbGncuQU4YBKOVGxEVWOr7Wm+4uOU1c96iUjNi2EZXPdTDHRQo8EpYlkiN4iemo8Bs
	ZVK/BiDU4c5ETMdH+cQyhYeQQhLc3FL8MpRKk3d/wYK8JcsExQQyG+ZIzQL04JXi7hGdtwG4IBB
	Th+tBqdV5HbHVCRq//PMZrBz44zdkcyKSmviswGRJsrrdcWftwfrplAGCYAPCbSiNxKOpD5ZZEq
	nFfBYpV/dAkOt555wQaX6Zx4ykXla1o+MhTos53oCGqtoFPExNdZE4q6d/JXiY8YQt2HyAWGQHZ
	zuruPkM1/BtxNl0ArgiPvLFftDv+0SJcsHml2riydz1+kGUSL7F6B83M11ELSnlZqSuh4d2yZPq
	7RawK5caegFIlIw==
X-Google-Smtp-Source: AGHT+IElpt1mNRwwWKhQpfkwc63KOwvW3rDRSy5Rcmjz1QUiR7+paKgXpx8Z2+qnNuoRZk5EjISFSA==
X-Received: by 2002:a05:651c:41c5:10b0:338:7f3:a757 with SMTP id 38308e7fff4ca-33b57862674mr23066631fa.10.1757403237229;
        Tue, 09 Sep 2025 00:33:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:33:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpu/drm: tegra: dsi: calculate packet parameters for video mode
Date: Tue,  9 Sep 2025 10:33:35 +0300
Message-ID: <20250909073335.91531-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909073335.91531-1-clamor95@gmail.com>
References: <20250909073335.91531-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate packet parameters for video mode same way it is done or
command mode, by halving timings plugged into equations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index aab555a2eb68..1ec3f03d2577 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -545,12 +545,19 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		/* horizontal back porch */
 		hbp = (mode->htotal - mode->hsync_end) * mul / div;
 
-		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
-			hbp += hsw;
-
 		/* horizontal front porch */
 		hfp = (mode->hsync_start - mode->hdisplay) * mul / div;
 
+		if (dsi->master || dsi->slave) {
+			hact /= 2;
+			hsw /= 2;
+			hbp /= 2;
+			hfp /= 2;
+		}
+
+		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
+			hbp += hsw;
+
 		/* subtract packet overhead */
 		hsw -= 10;
 		hbp -= 14;
-- 
2.48.1

