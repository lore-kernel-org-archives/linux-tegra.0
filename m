Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB6D1D619F
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271792; cv=none; b=th76Egh0HdE+8ER2nYPwpdhZBRzu5+Cn/I3SENBvBq1vAENrHRue+HjDALUuwbXDAXx58agWTgmcxGxWrHtkDvbPRUK1XLORA8lRGKEK3rnN01NF3wfsK9l/S58s0KjXaBo7kRnSyYaYIUKQ7kbpGjAB7G3SaGnO5Vn5SMhR8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271792; c=relaxed/simple;
	bh=pvllP0ZkWi2ON6gFXmzcXPaJmOGF7rmVV+x23nVmWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dw2qlKamTWfl32aPlFLDZ7DO3o9xl3yd5dw4IRaJg3IGRi8AtG+IVHwypjZ0V6XrdfxNixqj8qt/OXoKW00DSWsuvtitPjiDIjhH1lF8Xwo2ssGrRYCs32WJi3M1cWCoSXqe2CdqgYWPejSzgqaRIVFRJybLYAloFrM38MJaSyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYPpF0Il; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYPpF0Il"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a528243636so1508344f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271789; x=1752876589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=ZYPpF0IlI7VaDtBuJqtuADACGnmhPQ6z4XvIC9qXfnDBcX/fjnWLdkWgucpAgs2A/O
         uDAEwIW7gvkgysESALY7PCjotQnjWmqbgz2AL/aW+XLzi/2yi1qTJ/JtqxUfQWCvHRf0
         uZcpx3LzTyZCHItGYdeYEVENJMVGAyH6UkGBbalZks4EcP2dl9YPpcJRQfKqSZu8o10T
         w3fqdkGHVdawdRk2nY8UMrx5UkYwB2dECr9Txa9uRXn4FFnCQCypd6iH9wXzFT/p2/th
         wLCghYNRisLHWhOWQf9MLipbAGzsgDXFUH1EZ+lMpIkD9LkIlzbo61Ljx1w44HXRCpF6
         1ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271789; x=1752876589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=MGrcmo8A5kVCM2oBI9DjJgYgjTmgY9Qe8XFh/6axB7rgiAzK9d5y9YtJzEziLb2xE+
         Fm1BZIXddjvJ385z+x4ewcRfneCHbU6tdXGoQlQF3rhNr1aZmxxvcuIiS9x8sSWv2EGW
         pIi9X2rWRLo7tVR4BlMyjlzNpJNnRzMP8k69LMyFT/38At2C+QaXrylUTb5Ql68JILxt
         buCqbiOOX+EvoI3K6ebOhtv2k+7gkAL0DYcv+y5aUkmMWE2mHYTu3wCEiJQzVNVWprf0
         73xAzU0zO9EH0FtcvTjosfEx13yzd6wzcEtyegAqBxBZJdMsGCXtvZ4KMS6xykdsyLnz
         hAZg==
X-Forwarded-Encrypted: i=1; AJvYcCUFEFccqffbQzFwdmhWVPHegQkp1eSMcbsjNonqOwIVkfm32sAXTcd4uWv586U8cOe6AZ2uAiZe/SJmYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpyld2iYv8BhpCE8VztRqjnvtFvsQhJWOdsHuIANY0bOSctdR
	3uAU9pw1LcHnTWTYjVnarLbPo4dL7mtweXLoJRLXTPOSLsb0ExznZcVs
X-Gm-Gg: ASbGncsnKQuIYDHULxt5EyMJONIUmTIbNAKG8MUKvLdOGKF+DCaO6CAFi9d0sW9gGIY
	a+hvFGzZbe6+0do760OBAFvKFierJEcaocwNe1vy1kOSUgDkcD+fhjst1+t9zqQiFYOBNSYnCOI
	c3CBP+wYbZZBh+uUDzsH6csDjNwCO7rRWKiCF1sOYbwOboZzD0m29ZllHCSLbc94rUtkBEehhTm
	1LXrPGCcW2ULzTUhXdDZtzZ2s/rZGoleSjNaXqNXY3ybvsII+hKrLyqMtOr+W8Ay6bPDEV3oV6c
	Hre8yBeTF23r9I7YjnAOeTZ3AWX5n/RCDRV58cNNqQ1RLKjer1Ynldk7qh3sMzzGb3EZ1lK8ZB8
	/HqVzIciPTYE/eHhDdsUyRvU7tyj8AeySA/ceQcg8FXlNHPaG1Eyah63ASfEH2yy497GA4+XR6M
	Mz/YC3gv+cQq4c+w==
X-Google-Smtp-Source: AGHT+IH1Nwmj1nJTt0Sx523oF3zbT+IqMBHza1/CIgwExgeLZ19zMtKml+bp6x6d1S9hslRC9/KXMw==
X-Received: by 2002:adf:fc11:0:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5f18d96e8mr3631673f8f.44.1752271788727;
        Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e1e1a5sm5495462f8f.74.2025.07.11.15.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:35 +0200
Message-ID: <20250711220943.2389322-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware

for you to fetch changes up to 83f96a7eaaf0e3ac1b1447f74a8d3b2213187b6e:

  firmware: tegra: bpmp: Fix build failure for tegra264-only config (2025-07-11 14:50:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Updates for v6.17-rc1

Add Tegra264 support for the BPMP, fix some dependency issues and clean
up some code using new OF helpers.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: bpmp: Fix build failure for tegra264-only config

Rob Herring (Arm) (1):
      firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"

Thierry Reding (2):
      firmware: tegra: Fix IVC dependency problems
      firmware: tegra: bpmp: Add support on Tegra264

 drivers/firmware/tegra/Kconfig         | 5 +++--
 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 6 ------
 drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
 drivers/firmware/tegra/bpmp.c          | 6 ++++--
 5 files changed, 10 insertions(+), 17 deletions(-)
