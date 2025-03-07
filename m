Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CB23BCE7
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364623; cv=none; b=JDnwbGpycYzTAAjFSgYlzyOi6y/1LAdjj47PFEhGF8NVc0XhHt4tbcI6KE3ibh7L1kwYaTeJ/lbjXxqcNL8ZccYcCqWd9K2FrSvFDhb5ozvhLHkA5+QhxkWh+ktCPqoAa63ocATQPqV1jwGi2B6cdgmzrqGg+FI6OJDc3MQYRwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364623; c=relaxed/simple;
	bh=0qnzuf7i/jWMEVzNWemdnSZK4YpcNbKodKiyZFGgWrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJwHhy7Lngzrdd4rxPBiwZ+Y1JuZXoaFPfUy/dbrcrDxOxoHM6n+AH/mTTOy8NNKNurn0H1URaiqptnQJ7zb3HRw55c1ltFobvgyssgPa5fOVpku07Wz1HrmFd/QO2O6P1hr17a7LDGmj0rawLB4I7RqTevhPCJRXJMQ8mvdXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz3ZMAKX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz3ZMAKX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2202324f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364620; x=1741969420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=Dz3ZMAKXJsXNNK3fdcpXDo9Cu6q1Y3JGbun4L1SWeUvRBp6OwE7rBRxFozsMRurxi3
         Jh5qS7kGCKGrei8zX1v/b4FbqU2W6B5OIqkCJeo9pYOP+d3CaeSGpjN1jwZkAQploGsJ
         uv7/UwyGRlzIugI5Dbzl3eazV4kiLS0qjPf3nYtDl/nfyvp7gGgCPAkJEpmZESrtZZo9
         wMxbMavl4InoxiT5tZRpu7EUvAOMzdfHY7dRJtVpNFRyBQcdjJI8Rn7HBh/LbJoaQkn1
         f3hAfHbYCnMUjLGK+zyBf4tKPwq/qEzBctW12eP7fcRgQBaZbcta4t+l4vbmS720KSJS
         NZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364620; x=1741969420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=tUZ165oP7Ym/0Sjq9Ye7sf4pzwSjxsDyuHFk6uu1we3GOQAfME4i33RR5zFnnEWbnu
         m2zaJ8YrU2DmcqMy5W9ou8sYq0/xPShx4GCMJSubZ5/ZQpRAE+/BiZEv9fF35+Bf7WbK
         iqCZmS5DniM80deiZ9zrCKXUBZXNnH3wHkotG/VR61TqHcEMX6aRrwRlMQEnOZZrGVXz
         tEXh562GxJ4EdroFezUEfRAFHqDSPJUihluy+DpcQuNmUmQkHswcoruilDEYEE/VqndR
         WMSQEK5YGkr0HXfmYGNHzsiRe5RKxjNIWKf/hgQO+jLXo6KJMI9fCMVsci5uiZuqGvcM
         NzdA==
X-Forwarded-Encrypted: i=1; AJvYcCUF+A4F2GEQSluPPyeCQGi/RQvSt8+fHyh82/LsuOBoX44PvU6ghILRyywXg+2Ci5UIsNnboZmA9BhDhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6n1jlXtio0imrRK0niBeOUuTTG2JoGmpjCrFJRtRgWFIcvn8
	TuuRp2v1S7wFUXbKeuSNl+ej9WakozTbJjFEtZFP051dO4+JgnZe
X-Gm-Gg: ASbGncvGOhvRfoc2rNlihFuClqSUSn0/2p+l0/Z63mgaHL2W1IqtzMpQxuf9qvF+iCK
	HSAGGUni2QUYzKBb8i3aIpPqhpLZ8BH6qFCVV5DiJXAYAeKtvpi5Y0dO0TDB8ONFD5Pn7MT5iD4
	K0GXtE2hab2HOejN4n/gTromMIjLEtu2SupyANV9IZArg60y3apmLX4MCQjCBvJh9Nt1M3d9WW3
	Cz3Mi60QyVOxYvritGQxwKE98Ew01JYeAbj5cB0je/2I4t7ca8y3zmBqT4BFNBos6FA/HAE0OqL
	J2taBDZf7K19S0gphEzf3nv1MKas1D1GMVdCTkrvqnrzklpvPKmGNTHR3sOgihf8y+oZLHHLKJ6
	DVXRbdpWhO+w6fQ2wabt8V4znxH1ZlWhCtY2F
X-Google-Smtp-Source: AGHT+IEhX8ZynmyAzFMFULwh+yVEDu1g5TElWPkMZEgTtFM6On/PIukfaMQlBYq9jsNHdbJxeFWLFw==
X-Received: by 2002:a05:6000:2a8:b0:391:2884:9dfa with SMTP id ffacd0b85a97d-3913af01fefmr123803f8f.13.1741364619557;
        Fri, 07 Mar 2025 08:23:39 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dad73sm57497225e9.19.2025.03.07.08.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:30 +0100
Message-ID: <20250307162332.3451523-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm-dt

for you to fetch changes up to 237a868d30e7a744b64479ff98ad86b2e3008943:

  ARM: tegra: tf101: Add al3000a illuminance sensor node (2025-03-06 19:02:23 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.15-rc1

This contains a few patches that add some missing, display-related nodes
on Tegra114 and Tegra124, as well as a small fix in the display clock
used for DSI on Tegra114 and the addition of a light sensor found on the
ASUS TF101.

----------------------------------------------------------------
Svyatoslav Ryhel (5):
      ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
      ARM: tegra: Add ARM PMU node on Tegra114
      ARM: tegra: Add HDA node on Tegra114
      ARM: tegra: Add DSI-A and DSI-B nodes on Tegra124
      ARM: tegra: tf101: Add al3000a illuminance sensor node

 arch/arm/boot/dts/nvidia/tegra114.dtsi          | 34 +++++++++++++++++----
 arch/arm/boot/dts/nvidia/tegra124.dtsi          | 40 +++++++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts | 11 +++++++
 3 files changed, 80 insertions(+), 5 deletions(-)
