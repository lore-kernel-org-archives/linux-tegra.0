Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357CF34FF53
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142921; cv=none; b=GI7LGPqUSCtXLrYp8t70u64rq8sCHrj5rcIVee1t2CEl08j1xBLbXNPxZkKl1nG5X48oaR8pHi+GHJ9uZGkqZ4pePkOKRAvBVBY4ZdhKTF3I1HtQ/kdLl2MjIcHHdVgWiHvqlez3Zo4T2bxOH7z8GvlDwpLvHO4eQcJy9XsvVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142921; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKdKHuphOUOyu3HdrasLmmSyKhASMSgKesXFWk8Zg8+2Vsfoub3KlqMM364KMFMA2qYkm66lumWI2Xsu+Fiq4f/9DZEXgdZ/auCN5F37pHl6gb8Iyn4DCf5VROBoSvI63cIckxclJVclpXsy1VqSa4YGfi/e23zKTEN8Szh6sYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYXZiVV+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYXZiVV+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso3182504f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142914; x=1761747714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=hYXZiVV+NzC/JWaAHkyCwNcer5ruwq1gcoFh+6avL7XUhe8n45TZnlY/mQ8FvXhbYA
         lXt+DD/etB3MZv2gqG6R+inWhzJ6XRSlk9BnHuEYZR7usExKaT5zuii9JnVMJnOaVSsM
         mPnIa9jW3mx4B83CVlyxIwaE26GagxUHfJbQ14K02msYBfNow7xxrd055DOygP+t7/hk
         p7+uWgfihLdmY8+rqSjk3ZNMxRfcMLoPeEfcB45AHVcrQxw3wKirzY0gczw6uUGCpbj9
         Izh6i0RQAMdyLKN8cXds4YsPpd1sK7yHj/ipOE1+ChL9eXVPwsidHO6O6Wn2qpzFge7R
         V5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142914; x=1761747714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=u0Txg1Y5B9Vi2jm/qhqVAdPKf4MgtuO1MiTEzoiSWRfVgCNRgux7FrF0zXQkcZmNuz
         DZ2zGWylhjuy+z6/XcEBU89/EGYNX51jhCau9URQP+J/ygNNa/hyunaum/lYJBSgF78A
         jlU9zTODn6RvO9QFkCgHJlW2YpkBH7+jZMpfN54EDtKOVtGG9QAEhDEzfYlwIqyqO28W
         Mppd6K+lrdq5SeAxSjFUe1LkySvVxCI7fk5XT1oBw4Ae3kAKJhzImtk2/DiH2X1G9t9L
         VBShyBBaaNsl6NV0I89S5ai4UEUFD8GxsX4VnWa8E3viCgREEl2Uw+AIDESfJiHCE+Nw
         MCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNViv/XEkuLPqhNBg61MDcJ4FYl6U+gwwym/BUfkxDuxEOCzArpP2CJsIDjqCdn3+r+kV12O7G+AoirQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2Vd5n+wM9DRi3yV4yINYcakUia6z6IgJ0yrmS3bb5wpWkllO
	q2XNLynX+xIiUiof2JJvrlTwTHoO2eBVuXDPtP2/tWAlmcRBtQcIFlQL
X-Gm-Gg: ASbGncvB4CDGoFuoKi3U51ChYOyXG/D0ujSJWphdjhBgfJB9qlqMEbtjtL4V+qwiJvB
	wa1if5W16HOt7bHYmgPRsTQHOgIQjxv/S0Zj4r9t87NvwIfKHe864BhV9ZzQkYpvmtqYFc4pU1c
	M135+sQbd2t3AZKSwcAkcAYN1xXq1y4Gsj+1djKbjnKAGLxKWbamXO+a6+ZwNafYwdtNo0XAmEI
	GUlAn1EsszQcYNNRXQ5hCrYn6Vo5GgH2BUJTSNmVvfb2BZYODE0W7ZTPvZeou4IKThddJ5dBI4B
	H4B9jQkK/hj/IpEMsRv5dQ20BchwkPzYLZfsAzX1LuYWjlJTRTri8uPSPIp6r24wIsKfPigcejH
	+J8Ro7py+ekEOE13lQooJqzorlr/4v2QvB5LioIf54Tm35bKIfKzTPbTS2ByUWDMlUTJKlZE6ck
	2AIw==
X-Google-Smtp-Source: AGHT+IGVyh/0Lq21fHxZjLwl88/dShL76QWY1ZVpGVbU3hFOea3guFlvCdv+uCzmXqru7Kjn7g1lZA==
X-Received: by 2002:a05:6000:612:b0:426:dbee:3d06 with SMTP id ffacd0b85a97d-42704d55398mr14180974f8f.22.1761142913609;
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 17/23] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed, 22 Oct 2025 17:20:45 +0300
Message-ID: <20251022142051.70400-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

