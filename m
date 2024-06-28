Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984A7711B
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608906; cv=none; b=L3XEAzr4/LxOdYAd/sQ/mVYtfBG59M3lwAd+f9EzAMpoAyzofezwR8aCNACsGgt/R/JggLZ+XnXryVT1IBQQKwWE/s+6dEapC4u/gF2WXkDKZFh2L2qBaHqfzLYcLIIQW6vg95/ebPRVJRfybX8Da07nbjOZ5aX7BCO+b7Soa7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608906; c=relaxed/simple;
	bh=4cn6cZt5xkb1OhD5JI6FGw5AnFepN2CT5hgAqvTc5GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRWU8B8aP/w3IByWHyfYvsWjDIGJr8kOunTwtFlKPGjNyJO1kdzyRRwlV9C/VOXW6CNEYHVUR7hPQwtHmv/hQo3EfnVZA0p2aXvfeDyF88DRpg8UJDNfQ05HhK24zRNmjvLLiA4EwiQoY0BwJNDl0ozcCfNSsw1G5mQh3e6XbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnyKcU0m; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnyKcU0m"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso11242271fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608904; x=1720213704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ/W9G4dZKCyzjAYQZCsNtmrg6zW8mHgl+YEz0860cY=;
        b=JnyKcU0mhohc7Q80kTj0DLtifPwCkvOL5A6IVQcYHrXSLn3azHmuoNFFA9hzq8aXx8
         GkGZ+A6x2TfztVcGVhGc8FAdHV64hMYZ9f+KjlK6igVsWXwGsAYhP6403Mj7MUuNsyuy
         R6A1uPHJXtsCeVG9krJ/LiWsB39JwgYNNPI1SowI+OkEsKGT6wIXxLUymvjuD/Lv1syu
         iQfn8lDg3vC8UMpvdjfhc/X82e0r38LGGLePHTWl9P6+/JMe1toEVzW2BvQ+4Tpid28a
         k3WmDB9WgditO7w1UV87sGOt1dZYVHizC5CMqIax32akEnk7D2PH5+bAAFWXbT2JAwbD
         /Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608904; x=1720213704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ/W9G4dZKCyzjAYQZCsNtmrg6zW8mHgl+YEz0860cY=;
        b=YBBU5gc7KpQqjLLRm2udfkUWYPHxq6PdCY5svHWikyBWkzAMaynRgpKsp9YlX9bSiI
         LvqdqoJorempF3eDak6DIt0i29/Bud0bSnf2+Lms1PyCHoEQDBcwCty7S0Q0sxkxE8Ks
         lljV4TUaPqYiYxJU/Zc5gY4RYLgDThUZalM9xyn+bisU0Y/TchdffJ+zuHqoigP7NM3H
         pqc6sl6CDipVAntxhDdS4lcKHa7Q2c94KO1eohUoIq1ZJk1Gr3voBD4AjNqGE8dYarNU
         3eHaWElim/dp2UKAzC9x9OdgAh/OXPeVE0U54Odwlt/7jqeX6WId3Ing8RHBG3c4bv9n
         IWAg==
X-Forwarded-Encrypted: i=1; AJvYcCVu1zOih5aqN3dFLkG9K5JcgjkAUzR04oh2Bgk/0rawrUQiosbMsQWBNfAGmYwrRxxjVa2RKeiD5Wr/l5mQ3YVN5IURff6PzFMyq+4=
X-Gm-Message-State: AOJu0Yxq15ZEVNNZ/O6VxC1wFG7wLpptfBCbf4rcNLYRAlty2FYnyKXP
	48BsFr0u8BzfE3A7opOYvaYkP0Ci/ByHB3O52TPSj7A8KIKJUgKb
X-Google-Smtp-Source: AGHT+IG4ZgoDdwjLa5g14lGKtlAXhoLYbG+jdBqhScB02SXst7kZT3jB1EB2OLcYIlOGTKamxF2qqQ==
X-Received: by 2002:a2e:9355:0:b0:2ec:5b10:685a with SMTP id 38308e7fff4ca-2ec5b27e816mr109127741fa.17.1719608903013;
        Fri, 28 Jun 2024 14:08:23 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09aa32sm50642725e9.34.2024.06.28.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] ARM: tegra: Core changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:15 +0200
Message-ID: <20240628210818.3627404-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm-core

for you to fetch changes up to 237c5c9581b4f66c0ad37c6f67c14c79f0847595:

  ARM: tegra: paz00: Use software nodes to describe GPIOs for WiFi rfkill (2024-06-28 17:52:16 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.11-rc1

Uses software nodes to describe rfkill instead of using a GPIO lookup
table.

----------------------------------------------------------------
Dmitry Torokhov (1):
      ARM: tegra: paz00: Use software nodes to describe GPIOs for WiFi rfkill

 arch/arm/mach-tegra/board-paz00.c | 50 +++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 18 deletions(-)
