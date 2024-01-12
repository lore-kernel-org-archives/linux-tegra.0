Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50C55799
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtkZjywE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e67e90d04so1455155e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 01:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705051994; x=1705656794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdbKxRGvPxBWpCgBSE4r1aRsqUVNPZmEs29C2GWmhhw=;
        b=NtkZjywEsvJE26ej7S/k7KKBrdYFy0w4H+gygNKhdDlq4uVtnOJLVPpeBuuqxoP45R
         59e1Qp64gdxg2faGMhay5hlUiGButmUWiPmdlHBuvls6RpHcOIqn0/vqNlkJlvO+uiA6
         F6gzE/RK32SG6mWk/xcmmRsFlvQO/4Tg9Z1uA4z5zy+O40PHRJgZf8ZCTm2hnhYZfCM8
         PJWa0x2hYx6vD912l/tPugkfgLxm+ok11GMefy6y0uooG7UrVHsWlNX+CNOVdg8M/R7c
         2jzTbeuhq+XyHRcEQgU+I/O/wxL2tt3b+mSLZi2RwNvyhuQTqnFD6LInrJ+Kb4YRwECi
         spPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705051994; x=1705656794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdbKxRGvPxBWpCgBSE4r1aRsqUVNPZmEs29C2GWmhhw=;
        b=JE989+zvb0yKs+InbLUytYrU3URFmIEAdb7ijORI8hdvEfzz6kP7UFevcQbBNXsq/y
         aYhi7SVpq1Y32yD38IqJe3OF13VVpl1Tc8Agl6swkLL3oWlRhpDCh4xONhaDTFf08AV6
         j1ucBbU7XNI36L3z9JLqOGDye7RQlFIDVBs4UpPRjhKT5swewR38R01/FdoN25jDKxDJ
         7FMzNN1MEhYP7Va8sEbq8zhI6RKjgAuEzz+HNVuud63JsRNS/jyL2E8LC5OYLEbDrZBz
         MxSzZsmxwnTR7nXZxzGgVJDFA5/ninz+BGIp8EGp+c2TyoodY+SGBkTvHQCfX+xecuh1
         kXKQ==
X-Gm-Message-State: AOJu0YxWscTKkEr8Rge3/xjxkvld9PfYWkiHfMhV+VkLFBsgN1M+xV/U
	fc6gxWUJ+RFnAfBuB1LdEjreYvzzX10=
X-Google-Smtp-Source: AGHT+IF/NYjSIRTtayVBqUULHpCAh0GBqTmTrozHFjuRpQzT7UHUArYsbC+B8pvYzKVfm3Q1fZAmRA==
X-Received: by 2002:a05:600c:45cf:b0:40e:64c6:c877 with SMTP id s15-20020a05600c45cf00b0040e64c6c877mr374746wmo.123.1705051994543;
        Fri, 12 Jan 2024 01:33:14 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id t5-20020a05600c450500b0040d6d755c90sm5081692wmo.42.2024.01.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 01:33:14 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH v2 2/2] dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
Date: Fri, 12 Jan 2024 09:32:56 +0000
Message-ID: <20240112093310.329642-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112093310.329642-1-pbrobinson@gmail.com>
References: <20240112093310.329642-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the architecture dependency to be the generic Tegra
because the driver works on the four latest Tegra generations
not just T210, if you build a kernel with a specific
ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
this driver.

Fixes: 433de642a76c9 ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
---

v2: fix spelling of option

 drivers/dma/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 70ba506dabab5..de6eb370d485d 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -629,16 +629,16 @@ config TEGRA20_APB_DMA
 
 config TEGRA210_ADMA
 	tristate "NVIDIA Tegra210 ADMA support"
-	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST)
+	depends on (ARCH_TEGRA || COMPILE_TEST)
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-	  Support for the NVIDIA Tegra210 ADMA controller driver. The
-	  DMA controller has multiple DMA channels and is used to service
-	  various audio clients in the Tegra210 audio processing engine
-	  (APE). This DMA controller transfers data from memory to
-	  peripheral and vice versa. It does not support memory to
-	  memory data transfer.
+	  Support for the NVIDIA Tegra210/Tegra186/Tegra194/Tegra234 ADMA
+	  controller driver. The DMA controller has multiple DMA channels
+	  and is used to service various audio clients in the Tegra210
+	  audio processing engine (APE). This DMA controller transfers
+	  data from memory to peripheral and vice versa. It does not
+	  support memory to memory data transfer.
 
 config TIMB_DMA
 	tristate "Timberdale FPGA DMA support"
-- 
2.43.0

