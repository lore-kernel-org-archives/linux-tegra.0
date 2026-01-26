Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB87D28643A
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 20:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460573; cv=none; b=EAFAYHBuO6lV0i5JHAaPbZhRhoTAEWxVECrbGdj3Umsq6mz8JJ7VeEXmkdRlMi/kzWYg63zFytjf9PCFWylPYxGZDc3QXG12ki6lQnOidrybn3iQ8TBmPt31MFEqTKUYZXG2J8/oDi1LwoNiweUVZOJDg8UYKQ10RMExIWxn17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460573; c=relaxed/simple;
	bh=A6jn/yMvWVBB5veD5BMs8jFFmGnBj7lxblIDGmq5K94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYNTSos/IBJL9SIYX+HRyAJ+9d8nqD8ItIVVhwvx475UhDGIbCHKzFH8ACxT5hHwP2+4KmJM77u1prmbbKAepOvUFeGZoVZZQpYV9+vhrmltd2vVQAByCy0jWCg1ZAQqvPj08MjQ+ofJgO5Gew6lt9bZcEbBj2AJmHAF6sxsnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpNZMDCI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpNZMDCI"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso5532478e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 12:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769460570; x=1770065370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxc9IQWx5I6gbjdfSuWld71CQkfV0DDDCIijMstKBuE=;
        b=SpNZMDCIJiK9vobzW8cYp5UsZ9zcNcK18nzsu2r19fNRJW3+zroiNgs0w0Wsqfjgsy
         /8Mw0UzEsRMW3JbtTVgb74jSSxQqfeqF3Z4DBVe1gDBQoH0USDeTHQlKYC4s+zLomccB
         5PywGrr5G4BpuWNx782F8ZwbAQPVp8NdVI+aWjWQsSdUxJuN0EGtQwqpYQDhGu2E3dmB
         nYWqfkpr5F9XuWxbpNeLL27Ai5v99PZSXNRFdISr7aNDaTMpAnzWBGmnh3qZZ9vl2Ux7
         VFZACdYkR/hb0ZUD0MF8bdEMg0c3b/3eSKRkQOqsTChDlU+uUkGRe89gFpiTSI/n0Ro1
         lr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460570; x=1770065370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxc9IQWx5I6gbjdfSuWld71CQkfV0DDDCIijMstKBuE=;
        b=aDL6AiZAtPLWyQBAFE9TZrsFhBf/O0gjRb+B9PUEjBus91OAlBU7Gb2yTblGq1vcWp
         wCm86CuNw41lG1wktI1tzsu6YMADa44kqN1Zxcd7rVtTxicb4wliwyuwfxJa3iqEvEpI
         1tDpVgz8zOXgXY8mcxJ8XlxwiW7E+PS2dISp1WPMB6LpAZgwuR7xlhod4XhqYQLlYeYL
         F4/EUYhzMxDbcHxh13+4S4/8Mos3RCqwGcmhPuur+fsnFuAp5ulv4BzZHJipkM4bBU7t
         SIQt33emmcmVrL1LKxqft5QEPL3lnEEv2lAPPtoi5jWy/KE+BqlfOjpFFifSxdvDnYgD
         tLEA==
X-Forwarded-Encrypted: i=1; AJvYcCU4XHmQ2hg7ximWfipj9b59PNhrU/2L5GgvnxeHvHuto+Hqfw76mBnanXgwktsfufuAD0KELCTwJWGU9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYy+rZuApQGqdxEYOF+SdHREszA2cczLrxTNLGdhEhXWbT7xM9
	EYDrP3FCDiiTqgze8XRQhU8vSNtOnLjgG3nm/moXQXp8+cjRvHpEcD5J
X-Gm-Gg: AZuq6aLQ2ZQJ2lZtk+HJJYjS7UJKghYFJ3QtpI9nB6BQG5lxRZ8ogqETigM3RowI+9x
	FPGviP7d7ellAiuBTdqdt1eU/PyGZJrwJpKcYnRlvPiBpzL+7all7nZnIFIHwd9rce+k1GrZLHG
	e0N3s8D08Hf0KYTDZmoCrQp5D8epPZpFqGLhwvZKRCr5r2XbUAiJiKAb4kf5zJGtRCjMT4KeqTK
	dTbsEcbyxuN2DRuW5herwtDQBEXGBMNk8+oNzpa3HK8EEjv4mCsoiOSoSNqiZNRNsJ0xhr/Y24i
	276e2r4BEM6DrlCs5sOKNFWUddvHsb5okd5R6adj2WnTZk5aL6oSlM2dNst/FaMEHn8mTVyeSe7
	sZrQe7id4qS8idbXBSGDFwvTUkfgdlPUtW2ZeywACBilsYZUhaaKEqYtLpzciuT+sr2bsc1SMHR
	oe
X-Received: by 2002:a05:6000:4010:b0:435:b67d:c304 with SMTP id ffacd0b85a97d-435ca1ada2amr8949251f8f.38.1769453687028;
        Mon, 26 Jan 2026 10:54:47 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm31793947f8f.30.2026.01.26.10.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:54:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] devfreq: tegra30-devfreq: add support for Tegra114
Date: Mon, 26 Jan 2026 20:54:22 +0200
Message-ID: <20260126185423.77786-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lets add Tegra114 support to activity monitor device as a preparation to
upcoming EMC controller support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  devfreq: tegra30-devfreq: add support for Tegra114

 drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.51.0

