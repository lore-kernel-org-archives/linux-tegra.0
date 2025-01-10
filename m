Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11A20764A
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535251; cv=none; b=Mlj3dG34VftWDx+YDcEoKwRrpgqpwuv2zBPcb4YEGpi4lGCcKspRBuFPcIw//RMcNocbLxQQ1SZkCv34TGBDE8BBgJemyVrm5Bsa6c4Z5CQL92sxooyJJ/W566nyldIjtWIrtVen7dcuO7Pxc8XjL76hW17OoE4JbNt0ZzJpL20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535251; c=relaxed/simple;
	bh=ILhKQ2NtLIQeU0mxhYxB3F58THwtyCqd0wy7ClV+Bfw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J0PfA4VFwRkzip5V2LrYxRw6fG8Ic8biyPJntEj3lN6Fr8RROT4SJteBP5bzSb8okJsyK3KixQ2amy1nmvqMlbCo0mgeEqVbM0qXz8niDWENRvku9mlOvy+yDsuvNPeullotelaPSZxNOR9dvALyXlwGeGEkvf5lN26qoBCMr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX63TCNh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX63TCNh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1116360f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535248; x=1737140048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=gX63TCNhRbUs5jEhVKCUO/waPnqd0x3ZwNh3xKvYtZ9gufP7gn4I216B/yPzTUSLml
         hvnp3vnAdZ/UsvtTC+p82uTSr8badLcszyN0hfj0qHkpcl3kpCQsMDBf5YkZtlcxLxoh
         WkH/VJahZLOxOnim0sVKfrL+ogCInKbSISMbAu0gXbae878NBrPP2V4Qc8sQ+fMTdTyu
         1WGOZwfo6Naqi0WFs2c+dLua3xshIp0y8EZD6jzTv51DE91hUghgCw3HfNUaVoUqjkvN
         ydf/IqGBIELO90BXtpgUY+iCHkAaE/V94cp1SZzMUJJGQ+DRF+hsUbbTRq6MmklmSE25
         WqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535248; x=1737140048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=E6fVUI6pOvpXDapITADLX8ftR1VJswWN9gRAFjl4363Rfck3qW1VEREQF4s3fXnhC/
         uBh6jBWVuls3zn+bpunIRQ46FCGSu0NxLHKUGlBv2sziWxjE5SZ9wL+qgDpGD6hZ5sXq
         5YRaIxlDzaHjyEqSKga3P+vsCw5filsXAKALRk+/gGjza5j5L7khg14ihuQ4tg8M+b0O
         zGocS3Dgt8v0xxPrbSSlqGWFPtO0EVlYfJwKk1v68JPQB1szu1UxlOvvICjloUFIA9aX
         iyynU0xLFbxjR4VTaN6CQYAxIm3jkCRLU7n1b4F2D8vsPR9f/R0WkJUYNtETRCZzsNVH
         TUUw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbjDe8oKcsvzWBcPbRwN6zI56SpoXek5kFcm3xAQbDbmpyJ8kZT3HbG5QkAoduFlXpssrbsOWPFd6vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/g2nDgkXPjICf7oxYfxo9NvG2x9wjoOpBKCkWOTiDf0mqS/f
	UA15hevX8KKWnNygSq5mRTJL4vdjpai0kIA7H5OZ6o81K15zM401sa3o4w==
X-Gm-Gg: ASbGncv+2dmNCDHiaaI1RZYw7cIuyr0XEl80uyE0xi2NpiZ8q+LSV3yj1HK/nA9jFWr
	rs/dqnbapUwFzelYtocA32eD86PhcMBpzdMzfw73O6Y0gecUfTACRoKCGp4ai9iNueAW40ml/NN
	UuXzyKuNKhxCb8mEcJa9+g8lSeoVWi3rivFyuoy2+A8q7KwpPG8PuwshIrMG3emVI6BZDc2kRuR
	f/us6aiCw2Xx4eXvCg06PQ9VkFiqyQZH+fafpfVwR20J5Cxw6dJ7ZAhtP7AEHxfsp5eaiumYkT3
	YLbI2A2eEL6x7L08K4ef0Tg0H+UoV8QAEsIfmIAQwveGMfxX
X-Google-Smtp-Source: AGHT+IGZ6hlN+WoHP63J5jrBDfHHz+4clyA9GOi0tEzZYmYd03alnmZ6mmb51FMSnEhVGza4yao5Dw==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id ffacd0b85a97d-38a872f6d09mr10013608f8f.12.1736535247484;
        Fri, 10 Jan 2025 10:54:07 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1957sm59993665e9.16.2025.01.10.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] soc/tegra: Cleanups for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:51 +0100
Message-ID: <20250110185355.4143505-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-soc

for you to fetch changes up to 836b341cc8dab680acc06a7883bfeea89680b689:

  soc/tegra: fuse: Update Tegra234 nvmem keepout list (2025-01-10 18:51:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Cleanups for v6.14-rc1

This contains debugfs error handling cleanup, a typofix and an update to
the FUSE block's keepout list to properly allow reading these registers.

----------------------------------------------------------------
Kartik Rajput (1):
      soc/tegra: fuse: Update Tegra234 nvmem keepout list

Krzysztof Kozlowski (1):
      soc/tegra: cbb: Drop unnecessary debugfs error handling

liujing (1):
      soc/tegra: Fix spelling error in tegra234_lookup_slave_timeout()

 drivers/soc/tegra/cbb/tegra-cbb.c     | 20 ++++----------------
 drivers/soc/tegra/cbb/tegra234-cbb.c  |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 +++++++++++------
 3 files changed, 16 insertions(+), 23 deletions(-)
