Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8E33A038
	for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171241; cv=none; b=V/T4kN86lzOhl/Jl5bG2m9qAXZdQZqyn9IXAXn5+taTKv+umc0Rb4YK5I+mrchTmD5/DIRxUZJjCSPcibvnf1UmHpsvn7sb3i+edb52IVHkUMQ2KjN4QhhCpwwrppMuOkllFcNfcePBQpIGrcPIFgCwC6l5CEV63va7y9UukOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171241; c=relaxed/simple;
	bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOzAmU4B9eoiCxOkUOv7L5jmxNw4SjgBiK9ZP0rQBHcimxoSlGSOhUtnXEhlnwkxRMxYmlQ2elL/2dSMiLHRkdWABJd7icw31qjZoVPYv+/KzbzbFJVkqrfs/7N1DOpWgiw44pBuL5AOh1iNVZ9UKyZjeOGQQzVcMZf8WMcDTOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ekc7Rb5Z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ekc7Rb5Z"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b935df7bfso61885871fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764171237; x=1764776037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=ekc7Rb5ZoFqTdcd8CvsNN//6f6eriL7DrECX0IiUsuK8YcaAvtT/hlYyxGWhDnHEGV
         4waqkwmnQTetpoStQmgmxfz2PY4+LDpNfd2HFPL/zkFlWsFIa4eSXDku1caNf5kUa3lI
         Hc+Ex2cEXgMUCVrupcDM90b3RVDJGa+D6hcCxReTzL7osTYd8fcjq9yyE5qfKvxYF/up
         fVqdA9xKPKo1AFPP/FmRS80LaW9piOWyNXDmEHRLGQTpW7kD87PZJ/6UWp2BL0H2y+y+
         rj+lFOJ/vZ45iVnXIyQzdt5FUYoo7BDFfg8Gycp1WilvRpycRH1DSdXParqa4+oH/9ZE
         RBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171237; x=1764776037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=MxpLDMd65HPbacSoZcei8iChvhRANZMZJb6ey42htPXT8xJ5K5L6OS75FbE/FYaYHR
         2ruO4VK7gx3HTzDLCDfBfWzRDh6ZXIpB1MJc1U9sYYnKW05E7uXVJZet8CaLB4bNhCNF
         DSO6h6S6NR1VLpMSk8ldz2omFD4aL/Ni5pTZl0MpW0sNg5e4eoQ8fXD4QJah2FYYOMs8
         lP29xmj6qmJuInMTxyGoZwWarKMffCvW0Nu5Ew0UO/xp6cv1p4E6ZmHKrLynAogs8WDy
         0/LCW28izpH5Ebvu+5tbXX9aeGhGrIt/1oCwvhUlvWIjnlIqpkYyYP0BgsvxUnjvyRYh
         W1ig==
X-Forwarded-Encrypted: i=1; AJvYcCX7yF0Hsio4kzhV3q5Rfpp21tuijmsGu/Hf2z5Pmy50Taf1Z8heei42JO+mvKo2O4ad1j+1GE9PWEkmOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJjAeTU5GYIjba9lqM/I4uEL2ntRHlgfLjdk3UiODkEDiaata
	wGPN6RcFaKr3EZFiaGvK+oDHjppn1LJI082lmhTL3IAkO6wr80QOYDBH623ZOjjaZmpUpSsyYkB
	5RLXwVQGOLaSrAfQkFns9QHLs5oiKgfSdbrvB6mpojQ==
X-Gm-Gg: ASbGnct3HwXT1mlpPgBliSx94ulu/RWoXGHwd1OxPvOOt/aU8TMeFGbjiXgP/5wlPbk
	YomJkiHfqrUxlfglphkow2k0KSMEioL+po/X2i94Azw0+iw35acIOJqj+8XySWcTKvBA1HCBQlQ
	N+lfrcsiBbCXbUDPcnKrAwZsPxrSk9j82EiRbVw1Pk66W9EaCaPw8dSwPeBABhbIVSi7ATRtb7K
	Fd11K3M9zeaYp319RxHZZT1A/mB02/Q8J6vZGnkny9bPJ3YvqNlI6UcxaBeiGgFCzsmHIP/43qb
	xNiz3yzj9KRNP0FPh3/NFJ52m0Y=
X-Google-Smtp-Source: AGHT+IHpiJdAZcmd7ay5hxpzMSKF161dOYZF4eYXQjGHf0aIOIU5+E3pjAtawzgBqB2Cu4BXgwWds+NFi8l3GMK+YEQ=
X-Received: by 2002:a2e:6e0e:0:b0:37a:4714:ff39 with SMTP id
 38308e7fff4ca-37cd923e013mr51455941fa.23.1764171237355; Wed, 26 Nov 2025
 07:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
In-Reply-To: <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:33:45 +0100
X-Gm-Features: AWmQ_bmsAdHo5JAtQV4uhxKNZhn_21Nb7ErF3vgXJlQ_8wKth0d2tGKqeTK5e-w
Message-ID: <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 4:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >>
> >
> > Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> > Kconfig and post the entire kernel log on pastebin?
>
> The kernel log is here: https://pastebin.com/7rBh3T3T

This is not telling me much, can you try again with the printk() I
posted earlier, please?

Bart
