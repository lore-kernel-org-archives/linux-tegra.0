Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644AF34D4F8
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142905; cv=none; b=O12ZfcyRngxi7DdO7UEzW9ccdcNvdjD5oeL3dWoXBucofJ8VSB1aT+XnxVLe2/cnkoFXmHP9mDhShWikO5dkr+wxYOtPv3c18/5WcdSD8bcRhd+Ef49ikI8vuUPBhya4TFHrzfPPN0Oxp6sbyU0xv7xhaqdLI7MnE9eBAlRoxXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142905; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDBv6WumDjqvfwzEVcphvxXPZiX4kCqAyrm6ON0dZyK8Xcu7Bk21LafsU365JOOKllK7YqdetuktG6dXl5O4ngA2pw0gZOptxWwukwF+uiySj39hJ0Pi9LrM8rh/GnSPQnmdxRwR6KZqgwiFRCOU/g6H6l2VnUeOvP5SnV5gWIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT3YQ9Gc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT3YQ9Gc"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42701aa714aso4192537f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142897; x=1761747697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=lT3YQ9GcruPN+lVPATeN+AeMLQ9HuT9T3lRtwrQTTtpiAeeEyeDgV11dPEy+lRdIcs
         dB5tdNavAiXbZusN/vPISKlN5VA9I518xHEukkRh0vgyCi8IFuQXi8K+SOlMcFTjBWrh
         TuOUkuige4UxvD7CENUTFhOSd5Pdm/zkgm/PdoVZBp2m9B/6C3I/j/VaUEFuJaP00gpF
         +NN4xmNSBd/c+vnntwWQd7d5ad6s9gz48KKsI0t9b6Ij790/47VBssEdqoXIblxrG36H
         BI/+SsVzrIEsSVg8j61Aqgjd+6oXP6WLSWwW/aRZayFaQ9CTWhjXQtSaa7S5J2EXAXvd
         L7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142897; x=1761747697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=piIGf2/baDM8FGqePZx0GeHq18GZJRxDXFshlavztxx5U0h1bmCloCqDbxgx7i5ZF7
         oqLtJL/gRioG10vR88zfs9bgWzzb4QBuTp+lVHxmDFz/469JjEYDeqLmd7XZmuoGkd7G
         e/mJ6EwM9cYMFYC+vf5k+igb98E9GoTIxvv1s9SGpxf3HtPuce43/0AuQUAbVsiafUFe
         Enq49vRBYkzOGzwWJovUHsZyYqUi94puR9Jw8g/QISiTzk1ttnOOOpqjznuF36CFkACQ
         34zLyiOmeEslsiVRJJdvZoi6uJj55unCt7KtbYNLt7mNE5s8KhHOEJI2Rl/ciSSNfgMz
         XWZA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4cxPtMczI4GxO20QMetJHTfMbOYHw1R4Bm8b7FUen2jKOyC48+RZoRhSP6QZZJQUFUuy3GHaJ7EsJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZpW4vSe0VjPNk+QAriChsXGdoLzDquZlb0sLTY5jeopItoXR
	A/wERs84RyiepWTl9Uwa8w47rfvDyedO17NFo2l3k/mc46Y8Yd3jgSz+
X-Gm-Gg: ASbGncs1KCb03cKGu3wLwjB8UsXqdv7Tp6AQPE8Gj9Su2WfE/ZHdzOO/RoqGg8tUm3v
	hynQLSVjc0eLF/zLwpeaoofDYV35VWntN+kz3x7ML4AxKCWUgvXkRxNi7pTCjMOYYBfLnZTytFn
	kNRu3C9RBeozZfBBjHu1XVDi88BY7K8lq+AxwgT1rFo/kpUQYfLYlhALVY6PzEPi5tZQ5lJXWGP
	94h10w3Iwq7gcdKH6cy0bXjkuIo46WBRQXmo53NImmzMWalHl1EgkSP6+pbJOzKqz7RoymgAG1P
	zTSxMUlnuUBcADMA66t2khzLB3rV+6209hSnaecHDaZ+BatK9n15f8bnZp8JN9zloTJRoCkW6Hd
	zgFlP7+wvagflFd5RwqMy9YUix7/8gwqFKq3fGIsoCB6iS3iS7lctujegk2/1E28KVp9NWwP2Q5
	Hw+g==
X-Google-Smtp-Source: AGHT+IEQ89eeh/r2+ipRz7waSS8oqSfLxP7wC0ZsoklWA5VZX65aruo6BpxwArM9GCWrpFvdCs8Ryw==
X-Received: by 2002:a05:6000:2308:b0:428:55c3:cea8 with SMTP id ffacd0b85a97d-42855c3d365mr1542726f8f.50.1761142897063;
        Wed, 22 Oct 2025 07:21:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:36 -0700 (PDT)
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
Subject: [PATCH v5 08/23] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed, 22 Oct 2025 17:20:36 +0300
Message-ID: <20251022142051.70400-9-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

