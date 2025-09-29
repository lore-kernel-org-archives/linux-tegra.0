Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4F30CD9B
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155933; cv=none; b=fgLMpTR7ax9V1y5rVPa4ZjixR5zKipcVBuG74gWZGpS94CKBqx0hPZPE6Js8t9Ojy3ScTiFeMWNuAN0wLMsx4LjLqU7U2tfJWaCsVqw1TI9SjV3JIrUjyMwGyvg2PL7e3yBU0Qg/spbVvf412on65Ve/Mq98AKIqywtD5MdxBcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155933; c=relaxed/simple;
	bh=ljrBd5OGddd2yzGqohN5FRIpAWAajBSqIFjspUtmZ1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwaS/Hh8SUDQwSCOTl2OpFCHB3cmWaDg1ZnmWXlJS5FlWF2vfQ9BI9GevlVEPLWelL8LmFvtY1B/a4NswsNW4rFbAOdI2yMKIatuFyGbqczIVcpWoDYZ+PH4IUlpCHotD0N4obyR5B9Xf70BU50ZQyRBavhfyfZ4YDWmlVJqcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1qyMvmD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1qyMvmD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57a604fecb4so5707870e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155928; x=1759760728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmXPjuryXSqRr8DS4zExlYZnJGP8SsHdroCjEncRXpI=;
        b=k1qyMvmDqkdL2tClPLo8AzRJap0/h9oky7Ldgo3fD6jsWG1Kr2+P+rzSR3d2rMv5zN
         2H2tfgHD+iUdIlXJ0fQwSx3cXeilmYUPh/BUrcZAng1OOMroYzNls1QdZVv8fhqzmf37
         i+Mj8TAlS3RYSyeq8fhf/mJsuTAqT9m3LjJkWqB/sot7K+6LYgTy7kEnS7YAAwYaD76c
         dOathoQfUlCEfp8vYtFI5lMjvXameqAeP1TDmwT2vy++Dhnt+sJl6oDxeLkduQzV77TJ
         nuqo0xF+SPcbCSDcuemqc4cbQz3jk+O0xt5ok18qZHH4ejpltIOHZXZl5fs+nfuiyc4m
         93eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155928; x=1759760728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmXPjuryXSqRr8DS4zExlYZnJGP8SsHdroCjEncRXpI=;
        b=liIFVg9grGv1Ah5ZbENHmFnSJPBAn+R/m0GsT62PVsWenf2b9IS9cuOBpAkSfNOR4Y
         XEfK4n2kq/kRwmPhceYC7dZJPNNOMDfjnb1KBvvcuuPTik3dbgwR9wcoKFjR7+Fu95EU
         nEw4j5tgRC6C2z/BDQojIP7vR71e/lo1smBaX7/3UVc0Agv4B35CtNUMntl1tTUE0N4y
         FINug2QjpD4RU1QwuDTb2Pq8h0Vs0/ILzzhk4lrQYroqBRJ7P81OaYDsfOzTvYjj5fjJ
         m1Cl2Rx5JtK1BhgvMztibI1b2ddT0HMjqh5Q8vm0bc2P3ezh7OJBn+eoP1xvi9ITqYbh
         crIw==
X-Forwarded-Encrypted: i=1; AJvYcCUtZ9jgSu1cbR3cimU5l9oBNVbjD+JQiehCHqVer3Hy6q0an98KSa2G9QFcnyOh2UFTwwvA7YOyTmXIaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlEiODEgZShQm4kn/yzUKBkAXjz4UYKgpQS/IcFUIxn+pttI+
	uZhmHxkn8y0Pt5/UT2gGQjys7X/7oYAZ7youVagZF9VYYAfJIXyXw9xY
X-Gm-Gg: ASbGnctdsHuNl61Rt+fb7aP1w+Xs8NgN4TZ4MquF2dTZDkOToLczXb9L9f+Db+54dXf
	/7lzW64XLEjlfs3Fhy5G3cwIIx8wM9SXHDjDfZ+vAwjvdi6ooQC0zoVXeEYmgBrfwVXfO7PJUsj
	li24S6KErsEn+5oQRbbLzpVhKjXhApkdbrWhtlm4F/eS0fivJ+V51hWsDK0GywWUuFophp+oYtd
	X3oagea5R/iFVh+X8ep1K/p+u1dMTDbCvCkidHNpQPWKQcG4dq+viM3G94MPrmh4SdHAYCc19vS
	SyNhwS8wR3nQ4J/TSDpvuFDnwPE3lEJHAovMlv/LW/6dboE5tJcEPDdQxkMtySz4RXfUJ3Rb1Yk
	sdb5fF8zek3w9uuiCwVt1rZCN2CgA48zLoLc=
X-Google-Smtp-Source: AGHT+IHcGLKbQ/s13YElRimx5FsWcbtSM3Vf0+G5+6fyUYRzlFXaqPvOerq0bMbZhupJyyuu2WrS+g==
X-Received: by 2002:a05:6512:1189:b0:55f:6b4d:85d8 with SMTP id 2adb3069b0e04-582d2b4cbfdmr4907344e87.28.1759155928244;
        Mon, 29 Sep 2025 07:25:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:27 -0700 (PDT)
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
Subject: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
Date: Mon, 29 Sep 2025 17:24:54 +0300
Message-ID: <20250929142455.24883-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga 11
with Tegra 3 SoC.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a978..f01c11f7b59a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x203d, &delay_200_500_e50, "B140HTN02.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x205c, &delay_200_500_e50, "B116XAN02.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140HTN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.48.1

