Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6183090EA
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829038; cv=none; b=KAQpNf0HuRDIjuwIS2hNv11YmCIQusuyWJsMciOlV8cQPR9cVqCAbEXHgME16tgwfJliNSjwSGNcSRem4S+R4NN2OjKAB/50cSY1AJvCeL9uFGovI1eQN46qCfMIKrd2AhJgsVlvNMMGInJATtyfugwvlfABDvMsjhxvHyCCmc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829038; c=relaxed/simple;
	bh=YvGQg0thiYAJim0fiKMQbCpji4LJk7ivjKm2DBhO1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSOgqVWoG5A83aPAwoHAf0Az8PWSPBJrSwuWN4uE7N5Usv2jYGfWBX4pk9YQBgBHjXZ9qc8LE/p00cv6+QjsLscqiq1uYu2S3JkGFhCto6KRmD778U0MHtwdp5whKLTs4EEQFSs1oAo63d7o8jXbItqDbrlh2/KRUV++YSIt4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GybVkWue; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GybVkWue"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7370698a8eso70836866b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829034; x=1765433834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=GybVkWueXXpjZSJADApAbtdwVaiuS9CNIBrVgAwpkJ32cMxRgcIvygdiYjkrLGQInU
         cFgL95YDsFQMAz+PF0gq1Ozk3vWjVvaAgTptjyNRKV0nMLiXssdOr9hsH65QnLugEVMp
         fSG18VXCFRTN1Fk8ADXnajt8CTe+UYm1Y1nv9tOhX2dyJDgfpkjdxQVluTsT8XHSiqMg
         XhM1UwRRo7OBjyEbpxpH2n0y5wKm+fLxxmKHqgPGVFcm2FoS86TBBRi2KZVHUubTrnKQ
         j1pQz/sODLzy5qX1sCElskn413ySYKhDNLxEQu0o/UNJcSNnsMur2AYTYLR+WcSzfEF7
         dxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829034; x=1765433834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=RfRwtn2j+sCfFOF+cZgM6Z7Tlje2jgY8m+ILxI4Ul6AZtmb873xVZCoSIrAF3cnA/S
         OK6tUldMt2xZxh6K0D8//0THGyT6M0yEyuMRIB9cq2+Y3YBAD4SfUOjXf9Hjjlh3Wquc
         mr/9ldnxHe67OU/RUyF1WDPp4ob0CgKW3/Wk03p5pG0+XwVASQDTy++Yn4mNY1JZ+Z9Q
         gLEtD7CZFUB521UzqeZTPJR2BQdKs/nl4Fm6QCugtQ+lqFgpHbt+vI3rTiGBFb2UzRoR
         S2HipuUux3tSEXA2Ug0l6vpWkJ9BxNFvwfZhBIDf5uDbxFL+22kdy2lvqMF3jv4zTTxr
         e8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXa48hsrp9xIZJ3KNPiU7ix0flNzNN/ddGVGqyDiCzhHQoqe3KsDcZBwSWI66cuxRQeYMUlOn7ra6/jaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvln3zH7K3CnPESbtISdWEZCVKCd1LBiWO4iF/7kziPQce0KfJ
	eSOq6F4FJBQA/dEOitltrTmWQBpuJGFU27Z9aniGTULShPfcyP/fcs8X
X-Gm-Gg: ASbGncuOYPGDFMz1GwHdnb9Cl7hMmF9O9AxGck+wRvcFeX6L12aJAo6J6Z3d09g0Bx3
	EntPHJg5hzrCf/5/gONkb4wRFrCG+q++a6REz2H8yCet3WODwhLYEam5IoxiMTMgjM27jn7U11H
	hqxgZ88IY6be32/6qcn9KLGLbT/UB+TE2eKpbHD+oANyF/cz9V06Uqfyov0rs44aYW2H/08DDzX
	TBcfwZwt4cfJb0YdyBx7GZijdABC9IyBJ/u+VQhBIFhpWtBbTJlDa7JQjbTjGvgVKYvpMPImEDg
	/ApzJYq0/H5W9D0yuf6bgV/iMqtpClBY0MlkGVd3hODpovqLiLsFZW2MslrSszlXNik9WbMqlRQ
	iBc0gV4rvmXabJWR5d/5db9M9HKM20cgSSeHXE2qPAIHX1cc+Ekueju0bDnTig+ramAS9FwSGvG
	I=
X-Google-Smtp-Source: AGHT+IG7eLUO/lnnllbPhbV5xWFj7aQXNW+5SwKDRXXpuxxlU1Kc0BYcXWXlKX7dj/KXGoOhGhU6rw==
X-Received: by 2002:a17:907:1b05:b0:b72:d9f1:75e5 with SMTP id a640c23a62f3a-b79dbe8d527mr523744066b.20.1764829033747;
        Wed, 03 Dec 2025 22:17:13 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function to the top of encoder enable
Date: Thu,  4 Dec 2025 08:17:01 +0200
Message-ID: <20251204061703.5579-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_dsi_prepare function performs hardware setup and should be
called before any register readings or there will be a risk of device
hangup on register access. To avoid this situation, tegra_dsi_prepare must
be called at the beginning of tegra_dsi_encoder_enable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 278bf2c85524..8e80c7efe8b4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	err = tegra_dsi_prepare(dsi);
+	if (err < 0) {
+		dev_err(dsi->dev, "failed to prepare: %d\n", err);
+		return;
+	}
+
 	/* If the bootloader enabled DSI it needs to be disabled
 	 * in order for the panel initialization commands to be
 	 * properly sent.
@@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (value & DSI_POWER_CONTROL_ENABLE)
 		tegra_dsi_disable(dsi);
 
-	err = tegra_dsi_prepare(dsi);
-	if (err < 0) {
-		dev_err(dsi->dev, "failed to prepare: %d\n", err);
-		return;
-	}
-
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.48.1

