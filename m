Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EE631159C
	for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813466; cv=none; b=XLZVl5nId/GKuRXzCa9YuOjTQkrQnSSqndlY+2cRF6CTSkT8Jh1zweW+CMGlOK7nSu/JCmoSTs4JirqtB8TlBKi7DMbymqepQe5eeUkIiO1WJzZJPQUipjP60hfJKkOp/mbKJ7ue+6ftRqpB/w4NAASZduL0/tE9v6byWR7Dw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813466; c=relaxed/simple;
	bh=xEdfxaJK8UlRjMN0vvEHNNvzu0cwg9hFbDlCPM7oEtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oReeJWGZAfviK/hitz7xWfu8Xr867/QAupsEEAPnuU2auntm03KqM7WOKDEHp1kIu9RyxU1AtyIeKVZxmR7Jo7l0wCQCrVceYecP9C5u7MG9jxrVWhu5joVoKA641gF8GKgXSpyUezC4p4f95Wd8dzXkJ7xmyUXTMpwr/x4tm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSgeSaYj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSgeSaYj"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57933d3e498so1186688e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813461; x=1759418261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
        b=VSgeSaYjfCaYUP34XZrIH1hyfG2ZLivVJd0XLNP5KF7vq9JDHtDUo+sUO4oqrsr2py
         T+qEKo8MjflVxMPaLmvWSPBIcRP3+GkflyE1yDQ/GuOEmHGMQbFi+waTOHHf6W2UkHP7
         yV4R/76O7mD2LainVUvaWnOC3/qZTV0JWjfcFQjwEOSsQGSM/q6cDya7lOKtn12IxhMz
         4btz0X8egaimyU4txTjN93t93/fInL121Wbn4kC5ls2ULjqooSERYyOs41k19hLuHSDq
         nzzBwii6xSKj0fMZ7fA29O4UfhJdyP+zGEQwyamzAubw9TjXYDTIewhxIIlBgIIQIasK
         t+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813461; x=1759418261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
        b=l67GCxJwWp6nNgRZK9UTznUEo691OocG2BcGJfKrKO9zVK6fi+9EOT0WmVyei9hXpV
         eBdCqLoxMA9Zeu25qTbakkNmmas6nH8eocAUd8+PYkgiz+dMmEUXpGImmkaLnwylKcgC
         Tuv5WFzt6tCYMKJrypUVilZIwLBHql0F/EYsJwQWMHuMyrtBaOVI+D4OMklrW1N160ZQ
         Nvlh40v4xIbCqpiPTghx7SS//3UWjNh9nt/W2WKQ3mRbJgHc4idGHufSsACN5H6xVFp3
         VjtAg2giVgIj6890qRKaXprKPAuilhNAwjH2mgofPWuSV1XSrfFxca9XmFq4bkcd/DZL
         7pPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFPAjqsDY3hFSh/7jr5KSzbCDH4pfjJO2MQpEcgwyRlEM8d8A9RtIjzCzm03qYTzIg0Db5e2WLHI7Pbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJEDMKn8naxlQajQwunUBheO4V2LZz0jfMpK9S6GG6Q4Xg1fm
	TLVRJ0Tup6P3Gu+UQiZl6xpHOLmydsUzlkV1NgE+fwHLgRU9eo/cmbOw
X-Gm-Gg: ASbGncu2oOtgsiuIzn4vyaYYxnHhzyFfaQ0bEgIfXXDVx3gfN8XfXDkuFKC5mODtc5z
	e+ozGwmM026+SFOQvnu/IusaiRFheHvSRG+qdfFoqioRbzMg2ZxPP/Yaz0tOJ9X/Uj+GKIBRZzd
	pIvy+DXKun/dyeDxgRkWAFyGsR//REyoroGclttOB/IkQxpxqQoaeAQwyfgwNorTSu7iFHe4wUp
	Hk1YpdQa1KqnadgvrgxZD7kmgqWv0MSTgklnzUh0XobugsbccRslmmyCcTFIdQdt1i3u0tKfxn2
	eFe3sSL2dfXsIpbhsgvXvzDwzpRBvSBZhNJWYPgVOkxffnnADsWoHiiQ6Uv1SQnxVOiiiZg3lfP
	0RqhKIRhimLsWJg==
X-Google-Smtp-Source: AGHT+IHvquA0M+Xh1SpA+3oDLguKIe9WLFehMUyaGA/+DL5kSgZuWAoo44DRA7J3InsbPnIY3UchVw==
X-Received: by 2002:a05:6512:2207:b0:570:b85:fa9 with SMTP id 2adb3069b0e04-582d0c2a151mr1077864e87.13.1758813461247;
        Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 17/22] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Thu, 25 Sep 2025 18:16:43 +0300
Message-ID: <20250925151648.79510-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b69b556387c..43f545e6c45b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -591,7 +591,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

