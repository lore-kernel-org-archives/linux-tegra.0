Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917FC15D5BB
	for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713965557; cv=none; b=usTKoz/i9kiHwmubncHjsKjfCNiNXg7kyswdd1gGwytdc65krssby05RjhzOM6JGtUEOIFKXLtgPjyNfWW+gE5i6/kKPq/C/rW4qO53K5kcu1Le7+JDGv7GZeM2xsUCQPiMc0waUyrpBNBU+nsZ1phJrcXJeqxu8oyLjYqOyaFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713965557; c=relaxed/simple;
	bh=sqIFK4Ke/iibSqSzQ2BwQLyPnh2uu6n9SbHcTFTF+/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YphXOo4mMrVoJnofSmVrC4L10GgtEo/zWMqG6/dUy4fVb4KJlblOF4O131EUmz9qCgQGHfA2mb8ttkb/dEt/NttAwKX4TIqW9Y/whpsxEyCzO5Hbn4AeXCl+Txm6NxKpZpXWqT2oOS7Y7L5XmKISxYVOqOTvj4YNKdHDKLmwbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=crWrIenO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="crWrIenO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b21ed1985so1787385e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713965554; x=1714570354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON7DRK4o1QQEG6zMRrSA5yFg2l3FUOQ+KbU0jTc3aC0=;
        b=crWrIenOl8wTB724qL6vZoQtJs2o57vqHDpgA8aQeWzcftmmw9mEh/jXiT6RtyMYzD
         I1lFgBAchRxDl4+a1PLWGotEisXG/Oc4CDVXlkWiEbpIK9AB1lCT/LG+at2OiQZZFDTO
         9ysiYW5gthum06Cjs1Ov43iF6lLyWo3Nb/rSTlrnln8UcSMMZjpl8ODyuMXld8kwS1mK
         2chWUnUAIeSaXp94jRzZDMn6Vht3bO5l3IY/65dH664NJLWMbwHkbx0zDBCDbu47mtwp
         zm9+VgcOvqxAnpSLoqNIHNpRcfH8zF+7u79D+JnWv8b/s48xCBb1BRwvCJ55x+i76Bxl
         32/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965554; x=1714570354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON7DRK4o1QQEG6zMRrSA5yFg2l3FUOQ+KbU0jTc3aC0=;
        b=oF9uT8gReeDc89tu9iqC7rOYhaGm/kARLPvyVk/KQrKCezl/Lql7qbB94SZbo8D9Bg
         Ox4FUJsltNzjqfsvQiC/SA7rp3FFHmflBGeJz6iriJ831+FhRbqIhdiR3ruduMC5UPVK
         wbymunWjWlQb72E68JmdVDINFfB3e0vNtEMLcuAytU7pVspXz6TKdqYRT+5r2RKlvjxS
         B9h8MLcI78JZ37Dm0tL7SQDFk6Pqn6kemtcCMnShNb3TLr4IoinvNBTvQztIgwtbKLkB
         f/9DGC3nXfD8oHdl96rCONu4jyeXvlqAK2Kz8dcyIHRKH/nxWSuuEjshSBxnD83+uoRC
         DEgg==
X-Forwarded-Encrypted: i=1; AJvYcCVoufT3a+y0l4L+9wCQToVdOFu8QSIS2H7PeZ0X4HXnw8rMKcHRC2BGlLLJWzJGH5wsotzMcueeHnDu9KkvOvgIdV/7Ny155Q3OC1Y=
X-Gm-Message-State: AOJu0Yx4/r7A5emmqrPzqKaUT2kfhc6KEqSkxFF3EoaN6Ra8I8Zusy8e
	Y61y0569FC3wl9nLWvaVWEAFZugdVBNA2OwZu8dQvmLraSNzKyuphbwYBunvUNI=
X-Google-Smtp-Source: AGHT+IFt5k+u0qlhoBUYdAEe0Bqa4xVeIXq/GvItIj5LfRSsXjv3ukTNbIY3sE/Ec8osEpb2ZDqjGw==
X-Received: by 2002:a05:600c:1da7:b0:41b:24c0:aec5 with SMTP id p39-20020a05600c1da700b0041b24c0aec5mr297122wms.13.1713965553846;
        Wed, 24 Apr 2024 06:32:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:da66:dc78:acc5:bb9c])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b0041aea85be32sm3343941wms.22.2024.04.24.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:32:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jonathanh@nvidia.com,
	treding@nvidia.com,
	sfr@canb.auug.org.au,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	mochs@nvidia.com,
	csoto@nvidia.com,
	jamien@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v3] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
Date: Wed, 24 Apr 2024 15:32:32 +0200
Message-Id: <171396554137.82284.11131075774933207943.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424095514.24397-1-pshete@nvidia.com>
References: <CAMRc=MfJokORpEOMkOmQdzTuZxcUAcnmpdEyJWKqvT0gCpuzbg@mail.gmail.com> <20240424095514.24397-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 24 Apr 2024 15:25:14 +0530, Prathamesh Shete wrote:
> The controller has several register bits describing access control
> information for a given GPIO pin. When SCR_SEC_[R|W]EN is unset, it
> means we have full read/write access to all the registers for given GPIO
> pin. When SCR_SEC[R|W]EN is set, it means we need to further check the
> accompanying SCR_SEC_G1[R|W] bit to determine read/write access to all
> the registers for given GPIO pin.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
      commit: d806f474a9a7993648a2c70642ee129316d8deff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
