Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA845BD78
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628671; cv=none; b=NnwV/5j6ZXkI8d9ej8z3/JtXGen8CUG3OiYFy4iLI2NtBVUC++Vp1UkK4vypwDv0siUgtDuLtf4xHxv2JJ/yaLsON/C3k1MHAQcMJRUsz2hQIgWLniCO/Gl2y4jYVdxOgre0+H2zS+sWi8OKzlq0eMXwGtG2qZKbrpS5b8B2g0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628671; c=relaxed/simple;
	bh=nIdb/fBsG/b+YAwCgHXS6FdjGH/P6bepsDzowX5hlz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNEzau6k4nQyaA5hFGSBq+3B6ndKOce2DMkIluzrtEHcM3EVDAgF01kwGE2CrdkCnAEoitNqXpP3bCDFel1WguGr7iBftYAu7YGP4usswEwmMYdJJkmnI7znTEWep9P00hfIX0YI8MWHs9DpL2J9wKZ6QZ8/K/07yB2en2bl+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X11b/oHW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X11b/oHW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so24609085e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628668; x=1785233468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFSTYRvO4N3dQdiGAv4aH0rwTo6KGoapPKqZsOz3hkE=;
        b=X11b/oHWSPq8QUOTWQXHruQv6jzE8zpaNyNkqvVC2wnhmTNuxzf8E3tAEW0+virfWa
         zkcvc730thgzr/9CLXUB1binmdXkaW89fOxOyz6HTk90wDAVb07iL22SbFYjh/RYFdIx
         Fyzj0r78n3lv0tRNSTCbd/c2EaW4lJBXkfMzSMkv+GH1dyD7vhxjnm/p5knoLpKKaWOs
         fCPrtCaXBq/tZ0BiDjkXB32OUasLU/Kq7wfeKjtOBV/ItUO+mt7bNHkUkup0j0aMk4BF
         zDI569Ll5T1D4mIpJsMvQJc9Y4HXqclNcwZDitmJ1Cn+GiVmeosM4Un6UggT1RvVi1xj
         o7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628668; x=1785233468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFSTYRvO4N3dQdiGAv4aH0rwTo6KGoapPKqZsOz3hkE=;
        b=O2dJfCWUa03ak+fDDVrPzWUYB/hKcFXOfpNhpoTdOgjtyQIJH9jNbIlzlKUEb2ApdL
         ghiT8me4CwZRjW+W8EDkftSV7lylk5YgDbnNU0kKTAyD9wGVlnz6vom5wRNwRO2gTGYo
         J+jpUSlbjNXxKMWlRjlzRoiyqy3NsGYoETnYU3x3NAzocNTinEXMmGty/iF44GgfoMCv
         v53HAxg2AIpQepQEFo7++pFiJNHqhkuXnaEY101a9xLa4Zg78mKd8+KOu15CWmKzYzwF
         8sfT9/n9JPAXCy3+Wi/xuKdrSV2XCzSAGFPrPrvlkTOq+6D9KpMsNaCD+BGHIih1ejp1
         QZwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTITSlKp3O3y6hB0rNyjT6kOdDfVp/GfGEJIngaa+6nJBOJemKFjrUTjagStKUpz1kSrp57GU47AIQEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4abY7weFCdCd5KrX/+1g5McIOVZFxUfL4ppJTdIcxcuDWWAb2
	Zhv/tKFkSEMGhieJg3tthZ+CHt5YQjW84mOagMG98ZrHyC8Gkq9d8iDO
X-Gm-Gg: AfdE7clKy3p6YebDe3pbJPdEXJ6oP3xcBagH8BVSq0AU8N37BoI4e3HshdKRhrBhWub
	mCh4zbyf32N8T5gweGspDgLoxb+NBdMpeS+ZKF1PsBnbwDml3tOyv0Lo2g74FpC567hdrOdOM2E
	v26ux7s9dPFw1hs4VqeqqnJCO1ZMrqU4FjzPV7mxsWHW7p8M/O3w8IITkr2VdV0+W1Xc3C/4RgB
	654UIax3Fql2dNZNmK1o6livvNzr/SL/KQQsDorhdUaGMWbrK2LQ3sMlyR62epT2P1uHONurXHR
	0mDa1FjeSfFSBMDQYWAPW929EMv2hO2M1bOJvF3ZTDjffJIUyQMFw6GypVfqNFARIKB7d0llO0j
	9VkYRY/nOZ1PaNhbRlYi4aTvy2V1Sg606iQrfBWcxveFMd2b1tU/pOUSuAfJcBNJEi0K38PJiSe
	kupAtDYWqgLtIuGJtHuKSc9kk=
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr187455865e9.28.1784628667616;
        Tue, 21 Jul 2026 03:11:07 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:07 -0700 (PDT)
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
Subject: [PATCH v2 00/10] ARM: tegra: tf701t: Add new features
Date: Tue, 21 Jul 2026 13:10:49 +0300
Message-ID: <20260721101059.451699-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new features recently merged like CPU DFLL, MC and EMC timins
along with fixing some existing issues.

---
Changes in v2:
- removed vdd-cpu-supply from CPU node
- fixed typo in thermal nodes
- adjusted MMC flags
- improvements of commit descriptions
---

Svyatoslav Ryhel (10):
  ARM: tegra: tf701t: Configure CPU DFLL clock node
  ARM: tegra: tf701t: Add core-supply to PMC node
  ARM: tegra: tf701t: Add MC and EMC timing nodes
  ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
  ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
  ARM: tegra: tf701t: Tune MMC devices
  ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
  ARM: tegra: tf701t: Complete power sensor node
  ARM: tegra: tf701t: Configure UART-B line used for GPS
  ARM: tegra: tf701t: Add chosen node

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
 1 file changed, 848 insertions(+), 37 deletions(-)

-- 
2.53.0

