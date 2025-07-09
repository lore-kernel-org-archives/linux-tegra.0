Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3121FF5E3;
	Wed,  9 Jul 2025 23:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102853; cv=none; b=tAbf3AOXYM56VqfVkHPg1kWj7Cl7DI93gEUNY3VG5YhDuKIi+kKU2Vf2z6f4uhcEWPrSnVSyArukYTDgDhAYgKb4ctlvGiHYWNSz3eYcCiVxpi4qE4e6O94d9ysqV4IxVYKW7IXiGPnm+tQ5JrYmbWILlqBRZCINvBykH+nJx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102853; c=relaxed/simple;
	bh=600LWGK2WeG4tUOMaTQNC/K2T/fGVlLzTgm6dWz07ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpKS+mREfPrAFT5my6l79BoULDmBTINatXgsU1egFFxXCGxQgYfftNWBOWsgILr2sX62iXqYYJyUM0ArhIg/pmSiiI48G2Kt0kEcDm+2NZI4o+XIjG0xHJTnI4bcTr/aAe3wgQIaKvLdLXs53vVaLETmtg1IgVY59mFYbPkr4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBK0I/y6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBK0I/y6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a588da60dfso314728f8f.1;
        Wed, 09 Jul 2025 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102848; x=1752707648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mM0W7rGoqRHc41L6IiWj0CbgHWaJ/F6WxQNs4BZcfiw=;
        b=DBK0I/y6HjY2ZvAn+uRzP5zG0O+JqnBcmrqEa5HQeeKm7ont5JoRhofolTbHtyApUX
         qoG5q8D4ih4MeLKXJaoIbOC0tNFEKAa4UoHwpglTX88FczZ9bxmGqT8lHpIyxQcQd5jP
         Sh9qmpp6Iy/9kn4WTWCc1orcInsK0eHOMKvk9DpGPd7JrjtaXOwwUAKxj9pfcoHXTh2Y
         JBDW61o9kQ9rL8Z3RVsIuzjqLKFUJXEjqB7iPKU4/luq6sBgZXqZJK4VolUaz0AQ78in
         fOxQMwUv7OY+9FauVIcVADFHDWc0glUq+RRcaxktcobquphSICuQiV18FytZnVRmgfWU
         AAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102848; x=1752707648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM0W7rGoqRHc41L6IiWj0CbgHWaJ/F6WxQNs4BZcfiw=;
        b=CN0MIY1MWYLnTFq/fKTpFmNOMtJ6wOOoyp0ulhZDuGwNzOnsHGCAI2WdpWAnwcBz/n
         x8eymA093XlU/ZVBQfA7/9apFZRv/g5BJ4agP4Shx1urHS/BHTxo4EjtO81A5i0MhjuZ
         6s0xDM8PKWv5xyfOWe+ksSU+VWREuAaskmHP2dubmnw8x8G8uVr3/lfFDmF4fLusvgQF
         sgk90XWB8UhXb6TjhxdFzR8UuFTWf6FHv7g/vrj7MDY3CN39nt5eLKCaWbBWu83rAyYs
         O6ejDIh9wQERL5Jcg0csWWkynl5EYJsOCf2wcjzQemSCgpQq74OqmXE+nbDjxq4XqEo/
         anFw==
X-Forwarded-Encrypted: i=1; AJvYcCUTHcUi6smUpudK2+qNzbeAnHaHrHGFAhhxFSORxEH6EmjvgOxBoUdj6kGlU/SW9STyK1u7bDVIQWbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wncSYhHYoBuWj6ZCnA1TTOq3h5VztzevZtR3EAX0maITuF28
	qRm7/TfiuCPhSbMt1wUPGejMf3Zab8S6S270aL2z5/v6lnJPFqiUtp70
X-Gm-Gg: ASbGncuxbspLSS1ZU4sNzNSGXZ5YvOFUD913Ft+oaHd8Kv8UIfnKl0FzTeN3eIiMW71
	DZXlgCUXz0uBegHE035zaRV8we+OwOhXGhA6TCJWzU2GCbAo99tPl9Ylxv7PITtSMu5TV27AfpT
	AV4viLqu0Xsam6pbtF+syPAcMBhJR+MR1b83xH59rXYdNtjantFHYXkyOzyqITP0rAgl6eHD1RA
	Oy3QJ/oqPTKRgM94Pk+t2d2qiwJHHeRVjLuZZoJikJa29UIVpmPQXLDNqI87BzWrL5z/tH2a634
	o/vbq7TgoJI1t4d8KuejBJSjr33CFXOAKojVqcXOcz855ecyQfdpcR8H0f/FtOkiuQRvG2FhJFA
	ZhZNM1pJOAsI5mCHj9WYu8s6KYUDXfqnBtfcHUHBUJCLCZmXFs7qN+A==
X-Google-Smtp-Source: AGHT+IE7vuy07GolYAFk2CtHyU06NZ/fwyEnRAHKXN7YKlt4mNII9jiTH0Ibq5KgvavaEtaELfGpSw==
X-Received: by 2002:a5d:5f41:0:b0:3b5:e29c:190 with SMTP id ffacd0b85a97d-3b5e86ae9d9mr411788f8f.29.1752102848479;
        Wed, 09 Jul 2025 16:14:08 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd54115bsm1608315e9.31.2025.07.09.16.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] arm64: tegra: Add Tegra264 support
Date: Thu, 10 Jul 2025 01:13:57 +0200
Message-ID: <20250709231401.3767130-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This adds support for the Tegra264 SoC as well as the engineering
reference platform that goes with it. There isn't too much here yet, but
it should enable users to boot into an initial ramdisk. Patches to
enable access to the root filesystem are in the works but not quite
ready yet.

Thierry

Thierry Reding (4):
  arm64: tegra: Add Tegra264 support
  arm64: tegra: Add p3971-0089+p3834-0008 support
  arm64: tegra: Add memory controller on Tegra264
  arm64: defconfig: Enable Tegra241 and Tegra264

 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 415 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 9 files changed, 488 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi

-- 
2.50.0

