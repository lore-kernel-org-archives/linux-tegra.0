Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CDB283C83;
	Tue,  6 May 2025 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538308; cv=none; b=OJnPXWkU1Vx39+i21Gr2Wy1rfMEL5ZsMO82iYiUZChlVIzim+E8aDHkwa6rc385970nr8x35Pdk20AemiC08KOk6bdzFAMbCFTEaNIqrTXvikmvrviPBB485LXDBmU3344xarnry26JIqWy9O34twCso9G6rRMq3xz9kRGPoOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538308; c=relaxed/simple;
	bh=fh6t3Va0luvI2QKNyRL/1RilywLBR2QSkMz6XdaHH1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAA7fy6r3QaE8qHB7XZyHiLxZ3uoJLBaRO4prUI4N/7hv4sq1ckcMqEk8fAOuR60AVlJL/jNptvytXwmVxc3e9cMep9T0tDJxcfFYsbQlnwQ/vFCqspFnXakeKQZHRWMUPPh+DZkanM4IQmGdJl9aaKhU61o/CrkutWibJ8y7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDcLJrHB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDcLJrHB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so31967225e9.0;
        Tue, 06 May 2025 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538305; x=1747143105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57IWby+qaE9u34TVQ+Hjf6+RWk1LSFPxd2VsjtgKr4Q=;
        b=LDcLJrHBIPRhmMvHVjhNYm/ew7+s3VTgMT768UVW5XVHtQKXuY6YhnQEXbaJQlwdJc
         rfwbC39CzyWCihYwgfE2xNTBuUsKEWOiq3+NJVWrrBdu3c4G3Utf0mpu3cc9YHVcRy7+
         faL3J7OHStuLwFMAgFQScuPwGcpa3EChsaFvkx73AZG3k27PjwZrSxh8lq+JN7RnNQ+m
         Dn8+ihEg9EDfgxF3EhmIsp62dDUyHPByqYiW7oTZkLXcnoBCc37V3nrucfndGHx0dzN5
         Imlt+eFjeyldcnAmz1XyCiEKdQ/b2GBfnJ0zRzMT/1tdZOUb2LJ/0SgGWklrpsVm7fw0
         C24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538305; x=1747143105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57IWby+qaE9u34TVQ+Hjf6+RWk1LSFPxd2VsjtgKr4Q=;
        b=i66LedDj5k+u6Zb0rr+tuzZd7gZoLx6KGL4ZEuZNixuRtCypDyWtoHK7KUpccOrN4m
         L+5Bu13W3fuLHeagkQ7b4orpeOQHEPbmL2obzRu81WTfN0zgqlT+TVUYvOj8POR9RN6Q
         DWNrGDx6fknxVVxz/tHrKquRXu1dT0RZK32VtrxxnzvHs71ErQatoIWb0FTLUvtqnvmE
         1tq9dbrwGmXl2Em/2AEmqllkGtHOyDwqVhOhqguk0XfKlFVrtc/azwX260J7EUFgmB7G
         TlT9jOGCq0VqmJoEJZDg928xTmtIk7rXDzambCYTgoSNIzOW3AoMNQG4gT276C0eviGc
         n3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoEpFHR6Tle3jPTDLV4H4E/I8howJwZdDE5a04m0HEbpLbUhcRTI0HKFwv8YxGMsZEfQrLbh/Kp0woYFE=@vger.kernel.org, AJvYcCVg30gfbEO0TDRkBdWpSd8aecp+eYU5Je6lP/+bjjuI27hm9aSZT4SAuahTOes7dGKB/WZBl8MBjTXB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/6mDTf4KH/Vg4krALB0J/pR14q8O6MOEGl2kR0Oy4KMzyI1CU
	X2BKNobkrDCu0q4lKjk2rUpvhIx6g0Fi5wIx5PS8DufuoTaJBMrB
X-Gm-Gg: ASbGncsCe1klH2amZCVJvWfomnhPjzPLQHKYwGkFb1VB0og/+ZRArALN6dp0dzPmKxP
	NAtFIdlIcl0NEmFlhyjELfztnL5J41ZnG9qZq0MDDlg2CWEtxvVWNuN78w3b0EEILC/803YQX/h
	O+GxpIbCNRwtbZyZdSVGBTYw4mFeEPee8AiWR/ynMXejkIBtpZdR3ZJe4mDe2J/U/Uh+dV9G7H7
	qgjfiblzZIxNfUcOnr4UUXLoEXaxAmAHMztXpD45ErGFFTQTn+/ECWAbol9BYKau8NFETy7Xlzd
	NXv3yNS8YdoNIDuUFnZoqe1ZJqmX5ztIbf40/mlVBVoL0tPIkjmfjnsqkODUZBIDM8tCf5kjms/
	tPhrC0h4g2sQ4Hw+FdWbgND0bNucPnDFF
X-Google-Smtp-Source: AGHT+IEvv1Z5THS5tibUElgI4dKx2y74bPajxwMQy9esgr3008eK8zCwSUNUF6GXyvYpOT2zFugfQw==
X-Received: by 2002:a05:600c:3d0c:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-441d03960bbmr35914845e9.0.1746538304676;
        Tue, 06 May 2025 06:31:44 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee39esm168868705e9.21.2025.05.06.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] firmware: tegra: Fix IVC dependency problems
Date: Tue,  6 May 2025 15:31:16 +0200
Message-ID: <20250506133118.1011777-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
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
2.49.0

