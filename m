Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A52AD11
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625277; cv=none; b=oTr9Q5fGeshm3cgxVCcdia9pEgk6Q0rEoOydLWfl1G4Qs4tbavZ1PkA2Hfx9fvNNN+1GqtwZ10AxZUtJ+FQbanFCDxJWJA3ntQRcJW7SZ1XO5Dx9DoTWkQNhoWooggBpaFNiE7/SZk8gxD9LEL1zkZLHA/snEK15iZPkPFEWN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625277; c=relaxed/simple;
	bh=JSthpwSFeIt4qjS3RetjbUcoI5Cc07pvY5ek65QVrc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrUqAvGweYcWHJTLzDTnF96tWdXaBzKhw54i4vGRvhqJJVpxYt0oRUWl0OZaHCzKlRj3VrUAazlL54ObBJClfq/HZpEniSQuMN0YE/n6LSAatUTtQWOmgiW48y8EvJuKy+BVnQSzlypcwMw7/YBZniPayDwEzignhMwjle6BMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AWv458Cb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AWv458Cb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so9532665e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760625275; x=1761230075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8VSC6HDGAFC0rsKl6H0hRnSmQPRXnaQjH3ssPLdIg4=;
        b=AWv458CbmaSFhbVunBi3Qm0QI+eKZoA6tcLWJwVzkC7ecL+SG9sBONWEcIlf3TdU/u
         e1hKQuBDz5TkWmVO8dhJM8wSocP6TbnmuuNM5x86pq3nTjoxgBxmhCfaxeNk2nw5fRrU
         Q21Ake2fpBZFMLkzfolyIFatlNswwkd25+76lLDLWncFGhgxVU2+m7twGsB5AKukpn8t
         uwGLoMvgKo0n2JCmg03JN0NJPVjhHd4EwxP7hu0pC2B1A0qoTa9vBh3toSa+pDZSi/nH
         6OuC5dRUKQTK/eBJ2AgXNgH32kEpWYZ/FEAxlTOBUToDexe2nvP3XWUrJAFZJH+poA0G
         MNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625275; x=1761230075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8VSC6HDGAFC0rsKl6H0hRnSmQPRXnaQjH3ssPLdIg4=;
        b=AdErOalwmPY3L+fkiRt88SY/eA4m+gGGnqbIvP5WJwogOELMZgR7+7Kduqn4Kv1Frq
         wzFdawJ3dOmmddQlrRKowGNqjWQJ5xc+/Bl+bEBxGiDILIyNpgBPgxGDjegfiSY8xsEu
         PbnNAThsDv25GzBQCG5QEI+M5NDfy7Ofyi+6u+0jByk3vViC1N9rKSDlT7HJshImhsVq
         BI12mRtTNYaTMPRMgQN5HitjUDRyURSn0MlDNLT1dKYPavcscuyA0YihgODlSz4Ro5dL
         dHV4d6Qhsddbjlfy6U82y0AgEDQHt/29qwSvC+QWakvXizSdYTwSvrhoYN2JbsIewSjX
         Tj2w==
X-Forwarded-Encrypted: i=1; AJvYcCWHUH8wr9sLGy6FupGfiMta3x3NFU0wERERsw5r8sxtJ/jETctVk1HYfVZ8lzf96j+XfLUnIgMXmnAlKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhNR7/iD2ZV9f703ttojjEwhnaVpcWpHhFrJYA3L4yseRG7TdT
	LOSbzbSu+E94xdPzwvuoBBvFWf6+gjNXtAdJLBPvU8v2oo3vvJP4jyRIBDjT7433RpCmK/aoQ9Z
	nCnrUbTE81Q==
X-Gm-Gg: ASbGncsVcxtcqPisOlDmLOTyWWWPMEvH4uMirL7G3//pdz+t6t+Cuaem7U53Sfk9mZg
	DqL+K9IYnqRqy4HOqGi9c4XDdyC8H+r/V3VmeG57L1yv1fgvB9/15LZVnJQ8u3DXOE4JCzg08jQ
	PkALugTQIf6qtNFs9zuz94+i24LZwpUmsf0EQaFjnuyJC9HDtHtTuEetk4Mk7X3Fw9yjjoV8Yhm
	MOIJjp9bWIJUqoOcRIJm2ti+8+0G+pg4V0sdNkN9AYLPDIkQyvIjsvM5Q2ilBCC9/2UAFbLSnTM
	37T1N2yo9Q+h0BdSF5HB7c5hHfCJpTLwo2jCZRsBxckVaPZHGsSw2GlBK6+zwXqLClkSEw7yHAJ
	+AAhx2ds3cEJiEhWoEq5jYliS9dCqILEUTAWJUZT4vBI2IvLBBGsh/2K5y6ECXeZkoj4UIzhqaq
	fZ
X-Google-Smtp-Source: AGHT+IEusEzaVicmxlY/Bc63Mh+VhAak/hlhi5KMymhMgpxHo61SLm5W0znXGnRmWrEOUVcPV6djjw==
X-Received: by 2002:a05:600c:548c:b0:46f:b42e:e39f with SMTP id 5b1f17b1804b1-4711791d96cmr1368045e9.40.1760625274796;
        Thu, 16 Oct 2025 07:34:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e10e8sm35163314f8f.39.2025.10.16.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:34:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/2] gpio: tegra186: Use generic macro for port definitions
Date: Thu, 16 Oct 2025 16:34:31 +0200
Message-ID: <176062526760.121245.6881501236201475416.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010101331.712553-1-kkartik@nvidia.com>
References: <20251010101331.712553-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 10 Oct 2025 15:43:30 +0530, Kartik Rajput wrote:
> Introduce a generic macro TEGRA_GPIO_PORT to define SoC specific
> ports macros. This simplifies the code and avoids unnecessary
> duplication.
> 
> 

Applied, thanks!

[1/2] gpio: tegra186: Use generic macro for port definitions
      https://git.kernel.org/brgl/linux/c/f75db6f7f907c10bf4d45a6cfdae03bb1b631841
[2/2] gpio: tegra186: Add support for Tegra410
      https://git.kernel.org/brgl/linux/c/9631a10083d843b57b371d406235e2f2a3e49285

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
