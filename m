Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9601AAA1A;
	Sat,  3 May 2025 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268220; cv=none; b=qmwUvaO2VzrL0PwC42cx+J2fE0zyc+j3cUcp57QibcjjChlGEdpLMyL8uv6Gwc9fNKumYNvA0eEUAVjqZ63+7ZLrSIl+3KmTJp3cU8V7wLvjjYdUKQ7iBxKmF+irkUJKfAG4+t6Kf3UQ5/ZmG397UhNf+j9I/8YWI62jcMXAGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268220; c=relaxed/simple;
	bh=UMrNAau0Eh6k8vqOiELFsOeEbGqSVXDyF/kCPEcPG3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=usX95rYBSh1FfV6rOB2E/POV/czzIRSA8M9DTlGUFU+Rhgba9MNZ8XszlOJhDtMTUmXK2pcRO4Vyyv+EzWBqzYUFMHiN6YmtPJ4sNeBnIYMqoIb51GH0am1yUjyUu5hhvXxaZg5Nf6deYo23XBlppT7CgVrx1GmJUJw+4qk0TpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpDy3Tkw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpDy3Tkw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb2faa9f55so363297566b.3;
        Sat, 03 May 2025 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746268217; x=1746873017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Yh7xVdmrrVR1LoLiazJHgnLXij+6WlhbMFQTvBRYc=;
        b=jpDy3TkwAjglRLyyWUSK3AUs27LVPRzf6D85+g7qGryMtnpkuPdQVJEKKPcb0xA/nn
         EU1Jj8Kpoy5cKda76d905ENVnibArRg9jMG1eRMj2eTQiv2U1xAnJWgiznGLgn/XFyB7
         8Td3V/48TlxftJ75Q2Bpy5fc84sCVupm/cEZtdjpFSHDJtRpnXzD6DLO8ogGsBvA1VC0
         sqcgt1wcXaw28nu335AmrInGEIJ2RYeuZ4y2uw/5Bu8um3vfAxQgY7CKV/gsBaNY4bNV
         6r3KVtsq/OkPFyo+d6kI/P+ftklqQ4BXzUTPLoqs+6CbDsUM29VBEoJoyzY+AYqqD9wD
         7iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268217; x=1746873017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1Yh7xVdmrrVR1LoLiazJHgnLXij+6WlhbMFQTvBRYc=;
        b=dbaJ9Xt8IA/Fa1h6j0ZnW/1DBumWyZK5+m/TcVhJZKhdXC3sVDVRrjGCqf6Q7DFB+M
         l4dmtQkBy7/gD3CAQRGsj6zOYERHT1mIruTPXDCJjlAeZUfDenamhuMoqNFhanoH6OQs
         HDeASM/gTP1mhHwVJO3TQ76QqIvdpiNVsoY9JMeBoOBwSaqcWh4HKx2vCbAmJhjH+z7i
         INRc+lzQ5uqygwCJtxv0x5sGOWK3HoXWwGjaYA22UIdC+FCYZW0PrfxhOyvn/KN/cUu1
         flvqVkX/0nTfgVCO+9Ya8hiMoq/VO2eSpbrc1ozCl4uqXJNGrp896KeQqVbW97UcQ1rA
         TXHg==
X-Forwarded-Encrypted: i=1; AJvYcCV/T52XhmwD+PqZ1CvULDBPKvmfyHCnplke5uQMr0YuhrrfUriZt8Ngm0dTxeyC/XmyJ2gD1PLM/CLqDEk=@vger.kernel.org, AJvYcCXMwuEwMb6efn6MMES8blHe0g3CcD6/Zhb51aFUDFNa/zAImkxp29o1yKGLajQN4GA6D+0iMCygmmBTEaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJy1Z2mfleQ0oShfhNobFmTrEB32yGyKGoL3QTntK7fTie7Sya
	mODAJgPQsyESa8oWaKPlC4/joU/JdYXBe7eO2kM6l/z6rRsDFWOS
X-Gm-Gg: ASbGncvn/xq/llC40e3AjGvLBJIGYooi1/VxNbE2/bHp6l04h8yNj/el9EWyq4qYxsq
	vBMo4u//jp3KjRlbMoJ3g7xUhJgTuDo9ADPa/hwlIi5spKI+YZPVfEMPDiY9iBu67EuTjyww54P
	JjzUtydOZAT4FWG1TenTfryRTl/NwN0hq0gWgb2Y7XjrtQVHv/3X+u2BRPjLtNW4QzemponCuJd
	v1AZQbu31pcKJilaU5qkCSw2UNRZX1JYUvF7e8rXHbP4M/zD3JSTU+6y3ynxwRQCFwUkJRmbUFq
	2J5jBLN38UpHRPoqKGprmt6NkzZgh3z1EiCbOYaV48g=
X-Google-Smtp-Source: AGHT+IFceLos5ktmx2J70iKAHVypKkw3OnGNaUUQ1SACaovTBDxd9YXwOlGGIrVppLZWfel+TWOqzw==
X-Received: by 2002:a17:907:7fa2:b0:ace:d4f8:b687 with SMTP id a640c23a62f3a-ad1a494e3a4mr56576466b.20.1746268216088;
        Sat, 03 May 2025 03:30:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509088sm177848766b.146.2025.05.03.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:30:15 -0700 (PDT)
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
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
Date: Sat,  3 May 2025 13:29:47 +0300
Message-ID: <20250503102950.32744-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
Tegra30-based tablet device.

---
Changes from v2:
- optimized the schema for Transformers
---

Svyatoslav Ryhel (3):
  dt-bindings: arm: tegra: group Tegra30 based ASUS Transformers
  dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
  ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL

 .../devicetree/bindings/arm/tegra.yaml        |  19 +-
 arch/arm/boot/dts/nvidia/Makefile             |   1 +
 .../boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 ++++++++++++++++++
 3 files changed, 866 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts

-- 
2.48.1

