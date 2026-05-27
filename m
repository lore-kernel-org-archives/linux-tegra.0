Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C993EFFB5
	for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876755; cv=pass; b=eav2x/mSjuU0qn46FeFlP5TQQIaNHNnoRt/s7ctZqSCwytPQMzZM4PBWgzy6rcpGUSvIYmk3QLuwEVEHjE/ftXtTGCfjGQRgNCmmFE1ac21uTyViJZs/FxHM3TuRwU1wubrGpsTba1s9qFS4PeeaFRix92+8CgbSYFtSBoSjbSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876755; c=relaxed/simple;
	bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0dGVxg1qzN+ix6GZGTMp3+U1UbyGXh9lwnYagAydjXPND3orGrriK5F5Ix4zKTPM30UIx3r4JLYMPvPPsy1NJg25OWMg7T3v0QIXHDB8+/TGdJhP9mv5qQHwhymrts1hVbxBmQOia4F9+42UUKByJB2gIm5TivnEB+L4NsY8rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF/+WQDv; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF/+WQDv"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-303dbfbec77so13679551eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 03:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876738; cv=none;
        d=google.com; s=arc-20240605;
        b=WensGTgf81WQJObyk3U9+uUrs3qJzlfJWHefPdFuQiS7raOvccktvS14GhJPzMEsnu
         fCsXkGNaF0Hw+rEwBQCS7+b6bLt2efVQO+OKaE88mfKSt42vpq/44ijZtJGXAUqP91k9
         G28J7IsYBIzuqvuOELuLcmNEEIjk0Zx2QcbaC5B3jhDnR2ahfbTHIQ8rqUC+K82GT6Hs
         AU6U5aAtxZ1bi8y1BPnbn+029O3RtIN3l+3sC4TDpKBB5p3VlZTNxNS+pNsmaHcKc/vw
         st5krMHq6bVWHfop08gz3duTU7ygT8UxifgAXy62URdcrmWI9t3edPpa6Y/yeU5vLPlQ
         bt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        fh=BqQAaar/mGZEHjp3J7w4goTkETKeGEZkji7m15wRuVk=;
        b=Nh5DghYaXrBBO/KscoiijEa2msv2d9sq+U2Pl6BzFNE47+gg5mHkUbyj9cvgZ0Rzat
         ZX+jLzVFDFL2+Due0Cb6YQhG8kxJD6LooJz+1oeAAXolbrgLi+VpP6Pm3O9G2vmZQUKY
         nWIFU4xo28/NWLpAE/X3N9l0xnQ7yFKNniQ/AbtHKX44MjFwH0etoSeSG8YYekX/PGGx
         kUA9mfhgDJLFtdo8wUlDgCu+o5TRm9qR9OT5My2uyiBN5le1JvvP9bop46HM4r7JQ0mw
         1Wk923nAPaDIJUGLqrLwM+/QMSBO9RqDm2pg4bGSs35z3bqkYNNUfZXipqZuHpBrcUv2
         thUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876738; x=1780481538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        b=qF/+WQDvehovBfLN/fdTMiOVeDCzPvU2g5K09E8CULiQusXbmdCOg5Vas1wTfTWOyO
         VKv3Lp8VNz8bcqunlx0DjMytCHNQ2ebGiV8gTGkJ/EEQykom3fWHqpj5XwdkqLXROe73
         2rBonfqNVQ1gzlC+eqp4a2i3T2KltGx+9EzZHNL9cvAGcNc92sq0bX3tLtuQ0Bl1y9Ly
         38vsEvDcJcG/lzoqewR98H4/Z2x+xRPZ1gfPmhqk1iRtJpomcZsFANhRurHYu5zlB13S
         JdGpXVZOUv54NztdpLt6Nd1hXShPrHKw2zQKW+0lyPWJOHllWqFhcaJqAs76vWFwFMQJ
         iyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876738; x=1780481538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        b=ZRZFqUYnsCPh9igex9sdQpfY9B7KemNVetx7w2yYE8dZ4cDMyRxdZIQAlGPMg5GhLU
         vddD2iRUAyFodci/6zVgoILPoljaBLBFU0VEb6LiLK/hlmQXz5yDprQxLpxThJRFcXNM
         BXKqWHXq+KzzsKHuQdyl14gNqkuCad93qhT8QsJthaBkYXbchntyWOn2kenddypEb7gi
         SxNehtLbDabWnRtcqI9fmQL4ttuvfXay4R3SJD/fuGybFp/rCvjK92cvLaU0SfXqbIt4
         Nb8wlCaZKuoOkjUHxmhBvT3aLczQE9gMs4aAEu66StyS3nnjeDw2JelQwTgJgE2Iqjhz
         qVpw==
X-Forwarded-Encrypted: i=1; AFNElJ9guPYpXxKSdds6jCK+GTd7yLPSRFt8u7V4GBgAgRO797QK2sw1QIM6PW+/yFbRY+uvucJwW+1pyMd9Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGb1Wkwtn77pdil5s14de4G6cu3Ms5bRHlR73GrwVLpj9ZVOA5
	mUo5l2S/qxL7eU7qnwnyuvj30dkkIz/2pmMxvJ886jA6dtHwsgeYEoxmTKmUJeW9SmS5nxBQK6n
	HHpWvsAd3u3bpggOGN100pcM0zWwYqds=
X-Gm-Gg: Acq92OFMKVrRp5LYRe6DyWksd/2u055w3ANj2EB16GkF7PJjWcEHfnjuGCIST0ohIRK
	Aq9CfTUhE/M247dPxHNstASH7FEUBXkCUC77hpulRMWfmrTctdsQnDfl1z9w6kGcdXTgeXF7ZlY
	XClegZj4pdpxHT4Zpn8kv/6YHvQ22m+F3SwK9JIci9W6wc+yMPOPSrcjC3Tw3oUgSjPTPxnYvMn
	04elBEejF6mM+uGU/8yqgIPsS8ciyR0nkFqz0OVDTPOYofsAVEhQmAG3dBm3bV8Xvng7ddXYeI3
	IQCw9oDcemHVrCsUYPk=
X-Received: by 2002:a05:7300:8b1f:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-30448f30884mr10881349eec.5.1779876738394; Wed, 27 May 2026
 03:12:18 -0700 (PDT)
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
 <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
 <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
 <CAPVz0n2COsDL+fNBAuKr1ty_AVe9sK5yNJithkXex6GNa1T_Tw@mail.gmail.com>
 <CAMRc=Mc9g=yezRtAtRMzh7t-pSoyoKQEtxrb5U0oeFAbcjb6Ew@mail.gmail.com>
 <CAPVz0n3X8Gw2Yo9VgwhV0uAqvArGXbvmzw=cZVJw=4BEH_E7_w@mail.gmail.com>
 <CAMRc=Mf4W9hoP7FAbxQTNLaG3M9W+GmvQSMECbzzdQLU_+5D4A@mail.gmail.com>
 <80e102be-04c3-4591-8e75-ddf859d3a877@kernel.org> <CAPVz0n3_wueX1yeZ=MDfSMy3UaQa80-nGg1b7ZQuCTneOaQDkQ@mail.gmail.com>
 <0c4fe9b9-3ec6-4988-b579-776cf37585ca@kernel.org>
In-Reply-To: <0c4fe9b9-3ec6-4988-b579-776cf37585ca@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 May 2026 13:12:06 +0300
X-Gm-Features: AVHnY4JVHBTAzYKWqKZ1aNYZfr9MQmwwhT7RAGqWEdq99-uTkLrfBBwZV1kiBT8
Message-ID: <CAPVz0n0=u_bObb0Nnf8dH6MBbH7T3hY7V01GHnmnt4pCB4WxSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 27/05/2026 11:06, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 27/05/2026 09:55, Bartosz Golaszewski wrote:
> >>> On Tue, 26 May 2026 15:41:58 +0200, Svyatoslav Ryhel <clamor95@gmail.=
com> said:
> >>>> =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 16:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>
> >>>>> On Tue, May 26, 2026 at 2:55=E2=80=AFPM Svyatoslav Ryhel <clamor95@=
gmail.com> wrote:
> >>>>>>
> >>>>>>>>>
> >>>>>>>>> The node attached to the pwrseq provider device should represen=
t a real
> >>>>>>>>> hardware component. Are the enable-gpios and power-supply lines=
 connected
> >>>>>>>>> to the modem package?
> >>>>>>>>
> >>>>>>>> Yes, enable-gpio is connected to the modem and signals that USB =
is set
> >>>>>>>> and ready to work with the modem, while power-supply is an optio=
nal
> >>>>>>>> supply connected to the modem's vbus input.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The modem is a hard-wired USB device? Do you implement it as a
> >>>>>>> platform driver or a USB driver?
> >>>>>>>
> >>>>>>
> >>>>>> It is not a traditional USB device. XMM6260 is an embedded modem u=
sed
> >>>>>> in the Tegra phones, it is linked with the AP using USB line in HS=
IC
> >>>>>> mode. The driver is implemented as a platform device since it does=
 not
> >>>>>> interacts with the exposed USB device directly, it just ensures th=
at
> >>>>>> USB device is properly configured and is ready for IPC.
> >>>>>>
> >>>>>>> Is there a connector of any kind that could be used as the HW
> >>>>>>> component represented by the pwrseq device?
> >>>>>>
> >>>>>> I assume control over USB line is the HW base, but as I have said,=
 I
> >>>>>> can integrate binding in the modem node itself, and pwrseq can get=
 all
> >>>>>> it needs from the match. Pwrseq framework states "This framework i=
s
> >>>>>> designed to abstract complex power-up sequences that are shared
> >>>>>> between multiple logical devices in the Linux kernel." it does not=
 say
> >>>>>> that it must represent some specific hardware.
> >>>>>>
> >>>>>
> >>>>> No, not at all. We just can't make up any imaginary, logical "pwrse=
q"
> >>>>> devices and describe them in DT bindings.
> >>>>>
> >>>>
> >>>> Ye, ye, sure, pwrseq framework is quite flexible and I am not statin=
g
> >>>> this bindings is mandatory.
> >>>>
> >>>>>> Using pwrseq allows modem driver to be SoC independent since USB l=
ine
> >>>>>> handling is moved into SoC specific power sequence, and this modem=
 is
> >>>>>> used in Exynos and OMAP too with similar setup but they all have
> >>>>>> different USB controllers. Maybe you can point me where SoC specif=
ic
> >>>>>> USB controller handling can be implemented?
> >>>>>>
> >>>>>
> >>>>> I'm not sure I'm following. Can you atrephrase or point me where OM=
AP
> >>>>> and Samsung implement it?
> >>>>>
> >>>>
> >>>> They did not.
> >>>>
> >>>> The XMM6260 modem is used not only in the Tegra phones but in the OM=
AP
> >>>> and Exynos based too. Replicant tried to implement support locally
> >>>> with midas devices and they had some progress. From what I have seen
> >>>> generic implementation I am proposing will work with any of those 3
> >>>> SoCs maybe with some slight tweaks, only part that is totally
> >>>> different and SoC specific is how USB controller used by the modem i=
s
> >>>> handled (well and IPC but that is out of scope of this patchset
> >>>> anyway).
> >>>>
> >>>> Obviously, non of the 3 vendors have submitted any mainline patches,
> >>>> everything is in the downstream forks. I have investigated a bit how
> >>>> this modem works on my Tegra phone and re-implemented it to work wit=
h
> >>>> mainline kernel (I don't have Exynos and OMAP devices to play with).=
 I
> >>>> have come up with generic platform driver which handles modem
> >>>> configuration and a SoC specific part which performs USB controller
> >>>> bind/probe when modem is ready to handle the USB. ATM this SoC
> >>>> specific part is available and tested only for Tegra devices.
> >>>>
> >>>
> >>> Are you familiar with the PCI pwrctrl code that lives under
> >>> drivers/pci/pwrctrl/? It seems to be solving a somewhat similar issue=
 for
> >>> PCI devices that are hardwired and powered externally. Maybe you coul=
d use
> >>> some of that code for your USB use-case?
> >>
> >>
> >> I pointed to PCI already:
> >> https://lore.kernel.org/lkml/20260518-mustard-rabbit-of-ecstasy-eed3b6=
@quoll/
> >>
> >> And emphasized to describe hardware, not drivers. This binding AGAIN
> >> describes drivers, so we did not move forward at all.
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Krzysztof, why are you so mean? Yes, I misunderstood you and sent this
>
> Just to recap:
>
> https://lore.kernel.org/all/CAPVz0n09ZP1i2tasdTvnt8RvjhALvUYjv9u_EGRtnXPO=
YQtuqQ@mail.gmail.com/
>
> And enormous discussion wasting our time here:
> https://lore.kernel.org/all/CAPVz0n0u7uhL8_FQFiuB7DrnL++ecbaEKEoV7N2PgTVR=
BVECkw@mail.gmail.com/
> because you were pushing your solution. I run out of spare time to
> handle endless discussions with you because you reject standard comments
> and expect long discussions with multiple justifications for standard
> (and documented in writing bindings) DT rules.
>
> So here I told you to do like USB and PCI. This patchset is nothing like
> them.
>

You are creating an entire database of discussions we had. I am flattered.

> Best regards,
> Krzysztof
