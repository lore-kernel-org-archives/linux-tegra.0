Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232203C3C00
	for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966782; cv=pass; b=QeOmJVmcKkUA0+0OGcxG1FElVdEv4jVzX6Ncj5COO9Omis6JhzeKVNFuzNSTs+jKicMRORqWr5OCws2hmYtCdXQeDqgtIQGQW8wIOxmeCZq19tIDsnKvQC3U3cyGhFxU62Q9xGIlS2HjwJUzf/Ef1m2gjsyOaFrChdcaDhKawzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966782; c=relaxed/simple;
	bh=8xs8o7d5xVd5v5gOiZojxwL5cP8epJ07iWJ6BZxR0Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WejkJ21gGOvAyD2KlJEzaULyfMeiyp8sYdGIY9+fBX1GRQmWmsRQT9E44yhmGlZBywB6ZwysZ5MG+mWPspPHRCyfp33NbNAND2aQDhElk94ehZR7/QB4vFkFBFLWzy4weWEe0ojdZHk+3kIsTtNeiw4rPq/oK6RorK2YJlTS2Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fttSM5E5; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fttSM5E5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso7448095eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 04:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779966780; cv=none;
        d=google.com; s=arc-20240605;
        b=XAvA5dL6mpei+zIG6dKtHLAmBTjEcmX2m5x5REkvLzbY0VSRx580mGruJVUI6/vCqt
         mw8e36vnxUxAt1kcQRiURGWALGMg1vx7fGK/U+N7wqBCoNIvrc4Bktj5XnUrs97GfXss
         O0Nkiboh4ndQO+r0hmGM2Mpd70gA0+I0amisHpGAWyN6mTs9+fMDFpd8DOa+ooZUUG9l
         s0gBh+0mN3KITfIgyg6UzstpeG4mlE7v6m6dFN9AHebpsjArHm13IJSvX+ComY3RWC6o
         6irqrzAB/b0H2lYw0PcZdp3sUNqBpTMSG/XOZG3vuncjuaV+ZecgeqsIywZR2RzoUg7M
         6QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        fh=qOXPRWvIul7MCpT3JrvzaVF34onHyiDL8cdjTG7c+nE=;
        b=Dp00rXG/nm+VZxh6ZmRH3+L/ExdhZ/TZXuQhaCKE3mpb+LF8mCWiSraoEouuxQ3M1R
         N/EloxxZEYV4sVgKWTd+tfcOlUoLLgFiqj8lYhxYYqTm+HcIVlcPxQayV2ut6rzLVgX0
         FDwVLJ7YhmcLvbdDWTihFwg9zVbRTIHyzpIeOqP/HS3LEBELcT09pDbHAzbFexMDPAVJ
         7ZP9LRd0RZ1XcCSFKCI2XIgRpeC7+r0VdrBEye92ti87JK+X3y41oT4g21vSJ18jmtVl
         dKlVxQM6r4JPO5PUtBgKN5FTS+JhBbPWmxWC/MeUn3vI18B2sL9ruSE/DmT1iBI4P15l
         YH4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779966780; x=1780571580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        b=fttSM5E5JYMQfhm1yM/48MKeV8frkXmOHnGH2GjIOFFkyMfQeRfHv8SBgmzzjId1fV
         rK6a+01NFfjfQyiF8Kpa8ltI3c2KQZ9uGtUy6rTdA8fHIbULZQJ/4KtRBcmmknlqrEXL
         y4y8ay09klgIjvoupBatEnlQZxnFN83AolhKrqHkfBK8KYynUOcn2vDzTgWkq1SUAe58
         Wqc7c9G7tiBNEN7Ia4xEcAajaJt65ivqbBuZ6uREioSet2qwOA6/BqQoAmbUGb7Jb2V1
         nQt+T2gOF3dO25T3edsjP9PS+Q27sifwVUxKc3n+tBFqszjEdB3YClg5CmYQ27jnyeWS
         L1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966780; x=1780571580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        b=lscYXyE4jDmUYYF3sJtttW6XG7HcHSeVagmgw2ArCLIjCcP7rfbokQ7Sduj4CCrdE+
         pGR0lC6GZ5Sa2q+S9CUurxswtm/QfJ6wSY7J106EibYInzDTyefv8jAQL34DEND64y08
         QdyjN8FNOEnRQe+R7moB065mYM/ccB7mhXHl6D3rIFhf6MEugBRo3XgaZHUZNosBrtoZ
         WdnHp9oncW8WTu4MaCEffGTR5C2Kl8mvcAiYx36SasyWsE4FN4Hfn5Ruf5azlbv0VzFp
         silzUE6dC35BLXE1GQE6IEfwEMpuTk4hNnpDFtM8jrm/RDT6jk3WevjJJqVqZcNH6Zi+
         0lqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KqW+bv5WHC4abjIyIcCn3Zrn4kD2xn+/ZnAnxUtj9JyrAA0zJqYxPqLUeFGxAXVtROZrxDXKPGrKO4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNneN8xjgZBQ2HaP55gEEMClMRIDgTKvjhGQUu1J5kbba4zbj
	ELkppNEKztE+vCZUR0cVDh+3D/fYugDf3+buN5xYf5EnKkVRE6mr6mSKeYlRIDT41RvWF0FJylZ
	mntvwDCxD7+LWz/w3ZcJuUjQBuXUC7GA=
X-Gm-Gg: Acq92OGgv2PlVOFCzJ9QYIhznTLmBzIrCuYpaMXTraRLCNCpYu877ekcwsl0B8vo6gl
	L0eRJeD1DxzNbayGTKaOE11QT319BsqB1pt4SvS1ouDNO3gk3eHKzxNKVz27740tn2yeY4PWaTS
	Rop3O/W6gJSF2O01jsskYQUDrg+coMiAVnCryS4UIbETeZM2CZVRE/7SucPzAK25CAR/iadweuE
	z0nbHfekYbEcMnxy+OlAUltiTA+WURJmgeZgMco8frAeB5CI6qh/MsR+YvMBPeU7AvRv3PV/LpK
	SnoifwcGpG7gTd3jBwcu1wWECXzYJA==
X-Received: by 2002:a05:7300:6919:b0:2dd:6937:79b8 with SMTP id
 5a478bee46e88-30449035bf9mr14390183eec.5.1779966780131; Thu, 28 May 2026
 04:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com> <20260523083013.46372-4-clamor95@gmail.com>
 <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com> <ahfte9D4TsbgzFQx@nchen-desktop>
In-Reply-To: <ahfte9D4TsbgzFQx@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 14:12:48 +0300
X-Gm-Features: AVHnY4I6ZYIo6G4qxQVAoz1DWMNlxLUEPsCkVjwlCGPGnzxU6KzdrmxGygvJbpA
Message-ID: <CAPVz0n0UO=cJXnSA3hzXy5ye2TTb5UXGdVnqiTKAdaUYUfr5YQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:2=
3 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-25 17:43:42, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:30 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > If the USB controller and PHY are externally controlled, then the
> > > registration of the controller and the PHY initialization should be
> > > skipped, since these configurations must be done by the device that
> > > controls the bus to work correctly.
> > >
> > > Since USB PHY in Tegra controls clock gates required by the controlle=
r
> > > itself, Chipidea core PHY management is not suitable for Tegra.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++--------=
--
> > >  1 file changed, 21 insertions(+), 11 deletions(-)
> > >
> >
> > Hello there!
> >
> > This patch is required because I could not find an acceptable way to
> > manually remove and add a platform device. I will explain the details
> > below and hope that someone can give me some suggestions on how to
> > handle this situation.
> >
> > The Tegra USB controller is the root node, and it is bound and probed
> > automatically. This is perfectly fine for ordinary use cases. On the
> > other hand, the modem used in Tegra 3 devices requires the USB
> > controller to be registered at the exact moment when the modem is
> > ready to handle USB. If this window is not respected, the modem will
> > not expose the USB device, and all you get is a cascade of enumeration
> > failures.
>
> Could you add USB controller device node as the child node for modem,
> and dynamic creating USB controller device during modem probe?
>
> Peter
>

That might be an option, thank you! I have to tinker a bit this this.

Patch 1 of this sequence can be applied as it is.

Patches 2 and 3 should be dropped for now. There may be no need in them at =
all.

Patch 4 would be needed by modem, if it is appropriate to be applied,
I can resend patch 1 and 4 and that would be it.

> >
> > The solution as I see it right now: The modem has a power sequencing
> > driver, and the USB controller can either be autoprobed and
> > unregistered in the pseq probe and then registered/unregistered in the
> > on/off sequences, or it can have a status =3D "reserved" set in the USB
> > node and manually register/unregister it during the pseq on/off
> > sequences. This would eliminate the need for this patch.
> >
> > The problem I have faced is that I cannot properly and manually
> > control the USB controller driver to bind -> probe it and remove ->
> > unbind it from within powerseq.
> >
> > Help is appreciated. Thanks!
> >
> > Best regards,
> > Svyatoslav R.
>
> --
>
> Best regards,
> Peter
