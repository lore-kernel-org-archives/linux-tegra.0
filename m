Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E313803E7
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417813; cv=none; b=Pq1sG2l9gS4jQmn5uCWBliWoIqB3zW7gTzEs165pDUJUCsSpYjixz1XpnH5kYbOYMsM+/yEgaE1xKOQJ7k3xpNr5Vwhxwr9XMVqcozxsm5OYWzzXBoNOyFRBz5MxLb59RvFeervyd2j3HE95L/YThckPeoX3FlvVX0WzRD2BKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417813; c=relaxed/simple;
	bh=EhmF3j+M4AduWGCg7EqLVWPIxAwmTTCxT2Gz0yXqaxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zse90nhvlfAMYXB3BnCewbegGIXzpWLETFP1sBEMvw+PyuSKl4jiO7Y9//pgY64/iGDMrq6JDB1CUSFB4TFhtoZDLBNIaqxdWehJUmgZLL19tB4kSeBS9kWafp4aByXWndNDVIO205uKHwFulE+J9mKN051h9J/VQKoCSCsLSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSRNm0Un; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSRNm0Un"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7183135e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417810; x=1785022610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=DSRNm0UnpdKO1pbpdDw4uOVfg/zYafz0PCJCpAnsnhVZITB8v6XSABQodNL+sehwWy
         YLnDiSclQhajkd7cGIEz41d8cmCMOu1+XPZhPADxLvCewJWh6NRGgpSn967iPOlAbulh
         dJMpzyjwGN897E34nWoHX/cTyXRaYfWkj76tCsOCZpi5R3FhX5L7+eLgDW+R7ZgMgI8G
         B/efzJOhW0C81oH4Fl/FognDifTF6peZQKNbCyC8lEXl2mOCBQKTZQREnwjlyUDehHka
         QzJMGfdCePgjfR6ihNZVZMqbu0LYoT7IVTvOSvGrN4NVZCuQjRYCTU0VtNuAJtzGMUJf
         3rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417810; x=1785022610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=fmJ3UpEQ0cyhTitJx56lKh6i7DPT2KnraSjDyu/eOokYK7nLN6BN4QBi2D8j7oY7Zo
         yKHUN+SrMHml5+YjZ3NqBL7ap1dNTAXe5Na455xkwGk1c04VvfMGgmM17UYwloLXoY2W
         WbxebQNscvqzJFQazbaBSd2MnVR7lhORiHKYGoBLcx74wiWNNAyGR8blc64wPuDr2kSq
         S/jyRM3ce6Uhp9S/uOzKGHEyxKLFnPurdHbvGSpATR0ze0u4Scg6MHD3En+NEVf6fAZy
         ancg3LjeWI66ZOAPa53PPJ8vosygm/FqS+w6N84vSrYaiZIXldxaDUvd9pHMsawXiis1
         muQw==
X-Forwarded-Encrypted: i=1; AHgh+RrQ/htYxhYJ4XLIntLEbm+RVvo4LpE/R0ORpVIRJy4dwLJE0aTFOJzmprymTHq10mfYQXdxDvvTsmRrEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+70jhzUM/dbnXo5ECxD0NhMtGyVmgK5sCP+KNdj7J+eoo9aTI
	TsBXVnEkkwf8b/7xfS61Fl6PtTnNh/+JCOhuTUrtnUxqOroxIfnyHoxH
X-Gm-Gg: AfdE7ckpwZrljiHbWXyglSpFu2PA2X+Itf2w0ibCkKcOhupjgI9PZOLxGt9CyRDPWXF
	nSYVxFX4fMNI98hlD1mTM5szclqkGVwc8NjCOw5LAinS/N2wixo2TFwJgc2Wzts0j4CME4MrCEb
	hJtz9gGwe8kknnkgP3B7XcjW9vbFTWGq9GChjDD56UEIapDkgKaSKavDHDZoKByD7CXH/WfrUVF
	LWOb2omWICBoT8rnc1cdfh1oFa0QszuHO8UdmM8cYDXGxJLLOYjqxu+Ru5NctvG0FVfkXJvvNlu
	Zjj4SbfBOaCeCSCX4zUQVHZKOldV5Tl6rzbCx2nq4kZ7JtLyDP9DR5YDQGJIt+RtPbC7B8RJudo
	hx/zbaFYQ5Nd0qBFB3VKxVM4b4IanjjwMpBVUwlRb7TnLgFG6IKfurT8zCsn8ermQD6I6WTYQe7
	16buzmkk/yKw==
X-Received: by 2002:a05:600c:3b28:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4954a3f36b6mr89247115e9.10.1784417809642;
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:46 +0200
Subject: [PATCH 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-15-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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

