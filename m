Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA692FFF8D
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983778; cv=none; b=YaaVP0l5Cc5XV1ObhOr0S0p+Ut/IT596zCzOjJcQHLjx+HrOlfrkle9kETMy816qERftFsp/oT4mtdnVRnxx0ZHUhnHB9fuyfzFy5ly0LWdBQZx5ciweTztl6hSEfPPE4zlleW5tsaYUoqU6DsLLxyuq6R0/85+m8M3I57b3Hxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983778; c=relaxed/simple;
	bh=Zh1gMWcDLON+NjfzXUS2eYcY2NU/RrfJ8BIhx6gE90w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tn1PMvNj1jCp6dsYnW4UFVQqOFbiV62VSFSj/aHOS2NZ2WijmbHm+FjFpiIoqpElNfhaMussQ+Gngdt61jyLQC0YxsCjlJJAqZNg3jRezfedd0QpI8UZRUwMR5ZvWrmyd9+94a0qq8ZbLqvAoSMY7P00si+Zflhirs0v0WLQO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBxb5y51; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBxb5y51"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6714f678bdaso382215a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775983775; x=1776588575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=iBxb5y51wrQK1NV3WgNsk50NxLIsFxZuC9xecAUt6PmH6MHEfTRDIUdfmo8P2zTo9k
         1taWXM19afs8cuyi9nmsObviYpMz0mG1uiqaSdKVLa6SDB31R8nOr427MhPRR8yDgOik
         TyLI56tJLGBmcDR+NMwLOaEKTmVk7B2zhSKs2uFB8clO6ub49OCNsqIQGvjnU73W/jq6
         OZRhhgskzq/e1DbglsVby+/k+m522EyOXtuJgej0fQshxxdQqVAm7d4CAFCWCc0RZ51U
         2RXT0a1Lopwl4ohyZH6lQP6t0PfnLV0N6aE/HEmPlbJ/nW07YJAEPfJMnDg89qir6WAU
         5W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775983775; x=1776588575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=VZbIA7wxiKLjhjyCG//1XqzB0NtP7FrqNihpzJGn/e+xZLtMof+KR6JKS+5QAWdKg3
         JXgO6987dxGtuzDgA0Kudkm3lonKM3lDX/lVvPdxhoTjA4MFE3rW3tweM7ud/fpeno2x
         fSHhh5eFBmHo7YEloVVG7iRTc6CIsT9yU66ttvyPgJixWCnPwKhrPe3zff9nH1WjZq3r
         zcmFLTypnkr924KGcsBa/vrNTddc63uBAq+Z1HihpZhCCzO7+S0f+fx4Scw5+5HZYgGp
         J5TSco5IrshovquYj4mKN4U7rfLWDKBGuaWejXh8iTgmW+2dOSMhMxbyXQ3v7VdLSgZn
         34lA==
X-Forwarded-Encrypted: i=1; AJvYcCX/pOOGhNonay0D5vNG6NnCHgszSUE8OyJaUjJY2Y9OWkUKJwPxOd8qEFfnxnyY81NSFVZ6kaQOKSzLTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9kgAvPH8ArPCAUYZ4vx1SW/lFSsHrmgHua7IgBbGZ29cP+eBb
	zcAtREp6JnpbsWCA1ZvuxzSboVQ0cFHQofG4qc3QWXIvMUTx+iL/gyVV
X-Gm-Gg: AeBDietWacZHF4XCmXFHsGuaMsDd/dcQZoN2VIHUJFt9LjvPAZUa8Rovf09PUBzYmL+
	L2aUSds2zUc0uaXjhmOL4ByFdPzwFaAKtd8XLmQMg+IdWXT6naNGIGYdt0cgT3YdLi4xbJly2mJ
	3aUddYHoiAzbgEArBdL9TcmknCXya5jUvBzVdWSiG4MezF4Oz/asl6kzViKmT9tSPCLybTmf5+C
	RKx1bSWiCH1ComDFZpvhHu8FbNV3c/CkF7KoiP1mKoDX/i7901swnUQhiTjcd6X3NZnn9zBln3S
	xRZS2UknfQiSKI9FRTa6B7yjKt2rGYzm42wTwS5BMeX7+0z/WbdLkM6jcoqCNBeSzGY7w4NM9pf
	jOPfjhBeeNkKPvoyuYyJ6mDuUb9Lljj3d4czd05qdD82g26+GgMg2HAFoBzJqz/vp++vVNOyATb
	gIZr4ayrmUWkUiYgleJCOYZ9QKHK/hfdGii4gRhWmp7U3SMylpzy8j/+yEF8TX11fY52OvqD5vG
	EhRAbElHIE9Eo3qjf1+tM225GyeoQWfAP7E7uYpNdPPS1fJsfkaN41Jjn2W4V3qzZwGoGg0Nt7a
	1tg1Nw==
X-Received: by 2002:a17:907:3f87:b0:b9d:df73:f0b8 with SMTP id a640c23a62f3a-b9ddf7429e8mr7795766b.32.1775983775119;
        Sun, 12 Apr 2026 01:49:35 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd89a9sm226253366b.25.2026.04.12.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:49:34 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sun, 12 Apr 2026 10:48:08 +0200
Message-ID: <20260412084808.232010-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412045245.GA2019381@kroah.com>
References: <20260412045245.GA2019381@kroah.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_idx_by_code() returns -1 when the requested format is
not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
check this return value before passing it to bitmap_set(). A negative
index converted to unsigned would result in an out-of-bounds memory
access, corrupting adjacent kernel memory.

Add WARN_ON() guards so that any future SoC addition or Kconfig change
that exposes this path fails loudly rather than silently corrupting memory.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..d1d934e361f7 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 }
 
 /* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
+static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 {
 	int index;
 
@@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format RGB888_1X32_PADHI not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+
+	return 0;
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
@@ -1410,7 +1420,9 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
+		ret = vi_tpg_fmts_bitmap_init(vi_chan);
+		if (ret < 0)
+			goto cleanup;
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
-- 
2.53.0

