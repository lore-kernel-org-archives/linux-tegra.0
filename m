Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600233B6C4
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668111; cv=none; b=KTtkWn37xKtnhk3Ne6lsioipXNmmML5hKre38NScYyMJA3eNygFgIdxF/H98UeR0vTuBcQTY6bHS41JSMC6cdWsoqSmNZjjvPYKOT+KrQp89nOyh3/YnT3VG3TTWmtYE9QHS640at9U388wc+bOqkwTlmoHosJ1LACf49tfNMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668111; c=relaxed/simple;
	bh=TVDvBDhhE1GFZeZZeFs+dGuWH0KASYUMZZiT5zbEg7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gyd8Ck+4Oj/JY7j2UIEWme5aFdkBflzTqOtlVAYaxuvi8xh82aakMvUx93ljFlsILogD5n6OFqzwgwZwp6Ro21pP7ItwYbSPc7JxC6se+jw4Snt97+DOGB0T3oz33OqDNAnzUgVkppcf6fbpRQ1cEMbPx5mKBklsce/DiCP9SjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lebtebPl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lebtebPl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82d0b68837aso3982b3a.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2026 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668110; x=1776272910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz5Cydk8ycXF/+GGvFsNR7glut2xhT7NU+wPgS7bPP8=;
        b=lebtebPlpGDb8/bEi/NPyFcFExgcXkWDvCg+bENmCpmzFyD3VmYcrAbvCuQaW+0gsp
         MsJ881hdUgJV1HtO5vqcAt4UGTnkZdXsLjWzGYzGD1I1wPCuFoa7YSLUhvkrnEhc2300
         FQTZLvFrFOeM7jbNiR2DghddM/y6qLyzZX+a8etgN1IsCB25ziLQoHcQbat9lhCb+Y+i
         /8BJHXZJnyoANuviJk117j5yrd9Lcdob4j1JXDdkNfTDDD4SMtrnBg656FYN23Tr3WDK
         H2qih7yRAAe7zrXaLp+qNC4bR1G30zIFJvPZ2fsEQUUNcIoVk7456uUwjZF1mBH/1lmv
         4uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668110; x=1776272910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xz5Cydk8ycXF/+GGvFsNR7glut2xhT7NU+wPgS7bPP8=;
        b=RfSaZzY1uw3T+D8uezfMreMgfBTuXUd5GDif/esT309jS/QSvD5qHpKoubbPYMYvyo
         Z5VpS9jCukPRDwYHnvhLqwp2+bqOkfRJ6dlFdljgNsnhcxRCPtLR3gcpNCRW7jH1xgJK
         Q5H2bn+Z9vNQfIkYxtIGuVWK+VesfRSBcLyBEwDmOr11vkVvcLSmCVgGzpvDc0ac4+Ra
         8byFEZ2Il7cjNCgh/A4cX/gH/TehsiHjv8YONb0n9Wd0BiKRZsoRKny5lHUuyszt2ISW
         AUxphxBbuR3Ceb1plCfsre++6US+AlrVi+mhw0VeEUsgCLhXcHx2bqnzf4FEeDFloRg6
         +GJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV4Vf0dWMEzUX8P/1f6YWqF9Vd+aMttNecxVcvSk5RqtvJQyU4GNE4vvro+0962U+nlUP8EhJDBeE4Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysfl8EZHqxDY0QHqvKHeaLfpSMG++GvgMY7Zj17w1WpZTs9/OK
	QGxKH3l1DehTqxqg2c6fWPSMM5TKC2k2DuU04tLtA30RQn4NKCuhlS0e
X-Gm-Gg: AeBDietnynAJacvtEivfgHQ7PNUEFtuXvrWEQtPmEGkGBI/W29Wt/D0V9sOqJrtAu4N
	SH86XtrR0cv4T5vOTgbv5hXdLVN7VVmQXvTYB9dH4rP/Wt6WlP6nlyFv/Ij/K5UI2ehQ1jmzxup
	NwqqowkzCgh9Cvjuffkfka6UrUHL3KQYOkSoct0ABaDl2HJ3tN5lBjIglWcUBXf9+Gs7c6Kqpk9
	b+ErF3tZtWdSq60Qhmbb4MApJpdECq4D9Bkbsm6HKcKoB0fdGuAjJ1PTI/Fi+bo3g+qHXUsVZVu
	T4sjdmonBtIFk20I6bY86UFkeBIZmLI4fQyB8jXXTOyeUJTxUz1oBsb+nW3V5gjiaq3x3Aw2quq
	7Ju+KJya5nIv4Pt+HxVCXWfEy35xg6nQNHV0TMyYFmjvEOwj6pn+vjzYHw2LSJC8gwOmvKwCWCb
	TnxNZzA+Q02rb4nuL9PLCHs6fn+nr/0JZvIvdlL1GWk0OpGc9WtMmw6L2y0Q+sjLR0NMdkQuVlS
	hlk9YR5xLkgotvOgykZ7mzi1A7Bq1tU/0U3V+a+rJkmsy/c6SUx4e8FpA==
X-Received: by 2002:a05:6a00:429b:b0:824:b181:f492 with SMTP id d2e1a72fcca58-82dd8ad1516mr256957b3a.45.1775668109744;
        Wed, 08 Apr 2026 10:08:29 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2694csm21775091b3a.2.2026.04.08.10.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:08:29 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tegra210: simplify byte map handling in ADX and AMX
Date: Wed,  8 Apr 2026 22:38:16 +0530
Message-Id: <20260408170818.70322-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407170308.100238-3-piyushpatle228@gmail.com>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
control state as a byte-packed u32 map[] array along with a separate
byte_mask[] bitmap. This is because the control range exposed to
userspace is [0, 256], where 256 is the "disabled" sentinel and
does not fit in a byte, so the two arrays have to be cross-checked
on every get()/put().

This series stores each slot as a u16 holding the user-visible
value directly, turning get_byte_map() into a direct return and
put_byte_map() into a compare-and-store. The hardware-facing packed
RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
on the fly inside each write_map_ram() callback, which is the only
place that needs to know the hardware layout. The byte_mask[] field
is dropped from both driver state structs.

There is no userspace-visible ABI change. Control declarations,
ranges, initial values and handling of out-of-range writes is
preserved by treating values outside [0, 255] as disabled (256),
matching previous behavior. As a side effect each patch also fixes
a latent bug in put_byte_map() where an enabled-to-enabled value
change was not persisted.

The packed RAM word construction is also updated to ensure the shift
operates on a u32 value, avoiding potential undefined behavior due
to signed integer promotion.

Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().

Changes since v1:
 - Allocate byte_mask[] dynamically using kcalloc() based on
   soc_data->byte_mask_size instead of fixed-size arrays
 - Propagate -ENOMEM from write_map_ram() to callers
 - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
 - Use BITS_PER_BYTE and BITS_PER_TYPE() instead of literal shifts
 - Add <linux/bits.h> and <linux/slab.h> includes

Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic

-- 
2.34.1

