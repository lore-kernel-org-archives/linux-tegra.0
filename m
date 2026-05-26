Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE23B4E84
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802932; cv=pass; b=XI8QhghBzvTA8vWS4CbT9bX2yzf7LgcDiieR2Rdfbe03oou3IelWJFaKwnAXVa1q5pePVzklo6Tq7Vq/WQcabwlmRGTy+dskDrqRuKJL4PM7gOp78xulycXRUlzD3pEx5/yxGfeH04s9P/M/ItgiByafT8qf12cYnl0bilSWlJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802932; c=relaxed/simple;
	bh=IR8h168jGiuhn6TmrhfuE1J/dfjJGqCoY/8QGtJOSTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o94qDhY7coWcEMOF2owrlGSUHZ+E4KyKYHNPcARGAxtYXMhXRalN6S5k/+VuaUPj/7g6LoAhfaG1cEbha5Paweic5rx90qWVpeDtueGhriD7FdgpHpdUvl6yo9uK5Vg8F0wIKuBv5bGJiAIRRPVDr/JLevjonoLUebdeuRR183Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pnCMSKJe; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnCMSKJe"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ee990e8597so25412500eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 06:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779802930; cv=none;
        d=google.com; s=arc-20240605;
        b=Yr94P9hdNg6KWv1gqF12b+kZ4ywCP9ybmf37aUMmhYL0tXlJV1FC4ayeeiwHCBLVlb
         BYMfJTPnNkCcCmvnzZLD4JhiRezhyxtA5js+ivUQis7cJtxXyQVbzpqkGs5IR/DfAGhz
         u8JtMutRSN+0Zju+P8ozkkyxVikKlpNAjeipqxz4gt8NNj7QVsLrBWR8rNIKQUneN9yr
         e6D/2Dn/hSpxPTaYnSXKFynI7SE+a43EW6auVWUn0T42VWyV8lZlai2vTc4D6j5T6Sac
         fTFvQ2v6TipQwZbwX60a54Snfi2tJplPTSjbKuYFn2ZD76siQzQicff54UDy6m3S4wtE
         QhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IR8h168jGiuhn6TmrhfuE1J/dfjJGqCoY/8QGtJOSTs=;
        fh=8ZQv9KDhegtPEdRignxpaQnfFOqL7U2Qawy2ekJMijU=;
        b=AqHsSprSPPeNCsQjuZF8GcqQn0sfbc5SGV+v2dcG3lXKwpL+lnEY4ZtDc/LzaRlzhn
         juKJdlBGTr5NWV6qDkw+90jH8Isa558liefHFw7O6I9LI3KV6rlRnMeSfgZ7s05TYk0a
         jok1P49mFhTR7S2mbyaOxiVHop+uOIKThdGQWjbEUNu3THczueOOxPEFQOCau6CfQOcd
         hsQhwZaRboAVrtkrlri5ULCUekZ2Sz6PGc51DGS4hscaczRxh06nZ0a1WW4qq/Cnd4qo
         j/nlzZwM9z4Yv/p9kjH5SVFejPSVlbt6Sds5MWUd5YJ1k8P57BnQn4KmOFAT5Iey+hol
         pgxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802930; x=1780407730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR8h168jGiuhn6TmrhfuE1J/dfjJGqCoY/8QGtJOSTs=;
        b=pnCMSKJevlCMdl1pgU4d53eM8k9WaDQsXgwcDVH4MsaEt4yNVIqjAuHSSzXUy9lZ0g
         Utm2Iq4IJLam2Fxf6dgfe6n0gLMlukyjs239MxxLvVhNCCf6iB/lCv61ZBF6r++O4OrN
         8jo2to0Z75coXPS8NyQ3sLyOdlik9gu2L8N+itmuZsKTWgZPaGH+GRXMEHFzSosF/0XV
         B+uIHc1Q+6sQYd/SCQ4ub3KEfYU2WlfXm9azOtfoiIV7T5nDQGpB8MVd66gR3/NnL12P
         dLTpIEbWbfBUd9M1YBwfxIQFEZ52+r2fEvdK35eeukJDFb5lkZFIhrMfR7pgIWQTzluJ
         7wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802930; x=1780407730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IR8h168jGiuhn6TmrhfuE1J/dfjJGqCoY/8QGtJOSTs=;
        b=qkwvAAoBpQxLH05sxrnlRepZ/p+doCoAPmUs87LwtysW/0Tq2NhMIpt7nK0B/UnUTJ
         1sNSU4iiXIfLROqULayxuZ9XEg1kFsxr5vJR+UaL++9lOA8iTAkuR1JQZobzBLH23qlf
         NvalYZfHZ2JZgHs3jlS9A82sbpi4XepbclSx3TZRXC9GwOvahbyg0kSVQMMgHxP2C/TF
         oE6soZVTh3NM9F3GZpiM7qwZvjvMS5/Hykpj7MwfX5XOLY2je2IKsCirDkeiSiJM2BaS
         M71tDgVUBGjGLKjfgoqV4AGlHDe5ta0FfPSuhrA3thU4woQj4E4K2JF9WzrP3Pwz2dWN
         BI+g==
X-Forwarded-Encrypted: i=1; AFNElJ/oRtfSHlOuyeGXSBFGF1bka3/xxlOL4dgBT55zkmeJGtY7vyFC6dF+DK0pNhIU4lFkJnEINQTmAOQ9OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWr0PJrcBLXfakojXKcd5ZvT/7avcq1mKAAH/MW0/n04klpL8i
	HfQRuuu8RKxKlSj/4QBj8SDbtPAzo1gNxYG0Erf4SmabCwIJRwtWe1FqLBjocBloPeJ3DnplIzP
	hJX7+4Cma9J3UHTQqmKcP17l9KVQNhUw=
X-Gm-Gg: Acq92OHwJ2jgzQHamP1HBWJXpL8amANq5EyDGODjFc+KA/hBJNXut+XmfE6n2BKHNOO
	Sb14+lxaNOvTMzZvZca2d2DH876BLmEwD0H7jYjlpM/NRa+9TJL0hIOX8KVXhYTfRU3A90MXmFn
	WZpMNulzDgf2Z6Kpu5yutG7tu5PpWIOjEGGusxDJwBEp8TIpKnG+HNpqw+otxFgP+OFBO2L8LiM
	szk8WWatryMe2+U5WJGyObXGQFeP0GMR+jBzhST2cgx32sSUsIXQDc6QlfheRRC1zVcnvQktvB5
	OugFre+DMFVATWid+HQ=
X-Received: by 2002:a05:7301:9f08:b0:2d3:f43c:d684 with SMTP id
 5a478bee46e88-30448fbf1aemr7687031eec.2.1779802929836; Tue, 26 May 2026
 06:42:09 -0700 (PDT)
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
 <CAPVz0n2COsDL+fNBAuKr1ty_AVe9sK5yNJithkXex6GNa1T_Tw@mail.gmail.com> <CAMRc=Mc9g=yezRtAtRMzh7t-pSoyoKQEtxrb5U0oeFAbcjb6Ew@mail.gmail.com>
In-Reply-To: <CAMRc=Mc9g=yezRtAtRMzh7t-pSoyoKQEtxrb5U0oeFAbcjb6Ew@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 16:41:58 +0300
X-Gm-Features: AVHnY4KFEJMIqmJFkVXi2wsVW9jw7UK66gK7opVRcY6tQsdWbwfvh4xNHY4PcSY
Message-ID: <CAPVz0n3X8Gw2Yo9VgwhV0uAqvArGXbvmzw=cZVJw=4BEH_E7_w@mail.gmail.com>
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

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:1=
4 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, May 26, 2026 at 2:55=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > > > >
> > > > > The node attached to the pwrseq provider device should represent =
a real
> > > > > hardware component. Are the enable-gpios and power-supply lines c=
onnected
> > > > > to the modem package?
> > > >
> > > > Yes, enable-gpio is connected to the modem and signals that USB is =
set
> > > > and ready to work with the modem, while power-supply is an optional
> > > > supply connected to the modem's vbus input.
> > > >
> > >
> > > The modem is a hard-wired USB device? Do you implement it as a
> > > platform driver or a USB driver?
> > >
> >
> > It is not a traditional USB device. XMM6260 is an embedded modem used
> > in the Tegra phones, it is linked with the AP using USB line in HSIC
> > mode. The driver is implemented as a platform device since it does not
> > interacts with the exposed USB device directly, it just ensures that
> > USB device is properly configured and is ready for IPC.
> >
> > > Is there a connector of any kind that could be used as the HW
> > > component represented by the pwrseq device?
> >
> > I assume control over USB line is the HW base, but as I have said, I
> > can integrate binding in the modem node itself, and pwrseq can get all
> > it needs from the match. Pwrseq framework states "This framework is
> > designed to abstract complex power-up sequences that are shared
> > between multiple logical devices in the Linux kernel." it does not say
> > that it must represent some specific hardware.
> >
>
> No, not at all. We just can't make up any imaginary, logical "pwrseq"
> devices and describe them in DT bindings.
>

Ye, ye, sure, pwrseq framework is quite flexible and I am not stating
this bindings is mandatory.

> > Using pwrseq allows modem driver to be SoC independent since USB line
> > handling is moved into SoC specific power sequence, and this modem is
> > used in Exynos and OMAP too with similar setup but they all have
> > different USB controllers. Maybe you can point me where SoC specific
> > USB controller handling can be implemented?
> >
>
> I'm not sure I'm following. Can you rephrase or point me where OMAP
> and Samsung implement it?
>

They did not.

The XMM6260 modem is used not only in the Tegra phones but in the OMAP
and Exynos based too. Replicant tried to implement support locally
with midas devices and they had some progress. From what I have seen
generic implementation I am proposing will work with any of those 3
SoCs maybe with some slight tweaks, only part that is totally
different and SoC specific is how USB controller used by the modem is
handled (well and IPC but that is out of scope of this patchset
anyway).

Obviously, non of the 3 vendors have submitted any mainline patches,
everything is in the downstream forks. I have investigated a bit how
this modem works on my Tegra phone and re-implemented it to work with
mainline kernel (I don't have Exynos and OMAP devices to play with). I
have come up with generic platform driver which handles modem
configuration and a SoC specific part which performs USB controller
bind/probe when modem is ready to handle the USB. ATM this SoC
specific part is available and tested only for Tegra devices.

> Bart
