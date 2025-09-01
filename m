Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15523ED5E
	for <linux-tegra@vger.kernel.org>; Mon,  1 Sep 2025 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756714865; cv=none; b=QgsGw4O9gNicPls72Mdg0vcT/9NCobcnSx0TesTnpCmb7zWKKSnJKPIazFfJeG6ro0XtsJOltgjaxWNJmQyk5O9RC7/oexAkOIdAvvYo35QAbcHSBxcIqqr3Tk2PEUWw7ROlpUOSRy31j/7AQZRQtJY1DW/ZWVFQLzZ+3Y/9qzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756714865; c=relaxed/simple;
	bh=Ey5r5LzZ5mqJQFa5/hwzZOTkBASnqgBYv8P5zjbafME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6yi3cJk2CrVk2mWsMQM54dxpwq6VbC2MNYjHSfaMKBlNGblk6xzbkiCLA5VRuV3+xWsdW41XulxyOqTlkkt8ijmydmRMFEaVvvcCERsO/4COIiuVMyD/LWxlCG5Bg3RGOjULPClj5oeli3f1Og6TmeydkNwaNaLIyrTo5+Vuk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f/CcCz6N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f/CcCz6N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso9604935e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 01 Sep 2025 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756714860; x=1757319660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDXy5RfngT3BXReqDhGp/CaxOwU22Ty4Zht0U5yrbxs=;
        b=f/CcCz6NIx8iSV6esOMPK1nz8CnQddf2Wi1Q0gtBUAVp/QJ9ZAiS5hi0IwQWeDS9iK
         VP6rtGEs033pEnlCozwntYiiCzRaq8lQrD4hm67MEg+Lk35Bm9EWi00QB5hLPYCMKwJb
         cuuHGUWsy2pNcj+/4MFKuhkqG8Y/JNcyz6JQF3vW8J3HOjMX6PN+V9CWIarquHLdn8bD
         Dcs6hVDV+jBeT0qgWaAsfDL9c6oeFTx9PW0px3feQ6H2EcAcS+8ZcU94KMIAVrNMecXe
         1YVBsomdGnB2LJKo0iZRcC7zZy+I8VSP395+xDLIU0BQ6Kx9bIiRvyk74EPKVf8YV8+W
         kjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714860; x=1757319660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDXy5RfngT3BXReqDhGp/CaxOwU22Ty4Zht0U5yrbxs=;
        b=EPXM315/YcElyGRmW7JeViGL1uyQJ2hwKG2l042VZC+jE4Zzhsq8mMrHQYF/Motmpf
         bVvFCW6HnH5dlKQKlAA7nCPfaUtXJQs7NIpEziYLuu0Mz2swtuq99OOB1moK+ZCvEZq6
         SCSi+FXd03xyA9oTrnbYkNbq5//6DyI3WdNOBNMqZUZzzA3W1Zkq72xEQCS18xBP7BGI
         NkFmrcw16n8+kPjQS8vfsgUy1y0Pf2xuJnbSBzUD/wLdpB0acmpoy+hvKT4eXOOn4fub
         BgVsOlPw+xFTScM03Ec4XBdbrhUyH9zWneOSw+cSZQrz9nowYeyyffMeADCwnvdX/XIP
         +xpg==
X-Forwarded-Encrypted: i=1; AJvYcCVlXif+wqtTmzL3qbryKNswXDL3Px7r0fSnxdbuMBywIfI/ip3J8TqvljBJE8CtLDLJqlKTbAwRasuNDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwVd56ZHA3Kk9QQaODZh62xaMnGjceSBRkpcYbOu02YxPiUe7
	hBdjdsJJJivqnhp49wJWBLL9G1cK4HsoTiBI0mErddShwHBTzgxOGskFkTOq2EVm31M=
X-Gm-Gg: ASbGncu9auIGW2sO3RUg0xgscq1FprjpZ0ta6wWAt7Ow47+b57DbSmZyBpPLPSpwkUf
	mXPYxIJTV3GDnfCbUIvC3+4fkKUGGFLxZhQJDy+Cgkdisrma5kY6vGoJvRd8L6vaYwpYIPqUgO8
	bsuekNDsq3g38Xp2XN9r52h8pdQb8Deu93yokTvy5JVEYsGy33oUZ9OUXFBRoffY6UucOQEgdJP
	fW7e+1dgcMTK9mY1Jwt80gAD1YETzDaCw3hDv/Xg6+Ma9Jv6hDcQ7C2wvop6kkeflCK53suPXJL
	ZhkdLs75pjtUM8JlN7jBvLgDS4OfmVAtTKNswl/NHxmeenMmMenfPozTyAzW9z4eY9obkJmfpfT
	fY6i+1WkP9EWErwMvIjxTLoO3omPRB3iHdpgH2I5bVRYg
X-Google-Smtp-Source: AGHT+IGofJVjCphxVAkG9bd6t3NPeX+I5lacWK7xENnvALEAJUtz7D2qJ/sUSwpC4SDSpnSpZ8DDsw==
X-Received: by 2002:a05:600c:35ca:b0:45b:87a6:cdb with SMTP id 5b1f17b1804b1-45b87a60f9amr44731385e9.14.1756714860306;
        Mon, 01 Sep 2025 01:21:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fab9:fd92:e2cb:ddcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm145166475e9.12.2025.09.01.01.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:20:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Date: Mon,  1 Sep 2025 10:20:58 +0200
Message-ID: <175671485425.37050.14912737741264685322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250823055420.24664-1-pshete@nvidia.com>
References: <20250823055420.24664-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 23 Aug 2025 11:24:19 +0530, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra256. The number of pins is
> slightly different, but the programming model remains the same
> 
> Add a new header, include/dt-bindings/gpio/tegra256-gpio.h,
> that defines port IDs as well as the TEGRA256_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin. The OS can reconstruct the port ID and pin from
> these values to determine the register region for the corresponding
> GPIO. However, the OS does not use the macro definitions in this file.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Tegra256 support
      https://git.kernel.org/brgl/linux/c/eef6dcbc52fa83c392a2f4a52845f347b233a584
[2/2] gpio: tegra186: Add support for Tegra256
      https://git.kernel.org/brgl/linux/c/db12ee08726e55c8a1a70c2308f98d121d96edc6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
