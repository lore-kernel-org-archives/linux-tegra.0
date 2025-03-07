Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7B21A43C
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369783; cv=none; b=Yra0fvg8db0IvUUYiap8Sao+u+/fyuYwX18k66+Xw4ReuFewzktL4Rj/g8zdUm7/IP1FYRklu/K+Yf8yWVOePJYFmiE2Jv2aO6N1w2R9L+aKHBFrC9sbAWyyIdQlwaI8+rW4yxuNnf+uOhK4MLo7sIA8SakijUVM4z9P0p8f4GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369783; c=relaxed/simple;
	bh=+bWbpozrLQ8Y28qYv0RsdTy8ONY6agBjzjQ1RHwRl20=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cbdr5ycZ1XipDCQfwXMWimFVOkmQrqD/If+IUR3WCWfco4NrGKsJXiz8FFh03U5QNyz/x+fgSnI4zyo+tKO2ZdToZF5Mo6P5Cx7p+VqZTaHws9aVNe7LE3comDt7GqLIkUAjcjbTts+BimA1iQ5QjkLN20B4hu4rSZAI5OJ3QH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/vinuR4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/vinuR4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1025152f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369780; x=1741974580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=H/vinuR4ZQThEj/EoakzSZzPfwPTtHrDl5Y+xexyP1eHFMqy9wq3hw4QY4qBrmvKzA
         zEho4Wd0myTM09fa5uZYlvfXJFRuP8rtsUhf4FPCIze3+VapdPpa6I3iUGYDF8p3dc1K
         3Tri3+9fgtuaTky9vELajAVsaBbzGeZxP8VzX7r2biu/nIKjLD75WwnUdmbPfwTud49N
         UXyaJJ48/6BXXm2FWw+KPfKyrwq9CI/CEr6uD2F81+K4q16eS5eIcwPjBd5K4cD/jTbw
         MmEbhlIOFA3HGJFXFLNmvnkR5wr+F76RSArnHlw4A/0OR5Rrg4eBNUpYCrBrspsL7ubi
         1Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369780; x=1741974580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=nWyKIdyzzmj97fA8mw6K1mu9lCfXOecpI0mFv5zzRFaVwaY1FF4FmxE7ryr7FUtls6
         aKVD1XujdGUDu7pIBP8S698vsGNSqEs4ZX29AR6ZBAKuKBy5gPnDsuOtrxelfTxXyjsR
         ZF0AHP4hSSYqV9iYPNoBUfacItTXAJCFPXKk+xyNKMnBaHXtq2HJtbuYqx2QVzCOU2+K
         JCwCP5HuCdho6LPzRIDvNHtMnDLgGCIZ0szdRsV9Y4lUu6CjaUif/l2ZxwiWaJz/Lyec
         dIijMJM4qRGZOjoTUg7HfUgh1mjjTve8sRsv2D2QFa/ImBFINcf/M64r9zgz61i6yf5B
         qZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWHdKmekISm3d4T/oG0Ln6nMGtqfwaAR27TQzq4BdxH7KNpmTQ87XwZgSh+ciL2uJ94AwnNPlilI++2KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKa56n3UsEBt6XX0golxFLSwIL95tDLsFf8KW6kky5X8UzNDy
	+JYkNp4FSnDdBo7HQcD61kdvEbIlGe1nt18Ro5wOQHEk4MnE82Yj
X-Gm-Gg: ASbGncun8UZPEZWYwBicODkc+cbgEAykupaiMhpgBXyTlaKQqJGPhfQLxqKxpIsQfm0
	hGX6fDVTRPmM1CsYj5+2I25IAhIrhQAI6/7AyX0DoMlcka/C9Y0djetU4ROqwaRUUIH4oI5xrVC
	AySTz1NM4xnjgK1jNmjFC2X0eS6Ug+BSlFn17M1LfdhIebxkow9f9UKFaV6NBSFHU5t3dvDtR+h
	Qd8DJBb0TLIQZW1GJNOv5NFVc6dX5cLdcI2p1winy3eOIj1p/CiJRl1dXhhhJJ9QTmTZLo9ROl2
	11Po+pkS/Le2F5Yd/zfJn2vN/Qth+x7JjmkQRDjAw4gtAQvULZCnyTzR4l38Al5ONNK03fhZFhX
	45SAchCnxmXP+YWqR1OXOCh9yzv1EoiWbO3l/
X-Google-Smtp-Source: AGHT+IFQwfhw0TWFcyPyKOcZOJGtcyGZ4hJE72wsBJf4kNuTmJUWQ1NzJYzItPPrui90jo20M3KYow==
X-Received: by 2002:a05:6000:402a:b0:390:e535:8758 with SMTP id ffacd0b85a97d-39132d2afc2mr2954780f8f.9.1741369780278;
        Fri, 07 Mar 2025 09:49:40 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8b04casm58181535e9.8.2025.03.07.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 18:49:37 +0100
Message-ID: <20250307174938.3456275-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt-v2

for you to fetch changes up to 65d691a4400e111e8bb2422a5f4f28de34298be7:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-07 18:38:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains a patch to remove an unusable key that was erroneously
exposed as well as a fix to support GPUs with a large amount of video
memory on IGX Orin.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, the output voltage of some pins is adjusted and
the VDD_LCD_1V8_DIS power supply now uses the correct enable GPIO.

----------------------------------------------------------------
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

Jon Hunter (1):
      arm64: tegra: Resize aperture for the IGX PCIe C5 slot

Ninad Malwade (1):
      arm64: tegra: Remove the Orin NX/Nano suspend key

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 5 files changed, 52 insertions(+), 8 deletions(-)
