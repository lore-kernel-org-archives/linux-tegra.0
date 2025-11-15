Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35F221543
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197255; cv=none; b=q+UQjdbSLIUcCXF66v9QtQAW02FhlRm0SuyCwnmLoXqd2UCtd6pKm4FQmt8hpSyBdLtrDO4PM/VgHGWuFMTAxvUliqpXH3hhImgkBrHrYuMctEte2A4EthHNMLKCRo1mPbNraKAR38gKAC5cAXX6tbbV2UKJDYz15HBaZYJTDL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197255; c=relaxed/simple;
	bh=Z1mPo+ebBiIP0/K905Xag3aOH9G6gGBxOg0SUmGsa8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cy3Tsez9gknQkRP/PS7LtkNVvyUxVi1M+Pv9Oddl/bNUc7k/NPtgE1uFOHHJSfuNU5UTp/SAeqbtX9lWsxVWNWZ2Zl+6x4660lFaRGyCdkRdR860qs8MqTqj6NZQeDvH7TAY3fvW7k/w/8Go2OTqbD9Z4PUT5Zzi0pznyK5NQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=extFH/QJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="extFH/QJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b38de7940so1622215f8f.3
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197252; x=1763802052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=extFH/QJza6G9Axp5FOjHZhY2nlcZjDYOT3sA2WzboiY3Ts4/o0rKFZCApLwjrLpzp
         spaMLklWiAGH3CHpVx8eCBAlx2uscU4mLrmNMlAxw1q8uMF/5e/hU/O9eQC/vKd/cMZP
         cpRl9vzz8ZjGRd0+5EBB7HP3BkhXSE64zehUM9xAIqve1gFvVQbm2pwfmP26CEhV/kIv
         ZZNFJaldJk6uRvTA8O9t2N72wsxlMJkuGn+8/2jBhs89s4tFCUEy2vtsDxsCjLwWWurY
         qAwrJJcm3ZXpp6HvJ+asnEw92XGD5j5Y/HjUZ8ruilKBsBI1MIyOV4ZOirTLkRWD6930
         AvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197252; x=1763802052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=UWBO+XCgkRkk3m7uZVSJulran6gSU5zAfsQaV0rKyewgzfc4+RswipisCU8ktttEjy
         oRsnxF7N8m0V5vjog9GVlWpkR+bMZBqhLfCWRjwP6TUw6o1+NxKGQs7ha1EqMq8cgLo4
         9cjSflIT8l7dsnEdRQIW3mep31O/OVd5jsFzSoO0Nnox/p4uRlKUoi15XTNp1EhegYp9
         59jBdWfSC5iq2R3KWWueV5YlPVCYse5LyDo1Gtn9l6hZn923TnQ0cmWO3Iks8zQljCOf
         t3HpKOk6mgxpZVTW0RbYivkrX/d5GTdByju+gyLqtYs1SbFe2tAL0Krs8QGWtS70QojA
         J2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWuf7g0Xpq6BtEcSFRX6XL0RUfHJz7Y6r4l9BWxdfNu7HqtPNjHQEi6NLyKJvgjVXaSeaIa8ROEsJ53Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzHH8j+0PpDwQjKhYjVnbemS6/4+yjfahSu5Ue6185pSrPZtu
	dQVSiWsQwPs0C3PyfU9g131BUg22m2GkC+WGuxQyTSi0S9B+VsU5uN9h1IY68w==
X-Gm-Gg: ASbGncvP8HDY77MBdcCvsFiNP0DL7cfzy0w9RMQS67eEddokYY8wu8cbX1xECLSObD4
	sok0bFD3Rb4J0bYkykfQLx+ELC3ooaJgRwNfQxjC5Sa+lTkxRYD6wmspVcwu29nKyDlu2hQuMNm
	q5MI3orVsxXDPcjrSt97I0d+Gw75Sjy+1qLRQYQ/Xb4deKxpLAgnxdKlbkwYEDaxUE1DgQvKyz1
	yIeKdVv6wlLDyQOk8Bf1SRMpbquhcEt14hFxhZRyifKzeM2ttqz1vykUtnfpoiaJo3waJGBEIjr
	WbqN5SCtZN3Y+q6p18AMuByFWGjP5nx0bQQ9fYebyx1zdkrjpZC3zJpRc6NcgtHPhhsQf2RIpBE
	jzPKtyAR/L+AE0Mulci3bceSGsQbSF6z5FQ5HloBPq2vI5DEgi0TYUZGQXdY3AGf9nF3Pj3pPha
	qLd25Mry1xvr5jM6KpnVSWYUDixIFrGtW8KD6931naHxdoWmPuppa5oiOrXQ+mHnEvhvkOGp4gW
	5Bi07w=
X-Google-Smtp-Source: AGHT+IFdVfK+Shdttqb57lRCPUmJfMS313dD54S7D51C4gzOhgy2szla9wVkVMN99ItzkzULbuEs8Q==
X-Received: by 2002:a05:6000:430e:b0:42b:39d0:6386 with SMTP id ffacd0b85a97d-42b5936796fmr4919296f8f.31.1763197252125;
        Sat, 15 Nov 2025 01:00:52 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm14666449f8f.31.2025.11.15.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] dt-bindings: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:37 +0100
Message-ID: <20251115090044.3140331-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-dt-bindings

for you to fetch changes up to 905f0dcc38f8078f0641c5cf855f420d78f10ea7:

  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller (2025-11-14 19:31:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.19-rc1

Document various new IPs on older chips, as well as some existing
developer kits that were missing compatible strings. Add power domain
IDs on Tegra264 and wake-up support for the XUSB controller on Tegra234.

----------------------------------------------------------------
Aaron Kling (2):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallback for Tegra210

Haotien Hsu (1):
      dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
      dt-bindings: display: tegra: Document Tegra20 and Tegra30 CSI

Thierry Reding (1):
      dt-bindings: power: Add power domain IDs for Tegra264

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/devfreq/nvidia,tegra30-actmon.yaml    |  13 +-
 .../display/tegra/nvidia,tegra114-tsec.yaml        |  68 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-csi.yaml | 138 +++++++++++++++++++++
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |  14 ++-
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |  15 ++-
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |  18 ++-
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |  31 ++++-
 include/dt-bindings/power/nvidia,tegra264-bpmp.h   |  24 ++++
 9 files changed, 306 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h
