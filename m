Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858F2C181
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828548; cv=none; b=IsFUqsvB1aMGMdDlBME70bOytBJ72r2VJImB/9KRfnotKgoaGX8iQR3Xs0PgtnqreN78Zpwmal+SpIAdvSLdGY995yJZxIWQ3EYfGDaABuNa/ZXfUuq+W/KjjXQmrLV/UbVrCXaRQXODitJ0CRVlBt9CrRoVaGEPJ4PBF3nw/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828548; c=relaxed/simple;
	bh=/Iii+N1pB+IX8ozivJEIczKINrVHiSyEufjWtYoS9l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dtb/GzT4S9FxNL9v6A9soUg8szwSUpNjs/IZzFacAG9FtV3fkuM6axwnrEdj2pa6iv3CvEXePvM67ZF5/D6019Pcov+Y5cGHayQX3utuYLTSwH9JAdjB2PBqSFXo9IblZer+L3IZYxyZs56CPe9fpoiU5+RQViy2dB7BwMNHtj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiOjI+M1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiOjI+M1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b735487129fso79865466b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828545; x=1765433345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=eiOjI+M1BGoqJgy1CJ4507ouG1x9t9M6CFJ0sQQojg7qg6rwtwL7PSQIEfml5UgPru
         1c2jdNnm1akL0ft2fj0MRjuyM4I3T7DfipY3Ygwlw0mHEfESEcl8bO70uQoEFVhnwvDP
         EsdFNAfhopzYEQ9WN2JIv/65kIXBchewnl4D2Ex0LYNGQGXbaQfsQ3wwUO6Sd54Qhqys
         d2rXYI7lAT5fc1Du1M6TN6eNWgHU6vDjzJt6/RRsvQMohKQhHJ8mszetDAbu24ET9ySl
         lp9+BgNw/VoGXe9jZEmj7Bn7uCg5nCyrCiiYyJ+3vKHalmjxE3Z+qPvNRPUtsliS+dTw
         pwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828545; x=1765433345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=YM73/r3my0AjT0Ltif71Cug3LoJ+hxUKMDEwtM75YHCnXlN2Xemq8d9adNA7Q8bTEN
         o8GKxYhyaEsVTClyYhZI47PrRU80atcc6HBea/Cog3pjgtPPGm6JQMUdKJGYMscHVgf4
         HfaBmzrATWpyVvSNH27NkMCUheVu08TrsoHnWA7wxYi7op+nf98k10Tcbox3cMI7F0Q6
         qY8KKqczMmIyUcW1rA7dyZlFbHuqcUMKd1syPkDm/P1iiQ8OL8l7nHEcFqy1lDkNHD9D
         unup9Ed24ySEjTE0NiYdtU1gN8KArzgIne3ilfCiu/eGa2/pyhD+YHdNvwHEw4a260t5
         vjfw==
X-Forwarded-Encrypted: i=1; AJvYcCUtzEAhT1q2FwnjFZBsvPVys+BjPu3gucQAtix1lPY5bzjvtUJCDp92paorzG5lGI12KrvFX7DC0UudyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybMSFh/c8c7MCe6KrBUJuHN+szbbNyiYdsQJg5bvKzo1F5RzAn
	0dSFFZQw7OFUOKlK2S98uK/3DGkGSfqb9mEPkL6PdI2TnQw3Rp6hYuaL
X-Gm-Gg: ASbGncvbQm/mJccZhmljjgRxaSx5yWCrNQRWUahgyYF7ZGUeifUTJEG6R9hwHd2mcmy
	ML1sKCGdjQ70/aGmNXL3Iu0iQ4qnjbZBaQksh63bv8VV0y/qZY5TxeCdWtza6OeB0RATlxSgIie
	WGrlFBlksAVNPN8zHEEsRUwGnAE7183mymKRz3wYJHl4lhB14GfhUltMF+KUux0cMHAOgFK606I
	VSTEe90gJjAsdRfeMllo9VUDqj1K8Xm40ltlSvpZZCGOKibJOT7t7LUjHyQtiSLsOcNut64BkHr
	EdmgYq+d5Q0KZ3jMKPrwfZ6KvK8GC4h4BVLbQ30r5WL2j3atW0VeJnjLuOEF7XP4niQUcWl+Yaf
	nrmF9o04eNlnO1A4wvi0Hx5UPAP019rQde0X1P8inSY/mydxJMJT/RcoNc9uFJNMjdUJ8uozcBA
	0=
X-Google-Smtp-Source: AGHT+IEtiyDTZN6LnRtbNE3Mn8gfWY6RUZTUtWYufcRr2H1vB0fzeYUu0tLeBvciQw/VcgvjNvI6RQ==
X-Received: by 2002:a17:907:3e14:b0:b77:1233:6f32 with SMTP id a640c23a62f3a-b79dc777fc2mr546815166b.48.1764828544846;
        Wed, 03 Dec 2025 22:09:04 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445968asm49619166b.3.2025.12.03.22.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:09:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] ARM: tegra: add support for Xiaomi Mi Pad (A0101)
Date: Thu,  4 Dec 2025 08:08:55 +0200
Message-ID: <20251204060856.4994-1-clamor95@gmail.com>
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

