Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0172623;
	Tue,  8 Jul 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963304; cv=none; b=kx3TFyCukASQGQ255klGDktCqIDZ9u5Qy0Rv4KQxT58l6WN5EO3RFEmSaM9YeSZBByV4VHHn0zEoKoX7zretyFn69cPw5FmTROpaXolY0DRqHPRrTNVGiO/o6JJkzfMdCyq0OjEs54XpszZzLc5VzeXhulvIVLUDsnc+v8ZRJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963304; c=relaxed/simple;
	bh=fcsYySkyKk0DP0Aq4Is2D10xkXND8OyAUsiHqbhcgGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jm01qGzCZwUHOvEuWLZvzRrIERn12mazarjfacjC/9brhjbjrJDYcEgglV7zonY2tsx3dZeKtJlQ7sUV5Pl+NzoNUOOlKzZW54MErpqQ/0WdYwW53cs8/LXu2nvIEDS7PhxrOxwSbOooK6SCOYZQ8Me04rbaqwChgMk0+QgN+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMlE4PHK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMlE4PHK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1789252f8f.0;
        Tue, 08 Jul 2025 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963301; x=1752568101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuu8lpFeY80ClgGsq/Km2nu3i+uX/eGJHhg+l4rKngw=;
        b=SMlE4PHKYS4aj4VjCJm+PaBqjE7wqpwQjMa/d7WeB94Zyy1NjjxYd3k2XZ/TOGfZRe
         7PqXr977Zr7zosgU4HdAYfc7ztf0P4fdO1mgJjFifTdofEFW2H5JMuCOAm0e8PEiBpQ6
         /lYFQco11gzNYsiHrfTi+OHZ59KI9Fj3dTiDVBZ0xjXnACihvN0nJcAnC14bpNVhQPv7
         h9PMyHuz+ZJWi9LlQQiddDkh1SUKx2guXmLuFtYxahe7/KfII/rAD4iT9XL7JY07v5kc
         FUk0+2eU0uiROk1gcYhTMDHjMevfyy/Ea+nhsN6IQ5pxOUCF9ZLVA38Lyg8AcWKScHvz
         bdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963301; x=1752568101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuu8lpFeY80ClgGsq/Km2nu3i+uX/eGJHhg+l4rKngw=;
        b=ic/39yXsARLySRVhQbr1qbWxTDYXhrI02MuXIgFGjaSETsvKxYOfaOkP3R8QnnHp7e
         cKDw/ulrA4idY9J3R7ALHy5duwGXDTqa4gL+1PEW74ucRJvVnDXW5wcWoS28bUPOyl/H
         617t+bQpQW62cL0jyd8gJ13hY0lGk7bvvRYfIzGLsvQidEiczikS+FYFJoig4CEnoF88
         cNLkR3zbm3GEinBJ5+ByBeZyQULs2JfHzBzmUFIwlYsDmq6EH97oKd12BwTRNXNLfAch
         kof5ANd/MHpbHLTxac5RB6gY26umcFQVGP3vWB5UnrIEVyO+yn1YNeUYzUVQj95yGyPn
         PDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8NtG0/bPvLmGnbANLPY5x7r5ywPwabcELkWMTcSDKQYwVpy7YR7VMxeK5ap65jVMY5gPeo4OfN6KT@vger.kernel.org, AJvYcCV/gcvk/S0gT6AkRAvzS7OngPErMu9Zx4W/QL+oZgJxILQ73f0GGpDEUb421AkhkUaD8OIeibaWDmdTSDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgc2y4tJrz2KiMTY01up2q2WxkuAoxSy9iTu+E4lZVpiuTHFcz
	tZiXBMnfz45bIP9oq8ksqAQQsTqDpLfHfu7nrjW2CiYlcEeoKvkYQct3
X-Gm-Gg: ASbGncsHrAit34QFPeRdUHJAkZ/HVDolBVDgfK04cJEWCanBDbtnqcBr1Z8fHjEcvX9
	wSGQQqeBXqd22vOuJXPY5D3lggKWmjEeX8d5A0BJpeWV74eRbm5XJAL6K0Vsv8Ok8nSGaN1nTjG
	2CrTQ23/yY80uR8RYp7OFzd7IYNUt+BXtGYkeO3zW4Osou77+BvA0zmpd/1GgMgQw7II5C1aZVy
	jwCc3AnD/yTc3xzKWcebw5ZKxdg9ogP3IAJ+1PmMeZVZ3sePpgvsup02qJxP9DwlH68X/PmIs2+
	xpBPkDurqltlTsEKQPgKp6PtXLBlUTrgh2sZXMT67uTdZ6QSyOkRNpwD+XAEAFDCeUiSiEItvqV
	5wEcyld2qEdjdkQPzK7iXI/fN65zHO2ZVXFyp8rYAqgg9+5oNlOP5ZQ==
X-Google-Smtp-Source: AGHT+IEMixIAPuGtPEDuQ4OfLFoWm2PdLTuS6TyGGJxnF1mVvyiT8xcKYff9ghRZA8Ouj+E6IW2n6A==
X-Received: by 2002:a5d:5c11:0:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3b5dde9588amr1635900f8f.20.1751963300788;
        Tue, 08 Jul 2025 01:28:20 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c9f9sm12515888f8f.93.2025.07.08.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:19 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] firmware: tegra: bpmp: Add support for Tegra264
Date: Tue,  8 Jul 2025 10:28:09 +0200
Message-ID: <20250708082814.1491230-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This extends support for the BPMP to the Tegra264 generation of chips.
Most of the BPMP is similar to earlier generations, but new features are
added and old ones deprecated, so a new DT compatible string is added.

Note that this series is a more logical regrouping of patches sent out
earlier. Patch 1 was already reviewed, but I've included it here for the
sake of completeness. Patch 2 addresses review comments from Krzysztof.
Patches 3-5 contain some minor Kconfig issues as well as the Tegra264
support in the driver.

Thierry

Thierry Reding (5):
  dt-bindings: firmware: Document Tegra264 BPMP
  dt-bindings: Add Tegra264 clock and reset definitions
  firmware: tegra: Fix IVC dependency problems
  firmware: tegra: bpmp: Add support for Tegra264
  arm64: defconfig: Enable Tegra HSP and BPMP

 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/firmware/tegra/Kconfig                |   5 +-
 drivers/firmware/tegra/bpmp.c                 |   6 +-
 drivers/soc/tegra/Kconfig                     |   9 -
 include/dt-bindings/clock/nvidia,tegra264.h   | 466 ++++++++++++++++++
 include/dt-bindings/reset/nvidia,tegra264.h   |  92 ++++
 7 files changed, 568 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

-- 
2.50.0

