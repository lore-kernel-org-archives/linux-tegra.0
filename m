Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7124DFE7
	for <linux-tegra@vger.kernel.org>; Thu,  3 Apr 2025 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682188; cv=none; b=euNfOtbTGF9uwlNE/QKZlu2nMx6po6AxUgSliREFKPHR34QHpIsciv8QvxocajS4Ux6Ejg/4BwaxibNbrOKeehSF2j053pxQzzla+46Yn5GCAkCIboPjzMTcRC6dBKGp43W+NzNE2jbpQcyJmUeLr5kwqwrNBjo4Ff4vZCPq7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682188; c=relaxed/simple;
	bh=u+QydgONUJr0Pgq4GMp0nMeH0yflfwhSQuo2N5MBQqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9sHZDP7WJmu4+tbjtgjoOJ/dI+HLSwmj6t9pL5UBAO+jMMCN1Zl4i/nyx9akKMgwRw4wl5YSDFKnSVuzYCpdKYq0EjlFgNqnnxD8I4ZDPVfeOkXpk2Tfcc7+ZmPPpp8L5uJZfWOJulj3KtuRCIuV3XeFutlXaKW6wqgGrL01x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hlx9jNGy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hlx9jNGy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so529826f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Apr 2025 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743682185; x=1744286985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hptSX/e+wVcPnTsnjXvYnqoZa1uA7tV0UWABvKf2BA=;
        b=hlx9jNGynCImd2KKgJHBNCuPCyW3lRGVtaENcGAaCTqmUZ3ADvO2ro2HV3xC5AeJQ7
         vtZNsEsqghC0yu4e815V9gEwNr1YfDnLXOe6MTQOIstxENYBmsfeCFE2xpk24po/TtAb
         MggZ9+V0LogV4ZW5AfW0s7GV3CpQ+uutK6r8/p62/CejMyM2cLuZc9UttQtlWtrwMxxE
         8wtaaf8vZ6hLB5cPQe50xWcTAe9VPir/cU4H9ytPeTgr/wf36wsfw3eVw+UeMBD3fosd
         +yVmQMi3KVKOX5/qzd2x04FttcVtOhRKp3lV5BfEfTGAkpxKBaGUOED33J3v7JOLLJe5
         FCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682185; x=1744286985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hptSX/e+wVcPnTsnjXvYnqoZa1uA7tV0UWABvKf2BA=;
        b=BLZQwdrwtFzbEWO1KhJwIGRKInCA353/EpinsEFq/B5KOvZp7b7VshEut6050WHmt9
         m4ZbJUDx9z4YA1LqeILT8PTWq6OjbTvgOF8fuRvKbGsq4FK0fA7bKTMwNpAUhTTrqcRU
         Ade22r8G197X/2aVkJYCA3jfJsnoKS87HB/TuIbsNq5qVI/O35gDqUgfko3/2cBd3hMA
         LNuRxxqy0MBX1Q3JsrvsVaY+OPjxtNgwO0IgzO6X/BjAtfiV9U8bU2opC2Q1wE8mG1Uh
         FHf2ZD3EKK40chi0mmHlHugB2nELFGynJu0tydGVnld7GIiDcwpOh7cWNR5CJRq9e9CA
         wdow==
X-Forwarded-Encrypted: i=1; AJvYcCUg2fm4ZcVpCHdtBrVKZFxpwngM3UoZ9hzg1tb3DXHIrLvEbOChvK28JREYW5lCyU2bV8MQ70IJkjxkKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbEy41NQtD5RM739JMpsnPybCoiiktYXrLy34IyqFUTfbnMlW
	HPjwBiTYgM7zCQ6hkcY0ZVApZ+P6J19nHwZlqZrVgBteAVrZMd4zJbuTKWpj6hY=
X-Gm-Gg: ASbGncvLRiwoMj2aciaXUOaY3fvSyG61PJDpa99Vi+4+8jap9C1Zix5KJOH7CIvXBPY
	GYuZimwrMERLtUpyxsXqrmDwyusNqToWUBikjm/ukusHZQV6ohrsMBoo/nfSp4dJeoaBHuKqp/W
	BuTXu9iixYbH/QujQPZq7g8MeAS7se5WZdzJBv+MK4/3lSn2A0Y3zARJyvv55fk0SBsPTeGANkS
	yS8QUpDJwDsXQbBj11SreBCgBGuHYYm1ZFKK0YazeKrVuxCtMbQ3s6WIUhsCncMOxgcGh0l8rCa
	ZoAqok1hnOrZGsPrly76HBoFcoecmbck/fRAlbAc2zI=
X-Google-Smtp-Source: AGHT+IHLLUD7pDwTg6uhsblFpe0xvqHhHyMGzPKJ/KkeiJ9ysFXJkpnNXvqJTXR+YplK0GjxarW+sw==
X-Received: by 2002:a05:6000:2a81:b0:39c:30d8:a80 with SMTP id ffacd0b85a97d-39c30d80e4emr1264559f8f.19.1743682184983;
        Thu, 03 Apr 2025 05:09:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:298f:3031:1c99:fc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663046sm20599155e9.13.2025.04.03.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:09:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Guixin Liu <kanie@linux.alibaba.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: tegra186: fix resource handling in ACPI probe path
Date: Thu,  3 Apr 2025 14:09:41 +0200
Message-ID: <174368218005.27851.1117630791127381361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327032349.78809-1-kanie@linux.alibaba.com>
References: <20250327032349.78809-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Mar 2025 11:23:49 +0800, Guixin Liu wrote:
> When the Tegra186 GPIO controller is probed through ACPI matching,
> the driver emits two error messages during probing:
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
> 
> Fix this by getting resource first and then do the ioremap.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: fix resource handling in ACPI probe path
      commit: 380c913737edb4ec03974f653feee6cbfbb7e013

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
