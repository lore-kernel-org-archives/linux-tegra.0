Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F9B2DCF67
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461539; cv=none; b=rF6Kths+I4knYEJeehq3kEX4GEbvHZNiWQZLTldyXqc+Vkg4fdoa/ABw3Ouh95qenpfckHiehVfqcFdisucyYsjnb7r16tWEFu6pMOZrLkeQ0c3Y2Ml2Je/eIGvCuyVpz+PfCYQQ/J58DJX46BInsLgrpDP8ldKD9VtBx0QMFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461539; c=relaxed/simple;
	bh=4G1XuL3JmG0SfbgvjNtZjNiIvLZLSAEkiK19PS/5AG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuzSz9vIyrXKuvnI/5qxdb6RLeeglXPig/XetNib6Sw7ns90PeYvERssWuWZANGchBMfOca8mbi32YJaPWR8JpjUl4VDJTJoUhCPZpRwYO9rdEPaDPKTdgN6C+K2RjIPUS3wIIeXpc7C9BfXSCkf4pVDsl+Sbb8sLyk7dkVXs+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7QMBxji; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7QMBxji"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso6521323a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769461536; x=1770066336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPD2stUhqgDs3fRF/iKymS4W1eXzVO6RB2vrRpfz690=;
        b=Y7QMBxjiBem8/xGYSozzkhkkJXeCv5bKSoG5AZLfld8RS2aBj8KxpNddp0/3qJu6NE
         eYg+9JeXDLrptYOJarcSsLjXti0ZSPgoTEZIFYdd2bK/B5B4eTI4FmJ2F9RdjlTXBY68
         mraNYdAsq54jchYdzyGUk38Cidz2ulOGmUepJJ7Sk9c+3etr7JGI2bxdaD6xIIjMI/k4
         RCJEHbovxJbGxfeDEP2w/2OU8ng+KKlDUsmD3CjjArnTg9Jusg48onRD9jRbc1Que/CC
         Z6X0IsXnlX7nVkl7zd6xI257zlS3xS0JG/3qKmJh/CQLQaIOFIABMKEy7SL2Y2zEXPzu
         c6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461536; x=1770066336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPD2stUhqgDs3fRF/iKymS4W1eXzVO6RB2vrRpfz690=;
        b=W+YCM/6KFt+6Y8RICQdZ4k2kMSakV/Gg5SVA44//LiY449544Fdy/+pvqEbrQCa6e+
         21AHEyV8lDvPCQc5m3GvtrrMxYNSTMpETUAxPmoQ5ySPVSI/WQq+uEpU/WP84ZUrksBf
         x6L3RFawGyrum46w0ecGUXsKnbwkL6HLH5+2WJCmqjsdYy0B6J5jKkuDrLsNG6CMLxTy
         yQukbU2WYrKXX3d+7nRA371XS5ueBAXl/mfqCRTbJVrBaDTmggmLeJ8HBPbSdVYqKVfT
         7VKDLOVZGB+xCvRRs35kLeDCnumm4EXnv9BESS+9mxXJqv231kkW8T5U3OfVju41qOb5
         TZng==
X-Gm-Message-State: AOJu0YyfTIwCVZax2D5HEleAoJDsCICGGCZUuYAR9aEn9ogWIndbIzew
	RZMBuRU3U5HfgAlVR6ESmckfo6MiUDMbvhhmF6hxQ7g8Kssp+HjSlLAcXlSj/w==
X-Gm-Gg: AZuq6aJ1Wd10ZdBjLAutttLqqnN6LpW5DVZ7rZOB3bK8jDdhMvXkK/EhCpC1HSW6xV2
	CJ3NAgOyFQ+RsOQ8UwPytXx0GAIwQ9tvAadoEW+Biv87AezsM+UPcBHaTKGqYccNpByGly0+UIW
	hk76bqYWuE7Eyw8dHKuBn98fE7Dzx9Q0F9biwtml5/CJZy/ZuVKCbe+WcOT5+jJtIoxBebOhDuO
	jqZHCFBBw89VPjCmOJanulG5A62jYrQ/ZyJmyiOPyYXEX0h4XrUZarIpeHsmV3ck/3WYks6zMAF
	px/Z++Sgrk0uue8kUoACUzIf4i3C+5pFoWpTFY2oDPeQDTM+8v4k2A7PQM+PBCCKTD4XV7xNszF
	7nKiiOz+dqr3Fc+WD79l8dRYEGxKcKcKfpGn0yYbROiUKlNu1DFKS4Uxd9Xqj+8nCfa6iXP4FFJ
	bde22jvxAt1WQ=
X-Received: by 2002:a05:6000:2210:b0:430:f65d:c0df with SMTP id ffacd0b85a97d-435ca3a90edmr9577985f8f.56.1769455237026;
        Mon, 26 Jan 2026 11:20:37 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c01783sm32958848f8f.3.2026.01.26.11.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:20:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] soc: tegra: pmc: enable core domain support for Tegra114
Date: Mon, 26 Jan 2026 21:20:29 +0200
Message-ID: <20260126192030.79119-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pick after this patch[1] is applied.

[1] https://lore.kernel.org/lkml/20260126191536.78829-6-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  soc: tegra: pmc: enable core domain support for Tegra114

 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.51.0

