Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C5185B5F;
	Sat, 15 Mar 2025 07:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742024697; cv=none; b=m5VUluA7uLoIcIrC4gexmO0SAh8qOUtXD4Yh9LY6yQZQXhlSmr5dmxnnrDaS/Rg/RU58gArGyhhFQX3Fz+/5Eh9bNQ6Jbiwy3bxDBJCS3/Vp/TMH2TpelnB6EkXmthcP4yUnkUWZmdHBN6m+Mst6u08Drr4hn9+ouK+8jESA+rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742024697; c=relaxed/simple;
	bh=i3RmPbkXbo9uuDNAj9g2wes/afBT+0oIFgbCCjNkPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPzuY6KRiYSDIHDFLVBJuTnn6s4iZ/O4K8jnhFb3ryX764kAedBwyP/+c3V3xWjZDbfAMYvernguYeWEyNthr6vXBHU216t/KBYf4f6Op9BSY6En5aVEDKgk/wukEwN0qSqbhX+PZQJ5Uta8Jy5bQYojRy5exes1ViK3bubqYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRu0uHt+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRu0uHt+"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so382731766b.0;
        Sat, 15 Mar 2025 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742024694; x=1742629494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJM0a9BZfHeVjt/KPSYIv/p5pdqAEXkjW25J1PN1sno=;
        b=eRu0uHt+cb0+b27Kg6Xi7ImiopwpfFUVawuWi3Wzi1sLk31F8tYsn57DLXpGoCy9st
         RXNn97YwsnQiX3Vji9CxioE+JA0GZ1TCE6520SYawY577uvP/H+jMYeCgE1AeAZvtMkb
         LEkBJ5YSEXCHuAT2qECdi2SSDFlqE8I2763Cul6TwMbl2V7zn5eFwgNKnhHLOptFQs+t
         1mscWQGl1p6iPBFUUHdagPLgxLKdRDNuY2lqrDgdHLhwn9a3lVK4zZFfVQLL31pQP4wP
         fn3BzF2ZU2P/N9nOsRypOsFb8WnUTTfacEA8kJoYRhazrgQ6Jpf0Ztq5DcPyFYkqlVYX
         Kfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742024694; x=1742629494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJM0a9BZfHeVjt/KPSYIv/p5pdqAEXkjW25J1PN1sno=;
        b=a48dihUz5ZRQqmKCqzX0laY5syNTS7PAgGAE6t77vavH1wo5EiO8AB+y3EHguDIJ2I
         Po7xWkWxVcMT+wbdK9p5j3cCA1FQa9+KRw+Cr7CFbGDn86IwBAGK5/APXiGHdKMXGVkW
         qcDaHa9+ZLbpsoYZkmWRDxnTddTaeBbSBOn7M3W8CO7EppgLv26hlraEupAlUMInq1C6
         7AGwXAaf5WY89nAy6mYHvQIRnl5bNTXsV9GrdSqS3RLLto1Z881BBDkpxOfr4J6C8qFf
         ZEL4LV7FKNDBhCVy8O72CmLyOsSoRC2vY6/cbDR23GqmTS8VIR1/2UE8oijndhOtWW0u
         +wNA==
X-Forwarded-Encrypted: i=1; AJvYcCUMmSTpNqVQB068nxCcjumadVOBI1BjoAjQbHJ+wUltzpbdzRCEeQN0IfgVfSmz7Jl/etzrFPGvTnKuBt0=@vger.kernel.org, AJvYcCUhiSwMEmwk/UjLJUnCdmBuGZZH1eLWlOS+NOsrqySot6YENR8NXCptWuYoAUlDa9HrwwUDpFGDpGlZi3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSINAjqTY/mUMeTj9RNjHPZpP6ku2Kg04lMZvCQX4pepxrxS+
	+NNdzN/FqGbFSHT4KOPCJp9PbGmot3AwxNZCHAK2li+cB1LGNrUc
X-Gm-Gg: ASbGncsnAKPeJZAWD4RZAr2OtiFeefhgjcKn/8nvl4xfwHvyEhhz/kUvVJ0e1oX0zUJ
	BiM199cLFw8shkb0gbzmtK9VVJ1VPSniDPPUSO5YGzHtXyJBxnkwRZOwpjHD1f+wHHfSVa2RijU
	PJKyZFGGcZa0UbnkTNv4sU4pvhHvrEU0oN1QnweIjdUvMDY9CSFsRm59yc/AqBDiO88hYNCKYQR
	6WeoT1gwUYLBN9afn66dOs2yCQrUguhdtId6uYuh+FEGHCg79vuXVZU07T1K8JRZ3oI37okl5PP
	weneAFKeKaWwhRMedYRKddT5/cS4eY7QE9Cf
X-Google-Smtp-Source: AGHT+IF9vwCH5nDZb8blb41oly6pVEtDQ4x+UJXk57/l4NluQSZEUR0BxJQXk/iWhsvuCMRWfEKOzg==
X-Received: by 2002:a17:907:9712:b0:aae:e52f:3d36 with SMTP id a640c23a62f3a-ac3301e4c08mr534060666b.6.1742024693645;
        Sat, 15 Mar 2025 00:44:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm336247366b.137.2025.03.15.00.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 00:44:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	Dara Stotland <dstotland@nvidia.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
Date: Sat, 15 Mar 2025 09:44:14 +0200
Message-ID: <20250315074416.8067-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
Tegra30-based tablet device.

Svyatoslav Ryhel (2):
  dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
  ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL

 .../devicetree/bindings/arm/tegra.yaml        |   3 +
 arch/arm/boot/dts/nvidia/Makefile             |   1 +
 .../boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 ++++++++++++++++++
 3 files changed, 861 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts

-- 
2.43.0

