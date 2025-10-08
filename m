Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466782FAC1D
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908715; cv=none; b=RZRSN61R05xHLSoTqdEKztdLCd8+RuRnKbbPln5y5HWq4UYmr/HUDM4WXFOCcfLgL9ijqaJTvuI4ybb9XM3P7MoQ3j+BpNd4gEwBGtzAjCaEK3qix0OuPtT/ten1ziOHskI5u5MIQfh97Llr4YPmGK4gi2hBZg97FuBR8dKy/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908715; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgMplssVSyedg37Fe+J1bYBnMVPblw/9uOVr8SEiM7zkxylBbSGYiUlOq+mdOUsajkLlWCJjdmbMhMJ9dabZJObu6GnBhVi/5GezMZcBvD0Ja88A1Gl/sbsNuUek7sUJvBadeaNxTxnH/5QabScJMjkeCbjzdKFdH61/BWKXfyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7+lWQWy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7+lWQWy"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-586883eb9fbso2495216e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908709; x=1760513509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=G7+lWQWyryV9LtEA2h9Fju7xkySa19kVPCq0EdVTAxoBLBWbkS1pirZzs/4eu3elyk
         mN23d2df8bowdox3TOvuMVQMHK2Nia1knM5j+OG2by1uPRgQYhtR5TjTXxtBKeIL7br0
         S1FHVLlp6CJoC3ZUfBORF95/aRdolUBmEl08BoQdBzK4khmQ1fdOV7G/iDE4JdMeION0
         fIoAzmKGqAh+Z7fbQGakX9yIKzicjmVD8LssRxXjKCNyoLPU57f7CxK3NdIxSppciZug
         FTnW/tTHWxVhHFEyfVNdvC2kVgWWmZ18QBMEXYxZwuI39nQSlc1Q60F+IuZPzZKg5kyi
         73HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908709; x=1760513509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=WvAK1a/QX/GZ9ESwe0RJVSpD2rJ0/VIJOKJ/+hWQ8ylbc49kNyj9VnkOdCYJNRppEW
         nwrlNC10HUoLKS2TNvJsYUg9H9hBme8gmY8LJt/G28UAt3wquM0FrpIXCcGSSXGcynsR
         ljCykaiUGPoJ9Jsh0CQL4gEvS8E4E5molnaZMmLByjfwUlwXEJl1/Z1lHrnCkR7LNqv9
         uMNGbfD0NsWvY7YgIOiD16bYJElPVmnDz3tx5ZbhjRqNRy3wvMSwMzDYBza+MVGR0PqP
         jkpM5ItaHJWAHGbTqx7FLo1gTnWUmcq9Sp6X53zRNf5koMfuXOfhjRSTk4EzzOU/hrID
         lqhw==
X-Forwarded-Encrypted: i=1; AJvYcCXZLPIWh+7FS1YKKSJSHPhhcbPFRJCUS3UF60R/TBG9OemsfEW78phP25HcxVmYRIwcgYGYCp7Jb8ziSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSLd5vyG1Oj9qtyQaMnc+guour3mYkgiK0jqmzq3qOcBAMcQqD
	DBb19ZFbwm0INxdwlJbKNpwHZIcd1VFButrnjVMW1r9pzPizE5vMjhA5
X-Gm-Gg: ASbGncvRGieXWybv8e6WGRQ6ybXwsNYgDVijO3MDr1HYHtWMYg2mP0hrmUcTZN2pLQc
	CBoo4RKUNziu+osdJL8H1G1GaExn75cMPLn2OOG5HOhI1Z4sesucnyU+wr2majgzRxx5dYoA7rK
	Lu3c8cihTJe++oGjzCZK/T+ehpTSWuWVj9DklcQiBVNLnc1oOInPoAhSBGcJngQER+yGznLF65h
	yTyjqaZcrjzoXGlldo11/QIq1JtTK8f9LOM6gyL8+rZwWEMEAHtO6T32qGH66P/ccHa2X45ghZJ
	jZ+jPxvPOAoIMZ+9l2n9Mi9d7YRRYsB0R2SpC+xa/mXl1Cxaqv9oNfuy6VWpSkydP6ayEPvWiiz
	M6Halzae7i0JO9BVSjzdCzfpiE9YviRYbxVjxtA==
X-Google-Smtp-Source: AGHT+IF61Uf+7jyVQLbDjguFkflG7qNGvFKGa9VJbcmzM10P4AOV0pJo6kc07mp87QYBfIqV8TPf7A==
X-Received: by 2002:a05:6512:2247:b0:55f:4107:ac46 with SMTP id 2adb3069b0e04-5906d8a084amr687325e87.25.1759908708862;
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
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
Subject: [PATCH v4 21/24] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed,  8 Oct 2025 10:30:43 +0300
Message-ID: <20251008073046.23231-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

