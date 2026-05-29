Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E922344052
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043894; cv=none; b=kDMluWh8YjBmkQsrS7U4uJOgjz0qToMPBm0Cupbt0dvrOV/TuLh82Yltd6ShzoABVvhNGCIptuXJECTCynG01wkUVeUg8t23hTew1ThPG93NoHeU6lCWnDna6ti0xubC/VJwIwAMg9UdxiE+4tgPhR1zeM1WNQSJPx0e/C/4et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043894; c=relaxed/simple;
	bh=VgAm+RNMOJA2j0Sf/kAZ80gwxzHPi9+cRsWGiGUdYTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oWlOkO0ZLKpxuahvSSPOwv/qcrViEf9eLEbnUDY9RuioJvA8jQtFTPNP6mAXPDvgelHx8n3xEppKWpa+J67DgWMtrA1nKPotgAkY8tRVUtf4DQW5l43umC6ISXtq0iqPs25k4Bw/RbyxeZjG2HwCC7Yn4FPHqclMCG9ZcTppTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMdQ4Bk2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMdQ4Bk2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490686877a1so37972335e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780043892; x=1780648692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gBZ+/d1KcPESiQ0VdW5TtOLU2jbI36z47/ITTKvpHY=;
        b=LMdQ4Bk2TUf7zi7yHKpp1xWzHUY1JYgWo60bx0BNm9QlvbNq52fI3blCb6B+9bwvzG
         p7cCi30JcBMnb8jWy4YM464leoB5IB91+hv9kihkJ1XecO46EtS5DJ17/PktsC6vz7zB
         V6IYb9gBgMjxN8eEWTlmPuQ4PDHmeIsErwpmeEnIz3S34FfXAC9qeE8xx9LF5vGozszY
         ltFvzwFk7viTj/5aRpBmPdcUlBkDh/4c8NcRNmpF/pr+4SYK4SWThPo0K00riu/0bEw9
         X6YVuiBPqhVkkmttG5isFgh8EcwwUAE1VQIsbzLJgNZkkcZvR93lfoyOvj9UTtjY4X57
         jFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043892; x=1780648692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gBZ+/d1KcPESiQ0VdW5TtOLU2jbI36z47/ITTKvpHY=;
        b=o+/ZrBbD7IQnb1EFSCXCj1an3jGmPzmb8oSiH4qOQTFvHtccSE165eYN2XLzrgdcTK
         GYyU8LA2hFbi3z9/1AlUyIliKAaXBVwWkzw0j55tLjcG7kL5STj+3c2eBGs0Brly/riC
         Ndex88U0/fHZPu+ggpD7a9hXk/xxShJ5ECmtzIe89TuNshSzX25ErGnJRWC1yir9Oo8l
         8QOScJxSjJpmpTOlnPjaeAPJes6bAlHnQypdevORJBqaHW+gqPSKwem59FE0ZHe7eXZl
         9N1VF+iBbN9fKR2xK9Lc4x2z17Vqd9nMslBHjlYtaMVY+z7PJ6vYSHVklZnFp++AiRsh
         9k3A==
X-Forwarded-Encrypted: i=1; AFNElJ+XYnod5pVMH/lU3iS6YrNiJTk5iWixWjztmWkkmvVlVvNcVAJ84bbn/Ags5eF2raXCqhhU0bwwVtX7PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/t6OLkYsc6GUyP9pSTgTQj4AxYe/dZ6stAvyVOOFYCxpmw10
	oB42yG1RYqTgSp5qs8F/iVPECvG8MyiPRf413uFjcYRSAd3HYIeeJTBE
X-Gm-Gg: Acq92OElzU8+V2omV5krcgayYHQVHsrd0OyWQfDnIaHM0ZjJ0bfaoKsRshe+T/4dC7z
	XxgysmwfVb1p4p4RdMHHGsnWIN8Wh88ZkhmA+zusos0s05MKPpCxmGdw3hUd+526XbSgkJearSD
	/sBB1CAGwd8IxVK83UHA+dABWYkC1vileh1DM20GoNGSpy3ITVIQGvW2nbhWRolrxwcaOW+6d/X
	kHLx/YQjadvQNK4QaupeSbpXMx41a9T+e86iL15A1wEbygth4C0IYeTUl96UWQj+JAXeuOE0Sx0
	ZsDXUqU3X71E5wgAr7hKxQ0ORxRUXVmyClSmHRzc6Qjp2dLVt6C5Lj0K2T0JuYTHgKwt0G9PkRQ
	zN1AFAtkHk/Dp3z5Z0Xf5evHMXn8Sryd6MY+uRfOj8sS2xdOAI25EBlyrxQCGAWXjk3bX0oCvBL
	fOtajbMG9rb9lV97Np9JJK8NA=
X-Received: by 2002:a05:600c:3e88:b0:490:5000:917 with SMTP id 5b1f17b1804b1-4909c406a47mr25143675e9.1.1780043891800;
        Fri, 29 May 2026 01:38:11 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d5f2347sm24939705e9.0.2026.05.29.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:38:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
Date: Fri, 29 May 2026 11:37:50 +0300
Message-ID: <20260529083752.44796-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Motorola Atrix 4G and Droid X2, which both are
NVIDIA Tegra20-based smartphones, originally running Android.

Svyatoslav Ryhel (2):
  dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
  ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2

 .../devicetree/bindings/arm/tegra.yaml        |    6 +
 arch/arm/boot/dts/nvidia/Makefile             |    2 +
 .../dts/nvidia/tegra20-motorola-daytona.dts   |  107 ++
 .../boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 +++++++++++++++++
 .../dts/nvidia/tegra20-motorola-olympus.dts   |  108 ++
 5 files changed, 1417 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts

-- 
2.51.0

