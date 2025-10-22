Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAAC34C137
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142917; cv=none; b=mqGlNX/V7M4w634Ew+3M6WPozAGrX7a7ulXKTWjgnmqp6zVhGXFfhenj1AtHCDDYgEBxfjAzsIMhqHxTwsDrKiNCwycYilxAwxGLeHuRcIVTmLZ8i3gdox8d8UYVaYnig6lpcTFnhZZeRDhOifye6q0pkBZ2ks0L44laZBmN8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142917; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKYlImQp74ASz01kF5dw4bS93LlIb1vMwbnGHm/FVeqNLxRByKYHe9XMuN6pASghdX9MA7mxxd92QSjoBS8nf1Rm+ch2OcbZe0Xprk6VCcqQUs7jsAZ+WEkS5AvKdgsz2K5FzKFRdYzYZU+wpLwslGTtVfzoVjPbnOfS7gJZAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0iDgEC4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0iDgEC4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3889038f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142908; x=1761747708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=U0iDgEC4ll1KzUailgHGuGg2dvZyYCcri8Ik2xZvDn4/tK8FExWCzrToiAITWWja5V
         4jA3X4YERXMM9ose00DPofRZvynA0plLfBdirZ+SLHMXJDhxw038TC+K4JWDaExEV8fZ
         fE9zZoLkSlqs6q9fItnenRl5Yfz6XTV5qf3ZY1Hhfuk6ufYWP0V1hvxwFN207DqgjV7s
         FVrvLOEccT6+4RkEzP4SfokwquimM/ZnYXqIjE3zKrKNaaeAVprEYqS+0GdE/gFxgJd+
         YzSmsWK+zrVU2RpXgH8LYJ1C5rkqUWt4hgBjFrOyBIFg4rYhMu9vxk804vRtX4fXX5i+
         xbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142908; x=1761747708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=E7ZoeoXfWws3T+9HPg1bLWe4uRyk9mRe7pdSy2BKMZEdLe3R5fzb2pK13b5InEK5lr
         BxqrnsILd0Chj7Po8FaH3qV2AYViYqygCx9ot18S2cWZ+gN5TvpzZDcUgNPfw2v+XCuW
         vKNYoY92tNUc9Fby6naymCdPWiP+Ygc4l1jMXL3xVA2F9pSDEn9HDBbogC1r7awkJ94R
         WS1dRuiXYKY6I3G7zdNkyLbg6ZmZoiUmeKJ+cq9h1PexXjSoDxuU1fl0vm+AFEpLLrhl
         GYaAS3NiZa8mljPPh48CZBzwLEsDqBjPK8gaKeR6WEKbp5lVAKxwluykkRq0dIl+MFQT
         Zu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzjZfcBZeGjdiil2+7oDQYYmbixK0qj0oZWo3vG42m+RlmPJb2oYhD+K0diOPY6lMoupq3UT9RSkjl/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHSG9L9cY319RaG47D2qB3XzLEA7+c1x6mxWp/Qnehj/zgJfr
	INnRhcedTtc0ehBH4dqQk5PbGbA7KOQdsiFg95FlTgCeGR+ipLdZd06w
X-Gm-Gg: ASbGncu1LaDJHFsfxwjmH5pXjBGTHdzThCVsaDb6YlwJOqKH8CiBf74TGAJwpmYgSxK
	AmkoNrc94g3Pr7Ii6RqPgx6cl+YdSFhdKhkaYqAshZvN4BMYQoPfiHgrzeWGpSiajbXwIhZ1WFv
	fjtOZK6qYLZAHK6ApALeSE5riO7dBiHfho+kda1a1kF/bbFsK2IdvWvub+fgchrH5Mxekm4iGBf
	9gvi4N1GndzzTLUYvYMD1dvJY/VwhiV/dS4X8+moe3UU0lfQ+zyWR5gDYFjHRij31RFkntzuP2s
	yMA0t11Ooeh1vjSDqyGQnGqqChi7MVtB9hYmQZcXnJWfFgixbZa8W2GFsJ9Bfoo37BSGUOUNqC/
	mDfvYh8n1ZebGAPtgepugOAE9N64Y1aRmui4bMgllw4BVb3++/mRjCBt2q481TXIIlhDD42+5c8
	/7xg==
X-Google-Smtp-Source: AGHT+IFq9V87Zw7qGeTmSRrPB3JwZR7jtskG/uf8ikZdxsnRyJSInvVy1UaH8yLg4G5ahmvQ9XgogQ==
X-Received: by 2002:a05:6000:186f:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42704d7eb23mr14938377f8f.12.1761142908345;
        Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
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
Subject: [PATCH v5 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed, 22 Oct 2025 17:20:42 +0300
Message-ID: <20251022142051.70400-15-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

