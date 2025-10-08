Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8F2FB0B9
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908711; cv=none; b=G0vTBabbXXGA8Mrv/W6F6DokY/e92xjjQho188Q/aJkqoUdy50HV+MCmWpK1yYk6y7iqnUKdr99AZYglBSSz6yhpMWgpyU1nZntDL4fSWUry9Uoz0KkIy12wULg2ov1Qz3bD9KoTrcYfE3M0IXX//7IQSuQ/jDI2baishT1Wi7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908711; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKA/fSWSd3UGH9dnmYK0IOlAtQ3OU4SBfTcA/XWzXPSz7I5YB4hK05eYSXlQJj5H14MFRL1mST10WyGLbllMX7qZ3Ae2wwGpx5T+hhytk5zM8GxWwTQoZoFqlH3jmy7+o41ZqlqM/H3JezREk0dfp36gNJne051jhXhII7XYhVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU7By8IJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU7By8IJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so8387831e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908706; x=1760513506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=fU7By8IJ7Z38ZZ160nZFh8txVIOZi5d2XijmE9R4LTxngADYF/8P5QtHwI/TiChlFs
         d+acG437BoZc+5LUb1EMbOu3b/iRBi9yZjxweHRoLybIKxX9GqvHiVJBZHFly4v98oOK
         HYp1sLXz/N/w0Mgg3JmLkRaiiYjrt5Lyo27EDslG5sc1cdaXzNdGNdPayvlXeHwdTYJL
         ndVuHl04W/2xoESt1g+/JzAPDAohH2zc+f1vFMDExExSmeRcGlDLwLFly/SrUvCMoueH
         BZhwGwH0G0ltE9l/slZRPCzh/5Krv6f1IUT8KCspFIot8ZOWle2iF3ctV1RTdaGLCnc6
         Xiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908706; x=1760513506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=fIJaLMW91grAtAa5CNFYEEQHh6h1iH8lJBq+V64ZTYqNkcyj1VSGopvhA5RmPBFDp1
         bZJhICMaH6kfS3DaxQ+4kaQkMUIi9/grhAounYqSxYIBXe0xgc+lHAv13j5NK2pSo0pc
         gi3NwK+MZoxkKXzJhHLfOg0viDppIuYnh/qUwVSbjlFkbGzyoAReOjKOy4nO8b7IXWuk
         TDZHawz0aA/rasf5aLUTiwNY4pdHmwU7EMvx6H1wgJBd4j40vtttMLOms8pPYnNgY+lD
         zxraQqhot2qy5BSeGO/2bumCWqo2JTANGy8prXUegGBBE5o8GPVxqujcPB3SR8EgtmyF
         +Oqw==
X-Forwarded-Encrypted: i=1; AJvYcCUF16paSmJXETj5GKme8KRfqPIZebaon5DpvXsPwg2rLKQl/iVL0bImzPyg38F5qG/48r37tbN/BzRAHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBRiu5mPkJLKT86Leb9TbWsFrDwT493HvNYHGChe93DZXvg6p
	XhXmxWN3ROi02j3DnKn3rWPnbT/12pqeqrSvyA4F3Wbut0dZh4BNid3j
X-Gm-Gg: ASbGncu7GqojnDKtJo8rjLExu9IQaERlEs4amEBl+CmHr+8RVMVDxQwmvP5RnEemxqN
	X1KUTCdFNVz799lGxlznF2B8lsnRJ5GWBvq09Sp6vhXZqiAqYO/nRs04jVrP4RTcJCkAV5/LZY1
	POsQzNsamRjQkDHo5L4hl/IhTK9iEIibScyJTqlw0luSdsr9uG5vobfpiPoYg7KHdR8RSEp4S8k
	wFbn+RWOZVWLx82CsjLugYdyBZQ95Li6zQ+ds6v7DFMeGxABat3ihPPqcZReROe/RqbnmxqQ+iT
	2rt8+N9LQIINqHG/rsYhOzIg8RNSe4YuqbY9qn+mkPqd/nT5vfClzsXZDW8I1lq260Rz8Clw3p9
	BGvPN4wack3w5vTEI5vODVrh7URKislPSGOLvUw==
X-Google-Smtp-Source: AGHT+IGRZlClUUWF0NFnw8JC06wEKdlQrkDCO3jAGBg1Eoa3BWw4+yky34BfCurBVLPslna6NuvYHw==
X-Received: by 2002:a05:6512:3b8e:b0:576:f133:9288 with SMTP id 2adb3069b0e04-5906daea903mr620850e87.54.1759908705540;
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
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
Subject: [PATCH v4 19/24] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed,  8 Oct 2025 10:30:41 +0300
Message-ID: <20251008073046.23231-20-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
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
2.48.1

