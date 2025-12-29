Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B19236437
	for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766991700; cv=none; b=RZSbwFWlHSYaiwJvVlz/IqMamFYAhWFD0GUFBAcGDzqVyZ1/MIMAjSCwqMepd6owDgCQcsXzZDrSaQkUxNVZnA1dTQZV54xxoagy7xPZhhbF4kBwr3BOcibYqT4fV1BMKzUvNi/Nbz8P6opHFBh4klxKDXgO8JZllGFuJBcmDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766991700; c=relaxed/simple;
	bh=h2keJZQTTt4orCNWk1YI1WP1CMKaiyM8tZBdR25fcFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZNvuH4naUixSnM0VoMaeoI7G0qxaGtLZ9lLem7f1mz/QQryeEwakoiOg7rhVa920yjfgLwyUoKyUaI5jz4XngohP3KoBfeOOH4kS7b8BA9fFYwM+mbbj2S66DaRzrZehreDz0iOpIoXVtNc1Qg/GAqyuqBcWxSm9OqGINcN/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBPbaYDH; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBPbaYDH"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c2dc870e194so2165164a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 28 Dec 2025 23:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766991699; x=1767596499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=ZBPbaYDH0xuJKjqCgutSEDZSTGc04FGk7hfaPe75+gzjaLvZ0fdV4zocAHJN+kj3S0
         n4IBlzQ0rso5bFwhhU6JY4CMboQr1le/5Ll6ygjdCjJ14MjWrvRj/a3daX0hJJnJYvMF
         HBiW0iaJquQR6XURPrkoPvQmoZ7b7bT5Orma5Q7bGbTPoe0SdTTbGAUOtGiDbhp2zwcG
         sMnmFlBBpeCGUPEYmbnI3uj0Az2j2uq4rPTDxC1eT6aTDJVz7dQ7i14exMFJF201GkDW
         wKRCusDdx9+OGUTV06enq+0p+n9JMizC2r4DcYjMSEhFXPmjlTi5iuuOn7JzOr1cWcNP
         Q8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766991699; x=1767596499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=nAjCDXQKlTUH3dlIM6Gu9S6yYsXkD+WJThhOYqkTOPXo+2JS/o+lAK0aJzT36vNdh7
         Y9XqPq3EB6XfKGVewXTQXoO3QUoExIQaCj14kXOJ89m1LYOYzjoFB44rEq8mU/+uDm/I
         dweHbQRIvMKPcsGmlD/ZCyjVygIOG/TodCoNVU05nCDuEz3f/XxX4N2F7Ej7TbBMhf2B
         xhhhncWxOQSIZG+YxskJfA7zyNwSO2TN0ZN5vvpaVnWfo/so6Rd62shYBMn00K8P8U7P
         Ypi5BAtyf2q0wovnNUlzYcTvXiN2GJjI0nk+MxVQwfY+7YHK9RGml2Dp0fQ7qlUOE4I/
         zQAg==
X-Forwarded-Encrypted: i=1; AJvYcCUQVedj9jSIp1ZEh3uApJD+fYBqRv9b3AdZ8m1dlUv9XTIqxF2SEY1MejdfCDwczkOdbn4plpATIc1LuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5RL0jTsa51gQhwqyDihB2uHWEHraDy39Rr+AJuW1gI+wFNQs
	Yt52O+09dYf+tzX/sjN+rOD82bLTQJN8QrMcaX6qaDSodSX9juSxgc9c
X-Gm-Gg: AY/fxX6E+P+lENslA7Ohk3ca72/4Ehgl8WQ/YZ4m/fM4CNCdv/fK3BDYnV/iEl8UF8v
	UXIkSypQfJ//Q7J6n++zFbD9zIjsPPyQ+pAulZhOX177TVkKik0qMeRyRPxWJ8Q7DsiQ8wZdblK
	7kdP35sNpXm4AQuEs9IeYJhsnglY9soKpBF/A44qvTzxlL7Y1oUzoJ0rop13rH5G+1Vf6OsiujV
	vm/XU2D1VXBVM5NXS4sLnmwb/UZPWwXDqCuOCUj2WjbIvFRHpb6vr7e+XTUjasbePiWhLl61ILi
	xsQsn1sffuGp+f6sdHtwfNXVB/Ok9GBd9nByp5S8k7DzjyaQhhZNW2bu0Dp6KrbN/WyDTwECNzk
	k2IVe6KUtj/PN9Ckji6mpUGPl21OJpWJvd80zWpj8scJZIVaIVApc4AUG4kxseL1SLX8AvpEpdk
	L1pbf3WwJNnhZf6qvxbXKNA4pL6JxhOptuwvrEwc+q9OKNHbKHHcfYWWWIV98LPnQ+33G3kihLx
	A+vzGc=
X-Google-Smtp-Source: AGHT+IEg54VjCsdGwWrQZg836LQ7kq2l1RLk9ija49iOphX2yVvtnRWpvx5GP4wRoVgfNEIVMzd4YA==
X-Received: by 2002:a05:7300:f584:b0:2ae:566b:1213 with SMTP id 5a478bee46e88-2b05ec74b3fmr17880492eec.28.1766991698499;
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm73086507eec.6.2025.12.28.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
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
Subject: [PATCH] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Mon, 29 Dec 2025 15:01:25 +0800
Message-ID: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

No functional change intended.

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

