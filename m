Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291337F8D0
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777410; cv=none; b=COeGvaJKwnXXUtpgbc04/TcXBpAzayd2fYYYHFWTTq6hudAxvQVP98w5U+L68NqM5alKNCt9bXE/xqKyWqPuPRG3gq5LkzFF5R5GclOCz0SA/l7C84eQ8v/lF3VlLqemkXrUVjvoPaINWO0n5IIjB2WGW6HiJU7ZsPDyuCIpFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777410; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e32W9Yw73H7Q/wr7x5ey9/Z5IhFZgiWzN0vz97FpMUtE7/yflVHwLf5osRI9+Fw5KX9Siq5a8o1LPu7gCVIfoURvJWfL9JS2FcrTmKyBgDvluV343mGuP/OClK5xfJ5QLEACh5kvAWMn9bq7f6MYwxN7VVfAJ82mL5xhmW3odE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV2oT17u; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV2oT17u"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2670932so1986769f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777407; x=1770382207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=JV2oT17urykXFAIG42Xv9GOAfayCu+vt+e89ecEyBkVRGdQSuKu+xRTuZOiHN86XS0
         7Gf09vkp+xn5Ra3cDojulCgVWAt7qKEfwFJfmWpzwujr+ayIhqV6kbbDAGTLdiEm7GYT
         tesRNSYGhWXdHWyEbmP96AQS2d3lm8uk7nyCR3gKOxg0MmqSNwjeOrvNNZkqIgcnXXJj
         CBT1m5YfjEbYN3UezuM/4z3QtYzEhj88Ja4JKbEWh6g71S5ULXIIAQ1LvMeDXuQK+Nze
         tIGPscNQJm+s52ZqWzFCQnMmr9FL9XH3YesrGRDP4FQbOutAkOfUd7C+Opo15Cn1Aly3
         62rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777407; x=1770382207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=fBsULe6DQD9vEMi//3aStfoxrQUmFrcaJYW7QbAkLMm1L0KFan/y7YBpIDSlZ/ciNH
         hLHRCcNsMw6mMzRyN60Uie8VcJ077/V2UzWzWD75exC5n77xFW1SHQUSQOdTNpbilGCF
         6NJhvnshuRIVpOSuOQU49S/jtdS2OZFk4m73AI+7fCnUAWciVi8lYiFgfx3NQV7NLMx4
         4r8nJJTaqYQKTF00c5f3Z4HwdRt5AkN19ar5ET0GD2yuv0bd37oFumvSMcQ3Rhw+glqc
         tKuREjQ0X4YXeXJ6BOl+IRuFRQg8PVknd0ablE4+ZQSD7SvGALwJePuS2JeBtwYtfwAv
         tUlw==
X-Forwarded-Encrypted: i=1; AJvYcCXPAHNEJAER2jIXptfU2HxtdonEJ4F4709R95FC423c8aVzQOWU9ia6eg71T5HANJgTZiP9gb3jND733A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7RgpZBO8snV9LfP7gGXJDqognZ/muha0sKeQWbFkR6A8x+XA
	9SHMPVVdxuIIVBjWCQy2qpWMr8q6T3M666tENLbQvNw9gUpOOD0JQ3d4
X-Gm-Gg: AZuq6aIDbGwNM9Xg2tLFZRb1/Gq3nLzU3hiy0kXCsIY+mRbT5/tLALWTMvdWARpnlDC
	cYbe/qyRyttne9EOfSjB/VINUN6cHwTRfU7kK9elVrifnZ5gMKgsjFeFgIg9RRbJYruxQhSDH20
	uq22AaSq7uz/YGZKhHC182dGErNCdNKI/+5K3Bfr5nbspz3WU+R3kqIeC/X3uDfeH9syfsLkmWp
	mTPQfw5DR79eN/AfIXkp7A00MUqgpwIzPLyxVy46rtk88moPzDLkzOZmovLlqluIVZ5NXAde1zr
	2rwVtiEmLEKrljriFMB4BKFFbI0sS+5mmSjTgWBAMEsbHAUOdoL6TbRSTYpHWEtyolIJaTT13d7
	C5VJXA8r76H5ako09A0ztt28xyEkssLcnx92/hMCyVPGT6CNgTrQ6LgFkB0+wvrtLyFy2B+U9xV
	vb
X-Received: by 2002:a05:6000:24c3:b0:435:95fb:a0f2 with SMTP id ffacd0b85a97d-435f3aaf7a1mr4266059f8f.46.1769777406689;
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
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
Subject: [PATCH v6 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Fri, 30 Jan 2026 14:49:28 +0200
Message-ID: <20260130124932.351328-12-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0

