Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A430BF66
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828423; cv=none; b=XaDfwTyobSIxIYWtYU5q7Pm/pv+WCFhx5p0lgfdg0/eIbXGpNZZdBODbnty2z/F7v8e3afNxyggTE3eQdXGT1NrWdKihK2FhvKpJciAY0r6jcsMUXem3OCm09IWQtHqeN+5lOXp0wFxsBxLFqiQ+24z/77dHOXXxP3oN9Ayzox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828423; c=relaxed/simple;
	bh=459dlBPh3LInR8NOH/R4UDIusnkt1kveYPqleYn7ivo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQ65oL27PdZoGaFBBHRUUvQXIqd9qwZfNbQbaEqT/dLi4fgGOxmS3ybZwVY6Sv6oUkfPOcXN68XlZTg0+MNYTsPUvWH6htHBKp6ip9R4lUhs81qtbg0LlZ2t5PojN3FIsTRAjNs1w77BQPxiVNJETNWNGbdTXujj37cXZYa09SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZEkKPyk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZEkKPyk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so694178a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828418; x=1765433218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=AZEkKPykXBYKowsUpJ0XQ5e+DTgecaBXRz7spBAzpKQ6JjGDtL+OUOWu6JaEGQdxrF
         t8z9ju0ZD8J1GKsNXV3pKyj4kmdNIqnN1TazFcuODyk21V02VmEtrhbhJp5+BJalg7T7
         jwiKVnL2QH3yIvVz3cf+eoY9mHVuJeIm19RN5iqwNEeT+ISoP7h06wr6KSrZ0AEWM2kO
         5qYiCQsBE9nPQ8V5UfeNMorQS9ENmKaplATDe801ZAg/CZx1Hya0YygJb9gAXU0y3sBp
         rGtEusr1R9Apg21ZPEOWrPwESQzNfp0/1MHTGYZ5B1+xyaW2QFkR2RtrI9rBFGPoc3V1
         /haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828418; x=1765433218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=owwt0YD9ubPlc02zQc00HRUUod+sk6TqXqEVID7SJyvqB6LBANu0WV3oPuCebCVtNU
         yL6DzeCtL823RtXnbWJi9KWursmpMyoJlJUsx8HeA4uhzU2iQKfEsCUDATWhQeAF2m9j
         xyEsuFlGqEAzDxvlE0oQBRNpySjks9N59O8VNVvqzFWIhF11ov65mRiwemDsItgKVDhH
         YbSe8NN53VOGx4KrHZKtpBWyhctQNd0bUwyS97jxB948iFQ7MHY7d4ruTkR5jgq2evHg
         W3aamWEM5yB2sFeWz6CM4q5Z6enl0D+vzjRDpDy/t0YDSvrzMqQNkQr3hvkw3nJXjW/Y
         /7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJSWcURy3rdII0HFQIpmfxoLFlQgeGE5R2SiTIBmfFaUjvaXD4JYRSLTYr216wIsiOcEIt20y0LLKxZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8HmOpULC8CGf4iuy/S8IXCEtTWcycswggZBwZ41uMKgA6mHB
	I7mPTgZpvYuqHoSz/XDgnR7ZAwuTteu4oUIvJ8DIOcQ+f2rZjCPWb/yV
X-Gm-Gg: ASbGncusAOfB0Vv8x+QyP3zI4OYspTvMKj2SQKknsZbVxrTxuz3ZbvrQbsSchBAPbFr
	LxZIxYJejkXKzhfGWjtjFEuG9Dx5gU4/1aUqHqai+3+Wf89qKEIC5UY34ySE8/4+8Lz5sP51VXC
	Xu8rk/wD4lyF7dUOUc9lQm2YC7JmEyUrf0XCJm1oBYwnbM/k5oTtiEBS5OESBoSzVDEaoLPRFYl
	RimAqJh65C1GbfWsm36zcsK+lgnH3w6zvoTqOYwLFysw5oiC0FCrtC2awNoU1oCFYZf1XFFT3sn
	DMGJ5nwg/yZsbLbMJnX0fc4TauGmIfBvlAnv5vXPvZEY81sA5yXjUNjxUihqrUGZWNs/Wr60z5S
	Qk3FTak0pj0ptjB6a/QGZC+qwvOsIgHP9fLzFw2o0LZDdeuKVXTXQm9a42OKn4d3u+McSwE7kIj
	0=
X-Google-Smtp-Source: AGHT+IGXflP92wBX3QY5yGh88FcTws5u5X6jjlfnKknX5OJZU/5ArSGnkpWD3xgTqzGaHgNugxHWww==
X-Received: by 2002:a05:6402:2110:b0:640:b06f:87ca with SMTP id 4fb4d7f45d1cf-6479c471f5bmr4545828a12.6.1764828418360;
        Wed, 03 Dec 2025 22:06:58 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Date: Thu,  4 Dec 2025 08:06:22 +0200
Message-ID: <20251204060627.4727-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

