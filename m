Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF73DE450
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798580; cv=pass; b=Tq3gFUl7MWIo9KNSG7vFYCRKb8BljJ30rEe8mcUFxArwbtKpKD318c9SzM8yNpnmZJbYQPPAlbnCh8U7E7BKrPbj0Rdadpj7PtBXX7WHz4/yTxu3nj6LegHngOo1Ci2G0O6EkVA8OcOfDJOy8XwU0wLFI9YJZzXdSHgnvEp68Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798580; c=relaxed/simple;
	bh=Dg3mTo5Mcn8ngqMvpVvFnTbUkbCXNIGOywIbkn4YrmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwBzMREYAvL3upmjlTv62bCxlB9m83iPGZ/SiQFnUoXnh4j7bpz1d1Vpsa0qN4c045JB9zxo/ugW3TmCiL+F8NsNo1oZ0hdGP3lPyg7q8QFVN4cTTys7FqK9Ht8T0B41Z5YSXI4A+/6pEO8AhQjQX7Nl+kJY4aMhcrikgdoV4Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1yXffAp; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1yXffAp"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304545f5206so5513730eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 05:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779798578; cv=none;
        d=google.com; s=arc-20240605;
        b=RXlxIpj30YRTWMONaxwyHtpC/Qw8FH+UtTarcvoeaJx/o+vejmUSZMFfs220aBQnNO
         cMvWDeRJ6XnmNIIUtpkLTBuauHdsikvI2S+HJnbd2TIKewdriKtBhriMboxHEBTrTSdo
         2KEESdOkBzISWJqHvfJEfXRy2wBVS7R7OZdnpxIr8+jPEcTzcTc59AP0N/pdTUzdvcIh
         hQge/PALsu0IP9AybUEwntNRFy3dnTVmtfFPZrl7WyPldzglntF6+1/79HTUoqrTMFsv
         ov9GHnkJhUx2/F6qaF3deTtsn/6OZGoIkDG4QXP/lpihVnEaF4p47VwSQjcve26h/Pmz
         qiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        fh=n0iCgPo66K5u5BDlW1gCsKrc0xi58lPfCvYnrOrYATY=;
        b=GbkfowQY0B7G6CGOteaq79QM7quHvGIryG7np3W1lsx/T7eMLl4Z11HFDQqZXECGze
         ISDrQTqlD8Z9PqJIyL81omSgWjMNn1xXvJYaSiEhMsmW/eTauiIqovCAjJTb1dHsQtu/
         Cr4opxyaldY6mC5gKnuF5JE1OGOO4LG05Oc1v9sryjzzhdQ67p7lS9/84nG0MapuY1dF
         NOMEm4DWV3fB1R5TiBLPsuoCMEGLXv/Kqjq22RQel40j52PqnJhfzqEuo+QXN6SRcVmQ
         XXSnGzO/crkTAV/L7IlOm/mBcyWGwcvm7PB+fQ6NMTwq4fhaey8ZNzI7jW9JddDTTbmR
         cZYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779798578; x=1780403378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        b=h1yXffApRVj8DnmaJq+9aVe0KzjkXkD7ErPjhLHgtj/9+w+F562VG8pO3sXXPDfzE2
         CsSZfsBa6BLtwlYJNE7WfvqJRJe1MIUNQr4fygoIXnczSysRZWfOTnRUfm8rR19kXgIp
         d0xTUaowzopt2gjqzp8V2gX2NFivEX54c6vmjR1rv81VgWFK+dafm39kA8NvPbt1SATc
         maOUrWS7XlbNMJIdhE36j37/+6IT+SgmPpyCil8GJOFBNRL72ei83nTIWYykjANfazrp
         WI6XWQgRWIJf3V2NpZTvq6MurtJU2Bee8QV6/mNIpZlLi9lHDcNVgZ9if4dcCyUf0bgw
         lY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798578; x=1780403378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        b=fQOQCK9wsu+Vtx4JXkRM4t3Ri6Qu+V9ADnwcnzlWkwALFDCPGm9lXwUGBwcDWXOUXb
         PKmdakAjCOYrseXlAxDf3pPWwJGvtLYWHjovAmhUPjPrsZPuZieu3xShu08ZLwtcetJs
         CR8AMvP1g0bEunQDiWCZu4ZS1TFOW3aN6sux+KPDiu5oxLcmWojP0AWzgeHeGsmOhGR9
         1QZ+9q75qz3GeR0EfQK/E2rCbQjW4nfXY/MiRpJviRmmC5mSMxvznc+43Nb1lCWCJjGr
         Yu3P06SoS+S/OzFFtW3IXZb7Vzzee+PIFHTJ6xh7oqbPL7mtuCzIKkuGYQe0aL84UsLI
         FIYA==
X-Forwarded-Encrypted: i=1; AFNElJ8LVs7LNLrlkPQaDIe+M6RtUVVL1LNippv83b8SfGSQvJa3UHtxGpHbP5kvC63KWqWHvLu8R7KHhRPlzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LpY/sbspgvP/JXq+syqFXVvmczPQGBa76JOFMl1aMWffr5Sz
	zaK/y0c3S3h3IO/j/7JaK7uwdLQ50UKeZ9E3VkMdzOqNy6LJo4wfSmu7AvcDbZWPcJ8F0RlBiTf
	/Y9DC439s50VsuTpm3VGqQcCWUZMA7VQ=
X-Gm-Gg: Acq92OExaXYuDhnCNoESqVhlZBa3pOTOZ5Sohhlue7gZ68NcN3T3fdQ5FD/qlBYtI8M
	7DlnfAtjSP4ccCdn2cOEqRrajl5iGvbUfv3c7UpGmw5N9EC8TmM/PSmamlD1PLBXaBvA3WSakDk
	zbQK/ndVW/tMMDwwGfS/XXggSD38UDG890WdHXOGV4qZ+jmCoRi43+SCtLLl8kXjcouSH7G8X/b
	B8yYFX+Pyc8968nD63NTEgTo1H7+tL2PmEjek3xT5b+kAmL4LD69olZ/s1vFGDhmx7uKQh5S8Og
	XKbfUy6s
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id
 5a478bee46e88-30448d51723mr8826200eec.0.1779798578350; Tue, 26 May 2026
 05:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com> <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
In-Reply-To: <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 15:29:25 +0300
X-Gm-Features: AVHnY4LlPJQvUtSK0QH2SeBmOMPhEhv-MZAC_ScpGO8WYUg9vZq45m_SVat0lzY
Message-ID: <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
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

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:1=
4 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 26 May 2026 12:03:59 +0200, Svyatoslav Ryhel <clamor95@gmail.com>=
 said:
> > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
12:51 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gm=
ail.com> wrote:
> >> >
> >> > Document the Tegra modem pwseq used by various devices based on the =
Nvidia
> >> > Tegra SoC, describing its usage. The power sequence provides interac=
tion
> >> > between the modem and SoC-specific interface configurations.
> >> >
> >> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> > ---
> >>
> >> ...
> >>
> >> > +
> >> > +examples:
> >> > +  - |
> >> > +    #include <dt-bindings/gpio/gpio.h>
> >> > +
> >> > +    pwrseq-modem {
> >> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> >> > +
> >> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> >> > +        power-supply =3D <&vdd_3v3_vbat>;
> >> > +
> >> > +        nvidia,usb-bus =3D <&usb2>;
> >> > +    };
> >> > --
> >> > 2.51.0
> >> >
> >>
> >> I assume there's no such component as the tegra modem *pwrseq*?
> >
> > Hardware component, I assume no.
> >
> >> What is the relationship between this node and the "infineon,xmm6260"
> >> compatible node?
> >>
> >
> > The xmm6260 has a phandle reference to it. Since there is consumer
> > matching logic in the pwrseq driver I am leaning towards removing this
> > node entirely. This patches is still in non-final stage and I would
> > like to hear any opinions on the way to improving it.
> >
>
> The node attached to the pwrseq provider device should represent a real
> hardware component. Are the enable-gpios and power-supply lines connected
> to the modem package?

Yes, enable-gpio is connected to the modem and signals that USB is set
and ready to work with the modem, while power-supply is an optional
supply connected to the modem's vbus input.

> Is there an internal structure to it, like a PMIC to which these lines co=
nnect
> that controls the actual modem IC?

Modem does have internal PMIC to power up all its components, but they
are controlled by the modems internal firmware and are not accessible
via any standard means.

> Bart
