Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F22376BF8
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777402; cv=none; b=r1y7XIcpY6Rt3qwdjvVHrJF+aeiQIdj+4zyCYvUaMQjEDWF8lb1orxCWm8v2CxaByEWFraUi1GtGVClkT9nSE3zwmE4XepsL4mVm2TphXo62YjLTGJqZLZ1dj+LsrSnyB87XT+i6PsgGbeeVD6lhaIj0xHhXTTrkqnpw/DBvAUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777402; c=relaxed/simple;
	bh=W/c+p5OzSzMCPsuxSreuM0YQnwu6gX3JEtOSgZZKgMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXpBFsUmVqdvPpwOFUzl9knsT6TOIk0QpGM9oDO5JSVii15L8bMU1K+cQA9PC4WRLW3jEFNqb60+z3MPAGFibv5gLLnt1G3RDC/QcpnwygTRfhdB33pOQD3zw+7ydHe6WhjKMTSXr9lrqiSd7FwKQ3Kk2FtSudXhv1ZLIYXlY6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+ELSBeD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+ELSBeD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47edffe5540so25752365e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777398; x=1770382198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=f+ELSBeDc4COMI7t9a5iP6snIRDOyJWzJB/Lo6Rcnq1TyPpQfURO1wd2w+/30qhEt/
         Vd4gk98DH+f+bo16GH45cbKD09hhjGUgeyLxoEEmHpUCSgRlB9FV76/TdPkGFeI0SjL9
         LHbt9sJE5au/UbFjm0db5kbMzgDw3UmDIfm4NZq4SfBr1E9ggBReJoK907gE83BZbl6E
         QxUsdoLtMj53/m1qYqgiM/1ixS+PZBy4z47qN8lShDwFEeTEKRPjR76ydp3DZgHxzbCc
         YJqE6wShwcfmDa4eJaoYncgJczoG6HEd0XVdnLKdf7gBrgJICmVXYhCs10Ur6GlgTl++
         /59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777398; x=1770382198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vuLhv0mNsbTmk14Cy+1I+agalhgb8cQohYYZvZhzur0=;
        b=MJ0H/Mxn5AFy8BPRqdWhwDStL8+0gSG7NPRkb7jlpgjKiV9nLghUnf3RqcoxcaeTcI
         iRTXHZzCiA46RZ5hn/JuFPtSN+fYmBOLTDQUhilVPxxp+o3BIHFRJeiAso0QnezIqHhJ
         3O4XMkuF4KfVgaxcBp0tTxosxDkRLdXOc6QZSAFawajMMAmu5wbjrKRiOqvD6rEV8529
         0LHX9lZ3scq3uBRK4pFkbTFYowYO1KA5IDZtk/z+mgLSNQnarYKCX6JvgE4W7xMABc/u
         64qxzIR/aFiYirkkotxtgyF1ISlzbg5k1J7W10RuF9bDxTgcxZpfSb0MSz/RCipE3aHU
         MZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN7Nha9wxvTP5/6ljYR6R5As9XKPBwdgByDu/0/LWBecYUN0qWnPAIJofbi8rr8XpI35MCG6oMPPiTQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAzcrDBn7i97lVwlbNf2HhJlBZ/XO7gH9EzqHwulD7O1oHYmL
	bTBm+pBp22wcrhjuaiTDdytsXWwjWsA010BRtV16qtgyL73y5xXEDhAz
X-Gm-Gg: AZuq6aI4MLkXYhUVJgXxn5bJoZfuHP67+8KEKYK8w3dlykdizuVD1YnB5eDJgSD9WDc
	xWhVujY0z4vIxSqlYAel4f4eoJm1BYJy5augi68HvFpmw9qFheIt3No57tFpaiuEX7GxfbjCSII
	4RoHopHY/xzXf8CJU5AjpfRkwYPU98PPJnY9exTcN99UZqjdYYlCw4x63sNLxGwOv99t54boAW4
	2i9dUolhVkS1ISzEgSj8x0LAbvb0D154JR9tV7H49cHuKJPklqWhXIq1fGEWGEDXXwoHFMEHisl
	OWWhcXVGRmOzDt5v+en0zgtzqiSh76Z3KTIVcVegDL/XsRFZCxqyF45GMpfVTcssCOZYG3IixXe
	y/Y7vXRD96CnchubIgx8BfA5GrytKhzYH9ODM+7Nrh8MvcgN2oQK5FlXSJyLPBFqgv2kTd98nrb
	9z
X-Received: by 2002:a05:600c:4f48:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-482db013b90mr42921685e9.0.1769777397748;
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 03/15] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Fri, 30 Jan 2026 14:49:20 +0200
Message-ID: <20260130124932.351328-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 70a84158b589..0f98157a7e91 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -962,6 +962,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -987,11 +988,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
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
2.51.0

