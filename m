Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4A2BDC06;
	Tue,  8 Jul 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963310; cv=none; b=Hl91mczRsxUMJgLeJrqC+T2Bt9LRGAE1X+1IyNKKg7etcn5azhKG9NS1dynapRdDBTfagy2+kU3sicgsKAg8siNTJ1ltHEWZWVBt6omBgy7L741B4GNazC5AINkKVpOt6ZmTG6pqdzOMtF/D8KAsc1l7k8lt8/IvksBWOO/b2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963310; c=relaxed/simple;
	bh=BAszpT53EvwYJ9SjB16QzPApCtcdJtZB5nD84OOHbuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZhFTlWVzCeIwmrA4J3t2YEZmq7hl+0bdYJDxOO1hoq8raaHpf8h+DpJGMUFnsBEk2YOrCAzw+LuCcPoxkRTCl/aUyeEkCkwxrUvSCg1gHwLrNa/YRG9ca4F1wJz0Dt9+0k3cBPYPxbUMCp1OX1ozd4a2y8Px7bZvDTFVRmpSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNqEl+gT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNqEl+gT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3184675f8f.0;
        Tue, 08 Jul 2025 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963307; x=1752568107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjtCRFWFffW7pi1vnTbfF8R7o1inZ//6KtfO8wbs4Mk=;
        b=GNqEl+gT97TKvtgS4f9XjRvhvzXaUoe+RN7VtLcRvItJxOOM/QT810H3puHI8QpJd0
         Ny2UDLn9DyHk2xzXhfrC0lnv52MbDI3BSQgiYnh7zwvv2NCr0TJVK50OltmUOqfL8cDe
         sNzEMzXd81QgpwcchsdokNvvzIBY9x9QkPn4mG71G7kxnHWhyxHvW/wfSwoprD+qNw42
         lVrCjVlmfI/1F1Ys8oMnruocfBOVDSH8SE+hapCwaSMCviOPUn14tA5SPzNhMxefkLib
         BDanYGuVgHmXQCZeIdFVdySKAQq0CohxBe0ndDq6JbPu4vKbg9EqBKb5cY4/uucC1DrC
         Jj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963307; x=1752568107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjtCRFWFffW7pi1vnTbfF8R7o1inZ//6KtfO8wbs4Mk=;
        b=OEFEcaZ6J+pE1K3i5BZj6wswnjI5SNP1qA4oiLa1lvy9VFLQAGCUIu9nIGTKlp+yIZ
         f0Ddi/UIG5tb9NPviuzor5i/ck/9gjjLZXXBGb6O/NcsGsdrCyWdYkbGO7nLGfW9bT2P
         e0qFs4kymLkKc4Uo/DUMJB/f0usgWCwCWgbTNMQCdFpTxag9MULXlpvZHzQiZiM2TK4t
         QOvPUU3GWN3K67O8vfjG+b6BnJjjzBVuZoHAvdgdqsn3/ln94Q0qSUevFHerI2BJxtTA
         uHf4WOPa2XWMGG4Dp1JQNBYos0/xJtAkogyJ/6nXgHzkYMjS9dkNaXRG+kGZh51uisUd
         Vj5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDGUVzxOQjOZvKE++jPguL8g2zR17mdVoLrI5wb6Hz9D0kxKcuZdLcfDBkoF36x9lOn1d3duKoYQag@vger.kernel.org, AJvYcCVKk++mTQd++qs5QL+N96nyeK6vWy15fKMcrliqjt84faG30rXsW7rZ3diRxq/vFH6vtKLIyIlgpSaTYww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE53y6ECADodjKFdNyvoT7y8qEUsnBj3kNKQgpXtU0G25rYvLt
	lP1yXj2Xd5MhuyN5Roc2wLxRrYEEdUZx4erR8OWlCmg2Xh1pSrMkC9BB
X-Gm-Gg: ASbGncsUtdEScopG2Ez7Orasgit6ERAv1KUzPYjFPQQFefovF3ZhvzjyIS9as8o9oh5
	/7CzHTaCfbHJUh2XfBNrQLchrx5y8PV47qZ2O4iGJu71C+DSv4JG4r693nC1xjsPmQJ1PeITJx5
	XayG4X6RHfbH5V3F0UJT6Wdy5SbxImGdcUopfFBIBdmz2pSI8l3tQ4JdeVioKXo9X4KVphWb+gl
	nhHpDc2EdgAXW/Hv8J6vNBvwFTS9OjQZLE74PAnkHZf0/XfIkSIwuWi5XbhqJoFBZwUfTJkyj7E
	0ZiT2xqQVyzwLNlzBaKcsxXKlzw7RKG/KkaJDuiieVFPnMSVJH2pDJYpQmL96U5JcwkmexahChj
	R/ve4j8lvabi5fqFYE/GjrA8TGqAsQFGDU8ciPgzsONzDw2gPNP/tWA==
X-Google-Smtp-Source: AGHT+IEwEr9ZMYu+ucjTyJNWFnMG6wJX59s5qnFOf9Rk+CQvr9zKaNfPUVT47iH8O2QDS+2ETbkW4A==
X-Received: by 2002:a05:6000:2c03:b0:3b1:a735:e6bb with SMTP id ffacd0b85a97d-3b5ddfb893bmr1457603f8f.4.1751963306857;
        Tue, 08 Jul 2025 01:28:26 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd45061csm14579635e9.15.2025.07.08.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] firmware: tegra: Fix IVC dependency problems
Date: Tue,  8 Jul 2025 10:28:12 +0200
Message-ID: <20250708082814.1491230-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The IVC code is library code that other drivers need to select if they
need that library. However, if the symbol is user-selectable this can
lead to conflicts.

Fix this by making the symbol only selectable for COMPILE_TEST and add
a select TEGRA_IVC to TEGRA_BPMP, which is currently the only user.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index cde1ab8bd9d1..91f2320c0d0f 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -2,7 +2,7 @@
 menu "Tegra firmware driver"
 
 config TEGRA_IVC
-	bool "Tegra IVC protocol"
+	bool "Tegra IVC protocol" if COMPILE_TEST
 	depends on ARCH_TEGRA
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
@@ -13,8 +13,9 @@ config TEGRA_IVC
 
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX && TEGRA_IVC
+	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
 	depends on !CPU_BIG_ENDIAN
+	select TEGRA_IVC
 	help
 	  BPMP (Boot and Power Management Processor) is designed to off-loading
 	  the PM functions which include clock/DVFS/thermal/power from the CPU.
-- 
2.50.0

