Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4A16D301
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154730; cv=none; b=j/eYqApwRRxDUtKj98+gTUJRYkitS8p36rCV5hfJ/NyJH74gMf8RDlNkpFA/jznmpzaWpWdWcWL2eywPs1XDRDYxYbMg1RMdrQTnEe2ojsKXUbhKifrqqw4qIVPPOkbsAQlBgtXwgdRIhxHIG2DRGsSvsnCYA61hsij+QcsuHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154730; c=relaxed/simple;
	bh=ZqJ3iVBYMSBHBVBvS0Y86DMPXf8yCPDj40VJeFLuZvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CqE77+tWMDQpvvbiY1T5n5/7gihc3ZJOzNW0I5Yb2eh1R0jT58jpJy1ZnOh2txFytpTwBewwS3ds4DcpXFHelGtu8oT00jnFlVIZ7AGQ8ydt9uVvik3okg025RGNzxdvSw9eVUXdvBiWQVIKg2ng4sua1vQ5thajLmBmAYlb7IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KankiZVP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KankiZVP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so20275835e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154727; x=1714759527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XB49tGVq8/oqGDvYcm6xbYCDDcByu96D48kyxbsvgI=;
        b=KankiZVPbZaYzKMLfu8XwHTnx/9ElnyDBvJjVdTXOeMS/RWCiROxEP+Cz82+YDyhBf
         yi4xvMkIdgN/Hvjnr74Dqel6wu+qFAAiUvXTgw7YiFIfj8kmzVqLrJu7OimevN7YDdLl
         EeKblibmfTLCLDotIvv9NBuWBYVLYwgBdZSl9FGq8Ckiu4rqCP+QcagqdJVVQSjqOkB+
         zdL+bo9v/IjkJ3tNT3G91SVyk6Gz4aRjX68/yBmz0tl0yCoeml7rGMBfPZCoGgwrLM1u
         kqzQCBMgkORADGUsy+hbQ+KiG9YEdArru+yJ5xmgIa295a3GhLZ4aDxbV0h+tDQizJzV
         otEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154727; x=1714759527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XB49tGVq8/oqGDvYcm6xbYCDDcByu96D48kyxbsvgI=;
        b=YvT1TgaEPb8sT4EFhTv8CvQRlfuFjg6cNLWD50iPM19BdruyGvb5JYotrV1EESz3Wf
         uiooPR6ksIB/HDPumfhORSnN0zRnT+Fkvhtj2Kr5GBUCrF7ynh8RDPttldln7rz8/lKH
         5IqZEL8bKAJ2tEK43k/F3DShW11OhOhRmutn7ZzbCq9N+ka8tAO/1rH0NB7PsLKsxVan
         Q47SBVxulUhgc8hUR6zzL05yL0M7KR335ItomqUH1B72I6RzMIK4stG63C96F/om0VER
         2s8LhryjYJgPSyR8pMZziy5q0cQNuDcntfTnCmdCUyl8OwQZbnm3jpK3BTY9h4wZiaJ+
         O+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVzGszIvUfJF6xLRpaMasv0fU3Tr6pnt9kQiDksF775f4zf9lplNbgZyp7ERGwANkAgnS2DltqZSJyaKzWUIR7RlXjPC7qGqLXncS0=
X-Gm-Message-State: AOJu0YwKzt3giAdpgF8vwBcz/XjlYB7XiyUSoDEnFbrExZo/qrYyK2aF
	TEf+uJLpSB7Wjx4V8QTQ6ySPxAMJPhDNaim6rN3H/0iwsmMmi4nG
X-Google-Smtp-Source: AGHT+IEVOSuQqh6QuWNOlrA9S0aszuOQjxCnYwdaLsOY4O9O6H5Ry7seW3EvjqEvwKEDjgUIkaX4yA==
X-Received: by 2002:a05:600c:3509:b0:418:de31:7148 with SMTP id h9-20020a05600c350900b00418de317148mr3129431wmq.3.1714154726677;
        Fri, 26 Apr 2024 11:05:26 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0041a9fc2a6b5sm15091017wmo.20.2024.04.26.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] ARM: tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:16 +0200
Message-ID: <20240426180519.3972626-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm-dt

for you to fetch changes up to ff4d7e172100e2c35c92ce96881c3777ac566528:

  ARM: tegra: tegra20-ac97: Replace deprecated "gpio" suffix (2024-04-26 17:45:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Changes for v6.10-rc1

Adds support for EMC frequency scaling on PAZ100 devices with RAM code 1
and cleans up deprecated device tree properties.

----------------------------------------------------------------
Mohammad Shehar Yaar Tausif (1):
      ARM: tegra: tegra20-ac97: Replace deprecated "gpio" suffix

Nicolas Chauvet (1):
      ARM: tegra: paz00: Add emc-tables for ram-code 1

 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  4 +--
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts    | 43 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
