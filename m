Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8DB25F97E;
	Wed,  9 Jul 2025 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102860; cv=none; b=SV17d31H6p0rkkPp2pvQ3z1qfen2L4Ig9PEM2SgIJdvtIPdDYFnuD3w7S/uzGqQXplKzz65h43s2kIBAKXIzVf5XVkiPR0LqvvnAgWBTcD2bpu1G8CAkkIORoteeUpNlS27lGlOKHnHX1PkIufhtbv+d/W2w1K8NWCRxKP2ndas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102860; c=relaxed/simple;
	bh=QGDQqG/SSiS2zbaufLWehCumLeUtHX5vmGMGi5BUn2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdMaGqBPY2YKhijNI7W3JzW/udsThyNM+b6xa2o9/1y0qLL0aR+PGOSwfX64MVhZ5dwDpAMD81HKtL6pR6BEV97a6iKodrm8MuhCaQCMg7IWLUhegMfeYHQvmTArpmQLoUzeMCBhLli9toohFGEoMU5x9nUDJHqNC3qATKztq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVVyNcNf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVVyNcNf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a51481a598so252379f8f.3;
        Wed, 09 Jul 2025 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102857; x=1752707657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oicoRjD6gtaEj60f3J9lS1Htl40hJZixmpVAIyBkxLg=;
        b=UVVyNcNfHlZMKVZ4+hYjMadEg4rPQmZwlukwN6PX5vvptXMDq1VBidB9dFe8Nkx0su
         bCY3Wx+T1UWFynQrFEy5byJaYKmgBmobDvpmcqKPjfBgBmx5BW4tDabneoGbg5iMZV2x
         8GZuA7WJq1GJpC+rVAJwXKv8g3QbCtKqwTf85OxZ1U/Dg3l3xlKqh2MPH2ZXYn3cMq4O
         0t5djMrVOjorE52QMZGhM7Dzg1TkqFccqGZfktc47zNzFQ3TFdneMJHOG8FNTCT3rTBV
         fDpB2BiDGgW/XB/FqpHZCVpz1eTyWuv935JQaBB4FiJ3yYULJ7/gZtJqqPJdpY93ebk7
         nmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102857; x=1752707657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oicoRjD6gtaEj60f3J9lS1Htl40hJZixmpVAIyBkxLg=;
        b=XeCzT99fdYA2Hkk4NT0wfnjNh8E37CK5zE10f0qdTvmLOfy/zsFO3+WbZPFumA56JL
         Ov+f0sWvJigNSME13rkywgK41On7dKg9abFPTrL6zAKTDbbnWo6bg5+AF70XBnUbQ/WH
         Mn5ZXMXSYMSydhhB5P/NB6QgHGYn9TiP1+Sw7AY+aKRiE5gS1lBSBim9ST9R0Ti1GH7k
         4IP9EpyBFx3MRGvKRW98i6lOBviy9SIZOxdpMJEr1u6hvGK55DL/Yw5ZKqzebAyX9ueV
         o5+3yArjE0JJHFwF8KGUgip0dfxIsQG+abGsHOvE/uWjBeAbHxY+wZuimaVQ53kWTaD9
         5dUA==
X-Forwarded-Encrypted: i=1; AJvYcCUheBxilWgSfFoWgARxGZvPiBNRXEOG8SxlLwSN1goMCBMN1BfgltRj758+nY0O68lrB/MXyo69KFol@vger.kernel.org
X-Gm-Message-State: AOJu0YyPy/m+dAhAIhAEgH/PAvpT4AgYuj0MwSaAkfllyKMVdtMUaP+Q
	wC4lrWNmiIK2B8pGHCnsHZab7V4fuEjPxuV+OhNdlzrEaFqgbnNGUtIO
X-Gm-Gg: ASbGnctE5/lEkz5eZ5JTRrfpu8TlOhcakPwOjccsVapJnj/RFUVi4tuKdIz74Jx7W0p
	EsC1xbY9MDL7UO6EEbe6e7ZKide77xZlwhqIy27MD6LRLMVHLti83+XBTvyDNpmyL8D1SJZ/dj8
	gB3LGe3yrpdfnjJ21WGhnJnpmZVvrVB0NGHV8Cr52TROnzMee65KTHilaqwfo6wlyfZxgA1voU6
	nOGaBcI5cLs06KggLdMQGCXH1aBbjsRPp1Sp1vyHW9k1t7JKPAIw9ji5mpc+qNNZICNoLe8/7zo
	Ct2MQLHd6Q3qRHQZ0EnMvxZSbUolRRdwIk1PXdKd1c2IiO/ORCmXVH8SPo4ICNCpwmtvdcgKv/Q
	mxVR1jtImn0wlrrZeeI88M8Eyxb/vqv5XoBG9G8lxVvwKKu7neReYyqKm/Heqwv7q
X-Google-Smtp-Source: AGHT+IEeIxIiPUuQMg+0LzXiKHb+lIgF9LJ9CFm6uIp861pwDP7vJsT4ai1T+DBcLw/2zhiAUXbu7A==
X-Received: by 2002:adf:9dc5:0:b0:3a6:d6e4:dffd with SMTP id ffacd0b85a97d-3b5e86721eemr393068f8f.14.1752102856956;
        Wed, 09 Jul 2025 16:14:16 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc22a8sm215669f8f.34.2025.07.09.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: defconfig: Enable Tegra241 and Tegra264
Date: Thu, 10 Jul 2025 01:14:01 +0200
Message-ID: <20250709231401.3767130-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Enable the configuration options for these newer generations of Tegra so
that support for them gets built by default.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5abe148c35de..417c35fa7ad4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1518,6 +1518,8 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
+CONFIG_ARCH_TEGRA_241_SOC=y
+CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
-- 
2.50.0

