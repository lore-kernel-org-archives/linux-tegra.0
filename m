Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C644963D6
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jun 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020509; cv=none; b=azmOw2EnG445KH38G4CRnmpj2nzDfpnEqfekWdqiIsPlrVOHQ+Jm5iv9kYVj/tehqYOBBFBOt/0BNIjK7+nsLCm53vYKGH++/75Ot2GNrXrxqVpc6h7EPFssW44CLI2mdN1GdY8PbDeFp4/wEUq4PYcc939MDZQsH6lkjZFtm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020509; c=relaxed/simple;
	bh=ToJ8zEJiW1bs5CBQxzv/XDoFjmAxdA2pPZ5GUq922/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnmDIo0X43s2G8SQDnItaA/sKQtiSw6XZQyPHn9D3VAfaYF25zsj111fWnWr7E59yDsJ+OvU30xH/e3XSvN6EiLA98ZeFs2kP/ewVN2lFp4JsQ51G9Yq0mu0iL9H+Ny3Xa9iZ86IMcf9bhkFAp+zP6l3ui6MIAUqDeEaDdB56cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5a082548de2so1593195e0c.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 08:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020506; x=1781625306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+Avm/3bAYyxwMVrCuWlXvGD7InI0ltUZ0EVtayRBuI=;
        b=RWthC2VNITNBm0qVrznLy4+zoPNrrfW9Tys2jKqQ58W2HS8jUk0lNU6bYQCBMGj9k4
         sgXLlFyuG5MPRwNip5fUCXFiWE1RcXdEeT1lRhZZwaok5OZ6g/4/rf79nCIaOI3VHgKv
         zPmBybHQqvPZQsjZY0NDYVB7+EGswrwjzMa2DjtqrxY/pkPSFTezKA9AcmHZ+Ln5V/oX
         qdh3wV8M7XyjhAwIXmPXPGxT9DxTArtDsgyXLwSA53xfCiQhi1uDY9/P4StBcfiw3OiO
         8dXXE0aOHH9sLXrSR5oFRvWnXVPl38jGDafoZQUYr85wZwCj5aVVjIbPO4/bCRl7bt57
         /MGg==
X-Forwarded-Encrypted: i=1; AFNElJ+UzV2nsq9byobxmnp176VwvfQuF7yK1N4LsCMEJTSSZ/Fhp5IUKjIOWO+RY5y1iOddi7Rk/zlHuFrtLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzG2N66K7Y9WtBfglpwq5U1JewmO5Zw/ne6VGv/MX4kUpKxng
	70E5tqQm6eRLuL8ixOdnymH6NFZr4SttSGsixFyPMQulJdmeKKZ3J5vG4Q8OjgVpw1M=
X-Gm-Gg: Acq92OHzU5qN6joXIHqvHqlyegja09rPWxTbLvQ6E/4xdQnzT7IZ4aWoshe1OZCuREd
	bmURDVodKpNeEV5Gti7zkjVfv6JyozkoNYQLIM336KGIE4WGkenIRkcxyT/GTvi8bwxcNw4UTeb
	0eh6MAiQzgeJw3Oe4RFSMhVpZwWoMKrBgCfAmrWTJhskbZC3MvaTJ8aY3EXNRv0Y838O40zDZff
	B5y6urqJRvz/xGela8AaQln9BJHRoS3o8MetQoO7VlvPDUSJchmrGknLQuNZQuB73K4ThTI3pOQ
	aSpgW9gmMEHHPMK+HcaJU1jlyPv4Vg5+T4n2zDjCgIcfMexWXu83TT+GUhfFSVCWrP3ezrRy98L
	v8/e7CZbBoaPi8wTjznhk7QIGvY+xDkhTIXy2nUXlnzuYqIDnP+Xc27WayizDzcm1UmIP3D42iE
	Rf2BnChUuBW/Av1MfDpA9pnk36GNSn/BaMLqdEvbRavK1imTLA1/lRjd3Jm7f0SD2/WX5vF8j+/
	48=
X-Received: by 2002:a05:6122:6585:b0:5a5:3619:f764 with SMTP id 71dfb90a1353d-5ac53c9f521mr9754732e0c.14.1781020505734;
        Tue, 09 Jun 2026 08:55:05 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6fb9ca0sm19665545e0c.6.2026.06.09.08.55.03
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:55:04 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59d7db12342so1716362e0c.0
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 08:55:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lt/X6meTdDTUlQtAyfywGf52yfHSQGpSn4HfxaFs1EHF4lVYBFw2aMxztLCDh2eeKAR1mJCr4LaH6Dg==@vger.kernel.org
X-Received: by 2002:a05:6122:3a15:b0:5a4:ac74:f5ba with SMTP id
 71dfb90a1353d-5ac5291bd8bmr10681939e0c.11.1781020503646; Tue, 09 Jun 2026
 08:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
 <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
In-Reply-To: <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUc6ur7hjQZjdiGB87JiuZB1geA6FU5mGehZ3T=e8X8CA@mail.gmail.com>
X-Gm-Features: AVVi8Cdxc5cR5JQjN3rczKbNms6cVA5aKxH7o-FoqyzJlikW2W6ZFAee9lEYXoY
Message-ID: <CAMuHMdUc6ur7hjQZjdiGB87JiuZB1geA6FU5mGehZ3T=e8X8CA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 9 Jun 2026 at 17:38, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> > The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> > NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> > asking the user about this driver when configuring a kernel without
> > NVIDIA Tegra SoC support.
> >
> > Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/pinctrl/tegra/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> > index c7507193044f4af3..eea7ec9688b6460b 100644
> > --- a/drivers/pinctrl/tegra/Kconfig
> > +++ b/drivers/pinctrl/tegra/Kconfig
> > @@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
> >
> >  config PINCTRL_TEGRA238
> >       tristate "NVIDIA Tegra238 pinctrl driver"
>
> It's the only user-selectable driver now, so this could be unified as well.

This one and PINCTRL_TEGRA246.

These two are special, as they are tristate.  Hence the user can
choose between built-in and modular, while the other boolean drivers
are auto-enabled as built-in.

> Anyway, the change is correct:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
