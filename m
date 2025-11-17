Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15CC2D0637
	for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373886; cv=none; b=A+rvG088HOOpj5UH2qJlKMQdZr6dy1IJf8ITPQSFVMEIYGvceZNo2+KRQbSp15qskOxpY+Ge8TD8xteZWur55Jc8AfketZIWbHU80dJbazJCWS2QAzvYqIwhhRiFLWgANLie1OLSxp2yct8i2UpnltmsC460zkBZu3NwuOMvr+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373886; c=relaxed/simple;
	bh=sUxmmzik30RUcJHcl9Mo4hULyONy8x0tMDjjLb2v6C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0Yh5ItvBtUWFUWxUKp+Wy2zpslVpeFOixjN5gtEFgz0W+SJkKKmrrlOalWy3VrGWd1oizo2QbHZ8STeuK5V4GrPkXnEGh2ULdZFjpsb9KZBQxo87CpI4ZJI5MGzUKRqbxCCCIl7qwb/BwhJFE98MX72RQ29tAABWCD1xcmw3nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TONqugph; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TONqugph"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477632d45c9so29791315e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373883; x=1763978683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxG2t0oNB06OR4tbCXZ9UBNqKtz6tpbcQaLbdfquq/0=;
        b=TONqugph1RKNL3Ve/p+ZFUpSu/9q8XpeFsSlezj7UU0C1/6yD9cMGOTp33zv1RChHJ
         6atXoaJKOtZlhbnz5B/BH7bsVag3BnBxb/Dq49kdWyA2YOwUg7uqhKDUrOhbw7yCI9/8
         GxLCzHlKjNRnq5RfnqAbX6hIR4IEDTHsYOS+55rzfthVY+HaHYUIyo0YFmgobISZ4QOb
         a4NleMMPjeDVDGF8xyq143dwsDUg71jw0xM1dPG8Crvg/n4CiZkNTmsYw+tw8j8VnC0+
         soT4NGApBEkXuerxS+Sjdu5hNvw3zJh5afmydLctuQae4vHonO2dSIehiCkDnnNmICO1
         PXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373883; x=1763978683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KxG2t0oNB06OR4tbCXZ9UBNqKtz6tpbcQaLbdfquq/0=;
        b=ZyF8iIe0uMick8EpQuY+x08DOQDnZdy1CWQ+UC3zGicP84QwdHU59uOgLYyqw2EI37
         qH3qNCn5T54jjVPwl0GFwyQ3pmO008mzViCwJtxfIZD+7RVBt5oXqO64H4PwgBIPIyMa
         Gt0NmpaLVnF60Cn4i5SfQ1fWiM7H/KTAycnFUUAcwM+JHDjvC91u4gm3w13lL2zLaPeU
         dOuLft5DJipeOQYU1qcY2cmVeQ0FXngzwTsuFV0qDCikzxI+p2stFYxHOhIMxXF74ai5
         o9KXl70YHfOpiGpGbZdNz62ToN5SHbM8AJNOU4+zAlfCkAP/mFPY+mis0M6h9WXc1PuG
         Mwmw==
X-Forwarded-Encrypted: i=1; AJvYcCU1zf6xOLUXj/MT7Y2+GKPRUL5S40Sx6kKS4ITyD8BMBb1XFwsb0FYCKEbpbNfx4HkLlIJAviPXPU6cZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzffbUtRdcEHJXQOIw4xhtJfBdBvuFqUjCTTz5dtWLj5yZY95xQ
	edU+TfsyIigVjK5M1MePN/wFSctuGlZ42J+ko2AWCyeZEbTv/3mLQsqdUS8IBykMIOg=
X-Gm-Gg: ASbGncthHfM7/RSUmPeV0OvK+6ydIS5a0W1s4qLCsz8H1q63vRmgmSohXTnSvfpBLkd
	9PXo5fx6ZJct5t5wpRSM3YAruQ8C41FT/a7YBCQ8zAfuny0H/lunQbiM9551Gong8pc4S8cLbQo
	AufHR2bf7qXUMMMPI0LrlnBB5r1IWBuQDJ0jXD9oJpHko9YrTWb/4ki9pEQwFldgZCdfR8BGEDD
	CHTp7IzZpSoTwPo60dP2NTc3IutQh61m1xG7u27EsqM/iwgysqjB2Aj+Dx7aD0QEYVCMWV1KGqc
	Nij58wwPpC/u+irJhh2vq/g+khl05whYcoKIKZEiiru/BZ1mjRWK+1zQ3a0RGWSZtMczQlw7Ry9
	sugBAosYJpn5q01O6DLIx8Rra1VY+lPxmhCVsuWbss1D+vjPZonRTjVlel0iqIQXcrT3KIJOmuS
	+pwS4jXQ==
X-Google-Smtp-Source: AGHT+IH/GibFf1d+NbVobGQY65ToMbd2bGVauIWkeIisTvOKj7Ak9NWrwOzW1UWBaZyb/D/8GOyk6Q==
X-Received: by 2002:a05:600c:4707:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-4779eb89abfmr45551905e9.8.1763373882926;
        Mon, 17 Nov 2025 02:04:42 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm294011395e9.14.2025.11.17.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:04:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	pshete@nvidia.com,
	nhartman@nvidia.com,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
Date: Mon, 17 Nov 2025 11:04:41 +0100
Message-ID: <176337387783.48125.16535438263488945711.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113163112.885900-1-kkartik@nvidia.com>
References: <20251113163112.885900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Nov 2025 22:01:12 +0530, Kartik Rajput wrote:
> On Tegra410, Compute and System GPIOs have same port names. This
> results in the same GPIO names for both Compute and System GPIOs
> during initialization in `tegra186_gpio_probe()`, which results in
> following warnings:
> 
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.01'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.02'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.01'
>   ...
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Fix GPIO name collisions for Tegra410
      https://git.kernel.org/brgl/linux/c/67f9b828d4e5e47caf3472a399c25c3c0ddc824a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
