Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20B3E0C70
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498084; cv=none; b=r37IP1fmH15JZ4weSfjfTRxpThYWL5WL2lZi6Z+eo2wL+IN4Bb8xFIHhLJ50lBtPQM+zpCJhf9SSX1NqPNcLhBI7j3nKNL2ZBg7V4bQ/12mxQcF6pQBOx8X9pGT3KJlBzAMn4L0dU1LOEILVyyEgkIFq+zaUL7u654/ug8pfeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498084; c=relaxed/simple;
	bh=Uc1BvyKx31wq02IHVbrAdOzHOOXq8zU3tucq6JfxHfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V458cR0SLQnhNM6Tr4OGo+OYmakCeCueG0DjJkZBKkxzuVJ6oJ0Q90MK+UmOZPB18dEI11a3bcJRlqm99w0AvSyUhuxlkN7xeorD93cMtTQ+iBkJIzyFwCr5ujzm7OAwOhwkjvW1tVq427xBK6IC5HtNImYn22irtUyNP8NbOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqZjWsG9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqZjWsG9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso902937f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498078; x=1786102878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEzishtGP2RmkA0jz3joImPDpD+mMIsWvmQEoNf0fVU=;
        b=sqZjWsG9HtlJMY11CSKAY8JaixUo9G2SfD2WoFrFKzH88rCP9yDB7eD3sm1pnxdyaT
         GWlrHSwVsMTyKtp8GQhSFC4V1xaVYJ82XC/ab68ZU9z3I2ItrEtsXZhqjD6LUa1AnaYz
         fwvQIMwJ75i3qLERZ+am+egIqaG7gZtA4Xe6cNmKO4xtGWhvHNZVSQ6gOkalyuDGXWPh
         5hBitwHgLiN1o1aUY6rjkdde5Q0Na4k27Bxxuha8gQcF3ZsMOdxgkZjCWI6UtIddSSTF
         sdZ7i1q4qAWY94zHPGBGt0H2UllLwX+57pRywsJEN0NnyYXaLivMJU0L/giMd4t53YV6
         k/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498078; x=1786102878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEzishtGP2RmkA0jz3joImPDpD+mMIsWvmQEoNf0fVU=;
        b=NusmMWqOiE3rar+e4QRR03/ENhZa4Q/lm4PCLQLe+4mX6BGJONrVBasXepmzt9M2Kp
         bKTvF2e6lIsrWu2iDhLFe+QT6TZlExznfvh58s0vhsmlEJwtSlDwuL+wt3TQnGQdL8XV
         SYipfQDk1BsCWHfu82tPBjimr3UVEiIVAxQXBFqS1dJVbAsY5bSQ6M+MR+7oA49+Zvoi
         HdnZXFBna0COcmQDz5MffLihdkUJM7SpjwnWkHfV1b1soZvxEXSh9BuW1/ZwIjNELaus
         w0Rv1bMQh1hXVY+dmk7Rher5nqu0GFKQidcP/RO10IEeC92AJdBxgm73Xx1g/vCsmodl
         QKLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1T3aSxMvSOzQlXM6sKoFYlW5st2BcYlo3BJx0uJhvZB8wcf3bTwxX3Shz77ErIy4+Yr8f42HKmG40rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJj7zkh9UERsoChuEurK4eyUvbyFGGuevTOr3p/VjoTNLRDOc
	OiEhoMjq3ElDhcH3hkztn01VKBcudma7ffgQ338TeQ5h+yws/gQ/gW44yiRCHg==
X-Gm-Gg: AR+sD10NY/U4TfDYHQBqjI6F2UPboBytK17v4PJO0WFd9a8XPfpQEYpVGvLPQCp0VYx
	D2/aewCuQBGBzFV8a+Lw4KnLp4PbvKulgAEJ5yS4jfu6nKD75hn9ZnuhQAt9LJcnB+ixVU+F+Br
	0ENdraTl+J5aLsdXatt2wnkEFC9MyL09710W9vHclmvbPEMlYUHH3Yo8icWWmtStrEi/RfAmgcX
	q5PC9DESwOXdn42RH1c19W5B+eoRCQrbP/kIAZN3VQ5CQfPe7zNlpxPnq0tNb2wSsUstVGAEg2u
	dBxSGdSAbCSsvgYWGlUoS2JexFAT9DMfqDl2HD6uoLSEX5KsKo5q6l1gnZAnQpnMJKFiWy8TaCE
	P+sN3sQhvQqwtU52cDWWkIbCCD8KmHjbp2VwzkTDTfQMJaA9KBSE71WsVHYys46kUtWiKip5scB
	LwZ5a/aGLy8nxgKMtabFy/d2D9OwuSPeOfxjcdYu3b7jkOizQFDXD9zSuW8I598jYRxX9A3PnV2
	hDI5GlMkw==
X-Received: by 2002:a05:6000:461b:b0:460:3233:beef with SMTP id ffacd0b85a97d-47fd2b41a1bmr3954594f8f.43.1785498078220;
        Fri, 31 Jul 2026 04:41:18 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] ARM: tegra: tf701t: Add new features
Date: Fri, 31 Jul 2026 14:40:56 +0300
Message-ID: <20260731114106.169398-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new features recently merged like CPU DFLL, MC and EMC timins
along with fixing some existing issues.

---
Changes in v2:
- removed vdd-cpu-supply from CPU node
- fixed typo in thermal nodes
- adjusted MMC flags
- improvements of commit descriptions

Changes in v3:
- expanded commit description for BCM43341 related commit
- added Mikko's reviewed by
---

Svyatoslav Ryhel (10):
  ARM: tegra: tf701t: Configure CPU DFLL clock node
  ARM: tegra: tf701t: Add core-supply to PMC node
  ARM: tegra: tf701t: Add MC and EMC timing nodes
  ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
  ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
  ARM: tegra: tf701t: Tune MMC devices
  ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
  ARM: tegra: tf701t: Complete power sensor node
  ARM: tegra: tf701t: Configure UART-B line used for GPS
  ARM: tegra: tf701t: Add chosen node

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
 1 file changed, 848 insertions(+), 37 deletions(-)

-- 
2.53.0

