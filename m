Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B16A1D5ACE;
	Mon, 30 Jun 2025 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312053; cv=none; b=SUeaGGbgRPOFBDq9e6UPCyhB+Ndgy6OgBRmjqs4bX5Knd8c7CVe4a6iN2X8u3Yea2CKqCr3x+PzMMRj9p9SQJEnitfxabY3W6916RvYSXsgUk9vy2CRxTPoWuD43Ofc8rqMexHtVCTx1jqZNAW8gpjMj7LuWNNTvaDNobeIrsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312053; c=relaxed/simple;
	bh=r4TAHMfMdBvI2f+/ZJEXkp0NVNxlfoCluJQ/w8NVpZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP5aQS6nIiGwStTNP16Sdv15vw4lLecBFiKuOcHLCR8TZjl39KwUw/+mwIw6aZ1UmxqpAZKVJX9Q0EUbM+AmT+SUMWYCqO4Q1/6iePcHdRdH6dMwpYuy/UmUf2Jh73H5dn/BpADLXYCMlOJWyoUm4KE7gRO6Ts0ZvBQwQolXrEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6vYAFOT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6vYAFOT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso1186477e87.2;
        Mon, 30 Jun 2025 12:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312048; x=1751916848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beR3gBnMegNXmfOxcSKlnP3s1NNAUYnmJTdUmJfeEZ0=;
        b=X6vYAFOTbZZgS9jxwq0/+SMQTiVPe3bjH63M8yIc59ZA8Tv6Ycd2Adj+2O81BLloof
         D6SC8WWRs8VtbGW+cXAX0pnCEAifUxCy8rOWFka6m5USCb/aQi+V5PoJHYa+taBe6iHG
         le9wUHDoXP68vNjEZiYx43heGbByV1NvYl8PsWMt/24bzsSDvOKnSUH7TjivSno2FcbY
         I85GcISnYxae7h7hXVDoqCC9N4J1G+NvGhpW9fhD/MGUjDbNf9bPB/D03kglvv/hLzPw
         XRJy6pzAep5zwrcoMTAaWT/8vnoJzrXnjWo+Pe89mknGqC6ib+FAeQqyHRgc9XwjvzNo
         yR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312048; x=1751916848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beR3gBnMegNXmfOxcSKlnP3s1NNAUYnmJTdUmJfeEZ0=;
        b=Q/W79YjSPmDMoZUOPM6v12wDBxP3atd4Qoy+Y4x83zazVLWX/s120kdfCD8+PDGV4w
         78E9Uh7fIr1bXE/mqy8tvdnu/84BSevNGDPI+YAd61Qgg0xM4RN2R1T1mDnRSZpcxhfy
         VAKdepm0oAsUwWC0+DqGfr8GNvLFBDsh8p+CLn2n7NfA/xXQB5Rt74b6Bt9riPgcRBE/
         Z2uUTrzKLkgTk7p5YH5BxzWMFMOFqc2PQUbNO0ZeN8SDDdzwhvkDx4PbSN4Mka6bd1/h
         EUCpC0xkKRX2UqrDCsG9aWBiQNU77087pUFKKnG1Hjfr2f98kqQzSrAKdayOzFRw3lC8
         1Zyg==
X-Forwarded-Encrypted: i=1; AJvYcCWKsFUzdqyFqGXdlx+xqN+h4GOocG3G0lL2buKIZAxx+yvI4EiYqNM9X/vT6NzkoYu3Nq1y/+AualiEIgo=@vger.kernel.org, AJvYcCWx6hNgy2IjaulvTfKluRvyvIRlqZ1p89Ol5V4Uu0kJbUgeRx6eaGfMXoJE6mTWSCPiuvWgoqsCWfhXS8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXey29z1QyFbpz0YBDcGJMtzX51+LIwTDEjXx39YIRVj+nXOW
	OANe53RIdAv6JSVv5Fvk1kUHzRpkcot3duIay85rpBH3Xc5wM2xPp9btYTiohKspNPhdxDCDwNv
	36+oK6eOQo2/rwKYZTeQm5c2U1IN1RQM=
X-Gm-Gg: ASbGncsXnbkIhIFcHmdJMUSVZljfdUdbXpQ0ITA92kMWfgg4W0wViSboMR6F1/aZYLt
	sTK3EvvWOp3W2pX3jykRPidtOq43uD66kieQlQsYpCOLcDbeRvo9jKiAiKob+ssRlSE53jSDoR/
	7BO2a7dAikb+nTEqCH9aXxL/G/aB4POqkNkeOmGbdrD0M=
X-Google-Smtp-Source: AGHT+IEcZloFG6l4jJ8cgNCYeXgOddz00TihtZjrzR3EcWyur1s6dsDtIuhCgF2HuMdXrYLuOyWPUJEpBwohJWSq4fs=
X-Received: by 2002:a05:6512:3ba5:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-5550b9ee2b5mr5103562e87.50.1751312048082; Mon, 30 Jun 2025
 12:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com> <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
In-Reply-To: <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:33:56 -0500
X-Gm-Features: Ac12FXw5JMTdMU1UgcC1jxmIMzSdOncHyLMk8rYWZi1A362LpDpLt0LTHSI3GJQ
Message-ID: <CALHNRZ-nCGyYTndv=o1NBvL=zH6Pbp=Jkj2CHXtNgwcFzudYgg@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Thu, May 22, 2025 at 11:11=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Kasan crashes the kernel trying to check boundaries when using the
> > normal memcpy.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> > ---
> >  arch/arm/mach-tegra/reset.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> > index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0=
f1c2ad69d6e5c14f2 100644
> > --- a/arch/arm/mach-tegra/reset.c
> > +++ b/arch/arm/mach-tegra/reset.c
> > @@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(voi=
d)
> >         BUG_ON(is_enabled);
> >         BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_=
SIZE);
> >
> > -       memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
> > +       memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
> >                         tegra_cpu_reset_handler_size);
> >
> >         err =3D call_firmware_op(set_cpu_boot_addr, 0, reset_address);
> >
> > ---
> > base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
> > change-id: 20250522-mach-tegra-kasan-fabd0253f268
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
>
> Friendly reminder about this patch.

Re-reminder about this patch.

Aaron
