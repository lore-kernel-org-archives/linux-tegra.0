Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58830DECB
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354357; cv=none; b=RSPgcuniHUCeKrb5qOxdo/hmh4p0suMBduuMa4XtFx/TfFnCafvJPezzs6dHH7Wp/T0l9vFBRKML1gXn4SZTuS3FX5af5gIB3iX+kBACX7Hi5dh8nxd7Frl9WsCWxAvH+OfsVZbeikJy4MGBtreEuiohEkmGaugJDi1TMFsnD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354357; c=relaxed/simple;
	bh=2ypGmbMRjHkuiK4aTiukHS+p1dUsv+EdrHXZ0KGp3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzskaGV1I937hEVpslxbAGo6TG9c9VAf5oWbY6cLI/3PSbZY9H6EADH2JAFhmUm0t8hwblRe1a9n2HL0VWycuA5JkudY219TPmTG7FR4SiHY6s+wMJrFyLxWJqx+KORusf/806bbCHMsPv85aUtO98W5tZq2YT5qSdIwN5KLPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThTyo797; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThTyo797"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78f89501423so134749827b3.1
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354354; x=1767959154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=ThTyo797ptVMzfPBjytUaQJY3hHC7lRC22rDB2tcqPx+kRZJZUs9RKnGKcC4C8NiXd
         siyqYEbQrAxc2pHa4e5Z4HL8NK94WnuNAh74/CJMGsjnTGRY2sn4qEHJYW5Pu28/b84Y
         Pwvd9zoCcxf/Ai5pGik7ZRnovESW0bRrvtA1p4dfgCsuMEyxu2A8t5r5RdeRr2JqFFTz
         uxm/ctLq6VbUedpn/Q/XzukwwiojVGbMsy5iUksJ//IM1OYsRfTB1C4FP317uWV/JaIt
         TdulGuSrdSGKcicjgnntUqpPS/w8o7cwn7sE4R8Bano89jb3HH3qNbrm30O5nqp6ZGiW
         uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354354; x=1767959154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=wl9/6eSm7qdQwuOKCjheFhmO8wxpk/XE4qELp0GuhP/FTYw0A//Ir3dGxtXBDzAjx8
         7gi+NAnRfpQio5zWWUAp+N76PaP9bwXL/Q+3ajWEVYJZwlseT4it0XJHhF7itXobUWXc
         VWgQA4LZ2ll1YUVGHKSMNsyaVrn3xD2fZOu4tDRKOQxFWDt+xII5ZPXsIuYcPYKgGU1b
         LcZAMKTSlCe1XEER+rmvcmtdE/tW8u8zCdhzXv4RdnsDdgmEObcYEMuaWGkXdDnu6rby
         j0PYM2KmjT6yTpfLsfZd6xbdZq0AxMJEH78ktRll9XjhiuSdB2qX9jviXFu/72SZoye5
         t7LA==
X-Forwarded-Encrypted: i=1; AJvYcCWKycLXd27wtgawT+RG+jE+St0qXYFu503zKMmUGuKq3Pj4kV+BQ7grae7XsHlTK7JQkd+UPY178ZL2Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUg21a6yyLarjVuB8EuU5oPYXv23OWZCJuqxxvk2CRKjU9TpP
	nShp/+kFpTxQeuvm86TNWrVm93wEaS+CNx0fFZ16p1eks8IiJVfDF7Se
X-Gm-Gg: AY/fxX6TgSWcxB+oNaIGL1TJIY3cdmHKW8hC4IBNfklCy32mQJFQZpHceFY4aIRghJz
	Z+fqndy1frWqNqYMjpBu1l8fSPCXgDGMDsPOJjw0NC/cr40PvoA3rPhzXRBh4lWosmA17o98N3S
	ljHxXZlQIvHJnS5XRw1CydTk2S2IBjB+gvEQG/QYJPkuoyWG5x5IAfpQeZIiJQqjGhWXCTtbtPQ
	BN+XRCs+U1UKSz3TP5Ovg17ArpC2bDiUqCercfG2FisZ+dQOB0lfGafOGqsUyHlrJG8uSatBIng
	IvGodH+kdNhmneVRy4TiKCaWVxQaGvWZUNHT0t5klWf/mQk3sRcNVOq9UycELSXlrPERjs0yXta
	9ffiNPnd45romZ8/4cnWlsIyRAxooQmThX1Eow8ga45JBJV0awQlk4NxnRkMpSB3iKtJ4K51+rg
	PDdytzNKZXepmODvPQnEQ1Cyka/Hvo8TEaZ/mGSJICpCx+9m7zK0DTqPImKpC1cZny3xTYDnpJq
	+pKnn8=
X-Google-Smtp-Source: AGHT+IHQjwf66LpwbH+zQYAQHv53uj5p0N7n8ZIHwmqUY4C0r2zhCHWhI73039OChAbOqw/5A0P/Bg==
X-Received: by 2002:a05:690e:4089:b0:644:7ad3:6528 with SMTP id 956f58d0204a3-64669dd878bmr28580521d50.41.1767354354292;
        Fri, 02 Jan 2026 03:45:54 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:53 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Fri,  2 Jan 2026 19:45:00 +0800
Message-ID: <20260102114501.42312-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning:
 symbol 'tegra210_csi_soc' was not declared. Should it be static?

No functional change intended.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0

