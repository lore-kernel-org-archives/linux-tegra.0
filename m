Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CB3019A6
	for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167308; cv=none; b=jLzjPoMjEaBrYS6aiB6ELlZbBrzrqgCQes+hy6zp/9lJR1xRtBcX3JmCohCJhUBmYPz7rdADdd4fFQ7DZQF/4MteAT6cawSO4PEqExjLBTOTiXG4bn3ALYTVvG1gI5TIkIB0O+EV0Vs0rACFm/Hza4XC9zseVoGPEDPJCNoRwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167308; c=relaxed/simple;
	bh=RN30k8HzM73JgGT4+Hmg4UWVBm1+ESD5dIcHIzaZOQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHqLgKelYqg0qiLaio2WhmToCFboMwL/I7ffBIEDZxB4dj4BhmvpDZY40Yj79YgvZgpDmb0EG2VWzZhr8qwWn1Jh1GKbWG0RZDIxIYjwQhr025p8BDSzKWTxhTfRdJZWQjIrsfpXqGUPFWIapNh2JhUt3xZkOrK8LuWB0Y35glc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u4XnVqsX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u4XnVqsX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59578e38613so7773852e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167304; x=1764772104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=u4XnVqsXhUgUuNrM6sCQ/+wFu2/nLoEhJvb5gjhzLyztc53eSubWAHkn7kLXRzXSek
         +h7bhQGh0Ntfbh9nlKeOHQgoIINugaAugdrMT/wbPqZ7j9+ceAIJiMC2DW7zaneqVqlQ
         VetOL0H209f6ODEJuIRs5kMhbDHwPstVHb8t1NnDl0T9K5wGVMP2JbvdtEQD6Ngahk0a
         zDZs0+i2P96RPzguhIDn9Vn0zfz8R0Oqk2I+PC2sEX8Qz09FY8Zff0ZYj4cVUCFphKl+
         1VyaWSkTh+kuhtykMvWQJtCrBaZDiY61Fr/GB2VfCRa4vLAHDxJPtz64p9m25dgVuIIN
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167304; x=1764772104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=WNJXLXsDMaGA+hCnqmyeg5Qn9soqi0kYZjY3CdSoUSslwxl/GKeGfwqOPuVxrOEicQ
         l0lFN5W4N/SiQC34uL3A7CBiz8AcOumuyRsYjGLH/BRVp6+oXlZWbuInvF9sgnM58VML
         PmP5d/BTtqejl8oRcE56C/tVP/FboTOG9LY8SzcRw5qALWUk/P7knk9kf2eJ1WEhauG5
         HNgk2wnuPsT/e3ySDs4RvTKM9Mmw5g4S0JG9jwy/owoC6plLA+CFfM2j6fubXqgssUe6
         JoVSnBDkW5XOat7aZt+OdYoSr9PSc8DgF2Z49sNyZY1tpyJf0DtQ70SR/KGLcGPaMcCh
         hd/w==
X-Forwarded-Encrypted: i=1; AJvYcCX6xMtAfZ/SxBd3WLhvCqjoFqEjg7lltGps394ni4NOCEMDN6AsLobUUxqjyxtQ0mi0JVPoddr8mh681g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvforXafBb1FDSCZ3OBWb7ZVVlHKhKl95Njf8Hbl3Kv+DcEa1
	+vOBoEs9dGKGQpbEFTHffLTWiiMo/FB1hFGx2nSOK8sEbmJBedI9uezxgnyO7yVx3E5/ftvKWCN
	coEKms08/j7YraD0v4hjnFoMLm4AZ7NKF1IZ6C5EWsw==
X-Gm-Gg: ASbGnctPJYVuV4HHAjUFmXLdaqyipIauinBvcC6LuE9uzQuoe/G1mHeBmyAIjn39CIK
	N2K305hqJ/QOuU5ld71pQucQcjsRpRdsgoBnuWI/wU7QiPR15O1iuGf4+LRJ2jirWnbteUteMh8
	ZgY4xB0pxxlkGRE36o6AH/fJhL+TSmOQ9Z5KtXGsxCK2lTXa07GrYgsOfTXDAAime31lWrmkpLk
	KR0axOxFWDmTrWp6VauNBcHiZ/fVj1SjNmZhVAbmZ537J7c+jUevl2jZdXoDAeZfOdL3CzFsXZR
	edl2EAxCNc4868+wbBHGxyomxIc=
X-Google-Smtp-Source: AGHT+IHk3ZX4aUUBolMwiCMXAcXiwyT2Dyate9UnnaEtVgZgfmV77bNvl6bV8cACmOgABB87QFqEt5N/Ut+6mcoRVj0=
X-Received: by 2002:a05:6512:12c4:b0:595:7d95:eacd with SMTP id
 2adb3069b0e04-596b4e4b76dmr2588737e87.8.1764167304291; Wed, 26 Nov 2025
 06:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
In-Reply-To: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:28:12 +0100
X-Gm-Features: AWmQ_bk2gQa2v3AxwtOwsX10QuQjgn1DPsSzq3G8PlY09kgQ-V2J9JlUGzmza-k
Message-ID: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Bartosz,
>
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
>
> I have noticed the following kernel warning on our Tegra platforms ...
>
>   ERR KERN OF: /__symbols__: could not find phandle 794981747
>
> Bisect is pointing to this commit and reverting this does prevent it. I
> am not sure if anyone else has seen this?
>

I assume it comes from drivers/of/base.c:1295 - could you please post
a stack trace of how you're getting there?

Bart
