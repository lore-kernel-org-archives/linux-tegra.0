Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEC238166
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723396; cv=none; b=NYEkaHVnRgDaSpWeoY4xgUI294QxfQGkMreMyONTIJ46WGZVK1WrARl4iwzPWihIivhHUdbEiD4tZ3D/LTB5nDB96OqMNLX2wb2hzET/yRyuXZ/Gu2uZKXZ6jJ0QXmMuvv/6/xaz9iOUOTMAR9hFGjy48wwrRiA0/sLZ2uzuSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723396; c=relaxed/simple;
	bh=iNlyouCX4ztJ5uR+HLG7R9Ms7Gtp53ClA4DmyyIUaH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HGj5s2eMAXRKhGKwZT1WpYiQPGfqbsAQec/jyc6rJopE5YH9Js0XTvQJPkzGHD6ePLxpTxzOxso0X5FyxgNpK3j0WjmIlUlAytrPZWd/W9EISh9U2efvfnvJCM9zGgIALAFNHHZgetf/em2mlC66Pz0Up1nFl97cEbZjRUb5554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN71DYZP; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN71DYZP"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124566b6693so2120914c88.0
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 00:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723394; x=1769328194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=DN71DYZPhOtV44SN7xdmpv2lY1KzkXXKkmC6afs2r/x1gCPFX0oCLjO3axZCEMWTb9
         zT25Ur5EhUMncS9dOD4Fk7C0xwX2K2juWPBOkic1M6x7/+5Ucqe9XOMW6MmDuWcw1COg
         Ip+dZ1nH0g1XIYtiVcgKLpDKqpjrrR+Gt2g5OkG2/Rx1N2EZji3kAZ/kLElZPM8yKNmo
         Y1QCfhdPSOkMc60f76CtJjh7/W+zjYz0UJoQYQuJoLPY7BgDSFU6OKAWNz87GfanrtSH
         XOG6j7OhYN17j7PJdLKJFpTFHx3UqEkrldbCkh2pDK7zGFkQyeND53VI9AE6I2+BBs/L
         jIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723394; x=1769328194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=RIRVdHaDk7SmC33zojbKI+vDAkghCD7ryWPZso8XqnGpP704qrJdy0vo6XFZJdcPZj
         oLW2dCDWEt+cAUm0AWLUacuqfwCQBT1PicnNalPwyFzwrZUOWtZdZFEoRtQ1zOc1s6Sk
         ygsb1oXPzBCK588J4TKODlOzMezrUEkv0SqF+G7akCzusTV9WKiXTTL7i5K0S2/rt4sm
         HBuIXC8kTCpd8CBgda8BEb2V2rWrravFMsLzDCPMjoFGQ1rI33TWcvfdSsdewtu5/9NQ
         B7c4/93iqyLg8yjEnlBKlXmGU+dBNE7/TsoPZM/UkyBDLHa7QiYotE9LwCGoyU6Gio8U
         e7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW06A/LV5MjFHFNy8f8gyniT3p6E3R9DwTWvWfNsN0HXE9CQCYNs4ogohEmZtABe1gpSv5/JgzjHlCgLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQxExffwRL1GR1i2s8hBfPfyKZJGRgVvWNipytQVBmFcMEMfKK
	qN53RzJ9z4UVRqzlbC8eFJ52sMF8+cfqDeCvfQQ5fEoYkqTSuehoLdsB
X-Gm-Gg: AY/fxX7gcKEMD6hhrttY1AD7wyz0wnf4zCcX4T5wFPOvG1jiRevemkbQXN/GKM+KcY2
	W4uhVHGjoNp1llU6RJNm/LwwwSpqDpqZ/mVVp6gJqlDiEtMA0++4k9/uQMLViwz74tXY+lzX7g+
	gxnE7sjjBb4uwsRY+ZT0o2qdeG9SbyTVOyRLf7OXXgOltt17zQp1wec67ibleli+eW0tP5IijUS
	XaEz955ZEjfyOiJZfOCyPCabtOJ7bdbNYxhmuNNC4T9NSk5PG6L1weHXAImJk7XquPnvGmhaSP0
	7IZ6oXW8JugHlkZcz+uwJT806dI85tSxNZnSwbLJskzZT7oZbb9fkfoypd4sePXyhtdi84ZhNWd
	YPEexFJMDW97dsVipItpbh55QdOm6AYlodjdYMHQbLgUriE7+NMP0tfWfNh5kBJlrho5IYxbflv
	dD6vJxTUPH74fG3IwSk4ttZJ2/93e5bqoQGGN0QL7BiWdwqkagvzitZw/67o0DDU/q8YFPZfrQQ
	DXSgeRHnrtI9Q7G/Q==
X-Received: by 2002:a05:7300:c86:b0:2ae:5275:6901 with SMTP id 5a478bee46e88-2b6b503d29emr6365433eec.34.1768723393925;
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm8460212eec.35.2026.01.18.00.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:02 +0100
Message-ID: <20260118080304.2646387-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm-dt

for you to fetch changes up to 4d93678236678c4b6b0076fd11f4611a22b7e70b:

  ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30 (2026-01-17 01:18:38 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.20-rc1

This update corrects the DSI Device Tree nodes for Tegra20 and Tegra30
by adding missing properties (nvidia,mipi-calibrate and cell
definitions) to ensure proper MIPI calibration support.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)
