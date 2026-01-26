Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F4246BCD
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461604; cv=none; b=o4KdsKJAC4XwmMEj40JlrneEyPUvIR+zp3eQ7bUTWH9w7U5CW+nUZe5wz4EWJoCMflcwsogZawpTOprQueCPpbD28vupIF9bp882ZSYbSpP/ujH8aUrBUENv9BEziuHyjMCNsXea98s+SpTZDQ9Bn/SYEB7rXqMVpG/o7lDbDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461604; c=relaxed/simple;
	bh=0ZLjOafbstfY7O6g0rLNo3bzWByc735QArVhnlBsR54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azgYjoIzTF1WSnLGJneDoNZnsz+5j47XjjsyeMZ2pazWSYr5Yzbdu/OEBfWudhXEX8gUycD6nWY4yGHx988QhiYL59XQItUfOpJXAuIf/EvJno+eFMi3BUTO7DKh7sHKcrZVn9g4FyDt6L32VQOkuVu3hhstuUPoH/MTByoLG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGgRPjvF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGgRPjvF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b86ed375d37so566203066b.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769461601; x=1770066401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/tD6zuUpYbmd3SPWDVT715ovj9xGSOpd1b3b/TKmVU=;
        b=IGgRPjvFHtqA/ZzcX2RBfrtAf27QmNlBBcOyEnKNfN3LTJew58t67qehe575GpjFsC
         PrKnlxFYIt4QWI8/J/cvzbsIa/+f2PMSBx7lOwQt/o20PWmw75J3iunPrzU2BaffjyuU
         Cjn891v3AlqYfRd4rAjLfNXiDlMrNIkh7AdYYxxYdKOKZs/7/56rcOihxqnUAa9hXxue
         gFlJrEFMwISIxz4zqou1wa3NFX6vuna1g2oN3eMmDxjx12tXlsA1vvL33UKN0IIjUnhK
         u7VZKQHpse4oNwGw3O0Da+UpJT7YzyrniPMoMZEurWOMhtvjf1wAqfBP2Bp436Lku5D7
         ZELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461601; x=1770066401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/tD6zuUpYbmd3SPWDVT715ovj9xGSOpd1b3b/TKmVU=;
        b=Cnx7b1z4WiloVwYKtR/9Z/+/9rvbfaDxAimJJMmUv/uIDJe6+9PTYtdo9VKgaWcDCs
         wGhfX3FNVEJ7RHFYJTuHgjyohcIDBl0gdUvzUFqde79/eNeLM28vzsfUS925DSkCf9C+
         cZfpP2LHOuyZpU30ueFNZ54RmIF62/ZdWNVTeraMSMvo0Xfpw0xRsrKL32y01Zn6og7w
         jrZOfzriFlgubdRR4WV9m7wsi2v0Vxw8rFAHA6tUVRPCuv3AX8zo6YxmI1uka/Ox30Mz
         QwTROJeKJda/5fryAS78y5YP9HGOLdGJJ9lIvVyvAiDHm3y7dRZNqb1KSFCyoCfQ5+Jl
         /KkA==
X-Forwarded-Encrypted: i=1; AJvYcCXfSF6wANhQtpr55TCp2hMR4XHMh89qhWZA3FlKRb6Klv10nc1YMsceIP1bYVRrtGwyVaU8/pxQpFB7rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo59x784XpRHbIcyEpiUcFIP7L19bVeq7yC4hsPZitc76NiShc
	+kmpqp+yqIltOPhhif0nh6QeqehBOT+q0YZoBuXI/FIn7MDTAOxAWsDsopMwtg==
X-Gm-Gg: AZuq6aKN4yArpnGXo3v/ajneRf0zWI6vckd7ctjtoYNMkFdmd1bJccsSujlKnI8F6gG
	nON3Z8GMHFsnkkD13t7yx5A6VzCwLEv4lzNCiBujGJtEGKjnYzdhr82kwxv0gaEGjUV9jBWJiTg
	FI1q01EsECqViGUtrQQtwe+JBqQHADSlNz4nnSrYmR6LtcGiId0Oqq7jHUMfd8PTLV7tpQUosFc
	SDIcUBjPVDDiCN+KGIptqsLGG195krx+6GYbVlcCxjlO/eU6ltPUAg89XRtScBI2E4Cgm+BnJwt
	SK0oNiWXGqCwaz3mLW+DCgYKKSBfgPbUjY2AOK8FXQx2XHgYkBRgE6W+NRoUoD+5FegYfVhYygk
	ldFdWInAznCiHa44rg2Pg2Po3HHGOV23GciiZ7Jqnol509NpRt1eM1pvCcYBY1T8lWECqKwv8a0
	BhFTuZK1DEnuM=
X-Received: by 2002:a05:600c:3f18:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4805d06ae8dmr85958385e9.32.1769454947047;
        Mon, 26 Jan 2026 11:15:47 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] ARM: tegra: configure EMC and PMC
Date: Mon, 26 Jan 2026 21:15:31 +0200
Message-ID: <20260126191536.78829-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for ACTMON, EMC, PMC power domains and interlink them.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Plus added commit with power domains.

Svyatoslav Ryhel (5):
  ARM: tegra: Add ACTMON node to Tegra114 device tree
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: add DC interconnections for Tegra114
  ARM: tegra: configure Tegra114 power domains

 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  181 +++
 2 files changed, 1620 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi

-- 
2.51.0

