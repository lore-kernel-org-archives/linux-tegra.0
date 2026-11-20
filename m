Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188815;
	b=B5ttsHi+QR0Hs71s5nvfvf9jrfB2TwbP97bFwYO3f5T7F60MRvuOLo9ZfH+22JQVjizi
	 yrpxbg4eaQzoDQYd/lstpxvBHvzUpjtaAWd/6x9HqFgaN0C28Swq49gQCTaFbuU4zTeJF
	 mzqMrPah0+y+xGksOEjnKq39hkWzZb/clnSQGi9rf0d7dNoirhQ5KPKFOSnDWWVUBXW0B
	 UjXMYfbMmqdzC3sNQg267nNgy/lObedwtvXVdcOiRr0P8Z2PHgLTG/bjcP2ZyrW4L/4ZD
	 O5KIAG74OP8pTVnc0Lm4F9baAZ9hQ1n1T+GfOhdsGHPr5RUqm+cJ/OiENYQ/rT4UmtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188815;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cn3lpGNrKpPmr2WW+2DRITn4KazHE8yVcfU/4bT7oXM=;
	b=ZjiXuBDheTada9afgxXSzCNOImJb35KMg1z67/h+J+UEIZGujNJsfPkU5lfg91Jxdl+C
	 1/3U5CfCpjCBQsHy6xTHO6KMtLHahBAkD30/ZeFuCGyOtedAGnmjehUqbEApVoa4qnuKX
	 LPtUodw0j5PPTJTOd4w5g9JlZM/HY3HxzvskPs857x7nFKUMMzRTrKWXezywLF9aiIXpU
	 gwKuL8NGQtcT5DK0Npcb6imBY3E4hfeI3RM2Db5d9AVPaMCOcmi8TyLcbDkJJH1n9X3HA
	 gJdXKT7ftam8tV9KGZTq/abeLjBow8ajbrxwGyFCN5PuTmgEWFwQ6QqgbbCykp1Syqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5F606A320
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 15:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db1f6f50eso1234933d50.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 07:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188814; x=1795793614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn3lpGNrKpPmr2WW+2DRITn4KazHE8yVcfU/4bT7oXM=;
        b=v90QGStw4sKyNRW00EzlOQiEEOeGFwXfA2GkwSU8goQRHEVAL/t5QM+yIQwIN3E/9v
         reXoXoIDXXjrqZmuNPHQxoAUVJaATzTlRO8baC+dVLXT46QrfTUx7GprUdUZZBWXBUXN
         vi0pAn8U873WgkZ6Az1UYsk1QgQko8btbt9IWkJe2xnCkTO8lYrfk2M9L4tHpSvkizuh
         8UBdN3pk4bDeB28VyFggE0cCfLCDgwiY4rYpBJVIoPjFcdmPfNOZNMFkgWOIwW6DsQsv
         lcD7CBMNhpGmcrC7t7T9lHpg7cT0M/j2TrDTz38U3UujES9s3xnv9l/x0gPA5ixS2qET
         /n2w==
X-Forwarded-Encrypted: i=1; AL+hErEn8grBafapt1Wu6UjAI3/PaSc/rrjXFaGdxm28h0YTkh2jICeRS6Xt7gLHpCtRjZyt74gLHUN/n9QVbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uKsTRKBnUaHw06IUFgIB2F3PbO50DlquL1zkA9xuUL3LtK5HW
	x/4XmHMucf5vY56YP8pJEkLU486UFw8KJ9IuvpQ5QO/rBvj0Wl/LQPZLSPGFgT1z
X-Gm-Gg: AZFdTZfpM338S3eQWkqZENS41V4lbVO1vibg+PgCQIW4W3zKg/oZ6xV7ruRovtpGQQ2
	h+LwSHIinTfqaxHD+2EZYSys1OLj6X2S392hf4U6ABoEaTJLFNS1ozqhTTayTMFUPdJZ04u2VN3
	3Te3MED1mVWzJx4YmCMCPeeATpTm21TqzOOgi96nrZyNutjHekyF2vrx1kDBgHtq965VMiEwxW3
	3o0HywUPZReNFoRcLXYOaXmUcT3J10pBwY0Fn2KviZmsdiOPaTFqzJtjZDlOYTlbGwDgGAOnqIK
	DQKoKONP5hPiEaxF4JRRoVTm0Mqrtt4YsWWmNyJKl/47oZfsdPmCzK30nHybJR3OouTp8r+/P7M
	9LQaUVynrqqwM/a7d3gnhphlrsfOtT9mqbne0cHz60pUElVXz9tBxNR6/71NytccOyuP32n1RFi
	GCF4Uc+t4MAIBRi8vtmdKLITpdxbC0Bh8fsx55HNUG1aFWShfEFLgV29eFO22BwdSTyQOeAgxxR
	mSZv1TPQA2u2iB/Jd3m7e+9+MnCBZ6miHLNWTBsHSSJM9Xp5lnH2jIuWSi2psJJa1+O+6ckcYK/
	BtxVjEmEDbnOgyUyTu1lVwVdE0Fk1norbwGfrpQtvovVW/zstJGJEi8o2j2svnAgXMo=
X-Received: by 2002:a05:690e:128e:b0:67c:6b72:bc3a with SMTP id 956f58d0204a3-67df43fb5b8mr1667907d50.42.1795188813816;
        Fri, 20 Nov 2026 07:33:33 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33a1cddsm1730384d50.18.2026.11.20.07.33.33
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 07:33:33 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc81984fceso416766137.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 07:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmdDQdQ6496aVPMurC/5WPuAkU0jf18eQnehLb9BswhiMgFGvs4CBgCjX8/h+hE+o/y6uUfxEBxq/qJg==@vger.kernel.org
X-Received: by 2002:a05:6102:3f16:b0:7c0:1d48:b2a2 with SMTP id
 ada2fe7eead31-7d73968c860mr1362556137.31.1795188813290; Fri, 20 Nov 2026
 07:33:33 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795095742.git.geert+renesas@glider.be> <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
 <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com> <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
In-Reply-To: <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 16:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOtO6XNw1MKW5CBi9MSK+5TxVJhf_4nOt=Zr=qordTJQ@mail.gmail.com>
X-Gm-Features: Aa3M54ph5eK70EiMju3R-mcxt-wZED0VO-z7mXKruy6-8v4cTNmqw-8EZNTAXM8
Message-ID: <CAMuHMdUOtO6XNw1MKW5CBi9MSK+5TxVJhf_4nOt=Zr=qordTJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Svyatoslav,

On Fri, 20 Nov 2026 at 16:15, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10=
:45 Geert Uytterhoeven <geert@linux-m68k.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wro=
te:
> > > =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 15:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > This patch series improves dependencies for the MFD_ASUS_TRANSFORME=
R_EC
> > > > MFD driver and its various subdrivers:
> > > >   - The first patch adds a missing dependency for the MFD driver,
> > > >   - The other patches enable compile-testing for the input, serio, =
and
> > > >     battery subdrivers.
> > > >
> > > > Note that compile-testing cannot be enabled for the LED and charger
> > > > subdrivers, as they have a hard dependency on the MFD driver.
> > > >
> > > > Thanks for your comments!
> > > >
> > > > Geert Uytterhoeven (4):
> > > >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
> > >
> > > Though this EC is designed for Tegra based devices, it does not have
> > > any Tegra specific parts. It can be used by any other SoC.
> >
> > Sure, the dependency can be extended once the hardware appears in
> > devices with other SoCs.  The question to ask is: does it make sense to
> > ask about this driver when configuring a kernel for e.g PA-RISC or S390=
?
>
> Restricting this device to Tegra, even though it is not part of the
> Tegra SoC or Tegra-specific, seems plain wrong. If you want to

The help text explicitly mentions Tegra-based tablets.

> restrict it by architecture, restrict it to arm/arm64 instead. Your
> logic is strange.

Sorry for my bad wording, PA-RISC or S390 were just examples.
Does it make sense to ask this question when configuring a kernel for
an Apple ARM machine? Linus Torvalds does't like irrelevant questions
popping up, so let's wait until he starts complaining?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
