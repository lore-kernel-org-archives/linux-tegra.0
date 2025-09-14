Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE425A352
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831980; cv=none; b=RtPqzRmXQSPCjxZY0CJgjc1xaQOwf9kSQ/gKLi6dUEFuYSHM6pAPYNXY7rxlPBkjjR9WGUztsLY8vSbdSI4qnLC77Vo7KoDH+pVh5BUNQ+TvlD4m3kTIUrQ6L976htqcDUrXPDP7TF+ux6Ca1n+mVNngMQuFsg6WQo4RstUBSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831980; c=relaxed/simple;
	bh=bsOd8EVRaDr6WTbWAnHzgvTOV9nC656Hbrq4fioi2hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ikDlHDm15y/QsOrCikFlJYG57YXfqYNJq2FH0OmdxBvLPIIOneg2rzNWUbiR6CZ6lEbSmk7fVkeansh4FjW4sGEtToFu/PYlJ+yI9xq3jwTMKu/bbM7Ukg4VB3Q/TPdKpf8G2XGXp7dPpXxCr2y24Dnmm8kg2zakShbHlW+8FBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWs9637q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWs9637q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e751508f21so2027150f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 13 Sep 2025 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831977; x=1758436777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=cWs9637q8csA+Kdl5x4BNv403ROJVlWuNFuBtuDKKKJ8BH4yZ7sQil882tRDyN1u4r
         SSE7tMs7y+7f73C4M59v3Qo9u0iAIGsgLiJ+Z/9pzA/tg9vt+pGkEJmdLYViXS0Zs395
         PpIIvJHbXfzc+rIG+x/g6CO+Hyq6rCcPw+7e13NJvlF7w6vMBJUlsTAwZ5PmeDpgHmpw
         /AaBEpgAjeM1sX1g0hmAQXvUsibBEuQm7XKS7wxozsPCMCqLdqAlTSPqtCTv8WkXsY5Q
         Y+YJFawOoEGq5VPAeaIdBDk/uMdtUk2+Wt8EcDrc/PYW3jsD2C48RUc+4KgBHY0BavfB
         EDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831977; x=1758436777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=n299I8VuikI9PtNltAxojfBcVivsHvasBU+Vj8vOKgJnvZbtYGmdR/X+YulDqCd8cO
         qhBepEX0mdJFvM3/0brFENmWAW6cc8qPeaQBK/Zku5cSmPEMca8j95csJ7jc20UOQpAA
         08DfVZNAgPoLPmXg3X5X3nPDjWizw1nFt0WBDp0wFhePDZ1Kv7zPsI/g8R+1rvV3A7GE
         BIFqx9oNeNNGWaV4zKmxH0BLpkh0dcmkqqnFlpLRY/aO+h5UBvtkHpJUUQNkxvT1wFYp
         8lUP8Vzoy0Az8oLEVXguWRxc0UnMXMohkQXFqRIU8Dv4TIKVbmJRe9WI0KcO0V97jRrB
         NZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWC6xu3qX+S/ld3gw7AFzV56bocyyb9xYnVSxnQ05tMvbHZlad+lP+quIW3e9lJiTmLj7GHgPrCg1O7eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzduSDymSYxluFfUY/qhiYel/FaJd+KkJ09X1qnCvqfy2uzuOCY
	g32DZiEOjL/uXc23JIWAvlk1Dq5Vg8ZSiiYbRFUh8YiJDyYfl1r/t/kB
X-Gm-Gg: ASbGnctUNCIT0KvyBpYScvKCP3355UbRlkYQcyi86AvkIW7c0RKdAGdFnLLok8A4hq4
	G0N/t9g8Keqr4GTyVqWGXJl8XdJSc1rB6f5sASaZfl+i1BDXr3rikpopB1KLhyhLxFzIT37qmgh
	hfMoKDbzTcZzOzKSZmqYwChgui4J+1kbgQee3VXM9IOUNyo51VP4XZX+r8i2DT/3MJWUbaM3VMS
	Sut6DOMYlC+9XDLokyqY8vb4b4Nd+r7c2WixXoo62fAbqtTmohBHWJZdMYNhJ/Z/1n+ykrIFcPz
	CwHOxuVChHelCZCTxjgz3snG34VlU04SDn7MG+MMNq450wcYqk48PG0bYMcFKdunjXybSgyNgcF
	5T2BfPVGqWp1gilubY7F+ydlp233W3f0anh2vipLN68w+x3uklYkfRxxuaxKY13gv0TKqDXIWjR
	N0lJRMXvdth+dbtA==
X-Google-Smtp-Source: AGHT+IHymrOL+tTeViZP10RPGLwsdPflgferYQ5FgiwTqzzZ3HJC28XlDRAnkYKailfHPno4A8dELw==
X-Received: by 2002:a05:6000:40e0:b0:3e9:4fe4:2619 with SMTP id ffacd0b85a97d-3e94fe45cbemr2544297f8f.25.1757831977436;
        Sat, 13 Sep 2025 23:39:37 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e82f647b83sm5778948f8f.20.2025.09.13.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:25 +0200
Message-ID: <20250914063927.89981-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt

for you to fetch changes up to e1899da95f59240ed2d4a51d7a89c8b77c45ff06:

  arm64: tegra: Add I2C nodes for Tegra264 (2025-09-11 18:35:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.18-rc1

Add I2C nodes for Tegra264. These are currently unused but are needed
for subsequent audio patches, as well as various monitoring and other
auxiliary chips.

----------------------------------------------------------------
Kartik Rajput (1):
      arm64: tegra: Add I2C nodes for Tegra264

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm64/dt

 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 225 +++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)
