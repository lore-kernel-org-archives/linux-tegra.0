Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88323C503
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757832013; cv=none; b=FmZvtFQnzhxJiM7YevIz2jvQeNNqHyM4iV2pkWegQDbSSSflDNXiMi0FvCW7oOzDz86JvE6YyBxpVMSWpqy3nFCIMHF2773RNv3kflb/KItx4Ex3Rh8UL+I63WLL4ZW1aKKIX6TF4uiXqqiZuRmA2Sd+fdiPQFxjWuMFxQ1bufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757832013; c=relaxed/simple;
	bh=9OIG5orqFsNwab6LqC4uN8hef6QGTi9NSan+WeIbQu4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XI1SQYQStu4eBaDV3WJ4xw9Mft+Mb5PLczpMgWuiKBfhLUtbudQzeOu45HPFUkJAtTllmcyDtF0OY0qRZ6OfHUbyvT3TDJoAZDp2PEbibDI0bV8se1LViowtqQ5lNohHjFWW4iy2ZzPA5XvQhG4plcEFpyP9rvS1xvnFBUhgfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Og5oG9Yp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Og5oG9Yp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e8123c07d7so516285f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 13 Sep 2025 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757832010; x=1758436810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGq6925/jIdr2ZHYK/3/QTpUPif8QL9XSz6t8qLpUGs=;
        b=Og5oG9YpbYzNpCuki7TA79vIrw7ug+aWCFkUlCPUUm7SEFocs+OkDnoRFr4ZU7ZpSI
         WB5WEkmtWslv0mgt3TuuaAepagLClWUAj1KEsYSMeuLtQX/WIUpEvkSwOkJJ78c1+xFH
         jipaeElv41VHggVe2WohmVTtF3uqa5aqSfLCadOmYd8/TJ6VbrtCGmPCyRC0azi1YQz7
         bwmOEozkX00Etv1xNv2wncyky4PJcVzwDgc7VJSpEpS7ZUH0tQLqf5KnJ+NP8MFmYnif
         npTxxp4Kus/oMfvDDB7j5s75eHB23jzlfIxOn7nxLiYWGuz8wR3EZX0f4LTTZoAIE6NX
         q/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757832010; x=1758436810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGq6925/jIdr2ZHYK/3/QTpUPif8QL9XSz6t8qLpUGs=;
        b=Mv+RopWArE9IIyqgdowsDe7crX/KfTeONsSOf9wVf5+RpoDBlAtUDeeqD1H7HPZ71p
         3W3pKvg4tXz2jar6DDnJPO/0dJL18BOn+X4DhrS/rhvWkZKvJIy4SVHZNH3bYBXKDM1u
         A7JW6lNrwKwl51pBEMetnxp5D1V+FCaf8n5puv4P/tZpBiKJ/NIRY4O/NwJUdHjhfPZI
         RrkhkrYf8EgPlvHzbECQSqBYDKjFHzrceBh3fTDJYPpvR6c7O8ZH+f/2u/yanaXV1Wxv
         JcRaalFgf1GW80otCCMG6Mvg0SQDA4AHoLAUc49XAkcpPq8JvR7H+SpeFHDfx9frCsPt
         CMXw==
X-Forwarded-Encrypted: i=1; AJvYcCWX+zC0b/0BdAClUfk74faTnF4yTrHTGdZt49LlkGvBOrdGwfZ+VFGpsqPUcW5/x6RINgCkWAI5R1aUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEy5QC7zpmznoTanLzZno8MPGc9fkJShRdc0vPu7Zs7pJZpp66
	j0aElpeJpA6vS8JJ+borDTzsBqOyyZPXQO2oxVPTzlMPKLPo+ILRLNSm
X-Gm-Gg: ASbGncty5hsJMhW5LAYKV5/kDTS9Qed7rHA5DpJVDdLeSS8XyYLedAXiwmWFaeLqx4x
	YBK2mKej8L3pJyjxlC/j7vJ/HIqbDw9nNBl8tg6McKyEn28AATDchEfXsHymdCqoaoGfKyYm29k
	eDTh3zreG2Ou82bpuCgIhez+n6BwyLH5IIr6yUdP0jV679QhpR/uto/3k+Kb9pTb/vehXmJrOJH
	cp93ayO3xZUOFpxL7fkRZyROwfTvFPKAFd/cL0P8FPWgSwI8Tn4VoOcM84oLIgxZ183j45NNdoX
	g35kxNnONrpCt3ORAIHqFzr+8ywIn0BtNSIZYHNmNXpsdt+v0eCB+vrDCPJySKUByM/9HGctiQn
	dLu9/MJcqVq0qBcfqRP5MAbl/IAWyBZ29qZCNbIUOBa59GDy/O4rk3u1X26ndyNJnaoveUf5F4p
	UTKntQDETe7wmeTg==
X-Google-Smtp-Source: AGHT+IEkwFzC+MAQUOBOjx0qfNXQf1qYrih4ukqOKlPrqTVHxFCuNkIgRI4Eu4SBNCQ28PSsd3XSvQ==
X-Received: by 2002:a05:6000:2489:b0:3e0:34f4:31f9 with SMTP id ffacd0b85a97d-3e765792ff9mr6535584f8f.1.1757832009742;
        Sat, 13 Sep 2025 23:40:09 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607cd43csm12396259f8f.29.2025.09.13.23.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:40:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:40:04 +0200
Message-ID: <20250914064006.90225-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike, Stephen,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-6.18-clk

for you to fetch changes up to 5aba939e80f439c1a67adb6d9cae23cc72db7ef9:

  clk: tegra: dfll: Add CVB tables for Tegra114 (2025-09-14 08:23:28 +0200)

This depends on the dt-bindings branch because of the DT header file
that the driver includes.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v6.18-rc1

Add DFLL support on Tegra114. This is quite similar to the existing
Tegra124 support and most of the code can be reused, except for the
CVB frequency tables.

----------------------------------------------------------------
Svyatoslav Ryhel (2):
      clk: tegra: Add DFLL DVCO reset control for Tegra114
      clk: tegra: dfll: Add CVB tables for Tegra114

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/clk

 drivers/clk/tegra/Kconfig                  |   2 +-
 drivers/clk/tegra/clk-tegra114.c           |  30 +++++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 158 ++++++++++++++++++++++++-----
 drivers/clk/tegra/clk.h                    |   2 -
 4 files changed, 158 insertions(+), 34 deletions(-)
