Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E22FF658
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766136; cv=none; b=LOM9ILXyp4eQUYzv2XjQuTM5HOX/POXWeykFv3mpThtuXpwfSxeyFwXDwBit4ZIN1kppb9IzBcpxJy4QgleQn//aaP2jCrqTWVQkUpr2Af+o0otObzI50OzGIgZ8V7nuUNHok/jjk9+YC+3EFOufhYE9vVxQ0xyb0x3DBb6o7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766136; c=relaxed/simple;
	bh=459dlBPh3LInR8NOH/R4UDIusnkt1kveYPqleYn7ivo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHFBoTT3+KNMTTnb4+1VNMldG1waumXLX123LEv3MQMm0/OA3tlnkmXN6wD3SEg54mxs60Z+Yqh2sLnnyKEfx2Wtry/56GEGjX/3LIEoL0jnDFTQmIN+9/heFIAB+w8zk2WWYg90rvkoLQiwZKUYvVBydAs22RDYxjlnWqrwQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9PhwnKG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9PhwnKG"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59428d2d975so2830337e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766131; x=1763370931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=h9PhwnKGqK8eooZcjVt/bP7w6Cn6tMOMKltrRTOCBsqSMihDpCO7i+p5CmMJEKwIEo
         GMRuBjNes1OTTMqzCKHrTzvpPGMQV6pM7iqHSz+OFVGM69ofKmN8X3en7h3yylfP8aZA
         q+xSihJy2i6+3o8Ka9Um1HYQc34ZG5a74HAnRccoZjrzyBH/M19GuSTzvrkbAQCdJMPP
         diZ04qk4v67Rrumj5qLL4tgyGaSy8WnHHVJji7pVkM0oRwCYvchPYya0UaejVuXznWmY
         8SLKML3xlQdqqq35f2RtrUx81qmSnd4bd5+aMWrqVR8MGOPWSzwayDfsXep3YUokYGfx
         Fm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766131; x=1763370931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=HUAuSegTEhQ452qoh6xyoufJTSgfqo88pAa0iBYXqiRJSrfayep1JFpJM+H19sJHCs
         +XH29NhzRzk8C8fpG0JYNsi21LzH6xxdaVNvYA3VSuUrd1xWZkTnCuXsa78D6BcLTKVn
         tYJTqe8nxwMimyRbU3d5cF6nfKUgo1L/45zYf1bw50wGFZ/fEoUpKTkm9JQHIAEW6Ym0
         yJtiVUwMzJ+d4RfxXQxUcTQkXbBawYqdQdXYTnjYx7SUzGDRcOTbcw04Oo61Aeeb8jkB
         nxmk86+qP5250mmbpRM/elyBGJiw6kWreOy0h3LGxbXz7Q9LlSmJ8GVPkceVT9idd5i9
         4yQw==
X-Forwarded-Encrypted: i=1; AJvYcCWssGlI51kp8v82uKpsKex5HPExeN2Fo8HcH1Ih+pvR/myXIzK57KeaE/6MiG1Q5Ymy2U+Y4w2sRemspw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Off4FBEHEW8L+dIplEeE8An2Y4CciNP/DzUsP+p6Koz7a8Ce
	k1JBTzMOVxFM6/mwslic2BeSYbVjJCkQRHtSkREwT2Hvfk5rfABtfw2y
X-Gm-Gg: ASbGncvFKdusiiHn5odqtlM4RbZEgbmmkXdzGmUdd9KGoPS7leW5XRURYxW1eLNv7Eg
	0TEtuUo/FzHLL0zizDPUjQCoUkWQW7uDDbeG7VDyzmFr1c2LZ6F/c6FcC/YYQE7gCO593jgf9XE
	bdKi3M89zer6wd5662UWoF1xsRVILJIFcBpJEx+Xp2+CTXHJbYO8kLKgQiUWgyibcXv221i06SJ
	+kuAiql5xTiymrUcZ+n9AoThfmnZA/A5GRNynZYBN4ZqEbRlagZpdGymcwXbEzDHBrSgArz72Ld
	enUdfpgvbzI0SK1Bg3pwEh09862URCZNvxnrbDZTtSj0h57GiyJyqGe9PMAw8bhINfZNJBlRPSU
	RRZo+xuZ6COwNtyAgUdaYySfMgth/JpBMK45AxQArDsE5ETktR0/3wTYHQjrVuxD5
X-Google-Smtp-Source: AGHT+IGz/i0ncWwddIJ+2HVNMQhgm/XQg8Srr9UXcEYDpRdQ63zZfLAICmPWS4NS9Y2VhpYWQE8GAw==
X-Received: by 2002:a05:6512:158c:b0:594:341a:ab1e with SMTP id 2adb3069b0e04-5945f1b74afmr2232518e87.31.1762766130847;
        Mon, 10 Nov 2025 01:15:30 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/7 RESEND] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
Date: Mon, 10 Nov 2025 11:14:36 +0200
Message-ID: <20251110091440.5251-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung LTL106HL02 is a simple DSI which requires only a power supply and
an optional reset gpio.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9f1e76a810c..01ac0af0e299 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -52,6 +52,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung ltl106hl02 10.6" Full HD TFT LCD panel
+      - samsung,ltl106hl02-001
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-- 
2.48.1

