Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD417A306
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604770; cv=none; b=VGOvSYtll6Y+nR6yA5jiIyr4dwmMrlZbe+1Bz/Khdm4dc/WF6vuBJpbwRlI4/quOOVHxFhgohvMw9hVpuEuHyFjrni8mBNR6TqyEPnjYdVcFHKkHDYVTUPCExIEaSshEpCFOlw4X/T47pQp/TwiZLWcUMTDJYs5dbws87GTRzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604770; c=relaxed/simple;
	bh=YkMv6YjsyCNBVi5yIMwaJK92TSsQZwK3ovRalXzSm4E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSstd3NbdZ8hEQzjTO8l1QWkKe8f4WdJNWj9pctjSBV2w4omSPoz9nd7pHQXSnk6y+vpG/KrWzhWDB4BMO5dMypVQ2+f2RUZUTqQROtL4XTWIQLedk8FUvrsQX5fRbSp+9DOd1nfUg1V3AIREHbjKbdust2tF8aNkFONtNQyzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iySdujC1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iySdujC1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso4551255e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757604767; x=1758209567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y/244DiSphAJbtkVDW8SEmzh2Ums4Tc++EtjExWiik=;
        b=iySdujC1QrQC4czP+CEbV8VuLXtpy7ttLEReliaXH+L1WUDFIll2p2Nq2C4MOgFt7B
         ITpv/BKt9xlrsw2BGVNtb3HpzYTTk1Ocv14dn84Ang34rCKRSVBzfeC4Wqaa56AQDV2v
         sfk7eHUaJojWt1nZogl2kE31d4fsHxWURkdgsOyOpggTf6KE7C+2jGvGd70/GWCtqAsH
         Aw7vLyevFtKOvTHAqAVNw11cg4SEZ2xusdwrb1jjk0QxEr2mtlZ1cKSmoIh6JQLfvaHT
         rOOQWKma3SgRVzw3U6zqFblQGjJb2eJHkoYlpzoUMTKG3IGyQQIVljpGM/myjg66oYAo
         xFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604767; x=1758209567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y/244DiSphAJbtkVDW8SEmzh2Ums4Tc++EtjExWiik=;
        b=brx2y4LNYuj2bxzOoeoeCzbOCW8nWGz41SsaMNj9+mDsffJainbvkodbC1O8XacIXn
         7Jus3hBbKcLouvEbFLJa8t86F15/Si2Q26EctgqCOdhMrdVlcHQw1Lc6R/e8un3jHMyR
         xbUR7L3SX3+IZuhj+ophp4o74Z2pAvgnCbm/vyLvxKBzRTh8CVmVEhtBGtPiBqHz+gJU
         Fafk21jmcWj9XyZfhKiIlunaU/YY8qM7qmwZ+xpFoasgs1KokWEwXmQicYjzQCi5ZR25
         1++4uE9NBpz2TaTQ5Ly3BR0HF9BCcngmNzDvteSDjPfEvMLNiuGle2szW2YgJ1jHqbTx
         vb7A==
X-Forwarded-Encrypted: i=1; AJvYcCX8iyhNrwA+tzYns8WlI+mYV0W0Vdw+VKxTqJUsRYueZR3qhMzyOm+f5YGujNQJrdiNzuW2LzLXb3XyBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO4Zm6Pxiy/qe6SPFOIJ4wxZfLOVy/KJFAvV0HA2Hefxrb2QMu
	cWdD49QCdWmnyOJLxpZhdpahsEWvOiOsQoat7iFwAQwicOr/rRWS9WDP
X-Gm-Gg: ASbGncuo4qabAJRWsdlWUF8C1uHzaE8ClH9howj5UKGSL2ZZzAWfas+yjo1vyrqKj79
	8V9AVe+hWFk5OzF5EUv5/NoxEPOi/ddNmyn4dcaD7pniPYWTMicA0kBNhJXXssVuiSSSCjUbz40
	JozHnsSwg1VjuQxNKdqDinA9Y+gN3ZxP+o9zEuqbkC6xQ4p9ZeuqoC2R6VwKTKovfOtus06KVot
	oUaiH25J0NfvQWI9ahY+EL9qDIJAdFlFLdSJpiz0TatcoULTnC5cRhcMWy5WfalJtcVi1Oh05e3
	ed+UT0VL111x5H/62bF/+ko6324QMqGLk+FZ8AZGU/48g2GHwmrqwFtCcPx1sGik0j8MBiCjj8e
	A08bmghioOYxXnG6YJ1rhcG4tmejXhjIAf6g571WNiB9Rb1fS9jF2BvICLQRzzV6JV84rGxgEIE
	3ox84aIZ7RXCjI7yq4lICuPvEyeeCo3Hh0Smc=
X-Google-Smtp-Source: AGHT+IGDFl50WTcAW8FK5GtCVqo1WVM9JouN+PbJLJQUqledX8LqT6eikYMKGBvqjaGPWeZ+ftRl4g==
X-Received: by 2002:a05:600c:17d8:b0:45e:598:90b0 with SMTP id 5b1f17b1804b1-45e05989245mr18195835e9.9.1757604766795;
        Thu, 11 Sep 2025 08:32:46 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01baa70dsm30941195e9.15.2025.09.11.08.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:32:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Add I2C nodes for Tegra264
Date: Thu, 11 Sep 2025 17:32:38 +0200
Message-ID: <175760472294.2784204.12720978219175288045.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250828102803.497871-1-kkartik@nvidia.com>
References: <20250828102803.497871-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 28 Aug 2025 15:58:03 +0530, Kartik Rajput wrote:
> Add I2C nodes for Tegra264.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Add I2C nodes for Tegra264
      commit: 7afa0f58751a85bae003fd1f0a283b9fbe7611dd

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
