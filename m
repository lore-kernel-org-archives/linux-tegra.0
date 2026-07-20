Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36343846C
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562107; cv=none; b=ZwMGFK76zR+TWR9uDJUF4D3aZJjRR9sAAMSVKB8n7W4rqqf/JiVfmXTAZ9zF8qZdiv/IeEp4wH+GKoutNAlprsPLjMzfqeYDxZypjUOFAHbqBzKPRD4WvBYwrn1x0i2+6c0+lfGYA7MzfMQjsmNprDyvKLHfd7JZLWiMODHu6cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562107; c=relaxed/simple;
	bh=EhmF3j+M4AduWGCg7EqLVWPIxAwmTTCxT2Gz0yXqaxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scvsGOFWCsRUDu/gD+tllTspY5Zhs4BG6k4hXzAz3DQMoHdIZmW83DMAuUQmACkCfgaGlPARKhAdUmknzUNEtpGFFTGOsYAhyZt2bOyhJR1ox6SmutqFDJX2tFyMCmlXwmQ81rI5Is1oxxBXa8Fr6ynsspPrZHyIsQRAy07v7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3D/Gzzg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3D/Gzzg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f633e6058so2900817f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562104; x=1785166904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=K3D/Gzzg+DgwpeE6nhV/L26cQNnwefMDgGkbnZCmXDGSVz+9rlelZDlGwMPzQF5hX9
         rSVwXNeY6uGISdebBs6PlCjJVMmvyKLdIldiNa71ZVMO3fBxJypUhLgtcI9znFEZRgfL
         GcxsINcNRGbsrMxuK80iPk+SRQ/lIYOlQL/UuJ3nycyVD1uIduQiSAZbboa1WDM10QBk
         PBAY1E5mPpzyUBJVAwbAjB0Ex8SLkcGUMQaArIO/oYeTftJOMvub99ypqdJq5On4B5MY
         zdO+gKaiz1CjwH9JXA1r/HHu5NNslcxgQvQqo9XRBxKoyNavg+zi1ld8Tns104hF8dpc
         9TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562104; x=1785166904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=dC8rpoaRCYnQZXSTHCLoR3GKPd24gPcO4wSFwTM8DLgOBOedKgbqHMu2NuBL6CbUcE
         qeO8se64wAKjYd1NJ8QU6wCtH4HadVRpF5y8n3GV8RXK/Oqxd7iDqQyh6kmQXc0PV0zt
         KMFpCFNf+I601GbRwCvTA8lGC7HC1Qm5jikRxBzsE1BvCOw+R57YdMyda3sd4EaXNhzr
         RCJ+LK6FtpZnOg8p33TUCaLTUeg37Vx6iB6fHqxRBO8JcbeSR8LTpQ+T/4EFdy63VB4Z
         +Lwu/p8iOmz/lLkAt1gx6l/V1CQY4U2kafYsuVO86P2Ys2dYCJGVNlZ87C+ALVldg1AZ
         bDaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMcxJ4aYjJsp2MeaQ1GHG1AVh3GVbd7svoP8JQeAQlYFuZEwsE/ovTRiAh486tIBSZaB6wdV9X4jXRBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXyuFyqcPmCD5NhvUxdRzvb9Mrg0EHUnq9mxPAVDHZHZ7QrWaf
	xTxVZMcN9dCYTSKHG85CD5r5qPiVv/Akzd0yEAFjHIttJQ+lGcOXIvGo
X-Gm-Gg: AR+sD10ylCD7fgmGV3L5g4uSJFyPfcaCRIofgqu3wfWzLChafEGKYaaHlyQLPR8dIeV
	aZmdYM0PHCOb25BnA3p05oi7CA5Mw4U4jqKr6oI1gHhRMGN5qM+LjIer2PA4iU/C8WNgBx62YdP
	qh8tlTLHuZB//gfzEj173PHavsuA8+x43rcuuRpM13VW6XetVVhTZZ+AcV/+pUeI+jzsUYO2coh
	N1aA5iTblCqxFcglEOtj/OImo5SYQhyAW01Q67sZgE2X0WTpKCaVKIRH7n3WQc0REhAcRSbIX71
	Ogtg+UD1fCY1X+TmFDvEg3lt8cY7zEUctRBFK9d8ssD8uUNVaZhhKRKI+OtDzAQ9Tt0BVjqbQSS
	csTeeEykpMZt4Ky5ui0stYRcGYSVebrGGtwcKTgggbKFvHYTv+L4EuVAy7lJfUFZyqlcOmMSTTz
	/CohZxYnNjjA==
X-Received: by 2002:a5d:584f:0:b0:47f:6d57:5a93 with SMTP id ffacd0b85a97d-47f6d575ccbmr10955450f8f.38.1784562103442;
        Mon, 20 Jul 2026 08:41:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:42 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:47 +0200
Subject: [PATCH v2 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0

