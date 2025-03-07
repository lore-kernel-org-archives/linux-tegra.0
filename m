Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354C23BCE0
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364617; cv=none; b=GtjmUon3F1FM2IWvCGGJjWJHZcfzkf6WTYwN9oBItY5ALUf+nqyVL7TcI5ZgYwCFWaYrdZTQM71uO8nw/mHqScGyy+RuInHnBSSaxR4fd2ywMGTSjoFQSCdkht/DWH7z+jRimx39kZ3JmJBKBsBX2DzNncvXAuzfSTCmpIlfneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364617; c=relaxed/simple;
	bh=Ebh93M29DAva+ZMx0lDQQUsg/qaAZb/Ns4nX0Wj0rgY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YvNwQUAC7QuWfySE4ytVFv5ApTUNp+Y8cEgg8nwcGZDvoxzcvsqDzF0SrCsEq0Vf4P6ToHf8VeAcIig08IH7m2hMTOmJs2UZtJpGjPELXDwfQGqyQwhNOteqemLmTXw9DFQ2DeR2pZNkrHcYNPoAruIeSPBuPYz+swms14f0z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4rMPRO0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4rMPRO0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso23990745e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364614; x=1741969414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=H4rMPRO0VOnTjebp6ZAhf5jAqjNCbclqJqVUhqnqZ4obr8n3lE3bPii/9YReZO21s1
         RCc0JUxwOGRmfLQBQIBruH11vwsXUJpUW/8TBhXqHWBgyEC99fp5yNUw4HhFHdXpTxBT
         mDcXTfRKCKwUY4wwOo387XyCCCKaK3giZqnpFzzz2hjhhK9vTiOtz+yF86rfvB5U/Yw8
         zUH9SJF/8cjyYQm7sSjT6y3psCRBpp5VXTAXpxDkWmZwmZ3N/VnXFTl33TqwjfITvrMO
         xSyJMwM/ZS1+z7idZ5pwwT6IT1IV5nfII5xnzdCmwPdneTopiXjciLRRGKTperhrJ4yn
         o9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364614; x=1741969414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=Eqsut4dqBXvJvcrOF4nG/nffbEw5JtBcl5LYphgs8UnVJ5A023SS7cQGAgz2ouUzQa
         bQL99ql7UhStKgsnEmxnTTqD61/FV1u9zjDXQoRZxI+ETHMOBAyVydae6WV7jn0GCyzV
         ngX25uXoVC5mUJUHew9fxnuXZbodqVVdH02KBpCOA2qi51BOiawTC+BdC9qISTNXsio0
         +tbAmoYaEnQcWxqQIuVrIsi59eJWLs17DgpaeYYcYpklCNqHa38bQivMtKbojnsd5S6m
         Qan8t2D0CtciX4KC+I6Zo+lvLacLkwOVZ8yDw67+KLjajdC8QAyeZzdFe5NAyeyUMxmm
         fSmw==
X-Forwarded-Encrypted: i=1; AJvYcCXiAwVZiCu7zla4HSqRokHP8GdnekWKcEU5ibVEXk3WYp/K/EqH6gEBgLkzC4h8c8eAIcfZCBQCHe5lNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TZmuQ3Ek6etI9oxwjYRTo5/s13uXmJGdwlB6tTDQdrUbMvPo
	RWDx3TnaGuL1xJWUDxpQ8oZzVi/wyAFWI+QcVnSxxttXeN/z8mzv
X-Gm-Gg: ASbGncuORBLEcZ9YrmHMH/S7onwB9qNVLTvrBtvMU8i8CFIQNQTbLda0zlLuAagigFf
	BpAZl/1RMdzTBQOfHLUKy6LopKr1VnziCxMIdyvEqlyzm3PRXWYBIJufVFeX3iI3KU6msyu6Vo8
	2on12VBHH8vzquUt1vTYsGJ1ld5C9LfeqchI+gvrjiBtDESQ4pKT0letNDfZSLdU1fPR+rZ9Tfo
	8Xbpw9xnLniHAHsjQhlEPAFjCPwbh/IjMEasobreoPK4xIw64f0y/kMzbF0q3elAr06U8zQeAvZ
	UfMESOzPSXSeagfaIHXQ2YCYOm7rZRxJeNsoKqEFa+Eeg3inCjHbEZgg4Lx5A6TFczGdov5q7Vh
	OJNCD4d0iQLyNq9B0c+EZgd7hhwyJ8GcoUfAj
X-Google-Smtp-Source: AGHT+IEd+gRoPQ8KmABrlOREXez4/oLZ8nyQy5Gl1xM5wK9QbkF5BtSw7zOZUYVrcxnENMVPZJZadg==
X-Received: by 2002:a05:6000:2ac:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39132d08dc1mr3526643f8f.5.1741364613735;
        Fri, 07 Mar 2025 08:23:33 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfe61sm5910609f8f.38.2025.03.07.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:27 +0100
Message-ID: <20250307162332.3451523-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-soc

for you to fetch changes up to 5e63dfe213d01cdf0bb2786ae3d5ac613182a433:

  soc/tegra: pmc: Use str_enable_disable-like helpers (2025-03-06 19:12:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.15-rc1

A simple cleanup patch to use str_yes_no() instead of an open-coded
version.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc/tegra: pmc: Use str_enable_disable-like helpers

 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
