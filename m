Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C3280CF5;
	Tue,  6 May 2025 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538288; cv=none; b=M/l6ZEilAxdHXhH6aLACs9ybbzHhB/Zyen/2voAc8yYPZuYM4yg+2DewQH3oSQxeMxZpe4aodniP5PZ1UyIlQsVpP44g3KbW0/oyhV27bENmBYtFMk3/msvjwQdrHI9Aw1gDF3c2+NXH27h+1r5pih9v4LDPp4xwWWGTzOIcA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538288; c=relaxed/simple;
	bh=M/21e+tBFkQHoWK6VXIOfZVkmu9b3gKqB6m/NDD1S/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mwlRP9VU3LXWPYFTyBaFJNiwpk+fXx+Gv2rcffujVbsOUwJB7VQgn8DmFKfNnVGY/cJoMAv8JP0YBrxFDsvyYwo8c5C+0Jbcobv3iE4yjs1+FPW3n+7Yi3csul5x/jAYX862omiLL+cGLE/vrNM/MectyZapR3ofSWClAh3oLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxuLMHvG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxuLMHvG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso34964745e9.0;
        Tue, 06 May 2025 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538284; x=1747143084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJBH0Ap7+ClrcdS7u14Bn1WtQh5v3tsJ19PPMPZOP2Y=;
        b=jxuLMHvG/7Fk7N1Sz3dguh/LNQNnbwigW5f1Ra1mMatpj+BoUZ8xu9zBdYmlB5xbXi
         o0BJMyPUda56q2ZnT7/9vK4iLbPqmzbP8x2+pe46SKSm8YDPoYDqcpo24N15DsbKA9q5
         nU24d/x79DqWbPJoWtUtKYziGWWxRdhosos3S6Suo41091tOFyU/GV2kIpGxjwT6Jgki
         wrudn1WusKCcnLbfxgIXTJBEpZI8CW80CbG8hmjx4HXFr5xaJlmvqDFC62d0cR8LZaIX
         Cx+C4Pv7GlRIORsoZeC56i83Lm3ZtTlboQl9mj4RDLqdrgcYIrJFZ4ZWiNwmaqzeaE7c
         TUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538284; x=1747143084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJBH0Ap7+ClrcdS7u14Bn1WtQh5v3tsJ19PPMPZOP2Y=;
        b=lsiBSb8h624Qh9vkM6dm9Nu891SzVs5WgP5HyrROTYTK2pcY3FbVCz3rMi3rqze8Lm
         TB9f1iFwqnime3SxKwlWWk4SfV6LznkBYsfuBquaNTwanpuuiX+nsKLo1V05wmdFx4gs
         5nNCa2LkMFu7XxvC31nbP3YPmVx52rCCLgkASUq1X5yZfs3JrB560POJScUVv8yShG2/
         5QA+Vv24yazHwHbmF9/RfsJBPnsk0zO04UmODOvLkMZl0mS9epgHtdyY6PCuUH2TYizd
         GxOZJojp/v1vnT8n4CIoCMCfnqUrBDfxefsS9bgk9VXbFOGWcjLDPB4uIy86jTrYnnU/
         4MHw==
X-Forwarded-Encrypted: i=1; AJvYcCVAIMJDmzYNCqasQVabRuUT8qwFESoCrOR/7PF6yVGxIkbSswKvuQbeFmWRrmSa77u36iBanYaFwssO@vger.kernel.org, AJvYcCVVzUMdZAvai+FmhanjJS6oN4+5XWIEuAdNrd96aZ1gWvnT/tnaZm6hsL+/GNXhfZOugivifYnkGXndzS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIhrqZXYsmDJTn0rxzsrTKWVIgJl76P2Oal0PnHMnkvaF6UrF
	1A29PSnbHvtg8O/BWepYHYmXT2WVkYG7etwAfAlIDCZQ+bYszHrg
X-Gm-Gg: ASbGnctkjK++BOprOvfvIjR2ezpEGAPs7eVbQH6fI8S66K5bdvUfcu6BioU0uMCd/JF
	yBeOL/M0hAo1mhKU1G5hlb8ZkTuy2p7/CuFJIxSbGX0KlfAKzZqw/SlqdT77xBOG8LxZc40i48V
	iGah8qb2ahtNjoB3VGn00OkA0Z+0AjgXxL8lqduEIskJ2SjY1b5ov92fnbqJUeKEIaWfJwJOTKr
	xaVa2mtNTHId491VvebsljGEn5isi+GoCMN0QFPL2ZQMqGmYLZLE3tjJryFFtx47nI/4bsYiflP
	UrnlXWiYUlM8fvVI3Y/AnR509RQDsAKlLsi8V1Je1dR2Xjs5j4ezHk8lR2rWAWWkUgCY6HqjUnU
	UEbowm+iL/KdtiW0SHr4jpW5lsAj5ymoA
X-Google-Smtp-Source: AGHT+IEuwkLbg40ckGVZYcLuKpLqbliGZWRhvYxovjIDkNk3XniEYkEDcOoQdZWzo/NdvcbVVM4Pgw==
X-Received: by 2002:a05:6000:40e1:b0:3a0:9dd8:4ba7 with SMTP id ffacd0b85a97d-3a09fdd8438mr9682251f8f.52.1746538284262;
        Tue, 06 May 2025 06:31:24 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae82e4sm13915643f8f.58.2025.05.06.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] Add Tegra264 support
Date: Tue,  6 May 2025 15:31:07 +0200
Message-ID: <20250506133118.1011777-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches adds some of the building blocks to enable
support for the new Tegra264 SoC. It's similar to earlier generations
but has some significant changes that need new compatible strings, so
this is mostly adding those differences.

This also includes a patch to fix an Kconfig dependency issue that can
happen.

Thierry

Thierry Reding (11):
  dt-bindings: tegra: pmc: Add Tegra264 compatible
  dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
  dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
  dt-bindings: firmware: Document Tegra264 BPMP
  dt-bindings: misc: Document Tegra264 APBMISC compatible
  soc/tegra: Enable support for Tegra264
  soc/tegra: pmc: Add Tegra264 support
  soc/tegra: Add Tegra264 APBMISC compatible string
  firmware: tegra: Fix IVC dependency problems
  firmware: tegra: bpmp: Add support on Tegra264
  arm64: defconfig: Enable Tegra HSP and BPMP

 .../arm/tegra/nvidia,tegra186-pmc.yaml        |   1 +
 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml |  23 ++-
 .../bindings/misc/nvidia,tegra186-misc.yaml   |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/firmware/tegra/Kconfig                |   5 +-
 drivers/firmware/tegra/bpmp.c                 |   6 +-
 drivers/soc/tegra/Kconfig                     |  17 ++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |   1 +
 drivers/soc/tegra/pmc.c                       | 132 +++++++++++++++++-
 10 files changed, 171 insertions(+), 18 deletions(-)

-- 
2.49.0

