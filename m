Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337CC34EF15
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142926; cv=none; b=OkrjcsJXE8coW67DNn8FhkVADoxSHf62lSqmlqX7HxQVUlSb3u78E9NMnTTLeuwlIAoruxE/gZCeiF5s9f6xJDt6U0MJtbk5lG145WoMMmiNSfpEMgfa4qnKg3XPU6PepjrwUUYDjE+yMRg5OA7lyq/2NiPaY0C9KxlYKAEwHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142926; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLWO0pkbdlQpPUh34j/Ghp3hMf4U7wIPB/Oy9zVRh7iHq7a2WXQQVI4bwilfyijRsxY+FJRgg/AMNo+pgENs56yWGCk8BPXrVz6U5IJerMW/chLjkxqVccrxqPDmST6ojHAlOoU6sXauN5yIg5hLRHEvjTGsD4pK9/WY/P5GAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhec2zHm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhec2zHm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6410965f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142919; x=1761747719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=Qhec2zHm/T7JsVU3osGmI8BQsS8DYjJwhZ2LaPla6qkzLZVXdli9geRpBg1hx3Km3Y
         DXAo8duRdrtM6bobPNMCnD/eqGrZ8/0NC53nil1Sh+8+DJTO4sCg6K4ACVLW8hFkse+H
         g34cUacGIVuq+U79Q7iDtKiH9H50MYwBICfseRsC/27lDZxCu0mcEBvQJBnDaP0Nup15
         XvPF82r6MVEc6kmp+It110/ikCxuFZhXN8I5DkJgQo2O82XxX48W7WLbKHsl/QcYoToK
         J44bFv6IZsARXD9yRY7Gg0ibCcNwUlHrU7qj8giUTJ9odrCeMrD+dIMhdWybum+HaP7T
         uqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142919; x=1761747719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=FYejaXe/vclLUzf2mOK+c1MDk6axAE/EgF/l6NSZEYv1VmBVfmp0CM03fDvR8E3Ydi
         FfldiEO81k8glqnDBTTVqPXxUMvkGTiFpJYZdCWGKeB/cVFiIFB6iyj6Kl/O4o6oOZ2s
         HkuoZlZb/IvCE7G5XopDRI58poglXKrs4Yo+TZkpXhtR/24TjPRNjItveSDI+OWH5a+L
         MHxHaE3DVG9jX2Mt8wY58r9sm8VEB5s0aqotyEyJHmymIByMzruwjbd7PpNnPp3yQSly
         tTprZwVpgOYRt1/mOzBvInqIKOFKS+hHfEqqVuIXPB5hFCUmz5U5riztr1d5htuy0Pg3
         Q2ow==
X-Forwarded-Encrypted: i=1; AJvYcCVJpJ4ufgtx+2KWf1eQPq5h9D4vW4AJR1+hIKU4OpXDj+bQW5htv24X4SNuogi8IJM4PmUUBnTCe/ANQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8liwUEj+HvzYLf1LNn+yZR/SGjoye9oUxmWAccsKcET5KmZzo
	MPnbo6QW+uimoEz5/SySq96q4hr0i9PPveCXvs79diPIE9HUoU5j5HAM
X-Gm-Gg: ASbGncu82K12j+hvvPcUulxogR+JyVsuoNzlz2lD8J7SE+TD/U/+TyjMR9TX00hSzBb
	ttX+I1k/zAaQPgknRHapjca8dr5hoyVKIwc5Xu0CJtH2VzQcooIJSHtynaxAGTtQLB4pz//p98v
	a8Jft+cnhsX6luO6JEvARzPDCqbOxD3L2rFBdYRbL21z5HGQX1JT6gFMy5hneQGgcq+SsNc8KZn
	KpulMRSQNnGzuN/PjHENpv0HVIrjHUkK1k7ORk7tUo4drx0Dnz22MoFr0NaiWggA/4Ozm2Eu7Mt
	hjuE9a1+rjtDEPaOVdzHKl2px9fRq2zUTq31g0IN9l/RcIsPLCi3a2l08FJ5K/6fx/1yjYP9go6
	KMi6tvfflrHaincjpmYpdvydInTQBcggo8XkQzaRSGMaYcPww7M6V+sIapGPYUd+D4OknTYFyWu
	FdXw==
X-Google-Smtp-Source: AGHT+IHXd0IcgPPuddYC43FouBDl7JZ23qUq6zvhrCcNdJja7V9zzVEVqdzVMGBz5q8/P63zDQWKhg==
X-Received: by 2002:a05:6000:2913:b0:428:3fbb:8409 with SMTP id ffacd0b85a97d-4283fbb8df6mr11330113f8f.46.1761142918838;
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
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
Subject: [PATCH v5 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed, 22 Oct 2025 17:20:48 +0300
Message-ID: <20251022142051.70400-21-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

