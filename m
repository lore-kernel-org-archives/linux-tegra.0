Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D8C221543
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197260; cv=none; b=jloAsr7SVuB+sWH3AkPdYrqu+tOXXQy3i0xJdHc84tzWvZrYfKSS5z+s5VhNRhXsmQyg9satC21/lfnys5cfOCTjgyz46XXWtf82tz+micyvoHpUoX7ADD1IUnFp+mE5/aauTB95Pahkyc1j9SdEcsnE7ms7eT7OnDjUDJ21ZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197260; c=relaxed/simple;
	bh=aRsqKglc10I3GhHgrrpGNuTdBDyQwTu/Vued++Rw1PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mnTbaHrcGYIjYDpgwDzNF7yXrDgoO6ZaDit+Ea9MuPp5oB2eP2mYis3ZcY/sFI3QRlw4u2nODDM+YSZyxKUVXBwuOUvx+7nXgup11vUTUiQEpWJUe1hQfnboUdOPg3cQ0dOlW1mHmYHvmuniUAB+u7UPO1ayS6gx9XXTRZDMs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H00n/Pgk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H00n/Pgk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so4624385e9.1
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197257; x=1763802057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=H00n/PgktUFxFZuxJ3ONk+8T+b9IQBP4+QH/K3/V1CYto5lp5pTNfKueLlrZLAX2jt
         nhFAmh8sy8S4ds+KvKU5c9HNo7qxdsgH3RXoTK6WZj55nJqr2ZUNNymBdGjfJxNEKYg7
         t4NMsOSkQILzT1zxplSfEqFzra6coeNhXrJAes+eiVhh6bRYLN9cHIyjTOL2wlCMuwNT
         O1p3O5xKZ6VWK7oBaolMKRyQZ+1shuc3bteCU27mnn4ZU+wbEgzeCQqlQ0xRC/EatzzS
         x7wIm6Uknl8lzJeQ6+rbPXsMPrllsS7OPOzBGYF71icRbkmzAG2mC8VTJ8KtPzSFaeg5
         rSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197257; x=1763802057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=KzF+X1dNADkHkIVmit1S7EaIxo1IQwS5eoTOCP8FX8vF0FMgZbGEqk0g0ZUh8KF3YX
         HotvEXxrIedQEqNgfB8E1Kp6AQQSizlW4V4n0YJLE4aBqRdtDtB2FY1U9XJXHyarYNJz
         07MA8V5kB6IxST7LDRGu2Fh6ZepR4MHL9mAoA2EPUR0b+0vQZqeCmuLQ9eX5ztJGJ9ti
         HVmlT5qRNZjE5vUjmRiYBz72lc+idUR6l7unXk5cz36e6D3+dy02D+Du3uYWoXvzxLW1
         LkO7dVWRzB0x4V/KkJ7xr9DDKEajBiFXMkmeoxnEI0QACkLkmWCHhxR3tff64WXVkxSm
         0LXw==
X-Forwarded-Encrypted: i=1; AJvYcCXYg/TshKq+bwKilBe+25s3Njg2bJW/Ro8ldCalgSPbeVqTZi4A9nDvlaaCac1VtHGRIZSwLZKTYEThpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIsMTZJ0WRwq9cK6MwcHggK1p/RD83IJUZWFiyuLQxdBQIM9W
	2iLb2DW7547k1UlnB8j0iJIhh3haq+hPXjDvYBxqVtvCz6eD0QEjIwJI
X-Gm-Gg: ASbGncvsQ/0McNk+7qkxrAopqZN89spXFIc7ulKvrAxSAcJTf/MbyGjV6hGQbBW+I4c
	Hw3pIOsvFN17qW4UyqPg+RLVytXgFcZoY9fVK8MpWjMFKDqgwkJ6Z6wRmNWuB+uEOk6ll+mmbeB
	IiQxki1SJ/r3XUJLxKPbMDW85ZK81+rLf2pP+hys5zyf7DjM/dEtByXN/qoMD8HDPiN+dr4eE6Q
	AThlhvqQ/PttJ3inb4qZ3cR+azG+knDk1b9D19KaUH60eB6Ywq25sg0G3H31RfXTlYFXcTftal9
	+aj2dCVfd9v5O/b6B2iXmN3vEtszi+hSd9oO82fRYb4zgzi/UEvp1eRjDkpdqAW7bWPYhavE3mD
	C6uhrDvadtaIPIYT51aIvEH66J/EgIfrnANhoj+Nua/x+szPPnU3qxpPd5RXKV+p5TDuhHDWiEM
	eqLqkLEEbvSuqS1Ws7zVbeeotZNoL2vbkN4slfo+oeK8wI+BoprSDnorVp4zVMQbgkKfXq
X-Google-Smtp-Source: AGHT+IGyB/RQW9MTVswcGv4cxhGmARlI02larXZ725dOtFz0GZlaFld4CKIv8l5sOZoudOnpPEm27A==
X-Received: by 2002:a05:600c:35c9:b0:475:dc98:4489 with SMTP id 5b1f17b1804b1-4778feb568amr61956635e9.33.1763197256667;
        Sat, 15 Nov 2025 01:00:56 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm14443659f8f.9.2025.11.15.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] soc/tegra: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:39 +0100
Message-ID: <20251115090044.3140331-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-soc

for you to fetch changes up to dd03d34d6d8e7a3f62450fb7a1408d86fb35487c:

  soc/tegra: pmc: Add USB wake events for Tegra234 (2025-11-14 19:29:50 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.19-rc1

A couple of small fixes across the board: ACPI support on FUSE no longer
exposes duplicate SoC information, speedo IDs for Tegra210 are updated,
some comments see typo fixes or kerneldoc additions. Finally, support
for USB wake events is added on Tegra234, which allow these systems to
resume from suspend on USB activity.

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: speedo-tegra210: Update speedo IDs
      soc/tegra: fuse: speedo-tegra210: Add SoC speedo 2

Bruno Sobreira França (1):
      soc/tegra: Resolve a spelling error in the tegra194-cbb.c

Haotien Hsu (1):
      soc/tegra: pmc: Add USB wake events for Tegra234

Kartik Rajput (1):
      soc/tegra: fuse: Do not register SoC device on ACPI boot

Prathamesh Shete (1):
      soc/tegra: pmc: Don't fail if "aotag" is not present

Thierry Reding (1):
      soc/tegra: pmc: Document tegra_pmc.syscore field

 drivers/soc/tegra/cbb/tegra194-cbb.c     |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra.c      |  2 --
 drivers/soc/tegra/fuse/speedo-tegra210.c | 57 +++++++++++++++++++++++---------
 drivers/soc/tegra/pmc.c                  | 21 ++++++++++--
 4 files changed, 60 insertions(+), 22 deletions(-)
