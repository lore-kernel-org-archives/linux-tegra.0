Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5550276
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jan 2024 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGT0w14Z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e5701cbbaso12175735e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jan 2024 09:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704995081; x=1705599881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BowP+D2Klve7YyGqH04nTvYDcH+q/lMuRdxb8P1Fl8c=;
        b=lGT0w14ZNO71esjnv173MfyqoyBG2+5DD+CzoZl5ux2nGHBNcM9SIyuClsWxTYjxEg
         cgfmZIntJ3MhNi7/II7sf0kEohtHSbD2x9vnQymz/THY47aYPEzvE+LH+WdsSAlWNZ/l
         Zei0fveIIwoxqzFthDPOcd24wrN3W6dZBTkUPOdtGEtzn8zF7izQMdD8u4ysPKAvuEXM
         CeWrF9im2mmQlVR5c8kcoli9icGRsYRCzfbGCGkuF+pYkmB0/NvnfQFJS3YFiL4tojIO
         cecbh/N4bOe4opai7FJjDYcKmJzOGyhRyBS0t8kmmnSEIHjRxEGKajgF7218ndlU7eU3
         Eyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704995081; x=1705599881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BowP+D2Klve7YyGqH04nTvYDcH+q/lMuRdxb8P1Fl8c=;
        b=udyx2NgysbVmJyK8PbFx5fKi+xcosvpbyddJ9Izp132s1/4N5VXFuOzIFeygGgucxu
         9eQsaccPo2Iqqh85n3pbVotVW7Qivs2SoKsJ/LsHTj30txFIeEEeTdUW8AejdgEVZSVj
         Yng65KVfFy9xcSwxUj0rKF6g6wCdwvCmyFuu3hONh7bIUrK9wIcE5AvN85991vZEgXMI
         qXEbNPwBqGFR2KydBCT99/jE/GhSrIfw6bKmrfOOz6XDgAEA+WZxEhZf7jp0g2vL2/mj
         a19oUgOa1G7dWIUGW/iNRYJL8rhvykjoGdWTkqwTO7NQBpQp2NYQEJkJSNHZBGodGalc
         9Lng==
X-Gm-Message-State: AOJu0YyZ/K8rkhe46nsNGBdlROgm8BlnH46o7FBLaOXD0KNx8fgcK273
	85z4xdHlykoOPG30kW71uW69xfkbAFc=
X-Google-Smtp-Source: AGHT+IHlwfdIabPbYadRXnJUbWzf+D3IQoJ2qwKURZJV5yUW/QBrcRMHwJDWv//oEiaFZRo1bnyf/Q==
X-Received: by 2002:a05:600c:4f12:b0:40d:8850:a988 with SMTP id l18-20020a05600c4f1200b0040d8850a988mr785147wmq.5.1704995081044;
        Thu, 11 Jan 2024 09:44:41 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id q6-20020adf9dc6000000b003378e67fd2asm1075593wre.86.2024.01.11.09.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 09:44:40 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
Date: Thu, 11 Jan 2024 17:44:31 +0000
Message-ID: <20240111174436.183920-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
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
ARCH_TEGRA_xxx_SOC optioon that excludes 210 you don't get
this driver.

Fixes: 433de642a76c9 ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
---
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

