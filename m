Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDC3019D9
	for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941896; cv=none; b=rgVtaXO9lRgz4NwphnzIRfAkRB6wHy1ohDXBs0PJbocIctmhEcRGQYMt6SJTeMKY2TQdq4al/nWftjHznewIz7DskFSuXeAg0Y3bbuQiuE83dUC7xxSVgVh9Fe8FgUC6eizy7L8gv8NkYVx0Ts6ZN7HddpFlm7tFA7ynJR8Td6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941896; c=relaxed/simple;
	bh=nhMSujJJRVBmSCprErQbzFzUxp1Z3dBMo2c0e3hpQHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdHywH5+4sD9QryaHqPz0l+chFrt5m6ezfww+TStrsEvFyLCNAmrQ+PQd0nC1IWNnDB+DqKUK0Vc99havU0hlVSh2LMgtqhn9RaIiT+Suzl4bt8jvMXx1RNiqSeNkKBummfN25sNqv9xxvwmCZReCbb1wZavZIoPTKbzSC3FLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/1c1C7v; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/1c1C7v"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so3535881a12.0
        for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941894; x=1776546694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=U/1c1C7vZsUELJS7q8baHmiRUFvreL5/FTVnz8/XAyUNAkE0CNO0qHJgWUa4u1xHJM
         RaLQaCTKhQdhaHZygar7QRgC5X2Py58oOLCPHUQw+5E+4kY7VyqhgX9Tr8Ypx0jvyspW
         sm2L15z/SIOhsNRkdYKW5nP6N4d0Q6JU+/Qd96ZtGf+9du6ySVBrlaL4nFbfjMjwJV2q
         /7map1upzLTmS7f5sMtDGwa99Gpx7SEV1xhuSmLvzMm8C8AOVSVfKo09cVKrVyVvEbqC
         USv/zxfyJMmgT/JwuI9/3CR/hFTmknPOEBXWedorK7U74JppUAiphC0sTeoQBgr8vjor
         nXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941894; x=1776546694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=MDrA/BzrhPoxArZmoJfsYzFatpfaW8+k/uT64mPxrEbtnGHdWm34IsslUlJdyDd6QU
         CPg530Lo48eYQ/8U9zciFBUsXsFWwwgCCHTf5fXvKgD13/Ssj+TUxn9cNjhPnxwGDr3x
         5S0pk3e+G1MHoH5aDhydN5DI9S7FwOzOMWrcZw7ILVL0YLy6wXOynp6FTFXUoCmuyaBV
         BGPojAocXZaCszT3i5x5o/FgQXwEEV6JYMV1OzJZLfH0xAerIX/vromqH5bEU9cjFdQj
         3jbHMLvNHkiSuWC031IIRT0BB+75nioNLoeMtxFyOtSjsH9nIbl5swaTp1ilD+8+et/r
         ZJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVcJlN+g7RvfUfyLsnXhJVqkLMzNjM9er1eDraVT9KE0t+ZIWUBTW5cxGSCmBABhE9Yu1937nSsu8xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt86d/w8UxNWrrJuiE7Vab6YjS+Ad7C8FLl7E1uccwOcldlh2X
	VmCXte0qIlbLRTKcFOKrO5bRDzTro9d1uMe1/OrSfGx2UbHKbrIOtrag
X-Gm-Gg: AeBDieslruH0xjSagMab71/JSxCgBDNbFGvYfSgyPSrJ06/80/sBo3ZCSZOoYjELD+z
	STp07eDXNrRTjAW9q5IXQNYpjdcJ4eo1G7JM3Uu/a3njAYz030dL7UUL1A1pAep7F8qQFnM/Szc
	9HEO4jVsls4XQvz0l9spxCOrNw6NZaoRRodEpJ/z1vD8UnQ4KmCS3zSx0u7hhqpbIBg4jv4IE+p
	44Y/JEvKx5Bar84SY+juZz1Qldtx6hP9H0P6wxaDt6+D/Uy5xE3YVAlRiogWrwz7xo+3xl0eKd4
	ac2MYFosoVJXneMFzOBM72dJv+XakWxqGqBb8nm3H9CYem6eMzSc0CmQW7y8piHaEna6fCRPaRw
	geBTp7sG3JF2DeiVMaVS3cY32DvRoZaE4T2umPWpblTojuMI4zT/3MNO6cAdUngWPHOPc7VfRA5
	kZuHghlYfxfXR6F7h6ykr2pIGVgEc2/9YkU3LCS9jF/z8ByMidS5lqGQqBbJ9VSHg7lbCw65/+c
	uBYV/Pad6Qh9sLeEYKXxgaD5c+AkqUfQcCVf+EepAWmpcDHL/m+U5dDdJz8lu+Bqv+9HYZ9xSw1
	ZNQVww==
X-Received: by 2002:a05:6402:1f4d:b0:670:a401:c977 with SMTP id 4fb4d7f45d1cf-670a401d3fdmr3133815a12.25.1775941893972;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sat, 11 Apr 2026 23:10:05 +0200
Message-ID: <20260411211006.150782-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
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
 drivers/staging/media/tegra-video/vi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..e6416ea8503e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
-- 
2.53.0

