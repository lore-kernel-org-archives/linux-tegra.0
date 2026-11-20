Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164330;
	b=36lb0kTHftIMAvjX4t6Txc9nTJuaS/xh9HrpZ4gS3GdRdGzcn1EjDe0uB+MZRnJ/zJ8L
	 NRKl4XK3ZvPH56xfnrFWmTDbhpFgam1E0mYoBiEXWGDTjlKjFdBX5OrMhlaApmVFHCtkS
	 NggqWE0bKqiASUsRiHevtbbgS8dtu30g4r5+s9bO1EhUVkD/GdByweCCsCQr3H4n2Borf
	 EMgAtllwPfuarwfpo4ezR3nGh9Tr+Ew7zIWiF8dy/JyW6UoBnEIxYnOkYxLzg6yZiBUmy
	 s2NI5P5IPvy6IQc9bOUQahIDIJsvVPpDAY378iAZIxkWMyg32fHRA+MrPV7AazmSfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kKe/4cMcpovlVlLqvT7qtlmn5xNAbW7n/dTNm3KFNs8=;
	b=msUvZospIGQ1hQfXbT3lKfsn5aCULX1VaTf2sIzcE5RZji70ORSC6EpVWNxgTYkARD0+
	 5WFtQV0Xoclg9ye7FgtzFsEPRZxcuRcVdzeVueVxJoqdcTG6jHZqBF9++1QvuvK9YxeGa
	 NfhdivKjJEGW1saKpwvUDmEyKez1bq51y9CfinJZryetUIQ/LThRUhKdy11LC0YtiC2KL
	 EkHKqBkIU9vbKgilLE/fspCGEM+3e9MVOtC0j9nFfTVvKlwllrkRNkalmcut50bEHKE9i
	 M+/zTAVKDcOYmZ1MFnAZTK5Iy913RewbaSQm5L1BlYnZnzasj9fkr+022Cjuz3tX2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8B606B4A3
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 08:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D8B606B4A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2b25786d9so336275137.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 00:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164329; x=1795769129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKe/4cMcpovlVlLqvT7qtlmn5xNAbW7n/dTNm3KFNs8=;
        b=0lcJhUGHUDyZ1sILO1p/ev+cFZfFphqPHLWRFeIHkepel8qz5mVZicxqZfsjbilGn/
         +3tgOCnooG8Fi+iLYyFUMLgEiu1SrnplduvsSeTwv3MCAY+LrXVnMuCVePxtSgAS/PY3
         YJ/dKJtMoAJCbs3TG/d/vL0M3Io+ft5uO4QUi4QnHRz4PDWyE5/89/rlxLXgUX+Z/9E5
         JAY8nktvZVrwy4MuMc5Nop5S7P9BBN+DeEo0DctzrqxZfbFKqtFv18CIdIW4jXjykzMx
         E1Q/8kxTTtJZ7GRXeZ8s7Kto0pisB/Z17MhE6XzhensxXJi/9eQ68EFEQFUQRose35ik
         pKMg==
X-Forwarded-Encrypted: i=1; AL+hErGkTodGha32p0yjn49uQiEmKOd6TDTplIJq4vOqQ79m/0kIYqfWMzhFSE6+DDOJHkIpIBBIF4WkLdZqbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MR/j2WwFWs7GlsB+D1N4rrjMVV+fPD7Lb6Hd9zePmQfnIMhXl
	QjqTs6udUy6LEZO0zL5UKnydijx5E8L2xhPS47LbFawzLoMhZx/hng2myzcfnwXf
X-Gm-Gg: AZFdTZf9/ryrvTUS5dzRtK5Z5HlbVkaDzazqR9I3ScVvxhf40D0dq/X0edQbM4vwo+a
	MQ2jRzyLV9XB4mnjVcNi2eZ0PxNHADiFbs4sNYpiaZO1WTPBiOb9kqrZKFeI+Z/LdNOw6ykTpzE
	6ySBH6wAFVqFPeGUPTELbIo9EEofy8gwHImMAgy7j2iyQp9u/FictlQrKIGg+RoHYGmjOKhaJZ+
	hrhFpVoT4PawWSeNnl1xT1zdbMQlTWa76GPWcSlSkkzmTbuS7NKv5WXg/TJVSanXSTInHylJJ7A
	6AAeUpmj8sI1MMdgP11ImeAN3L3yTejncYq1F2Rgmx3LiOEJ5ArVmEWvYH0/TCk5iCEvS6dtaf5
	QCKCN7lVcOkSH3ukL3VBg9oJd01LrabzMcbyGlDRam64PwYHJ0V504KSvkAJ+fzxtWJZC8t+Vt+
	BXzKaWgr87XgDkUY3Eql/WkgxHFS/TtVURfUOZr9l35RWcRcWU3qUcILpV9fcrJrKxJAoKKPG6w
	eflXenHjGulFWezVsU8JuZbqPzDR9qlskp7MuPYCHPoeawPBtXp5ftoAuDSI9eSJUFF2TIXO8Q4
	BipcWxxhMO3Q9oXMBnr4K/o1JuPZSrBBGICroUZaLQK2QtQ7zJXD5rNEfKU93AHKqOk=
X-Received: by 2002:a05:6102:5811:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d7393d4009mr1058509137.16.1795164328800;
        Fri, 20 Nov 2026 00:45:28 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e822a085sm2264457137.10.2026.11.20.00.45.28
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:45:28 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so373305241.2
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 00:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFVdQpwGWdMLDqkcNAXY7u6y1G2AIcvv1BhPvpNp+h+MQXxyGCWMG1h2LJ/lAUXWNCYKixIzfgMw5I3lQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6a83:b0:7cc:2c52:47aa with SMTP id
 ada2fe7eead31-7d71e35b5demr961144137.0.1795164327788; Fri, 20 Nov 2026
 00:45:27 -0800 (PST)
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
In-Reply-To: <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:45:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
X-Gm-Features: Aa3M54rOiSTOIwRhd7pOhxBlMhXD66QjrOqwvbGtlwpHt8JjwbFg6d-mZpwSDxY
Message-ID: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Svyastoslav,

On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15=
:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5:
> > This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_EC
> > MFD driver and its various subdrivers:
> >   - The first patch adds a missing dependency for the MFD driver,
> >   - The other patches enable compile-testing for the input, serio, and
> >     battery subdrivers.
> >
> > Note that compile-testing cannot be enabled for the LED and charger
> > subdrivers, as they have a hard dependency on the MFD driver.
> >
> > Thanks for your comments!
> >
> > Geert Uytterhoeven (4):
> >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
>
> Though this EC is designed for Tegra based devices, it does not have
> any Tegra specific parts. It can be used by any other SoC.

Sure, the dependency can be extended once the hardware appears in
devices with other SoCs.  The question to ask is: does it make sense to
ask about this driver when configuring a kernel for e.g PA-RISC or S390?

> >   input: keyboard: Enable compile-testing for
> >     KEYBOARD_ASUS_TRANSFORMER_EC
> >   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
> >   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_EC

As pointed out by Sashiko, I forgot to take into account the transitive
dependency on I2C, so there will be a v2.

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
