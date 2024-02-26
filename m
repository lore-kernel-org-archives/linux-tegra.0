Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B112C553
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958740; cv=none; b=Pt5CTb/b2U8S3a46AgXg2vFQ1zvDIw5Qv/deW+7p0pz4zuvoVcwAd8sW7SJrVrXjmFt+CIInMl/cv915TH3bU8VyMq2pu7Q7//s2qgdwJ6QH07CogvYMf5yt6fHhQKkxrJTvAUx3RidWRSVmviokNgUvIB0T/DFrJKLiPXBFs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958740; c=relaxed/simple;
	bh=HD8XGrlJmuwdvJhYVwjsu5cGNDMPExUwVKY9McgHRlI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oT33abirbQyIa6o2vh6fdzE6w6aAIumXLDWLTRtoLyQmsZ4OvprQB0uBxyyPe03suS0qLzV29cAG3ReH1kAUnUoR34sA29EN6T3uVqibq/786Nf4ARC+mM+I6JgImrz8CxS4fOAECi3cgWrcdjpcmqv+CiU4fJs1ol/cKwpUJ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asdyoB3R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asdyoB3R"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e550ef31cso354032366b.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958737; x=1709563537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=asdyoB3RF1m6BNAmYiKlLYg1W2B8LoDbstJbLz5xeOQ2Aha6ZtAtHcjO1RhLm6vtHM
         z0uBInU4jEVnfaB8ZmYejSfrmtqH9Gq9QTkmnGdPoI3n6FB+L/zYtaglggFJZ2gNZlHE
         tr0t9rBjbkmu0AqSdi9ssvtJ2FvGCngNivKhjSzF/0wg0OI8uLE5zsUyZ74UrSYecTH9
         0PLpI6URyLa+/GB4OzgRK4eFWUFcR/IYDhKYEyYFtnQBu69MvkyNhw/+njw1z7IPylNn
         KnfCIq937+cUOjDJ29SLLfZUytpM4cTJQ5JY3SH6i0EtF+YkL79d+uv0GEA82rXvlUhC
         ghPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958737; x=1709563537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=pM6yOaJJK8LZLfMdw3zPhqWNWwsl4mUcpMkRV9AAioIucQ2FVvb29MUWrd4Za4lXxp
         19lZ10WPKI59iJgiA8USkVhF96OraYEt4Pgl+I+YSvMBem5YgRjs1CE1nVSU9i6p5I8U
         FJwT1rcWaoQFZfZHK4oTWyIHrxeMNP6hSx5tqiescamCDC9S4kfyxnlMy7fWGY6UzDcj
         il8JBKw8buIjaSauiOdPDVF6/8UiWMQfD3TzHhWpGMO/EdS4EK876MV3Aas3ynan/FHU
         j2Jr0/28XfqAqSyQfAxfcoVTSiNsFoDWjhz3bfDeUChC4HFaiBziDCja8zS3Ct4As/t+
         RLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp8ruaEB97hmbkpxQh0kBbtLsPYOLgqkDWtGmabbSBQtFnDQ3J0UYedfDEfBiPo8emiKT+604QErL6deQ/ofv0Clr8h6Z2RNmchus=
X-Gm-Message-State: AOJu0Yz+UnMp4+urzTr8L24kCqUS4TUN6gAFM9uaP2FxZcMN+G28JIfZ
	u5htdo8wrDAfYw0J+s5Nt0qnz6E2FlK7BZFwvdP57D8B+PH8BFivDZUrexPP
X-Google-Smtp-Source: AGHT+IHc29NHWm3fepWcp3B7//v3LrzDODYL4KaSq4pbw65xvR+khbcC0gYpft1fnaOs7pu1kPazZw==
X-Received: by 2002:a17:906:3793:b0:a41:3e39:b918 with SMTP id n19-20020a170906379300b00a413e39b918mr4037615ejc.24.1708958737207;
        Mon, 26 Feb 2024 06:45:37 -0800 (PST)
Received: from localhost (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k17-20020a17090666d100b00a3d8fb05c0csm2483296ejp.86.2024.02.26.06.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:45:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
Date: Mon, 26 Feb 2024 15:45:35 +0100
Message-ID: <20240226144536.1525704-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.8-arm64-dt

for you to fetch changes up to ff6bd76f4d997642ef390bffe42e93d6f7be87d3:

  arm64: tegra: Fix Tegra234 MGBE power-domains (2024-02-22 17:58:59 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.8

This contains two fixes to make the MGBE Ethernet devices found on
Tegra234 work properly.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Fix Tegra234 MGBE power-domains

Thierry Reding (1):
      arm64: tegra: Set the correct PHY mode for MGBE

 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
