Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D11B6D11
	for <linux-tegra@vger.kernel.org>; Wed, 14 May 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236684; cv=none; b=JR4HzqytSBpT+2tfkPqQKZC/BWGWZVLRn63oNRvKHtbPx1kbtxsezlGXj/mqnsZNuSk6aGmEQwHZhcnkfw93oSRgyWz7rbwvgCx2VoPYj8U/t110YEY+7UJQ51W1Hdch9B5KZiJsy1CDpiaSnAvIEQaK3KomdWmGYoOU5xUzurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236684; c=relaxed/simple;
	bh=Z1sxsE8kXcUhyoj0n/3eQWxMrwrp8xETdMTl6tZn0Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTR3imDeEAcufsXyFPVVgjerRx+nQ9jb4KsXEulKvrXQr9VbZmRnsugaHViOHxCZU2sSutrtfu3iRo3SaJg8euB6UbP01U52Sr82ou7FrJ6xZNserlPib3Pd+VwlaDJ1ELkmFd/9WnK+AV97nC9KOu/PbohKLFyB9fTrV1vTK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NjIA3K4c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NjIA3K4c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso49257735e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 May 2025 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747236680; x=1747841480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGR4+1BG0FD7hF4WA19BAUgiyzmgLYBs/GSczEJQxEg=;
        b=NjIA3K4c9L0i4et5fKAejFpL9vC3TkQOgER2Q40rHyEPU7b6pp2EIPBjR9PSvmMUZY
         YDnH0mqEpPSEuECdChDLwK6uf0r5onaoNOZUM821+M6ZcVpaPrAw7tHF8kJfK5W36QXe
         PV5bhm96SyQbmG/OaxhRxDYQtHeZ+k9/GvI1BEyI2yYTeY851tmNgOm3hrQjWvk8RjVr
         gKK8xbWstPGRl6XIsBdsB9BAMg2VzAjNKBuGocQulbBLCcsTg60ocAVKusWcSNTrgg60
         sjnRZ2eGFcDyqpplV73xEw24ezGW1GeXB3GIc8sSseGQvTw59C9eds5Os1ZVMLVfnSv4
         ymuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236680; x=1747841480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGR4+1BG0FD7hF4WA19BAUgiyzmgLYBs/GSczEJQxEg=;
        b=xUPFoV5dzOWHeuWx2C7IG173FRKObl8XIscf6XhJbx8uJVHZtb2GJN5B7TeBeD5MnZ
         FxlIZX60AJHNJC1YPoVnoqZl6lD8lbz93UcSRkYPJxrC3828gMTTEtlFhftmG/FF7INI
         TV9rg98NU0Cc1272+Hya+1igWSK8Kp7sRNJ6Ru+xbokhvatYhjbtrEiF93Q4RJvE5WLl
         uCxEHITavR6TdtICucp48+jHwMw3zIbR0ohcVUz5h55b6VAfnJAaZF86JwIC+wXa7pDQ
         ck0Nz7XlXXzBX7GeqUJGVBNfLFJSrMww16HwtTRgqEa3eFnTgkGGl4mTMb8icY8EWBk5
         BYcw==
X-Forwarded-Encrypted: i=1; AJvYcCUWfk4+Xit/DSeueypa7ZQsoYWI2efo70zg1/h/i9mh98DNF3cj/Ik9ZgkJ8ng+zgHFGGPYkaPpZbmezg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQkC1UI7hKAtdnNL/tVQ79Ee7t6Quoe19A4h7dLjgceyAQuMg
	GOFqnVld4yXi3QzkR57bWK5YAVZCdMEu0+8Z856u5s13t459QCtQQZDQudLVGDM=
X-Gm-Gg: ASbGnctPD0RNU1Vw9t9peSx5iCGf7u1MdcXjvEK6uFgQwCDlHVX6eEFBbkfYDmGkpKb
	WVQgpvuMZ7L37LVzpnq6W2Bvl3WCbx7wTxM+sl1fRIWjy/C6eyaoBVXIPANWuyoBMsBrP+oOX2D
	sF75FmR5xH3n33POi7/v6EpNCsa14NGM3vtYKsgUpLz4NgvbQeYK182KFGz5crmf+bjXcmH82o7
	nvbrYGMUEsv/MoFYdC3IwY19a52VRBsmVOpyu8S5BIGZRFeD8ZfaXjjywxzajJPWX26nKiteYf9
	d0yXY45mhEVMN9RpPAeCFkPLAce4uYAbI/qkM5vKHx4BA4uxNVsoigBiEH93uJYygragx3VcZqc
	Aloumce5DLjayyGP1gUbvcVbX
X-Google-Smtp-Source: AGHT+IHOvVPhpwSb7mTZDJYjwkd9um7VINSJBr3N9zogJFPLlegS2njAEUaLrSQ74A/tb/6r6JJrbw==
X-Received: by 2002:a05:600c:1c9e:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-442f216c175mr31299005e9.27.1747236680160;
        Wed, 14 May 2025 08:31:20 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db3bsm32975415e9.9.2025.05.14.08.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:31:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
Date: Wed, 14 May 2025 17:31:17 +0200
Message-ID: <174723666619.14309.2874778168838879633.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 29 Apr 2025 16:33:29 -0500, Aaron Kling wrote:
> This series adds support for Tegra186 pin control, based on a downstream
> driver, updated to match the existing Tegra194 driver.
> 
> 

Applied, thanks!

[2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
      https://git.kernel.org/brgl/linux/c/1275c70c4c1ca764cbf9ced01fb4286e4f49747e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
