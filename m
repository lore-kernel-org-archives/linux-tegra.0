Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8338E5C7
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527392; cv=none; b=TNx4uf64S1GbftEkRfuEP67nyxg7qxUy3Rqfo2sGI13UFRq9xDaKJnq+SRSKyI7FN5i5bbk40k77Bp0EPIsRxbaiF4Ml63pDJsNXn6V0/Y+yYrvTDJgzFIN7XczwYUTyFk9HfMmo3S+3N1PiszzUw2yhtqZxETJHqOvLPMDjDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527392; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSWwWe2uzGK0kCGdBNAmqS+fcpAhamlWIfsIrza2aS5gyGUva9Ur3GMSfwMwAmS3Iu7EyCxppQcN2wM/doq0/uD49msNHd/K0265fJlSccx6HbQfssWrNCURLgFY7X+5MMk6/8JUzBa9XlOzydpWxeOxltGxTM8fRLIkogHcTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGB8rqzq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGB8rqzq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389fa352b0eso78550051fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=KGB8rqzq9hLKZw71u8fjqsoGtYpHfAvE5RgXoQkkarCFkUzWU3UB4ozylpH0+GFK1Y
         of1Ysow5Ma3LrbCzvcg1sSZn9gIhjZlkW9+zrn7BrwrFy+7oFRYbeLbaoKPINCT9BoTo
         QOj/zOTs2bZ+Hzhi9BjQ0/3JYu+EKKibkyo0QN3Tee2b3QQYkPgPo9WOXeE4VL8P0Mak
         1x/Tz9stkAJge4bpHeNAqdtRtpBrGKqq0t1y+XwCW9UkJSazlsCHigTBbiMM9rwi/NmF
         2nwLr/E7/PiQQIVJ24gXvaQSJrQKTpgsL+55wKrcYoWVx7ApKfVbGUIFYJrHi3WTbLps
         6hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=IEIGqx7WYCpsqX2OmhJBfJFpfdLSovEntL7+75W/yEykwj5z630Ma5tPGpRbFkeDR0
         7SyH3pKFTDveWodmlAiR8SQlbgrFgZixTXw5jSE9uU332nsev8OBhqCYyoSHuBzITsMw
         SdUlzvtPwGvHZtney02OfuN23AkhB3RIpMjtU3dmAOGG52NfyeiH2K3pnH5GoXRQb0Tw
         Sz7D+vU1mb5Y/ul0268EccDvIEj3dLGeFNI4yZikSCZ1KfSQxOhTwVgxtjSBtGGUyrJK
         FH7d9iBZDhu3LRpWj2zmA/Vncu3c01g5jDHw+bznEJp+KEaKjo5ixWHx0ZCBeSQFYz+4
         SL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuX79NmRIoMRvC6M9ByMCXbTHvPznk2c9ZGin5bflycbIDyUYBK/H9M/kuIGzYobscRKKcX8Ih0xIfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz262HEM0v24GG6YZ6CpOkG+3UsipYcj/rqFTkXc1UKV0rANy5B
	8kXk/QT6N73lp/OCvUd7SW+sv/F13jfEmIHiuXLQttUvu78m506/mU+N
X-Gm-Gg: ATEYQzzP2WXFvCQ8rA+VLiSueEdgJrdIDas9ANt/3HpxhNG1Qdyou+hI47n5ugUBBy9
	Pbl5qwUkrU6R2vpARkKwEsuK8ZhvbqYuDam6UULNgjjokGXu1WLcdcIn7j3wZBztLHakNQJ6Ch1
	6IFwaK0sDL8p+JoC3sjT3VVcq+KVObfHEWOI3rwVdFgAUj5eGBY8KRF0zTYSUVEyLqd7PfnHFtf
	dFAam48yEWCmHHNH0vsawRs8xeqlLaixSuvT8qMUoRf8S/KPDBY4q8R0ODzm/LJzspF9Ofnj+hJ
	+CedCPzVQaiCg0nTTH4lUTWr1j/TqRhjaH83BgF8Iv4IFqmuLeBbs6y7mvL7FJQokXyjVCawVye
	Brhms2rrFY5M3+usUgRFqjmpj2HrpWuNpi6hQP0yAOJ2gfQBFXKAjo45LTGyBEMRbiNA0x9mCcm
	xpRDqzFNmFpxkvb083jbjsrl8=
X-Received: by 2002:a05:651c:b21:b0:37b:8b7e:efd with SMTP id 38308e7fff4ca-389ff365c0dmr93909351fa.39.1772527386558;
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:06 -0800 (PST)
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
Subject: [PATCH v7 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Tue,  3 Mar 2026 10:42:35 +0200
Message-ID: <20260303084239.15007-13-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0

