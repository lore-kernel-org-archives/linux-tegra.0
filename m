Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1121B9E5
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271803; cv=none; b=urlNnfYAoECQmBYShQCVegC1W79QoxPGH8IY/AbLP7kShAXedd6DUkB413HDzit86e5VdkqJCsBT0UXNFHw4o0fxLWQmbKIxSowSUhJCTfypNuZXdGnjScfu+XWyA+qjENjxLt8TyCn+Cj7Ywu1aNNjlm2I7tewOWxmIfrCOZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271803; c=relaxed/simple;
	bh=7V/JDvNgecmuUjPR+2RtoXSC7jjQ5Q4Vx3eF/7R+ohw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZKqWcKCHu1hksuVEB8e6rOxk5u0MpW+MxtLN2vwYLJAWSvxZ93xGlsgziJRsrCkyOyOhbRy7ofpkCfYkpkI8ZxWAovoIdAFng/5twIpZA0aKnAjFmeG0PohZ8Z37NDGknHKny0LLgJ+Q1F2CCVP/I57Zytc7/Q9KYIuy6f/yxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FH+lC3NB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH+lC3NB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1834420f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271800; x=1752876600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=FH+lC3NBqwVZHw0CZkCkWqL9wVX++nvHkHcNwFxY2SJk0V2XAqcxlyPO/lKLKtQaTN
         Nt9sr8Z7eKdnoNN4BvgXA/ooOKjWWk9oIed6ZtpOZo87Q5M5Zr31IEOsAQzNG2rdzvoF
         T6+MoLrB+zL4Zu1J6yEwUluwgDVUApdhGubBfIpPU2jSmw/cG/XTFB0NQ8/Hd8BIJfuM
         x5zoWzPB+pWNUsuuvy8+Irg/iTcPE1qh9bs6sGXzd+uMcAQPwIiUQEo5uA2SUMTsEVrV
         s7q0eIEohiSb5pqFzIqeRfJsyq/G7Z2W48SJCGjPNUYcgHCPzS22XdtkCW3UamW1uRoD
         7NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271800; x=1752876600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=YdULNfFllKEFaZiv168flSpfR0hZivohybc+kNfjIwXTGmI2XM9H0fwYY2qsP6ovjV
         wjXwGR/9tktTCgJZoJFvfhuzwWLIqKoPgvL1JhuWI7Oae/R2cCXOysDeYd16MKKq1msW
         zeT0Cr1lj5eEojLAYtCYOvGo+eQqU1xn+Y9niwnYu0IA7uRCAj9EMSMfutkFrxNwhs7x
         kL5d9dtUT2TTpC9a7CIrjsoZ2t0LCYrlHQhKsDAGfoOhKkTOoYV8dvQc9NHdU1gM2h8P
         wWNpdo9D72nsr+vCsbrJ5U38jm1XKgmhqoAH0ARDqxtaVfi+StV1Rmwj+uUvYZ1zIVxg
         tXtg==
X-Forwarded-Encrypted: i=1; AJvYcCVlLWcYa0sfUX4rHTPeXx7Q4ZB4bCbjdVdFtkQ3L5KPQOzhBX2ChTtJmjBkwiIE9upBrttq9i43xwLqMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWeQf5/7zc65qTkxnVVTWKVNQ4QRMvJcsMS1XLMSuYso2dumV
	8e+y8PV1ww1cxxOgsgf0XyBnGuLNgRSClTXlmN9gZemNiIvjHd6UEQpP
X-Gm-Gg: ASbGncvy+ENKM9zthzAsS7vcTK3T7W0260AC44oSP/cc7zEWchVuLxxRjKsG85w+bPQ
	5xeNeLSvGBPzI7lWuvj31uctZu6BUxfySLFDPtaJSD8zxB2IV6hVUdomTSMttjVHFmo0vapY9IR
	Q2E77QDeyLno5jG+SWgg2bDKNRsU3iODX+2KQTElLTFbpr8PHBRcHi1AHUfzArM+HtU3uWoIhVl
	M8yX7ExLGWTDpXBSw373dZrbdVWpt35u14SeU/wMlriqCkMFpk4zX5g80iaXC3KHA9H0DOnihYr
	ubPHJ8zziPgndT3IQPxqHfKz6hP74X5HzD6sLHvfWRFf+Jfkr7frCBdQ4tEjNUa5ICT7UoM4ykV
	naQyFhH1XAbbaVItENkThshD84PKcpMFRZ4WpOXJWCSoWupGfJoduD41+f5pzpqFuu/UxSWwqOI
	NEpf97+P36lZYQ7Q==
X-Google-Smtp-Source: AGHT+IHVLhu9sQqqVzUADbZibqpiOXQmra1YzYG8sZbz+5Usd1b/VVnMLyp9rN8lFuXsffC1HiqoUQ==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr4258546f8f.28.1752271799602;
        Fri, 11 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc9349sm5520827f8f.45.2025.07.11.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:40 +0200
Message-ID: <20250711220943.2389322-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt

for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (4):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 415 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 704 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
