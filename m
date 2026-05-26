Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AC23E320
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800122; cv=pass; b=pxd1TMFY0jwiOUdDRsi5wvXj9mgGLKWfHzYxZ550UEAh9UZv09IxpxfHQcC982XNFMmE1i2XtkwcI5FnBAQMnJjLuC/26sttjWy8LBwHJoBc9VmSiuhM/cTHm46Bc50Nu3flEphBh6vP11R+XJAW2ZQVnMaryq8tt916MTEUyYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800122; c=relaxed/simple;
	bh=NPceGcX3PswichgjQ3Txb5qWCLz/58AAZcjid0lj8wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7RNExAsEW3ITiU2WpGOzUYx9hFcKoLNHlcvWpmqCiXeIcNcsmsc98mW+BAZb8qymLSaCBt4sqGLhrjZCdm/Q3I51ffg4DBwhHvRhPsqnoEU5zdHcflVUYIpkqEKYByXKCYq9M5URfjz40t12Ck3NBUuKTX0GKiYwyglYvcCQow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW537hYj; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW537hYj"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so34723537eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 05:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779800120; cv=none;
        d=google.com; s=arc-20240605;
        b=GOfEyIUOAytNPs1KdOlhEcldMOdQ6WigHiZY3Q27cGQZbRSsdS7mecThvn+RoGcRWj
         oxgnsmzMlioFNSXIEL0y8M+AgUEkiHfLsmdBHzJpygEvNrujNdYgDfBpVBDIP4+J1iTw
         mdJ4L7BH9R8Buuvp8/GElOmpI+ArzLbf8Gjqce1ficK0pH77S+TRBx5zcBmPHTImdkRF
         Ia6aXjTizL1IX8NVPjOblzKedlVj+lUWHkk45/oDX2nmxficaMx20V51rPXb6xKrdpCu
         HUWLGVajsiKjpEjn9qE6IRW4rgA9Ssk6VSZ1qxXp95oCVXM6R2sinJ36FYQJA0U/HGaI
         nOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        fh=G2O25N+JduVj9A7yhDhDxhhGeOqtVmnuEVUqtgPYpVE=;
        b=ZTVS5gUCSnMaaceDDBcep9LwweZJj5Dz1QMUBpS80wMPC3X+Bzz5WZu9tnxBIApqSs
         0oYxD2/2dSxuRvSCEflH7evWSDIp3/6rG8ZdiuiArCy0xYlpJwcmmAnfge8rN0Fxl0TA
         2Sz/v9t4mXzPmcGjI1eGOIiXkFQAHFOlJr1IeLFLxPwbXAxl/h37zyoGbeUD60TYEunu
         zSjslV8EXoiXHX9IxC/h7S1s/pzK0aat0zfEMcUeUDK9MCo3pvQVd7c06sVT49qFtDmk
         RYc0FTt3cXKr17N6/hAYwepKjHV2VRVUlLT8jcpV2IlBLfIbzUodnB0USOyRoFnDSqBO
         8aLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779800120; x=1780404920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        b=LW537hYjR0WybDVCeLMHW/NbrVJs6R0akoDbpiNLYkLLTY4HeVs7gsyRQqBZGbn0sz
         UfCACL+O5QMsR+ZDWFAc7LXD7FA1r/dlzTIeXbT+vqNOZNB+Spx0s9BabDiMVNONYIqn
         UQfWCDe1Va9tZMdUJvBbcqBHGbVpbBj137Ol1CgmlWsk/ZFZPWKuipV+7kYwLkFtvv2S
         8C7U4EefLkOckO62sSi6JyOGuSaL6zHgY5wR/55nIuvf5EGinc6bDVoOs8RpeT90ohht
         9dP2sJO+B3lr1UviygArCx05yYkDz6n1fZmIO058QA6InNj8LkGhfeEAV68cZteZ7ZAq
         +SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800120; x=1780404920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        b=dRg0PsbVRBEj30AKsUWKOKboB5yXHKKUzbEvd74cMcbNCRxbLJYij6/p5xCo1hUjcG
         8AyaucVQ4b6lgFu6aWBhTjYc03R1f0//MmTkfJaTBKBoAbB7cTFb7ut/d7pCfsbMa4Ez
         WE9/HVKwGwOZCuAykQ7KHleNMTnrr6nBpJlFhLJDO9obwWaUQNmo+2lPidZJAfbpaS0C
         qGJG5//0oGNjmif3B2R/hFUNL5Lb9QSPu6t8WCDmifNYbgR4uGwlXIlA9ZsMVf/8XK89
         p8IC/YBK7P9EKHR1FltTGU8HzqTXBohwFKPB7mBu4dMIKf2wcQBw7b1VV9byKlI/ci5B
         QRwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KJeQ/O/3/nwp0KgUZIzRCRKFi35tZXbKWJJcxeFSRab8lkvDgaFMnMO5WDh65gu6yd/1iI2MCGFT5fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWADY6HUNHg/zBj15y07JQtXWfNyG2V9ZUeeaow4uovLzBVlz1
	3RDcH7kmx9bPt3ud8O9VslTNCALfjDs1Pf1KUM5Fh/LSu8qCJ6slOfI8BU/rwXyuLZbIO0WnNa3
	It2Ug92ON0SO6uYX9vr1F7nWSW1mMA9Q=
X-Gm-Gg: Acq92OHuTwLp1H4FxdXpGOashRnTtgY67GmbOPjfTeWW6GMJNUrvY0EEedUB+YodawS
	MLcxoiwSIPxt7ODdvlCmqBfvWm6Ztj8uS17f77ULkLLeNs2UgnVNlvTLxkbuR0JjA8gCUZ6NrjX
	oOZh9FL4rRqzaHdL3CHhwC1aYgvoWXeAiybc7QeH11jCg0umiM7lUBKe8JZlwhZ5qVcDq3Dtcis
	wBTTbH8IMoOO2r7qDzK2XwukMhhjoV75t6wD/GyvF0gV2Vdz2PAg5hIc8XZN10usAM3NCxzZzG9
	9lxIaZtk
X-Received: by 2002:a05:7301:d0f:b0:2ed:e15:c923 with SMTP id
 5a478bee46e88-30449142740mr8172308eec.31.1779800119575; Tue, 26 May 2026
 05:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
 <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
 <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com> <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
In-Reply-To: <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 15:55:08 +0300
X-Gm-Features: AVHnY4JRp0uoVu7T9D5O6sRRvjrX-3sJh-DKTWd-v6Qt1vrT7npN-zOtTEgIKHE
Message-ID: <CAPVz0n2COsDL+fNBAuKr1ty_AVe9sK5yNJithkXex6GNa1T_Tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 15:3=
5 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, May 26, 2026 at 2:29=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
14:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, 26 May 2026 12:03:59 +0200, Svyatoslav Ryhel <clamor95@gmail.=
com> said:
> > > > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 12:51 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >>
> > > >> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor9=
5@gmail.com> wrote:
> > > >> >
> > > >> > Document the Tegra modem pwseq used by various devices based on =
the Nvidia
> > > >> > Tegra SoC, describing its usage. The power sequence provides int=
eraction
> > > >> > between the modem and SoC-specific interface configurations.
> > > >> >
> > > >> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > >> > ---
> > > >>
> > > >> ...
> > > >>
> > > >> > +
> > > >> > +examples:
> > > >> > +  - |
> > > >> > +    #include <dt-bindings/gpio/gpio.h>
> > > >> > +
> > > >> > +    pwrseq-modem {
> > > >> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> > > >> > +
> > > >> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> > > >> > +        power-supply =3D <&vdd_3v3_vbat>;
> > > >> > +
> > > >> > +        nvidia,usb-bus =3D <&usb2>;
> > > >> > +    };
> > > >> > --
> > > >> > 2.51.0
> > > >> >
> > > >>
> > > >> I assume there's no such component as the tegra modem *pwrseq*?
> > > >
> > > > Hardware component, I assume no.
> > > >
> > > >> What is the relationship between this node and the "infineon,xmm62=
60"
> > > >> compatible node?
> > > >>
> > > >
> > > > The xmm6260 has a phandle reference to it. Since there is consumer
> > > > matching logic in the pwrseq driver I am leaning towards removing t=
his
> > > > node entirely. This patches is still in non-final stage and I would
> > > > like to hear any opinions on the way to improving it.
> > > >
> > >
> > > The node attached to the pwrseq provider device should represent a re=
al
> > > hardware component. Are the enable-gpios and power-supply lines conne=
cted
> > > to the modem package?
> >
> > Yes, enable-gpio is connected to the modem and signals that USB is set
> > and ready to work with the modem, while power-supply is an optional
> > supply connected to the modem's vbus input.
> >
>
> The modem is a hard-wired USB device? Do you implement it as a
> platform driver or a USB driver?
>

It is not a traditional USB device. XMM6260 is an embedded modem used
in the Tegra phones, it is linked with the AP using USB line in HSIC
mode. The driver is implemented as a platform device since it does not
interacts with the exposed USB device directly, it just ensures that
USB device is properly configured and is ready for IPC.

> Is there a connector of any kind that could be used as the HW
> component represented by the pwrseq device?

I assume control over USB line is the HW base, but as I have said, I
can integrate binding in the modem node itself, and pwrseq can get all
it needs from the match. Pwrseq framework states "This framework is
designed to abstract complex power-up sequences that are shared
between multiple logical devices in the Linux kernel." it does not say
that it must represent some specific hardware.

Using pwrseq allows modem driver to be SoC independent since USB line
handling is moved into SoC specific power sequence, and this modem is
used in Exynos and OMAP too with similar setup but they all have
different USB controllers. Maybe you can point me where SoC specific
USB controller handling can be implemented?

>
> Bart
