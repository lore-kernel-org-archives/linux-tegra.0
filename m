Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A023BCF2
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364625; cv=none; b=b5Un/EGAW/3W9laHWO0f2MuQb/ZSu/Ty5Cp6oMrvRBRX5loV21GkoG6N7FNwSRa15HYpZWq24GGVwcyOMv5SA6xoHWf8Bonls5+9VIl+75rEC9CdquMZiirBK7G843cF485FxIkCo2mC1dETZ9a9GhyxNcXOPARQTjEL06OJeqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364625; c=relaxed/simple;
	bh=BvfJPnPoTJGAMOKyBRjxVZ6zo6K8+m/dLW0B09xMfn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UtYcqd+5ll50TUTsofTAmV9fVRQdBzVnr0YhnIm1YtaibWOvbPVXatl/X9l3o0DqmI/xsA9K8yJKilE9TIiy7IufcmWQPaSQp+eq1yogqzn/X7xwMTCrvksuZyqbVEzlkk5ktOFHHuAsyouVsku3ZJxB/r8GSuIKK4QSt7FbcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN2PKX/n; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN2PKX/n"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so16236335e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364622; x=1741969422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=eN2PKX/nNqrpGIcnQHkIu1u7toeF9TMHKrOtcCvn7z05+OE10Fxmf8HJhhpkag4z2/
         kNvpfYEkA4TP+fnpn/F+51/S1LSM4HN3ydLbE6at1WnWkqifLOTDGQZakAyLi+xHckbF
         GmtQU7/BVpfLCx/Zm3/b8SOl/aKE6h0KtQjN8GanLc6B7csDBw3gKgODQOHLW0Rhakw+
         998FFmXpFG/mS7VtcEnzE+ee7Fm+iR+kBoYfNkhogxs+eL+DLDdZxYYQuGO5Aw+ODuTR
         RNSfOSmUOqlTX3fHg5wLfLJUz8oQNa0plFgWlHfXBKYs/MQ/rxSoUEfRUFz8LvkBUv0/
         NwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364622; x=1741969422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=eqycMxFO46K5gC9zvuoCmQ1JT+xhYp2o7YF7UZmY08mLz19XeMU+6WrnaGK3frmYVe
         r1NFfX3wUzjkefLXOuc3NDKwWon5IRtUAprLRr5OiaQrLn/f3pvVbBAJ/I4fm6DA7Q7k
         jjr0SQY+c/wvkJ2bDbs+aaVXg0y9xtopKQ0rZmG/arFZ2SZ8rML0pbd0khcAkPCyOdXq
         z/k82wbm0sKtxJ2v3ZUVlQklk2kBZrJWs/oxsUmz5c/27PwdXFgQIYNp7V1VYTxs3yId
         txuZbEAXGySNFb5J6ubgyNPaR8cOcEb7QU7hQF20/Rlxr04Z8sY+TcCTE7wOWkZlKmSH
         wSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7pjaDtS7NcVzPjiVu7KcwYtHESI6Wq4AC3x/z2KQK5xDGMJnvkdY5dMCSAtSjEh5oBQXRVpIsQrRM8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzux1wrUouu8vDiaL2chwkUREleBHu3Vfboh0S29zu+hmH1JeAW
	EhmSR6wqOBc7MRc1loCtZfmFqEFRdGOYa9HdeuoCIA6aV25Bcpam
X-Gm-Gg: ASbGncvBpAEfkHrQBsU+YZe3gts1fQzH/Tp+XIzCI48aNsblnF8Z44/DUTnRvc/0DKG
	adsgbj6PjQYuEPTOv1GWlOPA0g4o3xcBRD0TzFE7zyhLcKsw1HDXYpFDhUy+NKH/lQb9sSCr6DJ
	sDLkBe9A/2PpB5aADFNDgi2+MjpbLEH3QVHS4T9E60bBE30stSVHeYS0WLua8S5ENJipf9E6bCZ
	knCM9roXMFg9VAecZGaaWAuBshncUvKj5ZdA8EbRVq4YsOlQrN/buTGTBKmgW+ukamZG1nlRMuu
	Mei+alyp/1DgT8Go8IbM09RJa7WhaaGrHDhAwHNGOXVkXq10RU4YwBoGBR6Je3rUtYFiiAbz2zV
	uEHsgbcfs59gjs57wovZWQ8lHHGj+H9zwB0AU
X-Google-Smtp-Source: AGHT+IGYSZAdIPByuhfnlGvu8gIwV8NG9QDkn6z6XiamtvDMqZsy7KeQwy/cINDke3X/SNx+z6U0jQ==
X-Received: by 2002:a05:600c:19ca:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43c5a5e5259mr24255695e9.1.1741364622143;
        Fri, 07 Mar 2025 08:23:42 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2b8bsm5846199f8f.64.2025.03.07.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:31 +0100
Message-ID: <20250307162332.3451523-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt

for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:35:53 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains some cleanup patches that remove unused properties and an
unusable key that was erroneously exposed. A fix to support GPUs with a
large amount of video memory on IGX Orin is also included.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, and the output voltage of some pins is adjusted.
A fix for the VDD_LCD_1V8_DIS power supply is also included.

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

Rob Herring (Arm) (1):
      arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-scale" property

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts   | 10 ----------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 6 files changed, 52 insertions(+), 18 deletions(-)
