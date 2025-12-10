Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646E2FFFAC
	for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355515; cv=none; b=mijJZtWOMLGBVuPEwsIgWb5+ERQUdv6UIjzMiwwzRm+rrUQZZCSBAVPBrhL3j8HDsMEuU0qDbZ0+lczXtd5GLlFfenG5m1AmhhtIiYtqXry0UHdIGIUOiGRtauzNkTfsOyANuQK18iwy4+VXib6EFIYVCwfUUCqPwUtqUDKfEU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355515; c=relaxed/simple;
	bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h9rjbYRZ9D45S/i3VUz392l6tpyJ2m5qIw0gKza2+9KQI2FooU/DF+ewhZ0xb39uKyg+/7O+G9XCBiZDi1h4qH0wqndi6SMTi4b+oDJ+xwd3gnjVwGQWi8tMkgbHaKRi8Wg+RNAJZvWCtRtC5t+Lw36upk3zDe8jwIg0ohtmmpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x1O2oi+4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x1O2oi+4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7633027cb2so1043004166b.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355510; x=1765960310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=x1O2oi+4QgNJaHsYaaxIK+8nsdtPEq0pzaX73ojKwlwOym7skVmTH/5zomkhie3ZgC
         czlm+/3g3dsMGjAcnWSzmMeNbBNzlV93XI7y7OTz0jX7ZWoQ/nveBbJS/byf2rWTc7J9
         O4FX1sN0VrBrKEwR44ZvWRzslBXPakKapZnJxDtq9jFAx9waN50KHLmvLsTZn12j6WTi
         Euw/i+2QYdo0y+/iJBmtApXFr5MDN4vHt05CNnsa4LcwB6KNylaKx3GQRs/aWdeWNGjf
         O3FKcOzgsU4FccBCosjz92VYrOm1oyaRTztXPcexBM0ViHMrTiCAdnraWtcZLVzambeh
         fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355510; x=1765960310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=eXs2GcmamGWpjU07yEEqXZiQAhYO6VSC68diIGRfDsyDV1LVNFqRsRQgoLVwjehJAI
         unpGtV/euwTMmU3isOy1b7z5DeZsrG3F7BQ5TfvppJpRXuUwdAYgPjrbZHrXbnfG6urP
         x2f0E72o56cJwZLcbvAkp7G6r8aflQek7iwyL62pIvNkOHW9eM/qLevQsEszumxXqJ7u
         bD5+1nGm0Okqm/B8VLCI4KzKO/3oqYX9jf5IjB9oLiya4PQA1x1RKzu2cf42slQcAkhf
         x3uTY5RUv7NVGeFToQbbDoHmEQXIDByL4Yb3984HRNXnD7UK3PcwD1cRVvI4NOarT47y
         mENw==
X-Forwarded-Encrypted: i=1; AJvYcCVuAR2BnFtTFBgD4IC2W/vYmXJ3cK0kLOJTUxlevf67CjvwkJ9XDGFSLqeVT7vFIy68TYUBBS0KBvBh/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtwPZZ5GixbqIl8tuVHjJ+2PGXI6RD6QZPzV3l5EYWZewDp9sr
	dyn+ZYvtzmIfgH72LsA4Kt+QsWipt4Xr5Awru2rxutie8pgH/VM85He2/Be3Xy/cypI=
X-Gm-Gg: ASbGnct1p9rAsuY+3UmRZJbLCY/Ma14R+U3UzueFejEeztGjDqpvTV1PPRGIqbdKnBs
	MazL7PLyNQ/krHdpcq/nTRtgRC6pJ2SmfH3MNU8MNjeP5i4rAB6/NHEsklNDyJCKJVVM4cza8YN
	ULcWIgZJ7T1yvf0WnKabqmti7FUxc4eZOOf24d6hrpylp8GNVAc0GhGOlWplt55T/Rc7tjhcTil
	Dd1LPgzAq8qQC2Hoi7XwRCF/x8CBdV9Dbg89LWaVUdHB9SGsRTpJ4o8WUUs2Kaj7VcRL5b/DY5l
	oJNmaw0PVprzhpx4uQ2FGxhiMu9SGcsOWeqTePQZIEjFRVu91DY50C10T3unJ7efLCtdLZ9zoLA
	Raeo2i7LQaTy/SgE1cdDW/TZ7aClhPsnTyFys2sYlY6K0cngd1PQZUHlMQahct3hX1yghs5gsWQ
	6m5WjvrnsFdd/4Aeky
X-Google-Smtp-Source: AGHT+IFhEWLNvMehRpc1wUqvy7EgAfKj7fWQCi0AaayfiHw5TZ8PfJNykHUWSH+Jpsiw27YnP7qNSw==
X-Received: by 2002:a17:907:940e:b0:b71:29f7:47dd with SMTP id a640c23a62f3a-b7ce8476094mr174700566b.46.1765355509951;
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f497674asm1598816366b.38.2025.12.10.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:36 +0100
Message-ID: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/pKRGMR+zmAK1B+hWBzeQycrZi9CsF/M95z WMChvvAaY2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv6QAKCRCPgPtYfRL+ TkEhB/9UH9ZkwIxvzlifG7NyhzIUvjXvPe+zdF4tvTXVerfpLth6KJe95KUS7zl/ZtyebZz0D0I 6HC16qxNL0UPB59lEPqR9BMbMqC6DswMZrjSUU7EXrIaA1k0NQbKuO98s8Wpw3mEuNwUWcuAfd0 ZjhzB6I6y00O/o6eWe0swn89yn88PDpEwpmVGRmKt4KMFVPQs/TyHFzT77Vs/GWe1sYP0H83yHB 76QKduqnaltVkBvI2q3gugY4Rss5eOWhfULtoLbjwP6xrQuIL+zwucgvF3SIcpliagwQAP3UN4c OitUBA5tMJCTbIptvpfqe6QD7NEBWUdLLJCHf/+z81sRtnj1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

with the eventual goal to get rid of the callbacks .probe(), .remove()
and .shutdown() in struct device_driver, migrate host1x to use bus
callbacks instead.

Best regards
Uwe

Uwe Kleine-König (2):
  host1x: Make remove callback return void
  host1x: Convert to bus methods

 drivers/crypto/tegra/tegra-se-main.c      |  4 +-
 drivers/gpu/drm/tegra/drm.c               |  4 +-
 drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
 drivers/staging/media/tegra-video/video.c |  4 +-
 include/linux/host1x.h                    |  2 +-
 5 files changed, 37 insertions(+), 44 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

