Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614BF51DB1B
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908842; cv=pass; b=kblQutg0PaLdNSrDlz5f71MfPNPM/MlynR/xoWRKXlAKF2f9wyyN8RnNnYLcMaaK/KztCbPWkYFB+MlY1JQ7pbh6wOMtg4sQIyhJC+Leo0uR3JlM4qmfMC5+GMZC9oW6PC4yFh0xbTUfx2qFc7PDLQrpdlNHKSctSt5XXyQihj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908842; c=relaxed/simple;
	bh=w0IXztAu98K98cCd8kCaVJg3QAtMwDa5REUQqF4U6dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bw8vGwGGfmBkG4uZPsmt/vDxKWA7E4rM8ZKko6/LRNVU2N/Jl2mr0BFHxabsXSoHBWjP0xBDHy67zg7nG9m5NB1IAoLnA6LmDNvK64BMmJFvNajdb+z0MWcmRhBOhxRgPcAtz0rFL2h6ggfCrYXGHW3lcTSswdIciNfArjKumO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAwz60jT; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAwz60jT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so54311eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 09:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791908839; cv=none;
        d=google.com; s=arc-20260327;
        b=T7jaszhKbDQy602jdPuynUZ84eJgLOkTcbS+9zdoLqpv+/h0Iyk+k+dmfYJlGvfZW8
         J8XUkLRmfAg3ogDJ4HcH8bk7/S4wyIFHsgc2AT8B6kfEmAuUusHbvb2nOTEHP/hno6eP
         GQmAc/zOWCdtzHRMLB4Z4Gw3kudpBuzjlFzcDTk5MNPxXI/jzgEh+gv+5BU7B2xf6kq/
         XZFr7aKcXydaA38ML7Qp04zcq52wH3B4YCPT5Sct4+CfMq4I0ID2adHbJfMV9vmpGn3r
         epPNpNxuFu99CcV6y9Vp9JUttb3YGr5ZO4uPrdCTw5Xf8vRz09ch4w6IPQYesYi41MJs
         7Cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        fh=nJ7xUN7iPVgpor4ineEkCx1mkQfBDLlUcrcGFeDFcl0=;
        b=dBayyzfOZ3B62CccolBFmzJ9dit/USQaJQgvzua5BfARGdXGZUeFstpy0GnV1JhPBl
         z/5WNixQzk6/o4iUtj9f3xhpNjYsq+xLzZii90kikoc+SRM9rwQpU1VDhQEQL0BOpMC7
         8p0xtGNVvPyP+ZTMzMtXZlTNyNXiYnjQs7CAYRka87yEEqU957PD+1nD9yVOkveoQMHz
         ASkulDHldEUVSRUybhT2FN38acUioX6S+v+jNojjgfqjoIF0or/SMOpGpuTxYQTg7b1H
         clZLOviyMvDNV2lm4J8FhOVMFiJXc3O6Yxp0tOQDFamjs0bYJ9rRT36Gp/1s5XOTLydE
         Co2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791908839; x=1792513639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=kAwz60jTjbXZ1371SUWeIG50qMgcdtsu5vM68Do4i7fJ9AvXrLYXxi9ATctv5C4yfu
         iKRFsv0E+0bVccekECc7CRwDvTecF/0JE3S2LAHroLpe712G+NNAZKESuMmUoSHLjYfV
         h8rpk5auJVECMX+ymh3Yp3z9dK+JvPvT0mjjf+i77PwAB5KG7sl53zFvVFwtsZBTYl5e
         wgES8+x8HofSP+HdUOmGgjJaDgxtqUqjfH9aw0FzADG4EOZUqi4MEAMnoAsMS3enx59F
         P/52p8VFiL50edSVcTU+xfNQUFwJO8xk+bHdZK4/CouCoF5NTSi6OgwQHLGtmBKVJdII
         P2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908839; x=1792513639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=GmEPT0CbIKvYiv9P2XIdMtfcFYluTXfyqnbwRvQkHRlmwdhy0M1WqHDjBKbe2d8QUH
         S9Ub692js96honbZmDWBsU/C1NQB72VWILMwL6tScUtfGjctMddusvulDXnoCp6ebrqH
         qrf/xqJMQDKN6MfFd+caZffxIrWFU551UpsnGwihb/AxFIqwP2IWkM79vaJjx2KyqWAK
         +7FYgnIBg14XetMgEDUxL3jcs0lea16EYv0cFpTxlNvzGAEJsNmK6tG0s8jablYIAHp+
         vYH+pRf78oQxMSfqpk+rwayF/cwcdUXb0AByERLj2ojDBsyEFuSYDVTzN+GOo+bAxEpC
         aSyA==
X-Forwarded-Encrypted: i=1; AKwUvBzGVud4vI2kIlmVo/cPrjpPBCJTsO3+IKc/DrnbAX2x/KJ83JRIA9yiYzLWqxe+luJZAwI9CumB6qSJEQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpt4WYhYoEOHajL1nXQ4VtO00a1uZY7yVlDRn3nzmemyQt2onU
	9AY3nwYSBLuODTYm/ktge1esVm9CBB7Y4ZLlCnNLLaVREw+vjRSPi5wVQkGmFEoUxpW3p0AL13B
	7Y6ma7xLE7/g+70JSLm8H0jrOAF8TXno=
X-Gm-Gg: AYBFou2L/DK71oAod3ka/XTkMeNU/Mi31t6VSUrg72oDsk4XbRA3IebFYrYKv8iCDwv
	hGDWdBSVHDYjRQx7l5eZzjNGRyRLQTHTE/mcsd5XBuiQf3jEZv0UqXXhtKYiRkN2wAFAvKUZOi5
	4Fjs52oJCkana0jx/zcmGR/s2q/ACuQp73xQSguK8AkanKD3BynI6oeeDoUu/A9FWrZc/9bPHoT
	67G77pZDA7ZHgZWBVCoO02Nx3czEHAzDnAPbdD5cIWDKDZNxtceVXV97obgzZdwScSRGPjEQoyQ
	tYCE5LifjDCXDa9DhBHAGUqOmL4fhcXEsuTzs6WsB2OhpYtpnlHxetVfam5QJkx5lpPQIdGyPtY
	gtoJnNs8cPjCiIFxGer83pqc=
X-Received: by 2002:a05:7300:e002:b0:35d:5a2c:2321 with SMTP id
 5a478bee46e88-35d5a2c2980mr575512eec.20.1791908839126; Tue, 13 Oct 2026
 09:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
 <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com> <as5XpdpNm4cRGNcj@orome>
In-Reply-To: <as5XpdpNm4cRGNcj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 19:27:07 +0300
X-Gm-Features: AclHuK_-dlj4_NR-HXsrfbWG6hEOQBskE9gcB79-TNecmzBROYTdvzz-we1jX0Q
Message-ID: <CAPVz0n3ki1MdkUnK=znzt=uSrwRMbyXfdvGzNrxuB7_mCK9F8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:1=
6 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 12, 2026 at 01:56:48PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:55 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 18:45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > Add nodes for recently supported device (ALS, LED controllers, hapt=
ics)
> > > > along with minor tweaks and fixups.
> > > >
> > > > ---
> > > > Changes in v2:
> > > > - added USB configuration update commit
> > > > - added p895 power LED trigger update commit
> > > > ---
> > > >
> > > > Svyatoslav Ryhel (9):
> > > >   ARM: tegra: lg-x3: Adjust WiFi node
> > > >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> > > >   ARM: tegra: lg-x3: Lower supported suspend mode
> > > >   ARM: tegra: lg-x3: Add light sensor node
> > > >   ARM: tegra: lg-x3: Add flash LEDs controller node
> > > >   ARM: tegra: lg-x3: Add haptic engine node
> > > >   ARM: tegra: lg-x3: Add backlight LED controller node
> > > >   ARM: tegra: lg-x3: Update USB configuration
> > > >   ARM: tegra: p895: Update power LED trigger
> > > >
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 +++++++++++++++=
+++-
> > > >  3 files changed, 127 insertions(+), 10 deletions(-)
> > > >
> > > > --
> > > > 2.53.0
> > > >
> > >
> > > Hello Thierry!
> > > May you please pick this patch set if you are ok with it?
> > > Thank you!
> >
> > Oh, you already did. Apologies!
>
> I picked up version 1. This v2 came in too late. Pull requests go out
> before -rc6, which in this case was v7.3-rc6, released on October 4.
>
> Looks like only the last two patches were added in v2, with no other
> changes to the other patches, so I can pick up the last two after the
> merge window closes. If you don't hear from me after the first week
> after v7.4-rc1, you may want to resend the last two patches again.
>

That is correct, v2 has only those 2 patches added. If you don't mind,
I will include those 2 patches in a different patch set, you don't
have to worry about them in this patch sequence.

> Thierry
