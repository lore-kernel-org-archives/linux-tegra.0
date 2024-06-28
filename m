Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECCD76C76
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608905; cv=none; b=dpOmf81QEtgztOud2nGNkqbKk76lKjW4iG3Bhx3cNJbRMYUbGvGp+Rs+loL4DpYGvN0N/KQ0S24PJATx/U/woP1MKWhMSpnGjHg7GZ+JZUB5G0FyQmRkD5w5RsQFn9Y133JrckJ1eqivwND0d8+k2ff7lgX6M2LaGxOL97wJBdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608905; c=relaxed/simple;
	bh=CJ9gIYeYZHoE4596COL463+Gvok76+6+1PyClt4epLw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IWbIoj6aCRFbGGwNUj8+Q2QpuB8cPAlHFm0VlBIJSUieNgucZCrXU+aofQ0DxEsF5gok6r6vaz2ese7fbc5uekx6ajKcPqp0xLtLdJ/WvK1VTl27iNLNkSTKdJZH6bMVkAP1E3gbsslokRzlBwL9zwZ34UDctzURu5RQaXhasG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vltx7efq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vltx7efq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52caebc6137so1082582e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608903; x=1720213703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmhlTQVKP3bt0jrACs+g3oYCc5nmTL2fJ8oisMAUBwk=;
        b=Vltx7efqHw/zATZz6VbN1qoQO2rArubsKUY0sVTRi6m+tVR3YiZlk/yh91b32eSPp0
         RkNdwzijg2scObS2ZBirRoeM/slluU2EpsqZSTESQjg42aIHo2Ap7WMgqW9iIh4t/cx1
         6Wz7RX5RxBjUxmLFIjFqAXbdZapeLS9lH+2WwSpj1Adxm+x0O7iwfyWfeKVSMd8bH8hw
         yQiep4EnheIA2CzZLn+qcaVPOI5X6CdjQqkkc1zRSgMqNpxyEcq8wA3cVo6xV8ZLy8QV
         dgGD3CaH7DD/YczE6KVbqvEWssZLyV19EvLBKqS36CPwYxm0ajk7u7/Ik2+3zs6/TJEb
         zfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608903; x=1720213703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmhlTQVKP3bt0jrACs+g3oYCc5nmTL2fJ8oisMAUBwk=;
        b=Ytqd4ZgE3k7RN/bSyfk4FzbKmD/DMK3dPHOrmBiy5OnszgdqEXozO8StZvqodc/Jcf
         B+xn0C+XziXyA4PCK1Pw3E0hP/NUwPnTPbBIohkx+SJCcvGNiA1DPsRr8CwDszv+ZTS8
         nkz/OmMXi9EkN5BgumrBNvSUAGzl9SwJneQX6aarpYWYXwcGiGO7H+nGYw1oN9iEhKJI
         ELZJVvdfp0BVz+R5CMg/RxcJqWoL0YHDrSiVgNL+br45bK3FW+QayFVXR6Al0cQmvQ/+
         kCHn3M6L8Gag3AiKrex/AVFlWa41DtqoikNGFbal4E3Sao7CbQP4NUirinr0om6FW6rM
         paAg==
X-Forwarded-Encrypted: i=1; AJvYcCVeZ+TnKIoyDktAgF65cuBsvu0Q4yAQ4PYYnuNJOfXjN4MUex9kdoMjsTYK2DwPiSxzoufJYuetIn+21aysXPKYc6Zf+mzljU//bzU=
X-Gm-Message-State: AOJu0YxNL+FxBcej4h9Nm0TUd9fu1PQDVIua4/9xi6ueoIJBfGJQHaY+
	s8nZ1FlH9XbAfR90VDRmNtpKE0YNKjzMNpHM+/k4QB2g6G+S0tDz
X-Google-Smtp-Source: AGHT+IHPh5XULJ09RYKLkz5YRHePVV5MnL22HsdOUS9qtdmpNP5TPa2vhc8R+fmRFlGZT7a5KXlamQ==
X-Received: by 2002:a05:6512:31d2:b0:52c:e3bd:c708 with SMTP id 2adb3069b0e04-52ce3bdc757mr14024777e87.10.1719608902122;
        Fri, 28 Jun 2024 14:08:22 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af389b3sm51396625e9.1.2024.06.28.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] soc/tegra: Changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:14 +0200
Message-ID: <20240628210818.3627404-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-soc

for you to fetch changes up to cfcd6c46fec46cac3bf6658838d3ea329aff37aa:

  soc/tegra: pmc: Simplify resource lookup (2024-06-27 09:02:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.11-rc1

This is a simple change that condenses two function calls into one in
two places to save some boilerplate.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Simplify resource lookup

 drivers/soc/tegra/pmc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
