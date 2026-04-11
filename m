Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B21DDA24
	for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941897; cv=none; b=TYWus961ce2I1oWzv+S3w5yCATBo9CiMrcylglguQY01MPqP1Bc2RI+eYvikoNvooq5lzFT0IFnaaUwbArNDqW5QJA2GtPTCPFY88Valf2WeibxYzq5dCGpwKhRlil5FBM9Ddmw2ER5a+zQ2BGtlOMR1Tbp2VSgu7lIQj9xOQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941897; c=relaxed/simple;
	bh=gi15hcyqfgdadvIhdvu5Qn7qP7o4w4fImY4nXxFjqQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgHNohPZw7y1TcHrlwl+VTWVQpZqxijr5VLKpBj0S9N1WxS7WdX/O7/tW9UwJc7/EkYHukMGq6WRJoIUWa2agK2U/ScTvdQinmMeH3Xvtf5fg1XmSAFJlJl6YfjhS1ff6fWtQgI7jc1znsE4Urva2eqifCzzTZCwqJC7NSkn/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixj8ZSCf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixj8ZSCf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so4484927a12.0
        for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941893; x=1776546693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=Ixj8ZSCfh9qoyLBz05ac4nnJJeza7KmqAD8wV816BmzFZN5hwn0CqobIIF3Z98nPJQ
         d1mFxY/boyPEG3/fpS0fr7OP7ltIrnVm5S/rVPX5MuYVZs+97JXkES534wjObAWrxSln
         Edh3zs2miqDRGa0YcYp6EwEbP3d8dtRAzrtUtiGDbInT9xqR1NrcQ9DKgCJdYY4SNjfe
         woVUlpP6RCizXf0wRfvel6Aa2MKCl+SekvcNN8ujiz+UUjqlUGiO+s2Y7bZbFrURi9ds
         9141oz4vBiZoAJt7h7PATVjpKTijn+//SmhG5UOkkfxv0grMEEaOtcYFamnGcM4fgfJA
         Jyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941893; x=1776546693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=tVqAB+VKDkviyuvqO89YqbNPIU0TKReseb0G4QJC2UOEq6zFR3jCzbggqBn1+WuJP5
         d21cMD4+vcHSkIAdU910iGOepJjVm0F6UDT6vyTz/PmdnxiodIYjjVuVtxEHqyEPX31R
         Pm3uvdeIaUxODq3CvMO6yx+QplsjE36HCmkHbfDBalC0n/zbdjnRqnBOYMXQS+CNxz/O
         43seN34HJYwOlo7KDPdE5jZ6IuP5K+U9E37tDLcX74bYPC79Jt1d4HaOHXDmBZ04poEH
         uFw3Un/QVGx0yuVnbQ1UTKeohmh875/FLnG+Z31PiI0cupWq+gbthBN0zGyRLpSqZwQR
         OLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfUc+bfbKodDhQOLgegfxrBpwmsAF8xhfKU1vjcSF2toqGJLCd6MaHFFUXmAMqMGd6T+IFrs8Ks8iiFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWC5kC28Zhta0C1DV31g+ZOi/sf+2MCEsVMf2s4/pj0SP6OrHR
	A0aQFLu5YfxtQ+IwxdWlvHXtToh/+Txh5xneLouN3e0RefFIjVr+acrF1l9HsslC8SE6Ug==
X-Gm-Gg: AeBDieukorz1JzfnAZTX/Ij+3H60DXkbQ9boCChI0MLXVnJBOtjVLq2FYfxcNJgq4us
	mU1714cHTN6vSyA478YUh84aibssYp+vQLev7I918uPYYvQjYQX1LEEhUzpKFDCREY2njgRow/u
	/TVke6zh0JDfgYx20zBMMe97qQZ3dR9j6Pp8XI2KDRpMH79zb6GnZH1iICINZM4YpM5Z6fT97zk
	jrjxjaJrDSr4+SbAYcvZvhFlqPbuxhMhHu52purGCWua70pnTk6NIFU/Q5LQ37caQXb5NlsBueL
	ji5gaN8LU9XDJCLOKHw8LnjdSERLTz1a83z/9DrNBq9H1RAbnNqsroRAXholIMDTzgxNzNqcgRf
	AmrXvUYAcpDGkcHSj2NjRnGaPC2uswTQ4Qa9fhjYxXawX2NwG87prGxRlC4ReBSONVMzioKe5wJ
	x55N9b95OqRMSPO3lZ/55SbKuib2vl0tsjsqmM4wtHrs7kqj7Mhu861gWisPtncjMrKuxnX65lP
	gOLYeFrbcwMtc4cqConb3bAIVhvj3wliekknoPeHqG6dAIkbIfnuD8jtbW18A8r72gYY6ueM5mK
	jdGzcw==
X-Received: by 2002:a05:6402:280c:b0:670:64fd:2301 with SMTP id 4fb4d7f45d1cf-670795162d8mr3722324a12.15.1775941893193;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:31 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/2] staging: media: tegra-video: fix wrong return type in tegra_get_format_fourcc_by_idx()
Date: Sat, 11 Apr 2026 23:10:04 +0200
Message-ID: <20260411211006.150782-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is declared to return u32, but returns -EINVAL on the error
path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
which is an invalid V4L2 pixel format value.

The caller tegra_channel_enum_format() assigns this garbage value directly
to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
giving applications a silently wrong format descriptor instead of an error.

Fix this by changing the return type to int and propagating the error
correctly in the caller.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..afc7327ef318 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -77,13 +77,13 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 	return -1;
 }
 
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
+static int tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
 	if (index >= vi->soc->nformats)
 		return -EINVAL;
 
-	return vi->soc->video_formats[index].fourcc;
+	return (int)vi->soc->video_formats[index].fourcc;
 }
 
 static const struct tegra_video_format *
@@ -395,6 +395,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	unsigned int index = 0, i;
 	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
@@ -405,7 +406,11 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	for (i = 0; i < f->index + 1; i++, index++)
 		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
 
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	ret = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	if (ret < 0)
+		return ret;
+
+	f->pixelformat = ret;
 
 	return 0;
 }
-- 
2.53.0

