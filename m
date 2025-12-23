Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB8326D63
	for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482372; cv=none; b=JZc6WdbXcE+Tt2XZFZ8lAf04bTShjbvZOC/la219nZjieML0ECJHswgCd65NKyDtiDFYd7ahMMkrrbUih8zEQQwjZUf/oibstQEXoxdnXuksfK2KscrvyhW5MyxjWF9nvBHPvULmkdSg3Ks8IK5waYJKZwNvFJ2NhTRf7+t2ynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482372; c=relaxed/simple;
	bh=/Iii+N1pB+IX8ozivJEIczKINrVHiSyEufjWtYoS9l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKMx5p7sH9WoOVImNTudje21K1NEe58eBfOY4wjRFm0+lQqril8S7zytmhOmC+JZQmeNZmQPBGk4EdLd6Rw8tOYBq18r3JNainmmUARD6YDfUI3wWiDgGMRAHx0nEsEsj/U6D7mqgAM6WTwnnXuIjQdUPC/prBIi810LGeRjvmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC2ZUeGS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC2ZUeGS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so31941075e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766482368; x=1767087168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=EC2ZUeGSuM8CwnRloLZx2AuqZgK3J0RtcPxKLIaqLsObdSndiYv1HJ0pel7CBW6LoH
         kt5V18p726ApXWhiiN9Mm6I2NEAd+FcQtkQZXVEaCynvHmngDJrTikF28qZSWo/Pqiub
         yI6aCXIbbYMh5KHH/EQdKSokRk/ENS0eO4aK7OYO6qwvEKUgBIlaymyYjhLiVpekz5ea
         3+D31oace2S5F9U5XlfBVh4MnRQ5iHhI64pYRMtR54hS1+582ptSRucetS0UIIcrB9HQ
         qakT5dfF0gFS7iImfxGHGUwvPNiILPAIYtb+sEqj8UKIDOPLbgUHEUKB6pCecPdnDa42
         nwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482368; x=1767087168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=EhRqOUvLNk29XphcarOEEAWSTyRYvtpDl4M8qA52zhOIAO02E/DRDzGuws50vyrsXD
         o3tHfgX8bLRaXjkpeBhqHPuATmT3LW4VTSyBXYU21xKv0IU9eB2bcBPfVd5hPUiXypP2
         M+vcSMio0I12SDvI2AzLhGC0qaHn+0AcKjAm6pzgz0JtblcjRgHgOeuKwkzCb54zDq43
         JoMvvkY5vqArEfD/3LjTD3azs5f6U1n977+0aLu+ZET01p66yVhLWjLDG/ZTit4CxxW6
         UE9jfhV2GE88hRr/Nc0XBvWUDWuyHUPSoKDNTfgAh3WmmJxLrbvRQ60N/5Xd+JewqOGD
         CWXw==
X-Forwarded-Encrypted: i=1; AJvYcCVksTF1fU4byIgJqzOtVEgK8BpdlolEY7vGXiANFrzasrz7ZE7vzhJuvY4R3qmGT4Pdx8XCsT1y9E6yHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHTrt6o1AGbMMQWFJIiC8DhOdbzDHcO+nifQ+NTl8nIZcGCoh
	2nztTGD2PtTjaOrkf8A+Z0jAK6KHfmnuno8TjXK7iC9rSQi/bgvV6+XR
X-Gm-Gg: AY/fxX5UupDT1Dx5FGfFAr83OgKHvdCjLtzokV6MQiaq6xVpiUxDZkjvNXAddGQ98fF
	9KPCRHDL/uanLSNM34WGLIDz3d/g3L6nJjJSQPNuNsOJmM4s/sG5E4xE3oO/gFBcGFdgmkolVa0
	2ZVHcS3WIO/eXIoK/IJ25vCp/8+0Tv2mOrGBVk9Lg26LncQbic/d9IfNrFDJJm8WoGI3gfldqFv
	JT1dgnq4GHKpB+BLBD2H+ztD8iTmtEKeST8W5yFjyq9ZD52s6Hg0xr6ppyyxsR72DCHzl92g4yY
	1+2Pa7MipLlVIdWAnT+Z/Nk8cKDc3yL5VwpjKQ4zncjePQOWfXWi42a5g1hMAZIY3NvNEo7yDzP
	sE0mg3JwyZE4vFzyvFaLkfc1Ka93wUP4uRGhYf5/aVkg2t4qEiS/JjeKPUTZVO0ULpU0Ycz3KCR
	Rs
X-Google-Smtp-Source: AGHT+IGvi6J82Rgzr2zCOEmBeT5lUa3Wx78GAwGqctUMSFJV6I3evSDSyLrVDEeoqnj/mU6Cj72pdQ==
X-Received: by 2002:a05:600c:37c6:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-47d1953c178mr142674055e9.3.1766482367600;
        Tue, 23 Dec 2025 01:32:47 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm282891485e9.5.2025.12.23.01.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:32:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] ARM: tegra: add support for Xiaomi Mi Pad (A0101)
Date: Tue, 23 Dec 2025 11:32:35 +0200
Message-ID: <20251223093236.6006-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
originally ran the Android operating system. The Mi Pad has a 7.9" IPS
display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
internal memory that can be supplemented with a microSDXC card giving up
to 128 GB of additional storage.

This patchset includes some schema changes not yet applied. They can be
found here:
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250909143432.121323-2-clamor95@gmail.com/
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912065146.28059-2-clamor95@gmail.com/
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912064253.26346-2-clamor95@gmail.com/

UPD: patchsets above were accepted

---
Changes in v2:
- added fuel gauge interrupt
- added CE gpio for charger
- removed always-on for vdd_gpu
- improved pinmux configuration
- added camera regulators
- removed usb@70090000 (already disabled in common tree)
- set correct modes for mmc devices
- removed thermistor thermal zone (not used by mocha)
- fixed pmc interrupt polarity (removed interrupt inverted prop)
- configured OTG support
- removed bluetooth reset-gpios
---

Svyatoslav Ryhel (1):
  ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)

 arch/arm/boot/dts/nvidia/Makefile             |    3 +-
 .../boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 +++++++++++++++++
 2 files changed, 2792 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts

-- 
2.48.1

