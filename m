Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2E21FF45
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271805; cv=none; b=U1hhyuAyO0Z00wzINIdVeYTE4FzUeD5ZhS3TsO1/se6hq0WgZFVq4EzniSVn8YYBE3uZ+g0Xq9OWXakTxwToo7dz3VyHHwnZP3v14aMzIRQEiRCBwK1u7/QQe9NgRGwcLiLSXcYswPiZw+HY0r4TmKkRa/QiQZ2dg0dX101srwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271805; c=relaxed/simple;
	bh=q4eyy1TOD+UdXkmBv/Q78KZjA2myUp8NUt8Yl4W+hIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jJiOBvCV9wtVcRt9qVULzfSr0U0iz5kTK1SZDP7UnB4KZ3hTQusq5qOt5dJ9qTcA0n4fEWQITfH3EwCbfliIes/UgtWXtAwIcgeVoOl2nET+bUXswKn2TRpiT4hgOdpV9rJ6oXb3ndjvHfgbVwCWkmXpHjjoelTR5SxYIjMyojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk33iDdv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk33iDdv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so7413035e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271802; x=1752876602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=Gk33iDdv/qOIOLIjSGlIHTJ/y3E4yxTxjwvKDIirXo1sUArQyJanvF22zJ9dYh7Ram
         OsssCGmYOM2C08IUH/kn+kYuzec7aO8wzp85URynpe1X0Xo4GGV02KdtM3IYJbGeBS0b
         OjiR5ZwLCG/NOWAzgZsVUWp2vx9f50DWzBlPpYjLJLzCsagT18ckIR5/kvwZTvkqGUNo
         3NQAClGOxKpp/JWyTag/BYZH4aS9RMsgxlqYlq/Mf4riNkwc2vkPIzmcVbEOpHHEnFVo
         DA/IFoi3oc5AEK4kiH7jMeUsDwpM6smdrzetYkOaUfTSctOqP/3JXKevl91HpsPfeZog
         wmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271802; x=1752876602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=oZRYuh4Cjrk29GdaXaCtPbWsPcJDGPpMIpaP7ziXmHiFGJI/nb7t5Zi7l+uo0eyCew
         rv2Dw9yX/lQZ7ICcHTlkIS1wV91rP9uQDhsgY+1oPhLXX1pFJ2TtO8IbpadmSEYvU9DA
         3TwcbfuNaBQZrq+iS5G2HK9RO13M1SCW4m+hvl+/ehrdED6jmiGHOB0mCW4H/hj4oHpN
         8uczApr2UsYXVkmVpqxac7UVG9YTclP/aY96ZMoRII0CQltBxYVIglzSH8i0bu8qb+Gq
         2yH+l1GrfmY5PPvu0ftC278DvQI3VyL4jpaCooCVeq5FC9fV9z0ugbCAIpzPrsfYuU86
         2anQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJRu/hS0Tc7/YDmWCyJEshuJfJ4gIzDLrWfLg+/XtLnUSEg6NKJFzYv2qu7oQXGWX4ojdnCOuEyiHrug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gJFjcFwxq0HS1yrIY/k3YuRSVyjacR17mejc+PaSFVCQ1fsU
	QBYgkPpiBPS8LVPnBGCHbtt85oOuW6GvamAXzwYumhyRIqNVq2+xi1ne
X-Gm-Gg: ASbGncvKM2iHs+9bsOMH/mGrVJbrwn4YBmZeooiu6IM3pZVPLc96UohEexTJK5F8XZo
	AH31+MjUb3f0NJRoY5elprbpJWVENVre+G6zvzCHawgfSokvHLpF+BslPOqtUWfyIePoZyrPpJS
	2UTcMyWfQt+Y9zvJ6AJyQUWAFDL/2IYF5LMB4ghCgEHDFlI5Hj32hZfpS22/Jl/r63crQ06SkMi
	mWHiZZFfA2nH4BgPigaWkifyj5kKCLqWroiHItU8M/HaoiHR1BdNU0Xp8ATw1C23+x6FfPRSZMZ
	KTIv9wzcLa5S26pl/gjirwUwqUW55BlEWCXA87/vs3b47FyowLU9VkDloH5itAYRLgDXDt197vF
	aJX+fHO6J37CP+Pl3UxPeyTbZm3MKIHQBfigrx5f/KVPbtcARk4T12ZWBrjlZwe31lWnhbSDpmf
	LS/eTpYebPAWWVxbNP9amAmuqJ
X-Google-Smtp-Source: AGHT+IHy8K+cMlEn6WaDFY14pAsG9qqBk8/FSdFXqmhoAJtzNEuZl2gUeQ1mPurKUKcz5UGZPQj7jQ==
X-Received: by 2002:a05:600c:4f4d:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-456058e1e70mr909075e9.21.1752271801720;
        Fri, 11 Jul 2025 15:10:01 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d50df5a1sm97491575e9.22.2025.07.11.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:10:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:41 +0200
Message-ID: <20250711220943.2389322-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-defconfig

for you to fetch changes up to bd3b8e53e244fec2255ab037242230847559161a:

  arm64: defconfig: Enable Tegra241 and Tegra264 (2025-07-10 23:16:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.17-rc1

Enable the HSP and BPMP via the configuration instead of selecting them,
which can lead to problems. Also enable support for Tegra241, which was
never done after support for it was added, and Tegra264.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: defconfig: Enable Tegra HSP and BPMP
      arm64: defconfig: Enable Tegra241 and Tegra264

 arch/arm64/configs/defconfig | 4 ++++
 drivers/soc/tegra/Kconfig    | 9 ---------
 2 files changed, 4 insertions(+), 9 deletions(-)
