Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E72F549B
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912128; cv=none; b=HyhLandA+4+y/WzxnD3neL1t6krk7ZKpm0SNyQwlztgkvzN/bsBEFEV5gbV6nKLvRb3qitrUbkrGcKkgmiEDfKFrVGmxEI7+ABK4oInp+GnwmHZaxMQuBczZd7zSydfQIUUySWwDVSEZEDb6NUMx5Vt4Hdgfb7DD7j7GXzrlNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912128; c=relaxed/simple;
	bh=459dlBPh3LInR8NOH/R4UDIusnkt1kveYPqleYn7ivo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4hlZCCLXlBizOrFqIA11X8XWMbCWrk27RncEF+NEp0f43zgsjS30LIsZFxUF9QfmUrXrBUEHZJtbWS4PsmObDyAY2fji/pmDTCiLEdu/xwAzLmvyy7XnbexQxoOwvCA+5rCrGHMy0Ll8xCdHl1QtFepvmUjhw+re8rP1RC9y64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNamjMSs; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNamjMSs"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so7637322e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759912125; x=1760516925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=CNamjMSskz2tjeJ/vmcamCS9JyZhTI1/90TkBgpTF/FbLDfWxGGjhRkePIcR9ZLEFm
         a9S4HjyPq8WREyz9qzGT5yvAUKzAklgkLjrkY/l7lDhYyKTtRcuVTMwznHZ/w2dWdppy
         huk1eJ1QutP7ObBlIW/chf32lp17Z77Evl3R50BxAk9IPjckiBsHFl16EYjHULzX7BLP
         HFG2SsTEb63r4q0Ot+RRZNWYP9ftXwkn3TU4S8UL8ruMO9aIEuz+uVaM8OqeEP/S9hjV
         LenphnZ7n2a/LZ19cnBDNvgiiI4bDNUBC4nPGN8jqLQ8savB8isqBSAthJ5tEN9+Xtkj
         asbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912125; x=1760516925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=wRgjrvaH6I9fNUNg5neQ9Hjy1Yl6fL+481v+5QnhruX1h3uv2B6JIDbcOE4F0nv2/X
         F5IGKL1kZnteAh4ETEcGNaGcHAxwnq8cD9PxrJoIMicYsBFQ8n0iFHC8YBQqa8l4k144
         u/6EmTfUlyTFOiwkPjPOmFpmiDB/81J7susIuys/YG1wI1eQbIQYEZQ3wgG0AntsLSkS
         dcDN/FHp7XKXVHalRWiY7gKHJuL5/E21WzgBc9/fK53t3vwLiCnLbj5dKwBaRPon9jDA
         8JA+k0dP1HyTvnAb7fy+VXetHhCTy+F3QjddmWk58dujnFMxrQtY7H28jZxF3oAYVZ9c
         QG1w==
X-Forwarded-Encrypted: i=1; AJvYcCXX0oAJVIP1/qmjxJ0vKvN1FNrMCvuGRGGE+LzrtwoaUTpiH//ie/7MqKye45RETYlaYhTpXIot7u+skA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVnA92gzbVWo0q/Cp7B0Ao8ArpW/D6XqMPx/Gg8PRwh6bq4qm
	9n45jzFaQggM8Y7p/+g5rumEf5bbGBy0Ta/+B7ynigN1Fkp6Ljq+vxps
X-Gm-Gg: ASbGncvrWJPg5i8mXJcVSDEvWrucIrUsaQMAukV0qiL4GAe9EnSDcfNqmAMjFgeG+bY
	EVIM/fgTw/6dycYaX1lD3A5KcLYcypRMgRBs1bpED63m1c1n7I6TE/sS/mwHgUpQ5ziBNicROrA
	vL6PstlTWQGVA3yP2p2JTrrR6C7VDOcUj2pWmlfwfa2sU4+8LYsM3LVQKH0CfUwrPrfTKVLVG3F
	3E1KNbJMHbqLNGI+vwDJHCRPjtSZTN1hbV3mGZR2pHCc1mdRo+jwEMUyySf92+rgtKS9DQUETe9
	iwmY6J9mebaBC6Gj0h6+UdLGnWvr3tahSN5pBgC6Y5Hfrena3WpyisUTb+D+qFqHoZl/yUJ7efG
	Z2y1uyi7ksb6KjOlNtiLG17616KPDIW4AG6h09v3/mpqhloWm
X-Google-Smtp-Source: AGHT+IFa+YtfJMOLVgx9lbRcqni2sMY7RFAYwacszca3hFSUXsWvoDDOW8OhRY3egEaihLqXRjLDDg==
X-Received: by 2002:a05:6512:12d1:b0:58b:2b8:f8d0 with SMTP id 2adb3069b0e04-5906de90442mr620072e87.55.1759912124568;
        Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v2 6/7] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
Date: Wed,  8 Oct 2025 11:27:58 +0300
Message-ID: <20251008082800.67718-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
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

