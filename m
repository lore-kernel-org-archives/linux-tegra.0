Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8530E0C0
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354331; cv=none; b=hRwJekSJW2ZFsh78FTvF/y2XHscGYrFbXxPUlSkAOy8iJn//6V7nqh2HlYoJrQprjEvUaJSphlvpxDtaexjInRrdF9F1CewMMUAs0oMJpe89jplYyBu4gyu2IChz1ewDuufq58ogCnXogMDsGjm9QGViDaz6Y6hENGFQ9xawCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354331; c=relaxed/simple;
	bh=TDJbXfFyAbZcEQrNkjWXCeHspNOTitXO3owb4PmXNMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjJIoNaaHWVG3TSOED/PV0w+QGecyD+MNUP6ZuZfZrSC3ZFGiDaXLgMS2PqmZfAWabyU73uvYdKA9ByZZvc9GbI0xAie9K3mBMYphinnZjTTN0e9Jhw9KOhL8uCWk6M1RhB9oEcvXnBfIpzSpaJ17joFcbe/2rZgzAzaBlknvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHs3pU+X; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHs3pU+X"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6446fcddf2fso10385401d50.0
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354328; x=1767959128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=KHs3pU+XeF9uD8XqG1BqosfjYPc3ZBLG2O6V5uwhm/+JI1l+1ZqWAputZ+zQenhWOo
         fvWOIZ3blghkocgBQyYJn6WyYEepjPRt5caaXoPdmBdd9inSDSShBpu2hei+XiAliP0U
         RAcSVWIlWz/wcxDlnsoXti3O7MzwNow6960htXpPgsfTEAxVJc1WMItyWMIY0SjrxxQt
         x2QhW6P7KMleK8Y8EpqbWlWy6KU8b+TLX5fy70Dt/JUIQMgrkkqA8BIKoDCSUGJ6OPIX
         Al3Uf3wXOLWH8ttYiFXS0nZC3OC89Oz4JbktJrLi14NKW8RMRlseKosqKyRUBaNC6Kx0
         SU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354328; x=1767959128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=Q5al1s2defdR2F8xO5gWDn83+5ZMi+DOedyxQrpD+QoAqI9C74Yl5hWGCwvH7Yysx5
         6XjAgzOfym1rwK5bwSj53nDxZ8ok53qcLBzZ1e3dRLpaKLonTkBd0NnN9MDKmPJ5dJnf
         5Djzs4LzCsAbjXR1AoA+iTRdBKKnPG7MCeiSCXaKF7aCaXW1ZE697i9Fz1KKVahY0yF/
         E+uIYA8Pe1Ic5dulotEXVFXauiEIUVllAPN//nE0Vv34vp450Y1jtbyyEEBMEMQwFxjU
         yjzPMuZz2k0znbcnFUiFo0RZknxZJn+U5ZW9XaTytc7x9yit9+z2eHPq23Ajobjh9/Za
         qMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV2qIY8CKwXMJYu5QSCsCXaYxlarRpvjXNHBG23+usaZ+sVFZcAOmII4e7bekaBmDoIcmTtL21vQh8Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzmvUsUTJI1kKT+r1u0U0YNTY6kFig9CFebuBu4ldY4PMjG1+q
	oaaN2G0jFPj8LyqyuFuU5CbUe+bomP8JtPr0Y8I9JErNsFo9WUCULzx4
X-Gm-Gg: AY/fxX6b57eB/V5M6rEXCo3SCc4SzRjLM95hmD8AfidAYC+ucWI4uRb2CHoRKJzLLfb
	oIFVptcN1DnnnP1IXNfe3G/8cl8oxU6byzRShHpCRC3hg4xYvWBXJ+U6ynsXA4wDREDIgpOI0YL
	S4Bo6vPiiO/9Enw0nbDQpa+cTDTyNZK3QEN1Nhkr0FPkfqLN4EET2Ieobailme8FYPtseJi2lwx
	mJtwWp4lJvNrsmAKrE0BLIGgQluixroSqIKFtBkXp/TLTQQVa3KKoydQZeSaFV2lcjmuI9ZoLW/
	c9k/VKUlnVZbIjt6mFusxN5b8az9fqZoXFPGI0xUn3nm9RHUVwS+zvys+WA5JpCxZkKHGbE/Hq0
	C02VBwUSFNvjvg5t8WK2D6l0Ta/slduH81WPOgLO5EPhkeLg/rc9c5XiXxx+O+sTR8wtuNrSNBE
	jao6tiJ7D88bSwxoBUh0FJ3/+xs//sw9zGptLJLdrJp2QQa4vhkQKB8DlwIM5ganJkf/Da3WKWX
	FXlUnY=
X-Google-Smtp-Source: AGHT+IE6ACYtbfDtIgHRuD99sx3uuiu8dKeGyrijkk8cNwMwXUe595t6B/utOB2BInhViBh0R6kqVg==
X-Received: by 2002:a05:690e:1486:b0:63e:b41:cebc with SMTP id 956f58d0204a3-6466a8395admr33899090d50.17.1767354328416;
        Fri, 02 Jan 2026 03:45:28 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:27 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC declarations to headers
Date: Fri,  2 Jan 2026 19:44:59 +0800
Message-ID: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across
translation units by moving them to the corresponding headers, avoiding
local extern declarations in .c files.

No functional change intended.

---
Changes in v3:
  - Wrap the SPARSE warning in patch 1 commit message to <= 75 columns.

Changes in v2:
  - Add the exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

