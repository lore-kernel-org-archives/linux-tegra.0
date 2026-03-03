Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706DE38C417
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527389; cv=none; b=jsCGvV08aKnxU3sDqaFXu+WRFNO3GZ3DzQ/Rw7HrdphcFgNUvKPsrpANTOq/XF8VfmxU1FyI82BSqTil1bEHSpC8lcdSidsIbGpb2C/4aAumBVQtyQqWToT1YbfvKrCdnvxOqGh8MFG6RGi9RWpzw2v36M6Ps0Te+lHSffMPtyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527389; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLNTVKux1HFn48ueIpvMGf7I69c+W9Ex92AZUwgwF6BIbn8SGofYEsTp9zsCROKs+4Ymncu7zqEwPgpTHIeZeYozpDEzMFhpWkTBGeehD/zOT5w4ZNXkVsDESCJ9wGrEU0tyGQDweWui9Tl4tb6Wwyy2KppBxeu6U0MknxfqfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJkSS/qw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJkSS/qw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-389e71756d8so99717931fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527385; x=1773132185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=PJkSS/qwVhUlkcaXaFItruftcfF9+juSJ4H+P6TROG8OrIT4N4BGhIRmjZ8nBWLik5
         VtBELTMx7D76DaQc8lNAKAqFAWiQeSdEbYG/cbPNXsjjTQ/+mK/5xMnpBJ1e1TvGc2jc
         Z3z7WRr82S300NoDZZ0Nwp3sWqUurtBmykO+XsG7M7X6aSgFb1V5TsCLnm+ltxTAwurp
         y54VLl6LLp7J9KCXWtbOEubllziGP0cFNIT4DXwMVZobd3AsEDoSkfxzjfu7Fa84L4NH
         R9dhN9JwwQJ9PpYuievunaSMHnYcD8GCVMSr6xl86y8PJMN6I2mjDmsOtPU/06OA//9k
         x3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527385; x=1773132185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=JYclAtlg2BD/thMT8atSb7j5UyC+0MF2gI/lFP3lh0WblhDWarBG4vuodJU6PFV6X9
         ZD9qxDKyEk2EpRJSWfD52qZ4XWKHijJL+W9fhv7TsKeXSuxsweHc8EmxpWD8/diq8+3K
         IIXrlAA5CAgyXLOQMchcaUNYko5ZEHwrtTeoTylwgnApmg3nPAuLFb9UrqjNqiqfcoMA
         r8mz16rNCYu5NRh7T+zAq/bNKfsWjpc0iqSw08IX9/5rEfPbEw8Zgc4nnxUkJX8JD3dM
         0rOtomVpdqT4Kid9KToluuyhzCeePY1pQ9XTZ7L+i7qdUBTvhlN1AcFC5MV1U2tjRPum
         TH8g==
X-Forwarded-Encrypted: i=1; AJvYcCW/fl/yt/C2j7wCSQ10n6ekLyjobaxzlKoXhZliZQx3DBvNglghV57V73iuV3AtZWfSMaywiyH5rotSGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtert2DAHUgTSLhXb2XfRq+4W7GYm7thVVGqnKRaf1JxxKgrb
	RAr09/XtLxgJyIY93CySxzps4oErLwNT0kAC75YnwWEbnFcb6SRzWILc
X-Gm-Gg: ATEYQzwK448O4R+N+yztltiLgcm3ENS6YUSkNl2T59/X1YlEK8pFq/iGUmbnaAUXntk
	Anm63Dif312+eufL3Lecbt9UOSr3EeWeN3KchhQzVXK9m5hrQufBcVO5H79QTAex4HDb0/2S1L7
	7gQuw2BQcfoyB5PKVPTSbd1/nesWlEZadLaW7SFkjeBLS9qqjtk/sEdx2t7N8X1a2u8ntr9xt+w
	Y7zUsnP5dQRn80RTFCEDOaWKyA4gRD4VidUXdIstQKTMSZCOz5Fo/EQmJUZIoqBnzdrjoVu+J1A
	yCXervzqbwFcMpI2C1m6+bPYLtW1/30lJ1Ig7BnRP1tsni+R5AhQbas6cx+t+HvmqBJv1m0UaAn
	PyCtpkpw7c5NncUtbl8qhuPEfY89EJ+84zL7i9aM4T5R4Ron7nppXp0ynqoI0voQr6io4DF6gsL
	wY3Fg3oG9CNoqj
X-Received: by 2002:a05:651c:515:b0:37b:9e27:89f with SMTP id 38308e7fff4ca-389ff363a7cmr102300131fa.37.1772527385431;
        Tue, 03 Mar 2026 00:43:05 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Tue,  3 Mar 2026 10:42:34 +0200
Message-ID: <20260303084239.15007-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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

