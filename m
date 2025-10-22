Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37634CFB5
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142901; cv=none; b=OC2ImTq5xv4fXqKbgdXMBhqP29iyo3b6RVwFfdShGzgz/7mwGTg+VYq90a6gfjqPw8YaHq1CXNokyR0DJ0TgN5xPg7hjDr5WUQwWEsdmVjAWRxovhliVhUT7KdZQZRIn8Knh2pEBAQvfjOUL2tHQFATzM7QOqxevzR/2W5Z3Ro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142901; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFjXB4/wMRrtZPTBAFhLR97UVahFsRLd8+EKYCrNA566pnKvkLwqjynZxZxKRkGc4VjZNXk4+AS8JV658hd9BtPWZYDy4Hjvo16vCQr+lKLjsPNiDa2j4iY64RFVnmH6TYsp8xWo4c1GMMuPm2AeUsjMxEPbRTf6ri1WIcjoYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UucIpg2n; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UucIpg2n"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so65859825e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142895; x=1761747695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=UucIpg2njXrElxJXn0QVRH13QlN1mvRoiWg0ERm3uZvdhE50xg5vLmw3mwWc3qdkcp
         WjqWpoE0C3UDFjRfOuMJ3Kcek05+mnxMAuVWw3EwVEOMx0vRm+lRuk+zfxlTMsLsrxTB
         P77z2S1TPqGH/CAH60uPaRBO6QrbIi3e2CV1XXiRE8ug2ZABlinb1BMlLFE+KP8mpPMY
         nuSqvCckxpnXWdzgOHrkI6q42+NtqQReoIWMrWdcp/2vGf4+PKGVH4f2/HG2TXpDmA6z
         aq49WcEjPYH/9QzJdcshTXkIVN5GJZg4VB6lHuYFQKf4a/aJjIfZb69Gy77RDP3gybA8
         o/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142895; x=1761747695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=UbT2aTE33rFO2KmbWKfhQILAXwJAE/ZvD9BNiO4kTvV2Qu0uzSTwaioXa6V0IoZINx
         9Z3SNkCQc/5KreRUi7mx6L+gIvUtecAVt9ZOQhngnJsF30QQBhZ6Kd9WBF8v13wTp9yz
         WW5naVjL/oBuxMbWWRsZzAOO8uEP0Vuo21igILF72mKd8omul2fgjAwLy8+2evUPin2V
         AKV2ODHv9qT1kwRnGaLdaK4QEiEdn25/8nbyqMacsgtvUfnaLRclGHEeC/ubJA0oX7J8
         +WRozLEh96/hpZN4C7BpL+Kugy6DiHguH73SyMLq0EcXjrnD6UGpJex3eBg17YB4i7WL
         dg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU43eU4279YqBdV+wRnEKPO9YWbhe3twvFVTY6katOlYR+82kXeIf84pGfZG4O3dws3mXL1lJrGTGHpHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0SFG1uVeTd24T7f3DgEIdoQfGXzMrxNUAZysnicTh+q0TmHY
	2/fdwIexixq53/4BE/D6hy9chxPkHOYkEvHt2zCKvFz4DRx9vfRyHXiU
X-Gm-Gg: ASbGncvNQE2wxzpxrD8sR/PfmdA7SW+seiFkO5JU80+ODEcQtEx2mYFZ8GFqHRP+qLn
	vmJk3H7c4HJAdmx2GVGH1lQ0GBWZjBT0oVP1l5BNQxZYdWfOmxIOwvhW2UIV2WnDXRZf1REVYgb
	gDIdbj48IGOyyFqnmmNe1JrOd3bJ1RAmAxKPVYt5SXBI9UcCKiKpW1LDFhO7MvKNZMQT+fpqe6i
	1SGzVtpc011pg0mFrHXvstweEW4AYDnFT2uuFy/RwkC3fst5oJtjiyawlgaT6hI8WpqPLlbNLI5
	xwX29wQT13iaVxp+TkbqWQ+nqCmv18zRKECIqc3kTSrJO6sVIremd7DtZUwW7UHwY+l7Ztg9NoM
	fa/5C5KSpSZyI9RGLXVhIgGodYdttz5u1EjQtwdVVxY0T9cH/kMI3tcXlh62jn4uzc71r2eTC7s
	WUjQ==
X-Google-Smtp-Source: AGHT+IGaJGEihzS9F6fnNyhHVGRwXCsOXdE9dlWNhp4wiYwBqGQCgmFf5u4C0KR9SkCEnEJDDokDBg==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-47117925da1mr126433075e9.38.1761142895124;
        Wed, 22 Oct 2025 07:21:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
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
Subject: [PATCH v5 07/23] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Wed, 22 Oct 2025 17:20:35 +0300
Message-ID: <20251022142051.70400-8-clamor95@gmail.com>
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

