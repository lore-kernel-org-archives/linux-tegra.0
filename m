Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7D315D24
	for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554737; cv=none; b=Es7/Xg3KJFts/d3A3njllEHrkI5oTT1M20flOi7ENgKmApmKHIOANU+ZXjsCyQ3dU4r2XxUB2X2Kgp723av0/+bLiyBPx+sIQZINAsdR8+MvIzWpBrFecD0Ry6wJcOoiy52zkotzuw5uptsFxBA9yGusgju4bcrvKq/cT9SlUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554737; c=relaxed/simple;
	bh=ly8Hr2ywwPol+OOs8cEqDSSykysMh6TpsVP/PGQVACo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SjDUc5sVT8WXlsUHSR3wxa6tkfuH1ZyJiEHoWL7gocWJCmgrEb5EjUB7wy4U8klBP7THvAqkxbVor6eHkLNZhvD44GqOXHN/ikIZNn2QUUhxEntKGygBD46noA8ET00VkSDho5+gEMnWjZOMJzLQh+6j9zKhZvX1vqjGij/Cb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrWhnroA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrWhnroA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so1939667b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554735; x=1762159535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DU0KscrGihyZoXJMago0IWkiGUoidqfLwL76Wss1j/4=;
        b=QrWhnroAXJlnaAQd1X6cggmCZDoDH7RHA8A2ZmAoKtPCphlb9vz9UPcqaf1dHcGEo1
         fjEyZOPDELWIcVFSluUH8SiqDgmyUUGyZohlD/cb+VfG718TavzbW+UiBx0piw7LqOpm
         lEKAnlDOtCGB3M+Ul6GjA31wW+TjZZPJCtFo0ilYBo0gbb7aeClVajhz0vFXGbqNYyKU
         x0wiWwVS4NxmguXDKcv5ZegdZLHLriCfcMNEuyI9+qVaPzeURGMs80Kc50w+B3j+BoCF
         WVooy1brKc0tyMO0GO/hXmO/ZW+NiNp4p1sG4OlcM/VT83r37bLNxrp5CqnzXkc5OIKG
         VcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554735; x=1762159535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DU0KscrGihyZoXJMago0IWkiGUoidqfLwL76Wss1j/4=;
        b=YL8QkBNNc+qabCYu7JApTziFP1NPH7pd5j4WkxKgSF1pORyIo157tILqKNUYM9hbvy
         b2L4Ag2vNny5Ja4VixWP8Ucn5FnfHyHibyMcRnyxvYGC2ZATojtvjFfFb5i31cNb4Vx1
         ezKZ3dvznXbxPTTHfzo6eSkYqS9pYZrW7bmQUh7S5pVDYTjYJk+CWysZuRkewRZdxWcM
         moOVuEaoQkZRQFPzI0zcPgsP1LGLOpXAQYzYuzFo2ywtL9ccH1wvlNsO809pzBhXmYbj
         0b426rIeSWUlxkUmUjzWOHl7cHZ609CcWR0HY0hzBKzsMpA/pY4IPvyXTXiGEl/I4ID0
         l8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWoZUgSS01XS0BE+qxcm5Iv4IKc4fp5vyWMJU9UbdqvMFSHZ85C+Dv/znf9qH7uk5l+VEmhWgFDiTcZGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCh0+MRGtpe0usvv72gIDPDJ8PJmHLq2b6D87mFfIkAZ/r1RkR
	CEzi9CZxHUs1dsxuh42ec4EXjyVp0Rf6glvmK8g2lGVUdVXArCJyM2un
X-Gm-Gg: ASbGncsZdgI3NbuDu/jaMQIkqvxvhlSsLFiOhJf237RrrPx9nSPxYShQpOuZKlr7mnP
	aH1MIiqnqbh3IfVZe5773s8I53i+XUocBGhDsBJOWp61iRNQJfsxDNDNUXB9z3/tezSxqOYpJUc
	OZ29iNukrCJzOpN1BE6hnXSlmYTKDBGFK7TN1WzJspo0Mro3n67i64GDbkEYppH3b0z9JPvM/Of
	NynZY5pgx4rJ5Nxj/FGOhE0oS1bHRjTx1Ywm6Mo7XbKBS807pLCUX8PtuWpyR1GVsPuuYlpDFGb
	3YHOQyNboMe5w6JIc/pEcviV3BYbnWOfsCOTWEfXvvnOprXIruA/Cw1h8XdsEW1UAZq4dgQLFth
	hoFTU2vRRjYqojFIzkLznwUeOvccavM2yfq0nFNCND4ZW4iRS1w2wL3bPx6nb4jy9dMhPETccW+
	v/mrPtPbLs0mWB22BdNoZzV57CHSWQzPlS
X-Google-Smtp-Source: AGHT+IFlSNyx/m40xKYC6OWXlqmRmI+SM7/L6vothAHVO/hXw1MzPva0O5TbGE0SIfNFUBdqckDGkQ==
X-Received: by 2002:a05:6a00:2d1d:b0:7a2:73a9:96c with SMTP id d2e1a72fcca58-7a273a90b4cmr13811317b3a.3.1761554735303;
        Mon, 27 Oct 2025 01:45:35 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41404dddcsm7300209b3a.38.2025.10.27.01.45.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 01:45:34 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix reference count leak in tegra_dc_couple
Date: Mon, 27 Oct 2025 16:45:18 +0800
Message-Id: <20251027084519.80009-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver_find_device() function returns a device with its reference
count incremented. The caller is responsible for calling put_device()
to release this reference when done. Fix this leak by adding the missing
put_device() call.

Found via static analysis.

Fixes: f68ba6912bd2 ("drm/tegra: dc: Link DC1 to DC0 on Tegra20")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a..6c84bd69b11f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3148,6 +3148,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 		dc->client.parent = &parent->client;
 
 		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
+		put_device(companion);
 	}
 
 	return 0;
-- 
2.39.5 (Apple Git-154)

