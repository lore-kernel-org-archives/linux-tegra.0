Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187701;
	b=RMQ6n5WvCielDSvL8yu6NN4YAUzx/9rV/hp1Ncw7dQydl88uuS0cbkH2G2EgIlKlZ5n5
	 Y0z7DQBWXcY1SdT+vHM6mz0VZqGicbAdrzA8UwXavPQfXcuEfSMabHI38TYc/kT/Im55C
	 ZqduGLKj4bzXhPfuJuzt2T01MeqPw4qy3ojkeRe1JqTVv/BNldEvwzopFO2RWwtMpReMA
	 6k0oKdJLZzriR/wFvCpOvRnzRbT49GJhpWh7nqU7C+akb0oa992ulUb5NidNQlPwQqheI
	 f6uhJxEdllpXWApiL7mGlIEGfmZMhVNBMOxh7i3GB3UWcVokB4hWYofAb0WK/z6xSww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
	b=OOESmgRKDSZyPgqg5eUaarFP84YnM5pySYsfrm830egXid8tctU6o4PV7ovaacVKETPt
	 OQ8Igl68rbL10qi4+UWDTswOe+JEwxCc+Z9tYOogpkf3lmA9GtD9VxUSzJCczbI21sLY8
	 qP+2wLJ6OzW7YvkCoSVSflk+8MlijrjS19CdthtbsXaaeV5hvhkKlFxvmAhcPlSCgAEZT
	 AOHwWUkW/3sCFC6xJhl1I9LC0wBBis5mSGawpamE50XueS02IlpjQD6rXGXe0t9FM2f6m
	 9Oq84ZBZ1dqktnZtzw6933v9vvHckSIv4EXW96BiXLiIwa/L1u2GBLNnqYUeCOlxwYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuTp10tM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1919606A33E
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 15:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1919606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuTp10tM
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38587f3de36so1155493eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 07:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187700; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6Yvt7NCz6+aHOf9jsFQlBC1k35QjwF28UW5JTnvAheWAyxuSstwmBfJtVTdsgFjlC
         uYMrCWBQG7+EDN+bIMLydts39kyqi8oB+tQs6bwN4pnaWh0GUaoykDMWta7z2pjCaO0D
         BM23ZjgOqrhySb//SCrAl0Suc6czMkOkJxw9DvN4gvq6kj1G1FFnoq0/k+1LSdgTZM1R
         fPVrJJNdlvidsuYw5pghCRwx/4j5+bMho1m0dHReDzb7Pb1/3N2b85Phrkp+sFeRZ5G1
         xooCTsRRQXYzMgIz8C1zExFaUBQ2joktexvYh/0BF2UcAxtoEz6AaFqGt5mla1hNRPvF
         1Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        fh=XaTXD1dlrK1Jpgmz29BrMA6LRM1eYbI6xQRoFU8mCDk=;
        b=QBkfaLdSf9Nyq/OcliaazlT6CnHzu8CWoO/BfAPCQpmI++8r28iMnZoSk1EvsRoRmv
         xdK3UK+Wg7EHZStI+axp5xLaim6pCwfoCGVFN3wV/CbJOz0OC3Pympc2XPVQsfE6vHnz
         4UH6R0OWioHzIfs1phDWN2FAUbnkPTdrPF6T8VYcgotR8HrHs+UmXv2r9FsctMAQVwmQ
         HnyeFYM69yoqz/RKC84DuekkgZN2MFqnrqwqM89m7mm1w2T21yDx+A/z6664qywOV+5f
         wymfBvlW60T9kbG6mGWAnImiKl5TiVCM7XJxhhUxjR3Fn48waP9vJ41wNLAux+b2J7Af
         QN3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187700; x=1795792500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        b=WuTp10tMLt6quTLDUoIPlzwBypkOMQJNj+vf4TTfECZ/GqWqCsgs3AYI8wpAJ4SZx4
         MUuOzaDkO5uh5MZbFAOlrs8i8pZPQ6DS5JytlD7LMXxu+MjlhfSaM1gl+n6M3xhybkAz
         I6DVJtTZlrfQFu4Xj33bsQAhE3hVTCEvGP2suhCDp6l/8JKo8WXlhqEJCBun9SGSSXvC
         r0DI1bP62/E6NgoLI+h1+Hc3gmBR55Of/S0qPGWtxsE7gMYMn30DJ1Z4qnVOEeN4u9FM
         h2RpwA3/3BbD66QkA+HQkuuO0twdCZOWGVATOmbIEmdhKik1BikdQ6l8YXriWEXupjBK
         SKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187700; x=1795792500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        b=jtCXRqzwVfsc2t6MGshnjKv9KsbkCCbkpQPYemmODJwJukD87F+mvpavxUiYtrh3fP
         VBmodjM/fqvl5bQ6eQlbkkW1msLWVT7Ny2fcsYnjiadzYrrcdjWyxtqMdh7zEBpblCxL
         +1E/9U/nj5bp6oJrVW8Q12f3xeJ+gZUJU/EVxeKpMdKXIQ/Ebf0ynpDsjwjKUf0yPlpw
         W64HrlVhDR20W618y2DFefuP3cBKtetImj0Fl9d8pPuAhHoOfmKgLXA/x7u7xGfdLj5m
         m8YApuyjdnmygBGySzMIhtltCDPaYJP4C/hch7mo819PuHadjHIehj8nIFgK5a1KTilB
         A68Q==
X-Forwarded-Encrypted: i=1; AL+hErEGGptL4HxkofNunPdJHiq4HgKDfHYIwe9s3Md6WwWapsJFzoXi+w5xKEWaX8PwyyERG54EpEGmhisrmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JWf6rpUkVyit1ckMfs7GTd/7bxDMJR8pUyRIG6pP5UDzP5dw6
	PGRXR3RCt6XxfuDSth1eG8mm1eFdYC43Id9NW8O7byU4SrQt8P67mECSwKRyBGs1R9K8VrufRhn
	F6u7tMAVkLQUTpmshh9QzdGpyk8PxF+M=
X-Gm-Gg: AZFdTZemAme6phDJsU+ncqm+EJmnNIsrIKY1bcWMTL4hL5YwzNudKOgfz9xC2iTXiGz
	DjMAZMdAo1aQlpsF+hCiwslv8a3mNu3Pi+T0yZPFn43dW7iQb0F1BsJ+U8P6L58sDMxPmuc9Q/B
	Mk7/4h0qnKChH4Me/FEhZMHiozXw2/keJkvJP2bul/VJnTQ9P66wcN3KcsZLAfBT3gcPmTfFobs
	WtwMgaGKIjhOQGKB4M6oV6KOfxwlbCZU5i7Cla//Ilg7VpR2lVNsunwg/qGyGLAPAw0hLnpjEL2
	3adnjm/Vt1BvIAuN9/rtib/vtAZO4zRU1QTggxqcw87fyZ+9+nkO09gKOP7i9dLk+hnsX7sjA1m
	oYk5tsI/j/zbf0+eZWrtbdqlUJDwoIGCoonKWWcFlfTQAc2sBNnKSvajuLuj1zSmVkwYkNq6782
	TgMddUnULv65VUFacRppz5ULwbdcGL5/yNfZ9eiq/xS/c/c+sGxj8=
X-Received: by 2002:a05:693c:4091:b0:384:483f:2ea0 with SMTP id
 5a478bee46e88-3856f65af07mr3934775eec.17.1795187699638; Fri, 20 Nov 2026
 07:14:59 -0800 (PST)
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
 <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:14:48 +0200
X-Gm-Features: Aa3M54q53xAAi2-NE6j4-zP1TXb277cEgD_-5pZDZArGHR0nuFBgm3EHI75NcY8
Message-ID: <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
5 Geert Uytterhoeven <geert@linux-m68k.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyastoslav,
>
> On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wrote=
:
> > =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
15:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_=
EC
> > > MFD driver and its various subdrivers:
> > >   - The first patch adds a missing dependency for the MFD driver,
> > >   - The other patches enable compile-testing for the input, serio, an=
d
> > >     battery subdrivers.
> > >
> > > Note that compile-testing cannot be enabled for the LED and charger
> > > subdrivers, as they have a hard dependency on the MFD driver.
> > >
> > > Thanks for your comments!
> > >
> > > Geert Uytterhoeven (4):
> > >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
> >
> > Though this EC is designed for Tegra based devices, it does not have
> > any Tegra specific parts. It can be used by any other SoC.
>
> Sure, the dependency can be extended once the hardware appears in
> devices with other SoCs.  The question to ask is: does it make sense to
> ask about this driver when configuring a kernel for e.g PA-RISC or S390?
>

Restricting this device to Tegra, even though it is not part of the
Tegra SoC or Tegra-specific, seems plain wrong. If you want to
restrict it by architecture, restrict it to arm/arm64 instead. Your
logic is strange.

> > >   input: keyboard: Enable compile-testing for
> > >     KEYBOARD_ASUS_TRANSFORMER_EC
> > >   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
> > >   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_=
EC
>
> As pointed out by Sashiko, I forgot to take into account the transitive
> dependency on I2C, so there will be a v2.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
