Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605990;
	b=pLa2iYOk/Q2jMt81EW3qTYz3LWDp+fr96QBgHjxev4fnMgzILuV7Mn2uGb4BBEK2VUKf
	 Vpbo6pr82fMY3kgqyPvhqNOVdSWzwnLKtcOTTvlmeuDkQPADvHDqdcjE0YWFEY4xCtmYi
	 eINLFDV7/TOz6TPGxlXZcDI8p606aIubFPlquDlSEgCeaaq0PZxfXIUnJR4qlPKEO7i/w
	 BnGgGhgyYpzpOFWwIPI6zowHXIunVIqSw/6Q0WeJynBAt6SUKIEryJ9bEDIWzkP3K86Pr
	 VKQr3osQOWYJWASZbO0G2jNOu1ZCid6zERaFyiObzAoDvj0YvSdrkz+PnEaFkysF7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
	b=r2AgPZgJF/XkODlWTKwfihgQQxUK51ukH48GSKycDgN1PbXHmYFilNjKw6dVVIBdqkJa
	 mn1xSGWK8gA4S8Tr5Abey4teKwgf5S5B6BBbWC3vJe8tEEGn8jL1OBP1QwilJAVbpzBgv
	 CeivWATSv4EBLLQ2LAGZaAvXb8eqvR6l+dPttJLwPSIOT3t2hQDQlhAnkoFGYOzB4Z+rp
	 RAXxIh3sfCSjRG6jZ/grft7JDJmj7tbfMk16vNSHJo3ekPikoKTi8E3+8+Lhj/49hRMrd
	 8eJUJpVKHxN49TpkGzD0gsJGBqb68ShAx0FKfK2kHmN/PuWMY6q0izgHSW2VpSFC2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C21606A335
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C21606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7290489a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605988; x=1796210788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=PsnXNr0E2nPRNc4NVDs6TRBylDALo4zK45DsyV3iimGtstnIcQuO8A88WZxWfyNMvM
         1wpHTVu/CmvWrgr6pMq9jC0o/XSBuuI+x5WJQxt8lvrw0lrHXife2yBvjqKBi+kGr9jY
         LZ37tRvEOXexYmzSH2CC9nDToQMGS6m1gz0nU7ZahT+aPOvw+1igrWuo9UHUb9ZXxTV8
         0rjTeyw9ekGMBDqeTLt0HooTDDdHND2K7L97YVExmeJiVez/60JKhT8iu8yHR6FoEy3r
         JWXUWqDo2n2ZFnmoRkbZzxqhHgiGjaRRLxiXpgGrzFYx1vbXOP6cvcAngxwkd1cH0Ftd
         T+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605988; x=1796210788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=YhE1GHOqPViYctEjqbApfx7f03ldNyyqPYSWYzNh60WH1ZrTX1f4FVSh2w8tCbcPbG
         FXLmPJcQlxrIxa03qNSPxsHY7bSloAn53vL/geG5H6D1HEp9dKY9BvCPQI8jxSF0gHNq
         dD3AeGZ+yuEnmdlHo/RgpjHzX5HRuRnJbBcoJHK5pMCbFoYGN0vqknb5ylY9LveEQKVr
         SutgOHcWjFXdVpnD9tmRhQQ6kCAN8uueVjufspJ35qB2MP4T5YNGDHLjUzeKpv1ZTIB5
         7rvTS7a4Zxb3+CIkp2ZGTT7dbUvCPGhl1Z8PlFF/XeXg79k9ITW41j8u+TMfS/00EJ75
         bwRg==
X-Forwarded-Encrypted: i=1; AL+hErFbUHFZLX+B7Y9PMwaO1HTfaDEMZ1HHJouTqH0aeMVU7VHwEOrtnYO8jZMdEsAEU0eO+t3RG1opik5OSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SUqFXziUDpArRZWnqNCSfX3BxMYEC1hq7CYRYwIED3Kq5r3Uk
	BwWkw0+Q8Vy98rLykXApQuE2gAGqs6ic2MN5QSFjD+USQ2SJi8wU7+ma
X-Gm-Gg: AZFdTZdu3BvGHUO2X56ZsJ0TOVGFKl7C1reveVv8DjOzpoJbnO0DcRHuCzxQIV1NAgx
	Xbco/aNs/dQ7vHYN1RKX9WKWpem2OyKLi1McGIH4D+w7aN77DMgM3t3NDNqwb2kIgJZmum2IUzT
	5RlS7D9VNVv1jThFWUbFGqA78wjtIBoQAE3GWaeBLmB2g/pFSdTuaQ6lIfjXt0glPmYXKPepWnv
	DnfsYblP8dPo6iebmiv5lA3RE7t2cAHRlIXNmdR+dWenTbt3ZBd3dyJyNSgkZQ69oGtZrLPGRd0
	O9q66nJk+lxJKcObgIiqDZ2i0aDY3Wl86P0y9dPUEcol/fokf4YR/z9DvpyJMW4svET/kGq3jEt
	o8rhUFLnudVJRqvlu185ihUW8YjclqX6an1iemLPnPH5+KP3EF+ntcHVTLn4WjGTY6cHlad6rkk
	xOnIxFkH9xV2Hk2NwtYevlMGgBYfy4Eq7MNDCSbYG/BF+c4kaP8KcINnGtCEBK2AVgnS2bAXLi/
	1P6fF3yGND4Rw2qX6din+Y1pP7VrD9gJnQ5TDOrT0/uirMddCLqqIc9xoTP8dllQPoyRi7XgojU
	AABL22jLFF9wd+bU+rVVWNAk9dtT2VIy8zxM0Unk4KVTNuaeHW+aUeiL/XiV6srZxxXlcdITddB
	BLPnbwKyqNNdVeshPto8UQ/6quTX3ch4=
X-Received: by 2002:a05:6402:1155:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6ba37e90a38mr10062440a12.28.1795605987551;
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/7] Tegra SoC specific Video Input updates
Date: Wed, 25 Nov 2026 13:26:06 +0200
Message-ID: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various SoC specific updates for Tegra Video
Input driver:

1. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
2. Moves Tegra210 specific code into tegra210.c from csi.c
3. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

The "ARM: tegra: Remove fallback compatible from Tegra30 VI node"
should be applied with "dt-bindings: display: tegra: Remove Tegra30 fallback"

This patchset is based on
https://lore.kernel.org/lkml/20261125110750.223628-1-clamor95@gmail.com/T/#m46981c261c3178126ce806aabddcc38cc33f747e

---
Changes in v2:
- "staging: media: tegra-video: Move driver to media/platform/nvidia"
  moved into media-device conversion
- dropped:
  "media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper"
  "media: tegra-video: vi: Use entity function to check subdev type"
  "media: tegra-video: vi: Adjust pad assignment logic"
- fixed schema clock-names configuration for Tegra30 and Tegra114
- added "media: tegra-video: Move Tegra210-specific functions from common CSI"
  (Move and staticize the tegra_csi_error_recover() and
   tegra_csi_calc_settle_time() helpers from the common CSI file into the
   Tegra210-specific code)
Link to v1: https://lore.kernel.org/lkml/20261113161819.36847-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (7):
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: Move Tegra210-specific functions from common CSI
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  37 +++-
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |  75 +-------
 .../media/platform/nvidia/tegra-video/csi.h   |  11 +-
 .../platform/nvidia/tegra-video/tegra20.c     | 171 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |  71 ++++++++
 .../media/platform/nvidia/tegra-video/vi.c    |   8 +-
 .../media/platform/nvidia/tegra-video/vi.h    |   8 +-
 .../media/platform/nvidia/tegra-video/video.c |   7 +-
 12 files changed, 324 insertions(+), 106 deletions(-)

-- 
2.53.0

