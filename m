Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17B1922FA
	for <linux-tegra@vger.kernel.org>; Fri,  4 Apr 2025 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765432; cv=none; b=MpT+wzAQNURU8tuxUwVMXTDWJ8LW/xvhq7GEguaz4Tl125El0D9gf6WNrI1Va+2tXbCbiAmqxi+P9k50U3CcdZJi7CB7fln7cZk0zprCTfCpKUcl6iti6UISmCcB+McU6tEmUVKkVhwYmluKoNZGVayYDPw0w1G8sgq/OgCtVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765432; c=relaxed/simple;
	bh=QzyUuYe3zsuwZKOvF5UK6gULIps85MQVbSvxkO1+GEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhhoIgyQntsjXZznKlgY3Yn4AF9LJTJd7k72L5oLyECIozZjDfSlrL098MkNEg4MQCoJCjg2xnSv6NVpx+nC7La50mVjT8iphsv7daL/skPKduDbxhg1QuGctBVWB4724HKYFE8ocMxgc++HIciblsYfta8bKE/LpDO1QPUcU90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ByJNf/bh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ByJNf/bh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-391324ef4a0so186508f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 04 Apr 2025 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765428; x=1744370228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgfvES34/jQuo5gJMT63Lo7MUqSbZlUCNclRmTokpVo=;
        b=ByJNf/bhnXq5zknTL+p4+EnzssgUa6dCEgBImYayxaxP4IKXosttTvbv5yjXKMUoMv
         1cNWb4GU4s2tazNnRsfNbXH3GA9LYYM93o1VjkZJEl0zp79ouSwUcrnzDp8CrjdveqJW
         AyaiUltq37xlrnlRvQ+Io+yqTTir/ST8A76Sez4hMCUGjk0TC3JnT46urfUQA80JcLch
         gRcHYXxT9a4BxiSgiT+2ObGn8PmoJQZ7oKkSyQ5EAt4ASdwoyfoUJpMP0N7Mu6pnAkc5
         e0bg1Hn4aHzuopwuffYv4EjYBFrvvF6uPgO6DptRtdwUIPV+kCmRHgDSeFhcmlzZ/PNL
         f4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765428; x=1744370228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgfvES34/jQuo5gJMT63Lo7MUqSbZlUCNclRmTokpVo=;
        b=IXwDEipDOgEFNOCG2VhpWmVKfs2PeL7bleDt6SRrZWj+7vXsmRsDkivnuoEsAr/MCB
         z5GrjugqbjNNJMyUND0Fu1O8lhMu9BTNv7PBkRV1Y7lXP28QqvJQK6OQ+Ypp5UBg56dA
         O0lITS1bbX1SEDsx4tymnmHEGB9VPhumonz5Ijz+mgnm3mf63UG/IG4c6zHs007Sp314
         SLn8sTM2VdRQK4CZVu7I3u3jRhgFn8N6kAApz2x4vocjlJ54sYMODFV5BYKY7K0qe7fU
         S8S/5YxL0zV3mK4Mss+sLKDzL/IUTyTKP4bxTCoDlPzwLu/oh19oRrWi2EnUKOy9Ilag
         O50g==
X-Forwarded-Encrypted: i=1; AJvYcCXdR4GtCsQ6vwXq5KF6GYtpcWokfABc4rAPJ9afjrMscvNB9xA2uirgmuEM4EeIv3wJlgptMTAHSl27TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/Y8Rjlsv4nvhbrrzp2evN6fuH2+zvjskL9yOAavb4wzBpF7P
	6cmXeh0IRennlA+JI19ph7rHNs+bjpI71ElBj8QXJu4a59CLQENZ/uXij6yEzmM=
X-Gm-Gg: ASbGncti64QC4KynecQ/nAvWDXFgcpi3LW8asSI4s1BOCRuAVv7eShbOgLNAjGQOg+Q
	QMtHurtVy8bX+EnS56rc+d2+GhD+aTpUd/V1fklfaCNjecBwdELQCOYKEzxFObuznHSbDztF6EC
	K1gtI90KTqqdJ6f7olfNYBNBoW4E24GloMfG/7KAmDB6LXnTAKCpMrkUjZJZ+krIwrM9NzYeGss
	OvIcbNk2zmQkJIG641x8idE0eIsBfxOujIzlX7bQYQ8HoeP8ujA95GugkrSUdlT+KmSzi0Pp06E
	48GtEVxurN0zd33rQ8ZLxrAqfKUki68NeLID0HuGfdBdqLJTVEvMJA==
X-Google-Smtp-Source: AGHT+IET56a509a9xLEGWv2kJabDzmV8+5tDLZjOc6T+L8wxq7e2lVWdOkbx0eUnmtA+zDDFjG1rLA==
X-Received: by 2002:a05:6000:1787:b0:39c:30d9:2ad2 with SMTP id ffacd0b85a97d-39cb35a0f5fmr912126f8f.5.1743765427755;
        Fri, 04 Apr 2025 04:17:07 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226cf6sm4044377f8f.87.2025.04.04.04.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:17:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] memory: Simplify 'default' choice in Kconfig
Date: Fri,  4 Apr 2025 13:17:02 +0200
Message-ID: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'default y if FOO' can be written shorter (and it already is in other
places).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16ea..0174cbc448b1 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -32,7 +32,7 @@ config ARM_PL172_MPMC
 
 config ATMEL_EBI
 	bool "Atmel EBI driver"
-	default y if ARCH_AT91
+	default ARCH_AT91
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on OF
 	select MFD_SYSCON
@@ -147,7 +147,7 @@ config FPGA_DFL_EMIF
 
 config MVEBU_DEVBUS
 	bool "Marvell EBU Device Bus Controller"
-	default y if PLAT_ORION
+	default PLAT_ORION
 	depends on PLAT_ORION || COMPILE_TEST
 	depends on OF
 	help
@@ -198,7 +198,7 @@ config DA8XX_DDRCTL
 
 config PL353_SMC
 	tristate "ARM PL35X Static Memory Controller(SMC) driver"
-	default y if ARM
+	default ARM
 	depends on ARM || COMPILE_TEST
 	depends on ARM_AMBA
 	help
-- 
2.45.2

