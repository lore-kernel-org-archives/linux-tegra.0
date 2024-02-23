Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869C142653
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710538; cv=none; b=aUmiGuqje2PEwxzxXNop0YIc4wfjI7I8p+J/cdZkCnYK0SE2TITC+qnOO/JRO818ZI0LzyBl6JMrM5Any0FKRTamEB2FLdr54LeADEZEtvifD4S0xCT88eDXj4QBoU5Visya8iBzKNNQNlkFMPdPCnFAVifH5u+A30kCJfh+eXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710538; c=relaxed/simple;
	bh=rTonWvjQAcJNaeKv4vth0eoJSWViUSqWd8JjoyxQVkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ujTko+bVdN/rt1qmO3lDbrDmcMvG5byfoTksafL7J5kIhv/HIGjBe2u9+w6+nWORyGE9Pxm2WmGLIAah621e1OyHRXZfi8gEVeQJ+26NJ2XGvEh0fR0JrqOKrgXnT3ZI+pcT1LQqJuefsdkHNje1gqlD93OkhtL9BnTw5QeQRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhoIeVF0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhoIeVF0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so899213a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710535; x=1709315335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQCCxPjVwc9J88j7D/qvdajFk19hWL/B2Jwz7nQJAz4=;
        b=AhoIeVF0j7WcgMV6b2kZjzPFMpgkMa8b/HTe9pH8KeCm/ppx3IedQYe0r+CoxKMAS3
         Awni9Ssyt0s5LMF+YVgR21ykzT2xY7sjiD7QPjDmXL4SSw2iB92l2TXkK+Bgiq+oj8R3
         A5OOVF/2PnfYh1aiYBaitaP9MZkt3zWj7JQpl4iG7iGrBCQi1ktv7AZouEtq0jV8V1ry
         cpARXH6fDckMQ79jtG3RaGraS9oGQFF+W6kSWJMJIUWy4XXdxrMGwa6IEVzUjT+SJxil
         y5HCnOihbVdwoWPkx84CJZzJ+Hw59BQQZI6c3f0FOfGRgLSQp4BMWb8xTQ+r0UahiLe9
         sUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710535; x=1709315335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQCCxPjVwc9J88j7D/qvdajFk19hWL/B2Jwz7nQJAz4=;
        b=gjERXyKa2CSp6EiwZF9hFE4wqpk7AK/yOQVx/qgu1epvhx/op8D+EawehWDyJoyh5a
         tQ2nbeRIPYdrpQHjyH6EO0bsiqnzaOvSl3hQsmpwAzzGH3EpTKbHv5DEDfuEilYnnJMj
         6WkzHv9JO4Sa1vHuHKgtvHtQ6s0v1mJdItAIu5nTWBg240IjmC0oht9abccJKagI3SIf
         BqkJzX/Rq2ZcPAklPBha1FpMMA1418yuTBRYKsh/LDLZBKT6juHLnzcrU2DKvqCWOhEo
         IbOsHZMqDBFG2p3hjQ6ucvLDQV2YEx0OeYSAPTqXsKh6UBBqUqD3WCMHgMo2eKVAhswj
         NiZg==
X-Forwarded-Encrypted: i=1; AJvYcCWBFXT58tXB/ZlmiQAfqYsipO75Rqqy2TTFb5WfVk7irv8qAlnOLL5MdJ7VWfk2u0E0EexuflgpjCPB6KwTa/GdXfoeV6MNw1rZFaM=
X-Gm-Message-State: AOJu0YxA7MI9fkwfh+90FzCVzCqLqVihR3bbUReiqwwkWDL3l0O5UVDf
	xDIWmclptL8iHtcwRTfvMbJVepfEHRdTMJzN0yRapwUp3ctv27+X
X-Google-Smtp-Source: AGHT+IHnCj9S63ZRVSecjO3NdFK2lOFoKvDAvMbcxc++eU+HueUQ3s8wWxrBN+TXpzj1GehR+Y6czQ==
X-Received: by 2002:a17:906:6d8b:b0:a3f:dae9:1e88 with SMTP id h11-20020a1709066d8b00b00a3fdae91e88mr315648ejt.37.1708710534525;
        Fri, 23 Feb 2024 09:48:54 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906251800b00a3d9a94b13fsm7113688ejb.136.2024.02.23.09.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:47 +0100
Message-ID: <20240223174849.1509465-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-arm-dt

for you to fetch changes up to ea5e97e9ce0466b421bf0350fdb05409f5369162:

  ARM: tegra: Add device-tree for LG Optimus 4X HD (P880) (2024-02-22 18:20:45 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.9-rc1

Add support for the LG Optimus 4X HD and LG Optimus VU devices and clean
up some minor issues.

----------------------------------------------------------------
Mark Hasemeyer (1):
      ARM: tegra: Enable cros-ec-spi as wake source

Robert Eckelmann (1):
      ARM: tegra: nexus7: Add missing clock binding into sound node

Svyatoslav Ryhel (2):
      ARM: tegra: Add device-tree for LG Optimus Vu (P895)
      ARM: tegra: Add device-tree for LG Optimus 4X HD (P880)

 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    1 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |    1 +
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |    3 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |  489 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |  496 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        | 1812 ++++++++++++++++++++
 7 files changed, 2804 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
