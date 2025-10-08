Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A45E2F5A1D
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908693; cv=none; b=mkdmIB4v7FwnZ0tq6D7ACKK/qbezgx+MiFGOdKYr+KJPQhq0hZxjyfRRqh9s3zD2mi3MGSkpGrXRU+vfWM8P3GdelYCMUgZoUGTYb3Ai+2HzV2qZLVCb9KiKl6nfkYRIXMXcjaI8LdDjmN0BcfAGPK8Uis23Jd5XVWSUYTqC09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908693; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3S6bff78SJPdNrXcDfNB92ls6oX0COD0Rf56C47d7nItDhU7rGggQLqJJntYPaMkgIQGHJAT4OFz7RU/0fPVRnOPLGVSsP5XelbdaidAeRPASbwWw9d7ySboX7sUwUrV4jaaryhVDUajNw9GnDZW9/nEV/jWefY4V4oUTyXtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXuEKwYT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXuEKwYT"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5906665139cso1801503e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908689; x=1760513489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=YXuEKwYTbVzzkwo12hN63x+Ha6PFjTVrU25TB1zHtsKkg7rVDVeUf0NOGdgLPMkaqd
         YrwyObPA9KfdAJM0AW9sN2mhMjnTGG86m1TIe/UFC6lBL20ftKBsN4Hbk9iT99fsy6/p
         diEp+RNcfS0z/KTHSeKUhLSWQD3az+RdfMWB2tJ3QEHj2gxA8DyspjDOkzMUEAyAHd4E
         w/k34cx7SmlTLH/Q0gMNC08P9LpWx67PQy5oyS1JeY4Acq0tCOZt0TGY9r2wymZ/CZh3
         pKXgrud6y555vky0c8jafKPWStn3HF7Gh9/Phi/EejQK/1xaShJRoQqAhrn8d14q9U4x
         cZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908689; x=1760513489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=ny0yysd0B5CjGbf7RBM7lSH5RoNXDC99X3avLxIaaoQYgEIT9R/kVnwqmscsitMSfC
         iJ658p28o99npQhDIaUfOcUPPUzCMFixkpbrr9UezNWAZRyDj29+OGuB4tAm7vJVl7tv
         t6Vi25FR2q4RFn4IcgdsqxpttjdnU1zXDjtlspsWnEQQCGlPtNjWpf8nmlwWM5SbhHNK
         LhqwoLpSKfVQULZJN0rlrDJupr8k/kHAfxubxRkJjjjverTVQv1lc/uaoVF84/vexAdS
         U2/ZYY5wT1aa8Z+8HilgZNFmQw7VJ72+vfZFYmuPJcsRFUspYT1hXwGVq5S+JWSB7KiU
         hicw==
X-Forwarded-Encrypted: i=1; AJvYcCVVgQ7KLumuAG6MLogeg3lalmZLklQ6DHfflCQ6tM6CiHGLDVQZ4axB+oERlsOdMda2hXxDLioEREOo8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTaq0PdC4z21c2ex8DfrCTUhkr1HMuOSM0QlKqPLsuieYO8vs9
	vqDsKfEobcXPVgq7sjorT0MrjmxWtTVHSXhKFVSAVfHzzS7NE1qAZldW
X-Gm-Gg: ASbGncvFAwRqddRUk42aVeLB5n+zv5cF1DhT4PFHsIYleV0NcKrX1N+m6FtKkJNDyDZ
	/EnkyrIhA0gn9kq782/BDWZ/iuSCmoJdG1NgKYpGZuZOq9lOzPOXSNwJNJeyJU6jrMfZAtOTelh
	GknxUghrTYH6w7b9QoP3B/jgU+7ifs8AEZ9CR/rmBW9Q8Ig6NVeed+X9U0TkSNPpF4D0ZGUr/zO
	HRp0RDE0moJMABeaLdrQt+tY/gBF1gA7oNSrldAdgr/uxdJ319lWNIkYpSS2iRcXZP+jbqGz4CP
	Y2gUFrJacR+NnX2fXSnXRav8001Ui0WJ5vSeVA7xMr3M4uIkbY+TQKMNeq8GTMGLqLiYh7rgEGx
	BrE4TExYyz4guuAffyb+d4ldc18d60GQGXliLpQ==
X-Google-Smtp-Source: AGHT+IGnZcqKqG0CeOtJ+fmzvG5biXeb/ChpdaHmR1TP85hnqOnS5yRC3IE90h8eaQFZIrYCt7o/qw==
X-Received: by 2002:a05:6512:b96:b0:579:fbe5:449d with SMTP id 2adb3069b0e04-5906dc14a3dmr717226e87.24.1759908688715;
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
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
Subject: [PATCH v4 09/24] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed,  8 Oct 2025 10:30:31 +0300
Message-ID: <20251008073046.23231-10-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

