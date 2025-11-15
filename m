Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C091FC0E2
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197264; cv=none; b=pngBFHPbgid2D+rzaoL+C9kkOyDonXtRR2+h73dbkVFVEKdpEz/2MpYH1+PesQpTzAvXRuhkhdNVF29npqK0H14W84lcZtQMYadQD+DEJu85Fue8xbAU2if5SNFBqAOWgZjotaHwfNfaZQY297Xz+EerLPCndfu3/PasUFTf0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197264; c=relaxed/simple;
	bh=lNTm5B7eG5zTTcCigkqPBKpQFdVecZr6eqltPBKgCno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGFhj38mzKLcYYeaXaEpu2KsG0Q99XkcshswHTLZMFkEiIdjA2/901Gsbe6dON08ruFagK41DTG/dHsTkhtCxJ7hZOQnPAow0G6TfUMUnmgj0AjBrbHqZSnxBoP4RzBA0WRon9JYo6ns2iJfXhP6knd8Ma0iBeAge/Xki5oJZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs3gwyRQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs3gwyRQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47755a7652eso19115905e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197261; x=1763802061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=Zs3gwyRQQIdVU8fQRrgQlxr5m2X89weAU8EWF0QJcB+JY0FxlSjFmiyf5QolDGWhwY
         BSmPrdwvMObDqCsTj2YlqCREtUtGQwqb8+ex0rkARl+PxBsGUDO1OXnKcd+jtw/xnSTw
         7Wr7AZa+/nIYA+cl+9lMrapM+isC3WMvo3crH1i9UXnDProjeqqGZ1GxYtO5UT1r4e7q
         G+Wc0XOS//bT1uue8b4c0Hf/QTfzbXZOkVdxALLjE23Py9Oxpefr+rJVYbSOTS/N2TpE
         boNK1EHCajkn/bPtJiGjhzO6a5ZejwfGahi54NSuSHKtUcNvHyH9ftI182ZejTPacAuj
         Z7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197261; x=1763802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=m13rgNwWVNRMa5vNc4QRrAa4/miPN+Lk4geAMvY+bydV4GF493g3ud0p+pOKUplnQ5
         dMmgxT1L8wBdSyWkGKdcuSvGLJ6zTl3ZoVXWx+zGlwPt2MjkpmQhuyFBchGEWIc8JPAo
         Jgnlota1rchpESduTi6iR4Fi/RMGftGlynvzKb8m9943mgUAPq7m3+thvEDLVmKp1YRL
         Y48roCRFgfxl4w4QhGPJpG++z/1WyvoOY0pbj0zddde322lkAh/fgK+tae56SbP/A4zM
         0oMOUO6OG6IBkDKC/aku3+cX7ZyRppbmH0MFn7i+RdGs2JM5KPgTurRoz9r6JIPagk+G
         PTXw==
X-Forwarded-Encrypted: i=1; AJvYcCXSUvuU3/LscPwdOgQo2hRDeWdR5kYP1Fg04fD+TuG7Uq0Rc2llWmnaY8mHwKX6vCjFdbrxxq3Lq5U2ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmLPcTHrZGl1h1PfUooUWCXaQRqvtLaL5273iLhiUOfXxRFFx
	+WZt7UBSTZ4D1nM5W5MPzgnx3hrOyO4vYU6YvfOjC/HvZvBqpvHYH+4Z
X-Gm-Gg: ASbGncuVWD9bRJtXZnYMih7fizETXHEdjg+ZcjI30PAoXULY3pw49eJ/WpxfdHNlaa3
	hkRfzgUT7zkHbkLyNRItYuB/mIsM796dQOn9Rn2GK3P6y52wKKwYzNCHoxsEAUzh90LVBL2wAc2
	M7oVWhpKqIuNbXwGVkwaGaB9qOGnLYLSy1rkwF+98pgvcMbspKEMJZUb1iSV/l87SbJ0+Qc59Cz
	IHrTDPwZFPyXcMJ+taXpVWfeQWHcCF9j7HLw5kihItXUfa3z2xMEjUDlk6FT1IXxXQljETBQ7/S
	mwrS4tDujiw/JVJ6ZUtmfWgd7Rj7Z6AxQ0CAjGooXRy+t1VeRtdybxmjMLlHH74VRm7w9k4V34g
	3YHX7EmOlW8JbHIpj70arYA9cFY2VwdT0YimawREYWg3qE2xxlmEV6W7IJyDnKD2Lg6J6Z5nvgV
	cgFba9CzC8jqJJ+uKZiyAbo6E3hJ/2u9zBWbWPSR9Vp45LxfS9tQvBhIYQ6cpeui6lJzC/
X-Google-Smtp-Source: AGHT+IH1PM8xyj5yEL7gAjaZXMZK2RgMF06dvQKC4vQfddhPGZGy34EPxlJte1WyAuPL9BFCTP4JhQ==
X-Received: by 2002:a05:600c:4fd2:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4778fe4fa18mr57188215e9.2.1763197260712;
        Sat, 15 Nov 2025 01:01:00 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477975022ecsm32259215e9.4.2025.11.15.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:59 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:41 +0100
Message-ID: <20251115090044.3140331-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-defconfig

for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:

  ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v6.19-rc1

Enable ext4 by default on Tegra to restore systems booting from MMC.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: tegra: Enable EXT4 for Tegra

 arch/arm/configs/tegra_defconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
