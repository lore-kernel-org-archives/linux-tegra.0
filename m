Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F578C99
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608907; cv=none; b=AfO0zOpogkt8c6pUlRcgMQCMNP+hERpe0aie49tG7QKsBALv0C5WWrSYZkUGLHsZaPuLCyAqP/bjFd4Q3IizqJfcfssB4Z+1dPxwPrfK68dKABE7x+7oxTJF1qE6kVefd5TDDEGI5kXBqwjCl0m4U4j1mOjXdKz9FnY1K6ZcJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608907; c=relaxed/simple;
	bh=9qci2CFTvIHMdtg0WhOGEdJvuGTKKVfFq61/JTi8gJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BZOKLh1lQOJ25pvEEWzCMArO2ncRkI3GWO+xNR3UZr2f9uFaj/09bvz7eimKKJK+ImXrUKsCAkVGd2MBpcP1pAzytvpBuuUIYC96GrBkLp+jqTCfufzAam4zaBQPhLH2N2NIXzXLUDEEbm1WV/2ltGWgttfsacuwQbm+XY38RxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN1iop8q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN1iop8q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-356c4e926a3so660814f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608904; x=1720213704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M10gHSCT9ZqfkPRyeEbI6mG0gmimMjtXBAckNGKm00=;
        b=KN1iop8q/DZ8YTB6uBSIQ1x6cQbp1GsZiVTAsCmtu2bRm9WVa1KO5Tmo1Bw9iSayIt
         kPvwivYi+kEMT+oNIyaHCUO8lPLw6Onw6wa280FEnEVL/vyDMZBDWDU6XkiBq2nkfcJR
         uvGZVVv+NUW9SLCrR3rJGRWbyrXgcqdZe8bF11QfT8uUbFVB1ItNw1M302E6gU6309Up
         t18ale+RPtJ8VTGmfhgLpqPRZjUal3+Yhbpo24+/lEoSaLWtR2SPBihsf4pzmf5rd6tx
         TSKOyC/TpmR/AKyiP6m7HuJz8QKvqaEQOLHyVjLGW1r4uFajqmndLDmFC35lNxVeeQrB
         M+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608904; x=1720213704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M10gHSCT9ZqfkPRyeEbI6mG0gmimMjtXBAckNGKm00=;
        b=cRFJS1BAd2YZXOC8Te8PFmSyxM1X4lZdDDeoRF1/1L4stqoKHcN1GsFPcNJcc7nRd4
         CGB808XpEU6lIa1Fj0xSwp+Pe5YW/4CwMj6HJZU94Eh0gDBmx+U13IpZdX8P7P5aHWy4
         JWaEANRVRGoXMNoD8UdQXroQfPpnIYX/nAJuuAsR4qnz4UDWwyE6U/6nSekbefvRlih+
         c8FLqrdnAs3Nf/fEr9WBap3MT1eGrs9wSQZJezlCA7s8vOkZEnJcECDH+D/NvujvsaOp
         YDa4n0jChm9MFOBLGt1NWEKQb/OZDGJJZ9hNUoMDgQV43wOHo0wWzJl3Ql+hoyvUpLW/
         CoCg==
X-Forwarded-Encrypted: i=1; AJvYcCW0vSIXY49H+Gl5VZJdgmdeMnmZYgv2H+JeiqWUcAUHR06Kv5khcLhuhwITHVzn31XX3XF+1Y+z4vv+qVilmJOturV90e5BSq0/ehQ=
X-Gm-Message-State: AOJu0YyfGKC3/e3IiJLqUzpKN1TNiK0fxiKNeF+3ZWCEBM8sbQsVTBBr
	RluZz6gwm2sidBXYF26vPnbYV4EwnU+jXbQRyjylUsP8djTzfrRW
X-Google-Smtp-Source: AGHT+IF7SyDvrv2zWQD7p80W23YSTxsrNmRRTwZzenMNxlVj3/4eQc3NnaWtkwyNsf6/mXLI4fyssg==
X-Received: by 2002:a05:6000:1811:b0:367:437f:17a1 with SMTP id ffacd0b85a97d-367437f1a74mr3282034f8f.13.1719608904001;
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10302fsm3295473f8f.93.2024.06.28.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] arm64: tegra: Device tree changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:16 +0200
Message-ID: <20240628210818.3627404-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628210818.3627404-1-thierry.reding@gmail.com>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm64-dt

for you to fetch changes up to 5e4bbe52207c3927dd2690e46bdbef6392d7bde4:

  arm64: tegra: Restructure Orin NX/Nano device tree (2024-06-28 17:37:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.11-rc1

This contains one patch that reworks the device tree structure for
Jetson Orin NX and Jetson Orin Nano, which are both within the same
family. This restructuring makes it easier to extend both platforms
in a consistent way in the future.

----------------------------------------------------------------
Vedant Deshpande (1):
      arm64: tegra: Restructure Orin NX/Nano device tree

 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 77 +---------------------
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  | 31 +--------
 ...68-0000.dtsi => tegra234-p3768-0000+p3767.dtsi} | 28 +++++++-
 3 files changed, 29 insertions(+), 107 deletions(-)
 rename arch/arm64/boot/dts/nvidia/{tegra234-p3768-0000.dtsi => tegra234-p3768-0000+p3767.dtsi} (90%)
