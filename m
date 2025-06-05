Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A21E5B95
	for <linux-tegra@vger.kernel.org>; Thu,  5 Jun 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129591; cv=none; b=dg7bGoQw7cAvSc8Ad2SRwv/YJT0xHJuTZBh1fciEeqLzpVO89c4MUtb/aMfT13yGbQUaXk1h2KcWEKjUfTbaaiei7RDD+EuSgHoM2rnx908WEpAiq1thWpKahQKYuvpKSIbInsI7l31tVsj4au0KNVZK2s5iHtqNf44uY4CM8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129591; c=relaxed/simple;
	bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut11OcvBzzR8kTI/CsK8LlR8Quwwf3p3eSU0SRh9zJ1JSNgM2RqdLoyCZe4h37M8Hk/1DiuoYhUPYLyoT3StanYAjjJldmbjTO3JSbx172M2+mmWlevz8C8OqiG+T4qaTgtltAU3utoWIdAnyBIWczukxnm9Aldj/SejG91v298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIw4aSdu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIw4aSdu"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5532a30ac41so1099901e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Jun 2025 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129588; x=1749734388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=GIw4aSduJaHRZqHhbhmNcIhOuzisxSXLzMTlkl6S7WAJVWCCuSNGNr9gZNLvaoCVss
         OXV9R5LqviINNmIXXP61p5qU2CoMjRZwHQj4MqqoZG2XenzkMb8AaECym/XCYtBueNpu
         loPECGK7Xeqfz+zzaRRvbS7HIKc69uwG6xMa1r8EbOW2uIpdLSk/kO6pnn6m5Aaq+7p3
         dRTtxrHVn01scW0VYgnqPYoxRz77DyWQDwaiYZ/eYpL5LqVCq9/oMKfxInfb73abWJq2
         eLl6t7NLk2gbsebTtgbZ7MEc22+EyzhpLtDbfdVTEisovqPxQRvXyKcqzSRF9MKzk60c
         5bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129588; x=1749734388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=TXHA87I3/AdqNjjSEXinSVYpQHBa+MD6PpsB4YRSzJsd3TQeN1zEqLhtf47VNuqeP/
         q0aiqNo+w81O8yPI3KD/5rNTT6Jl7zJP01g2ZwVCIokffHYHg1n1XtEnKjXgCw0Y+DKh
         zC27vQBV7IwipQnRtQXBIKVG3ZSVjb22YQ2QF77ZgJ/tzZfNE8JTbBL67nfGsAtP3anO
         ZMlwhtVpx86A8n7jrVVoV8sLROa5g6ZdP94k9R6nH5GpQYRY0n1Q2GRAYuzfZzzO/7S9
         hA6N1aRdSodHi5l5DbNeBpreBZdTi4mF4a9SlsKF1llmuBehJxXtJTecPYzg3k/gUb2h
         zU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVS4pJ5Xsq8K6+RiqpJ2I2HaSYuJQV1T2HrpJrEZGYUp3lp2r0X1LCJRqYVwONHWcdzIr+8J5ewpZxeYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOxfo3LuvWTxh+zry8u8BM6pewo6GxJUxMH2Am9GiaGtz8d4g
	KYzkPL5bYQT4dUfFZ/6T7SPb++xcXMW/W+mOmZQ5FUmaCyWbLu3oBqSQ9StMqcEDfPqaxCbHmC7
	PXYWPw/rOusFUIqIzDb7Z/QAbs9Cyn9E3mX1RvEE0ew==
X-Gm-Gg: ASbGncs6tkR9cNSb4DC2oR+ISLBsVeOaM8KlzXSnCScxKGZazLRSnCS/vrFOHJqYd/t
	EMnO2xKP2vvwkno37VJzP8oy6VrVMkHRoa0hf0w1Rezy4W5xgv+LzdsZFNTIZsi0fyp+US2HUDD
	8enT1bPRQukav5BxDIsLvWRWRfBHUPUIdh
X-Google-Smtp-Source: AGHT+IHwUg8EOutUqp3GD21CE8boOlewudk+gIWQR9a77PpxijELTwnpqH+LGR5idjK89e9n3Wb11FOM+mCZanmNr04=
X-Received: by 2002:a05:6512:224c:b0:553:29a6:3398 with SMTP id
 2adb3069b0e04-55357bd6ee1mr1908588e87.55.1749129587841; Thu, 05 Jun 2025
 06:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com> <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
In-Reply-To: <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:19:36 +0200
X-Gm-Features: AX0GCFsdxa_RA3yrubFbUtjyotAsDp7hdaFyuBIGBs0nGmLZ3CxnTUhX5K5TYXs
Message-ID: <CACRpkdb6Qaa_0wahFLG4o7-3gBGAzdKDMVb=ohgiN20dKbrNTw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> Friendly reminder about this series.

Can you rebase it on v6.16-rc1 as it comes out next monday and resend?

I will apply it if noone replies with review comments quickly because no
way you should have to wait so long for reviews.

Yours,
Linus Walleij
