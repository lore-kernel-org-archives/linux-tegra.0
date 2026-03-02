Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13201DF73C
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437815; cv=pass; b=Cqj0d2qqpDAYHqatsgPd0aV6uSj/k0pft03nRWZdl4ErzNewhAQTWP42u00YS8aImps3O+SzLqbi+sfEN5rfDMKCGQzXZ6leXLMg7371gxT/w0zskHyL00htjMIE+xtqcAxCmWijV08n1PSBGakTuuFrt1AyG6beBP8vLmf+8vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437815; c=relaxed/simple;
	bh=F/VV1DFtnaQKIRkN02cTJTQK152TFL2Dj4AAsGC/asY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL5GoU6Tel6IaVwcT45XO7+GIW84l1j71X1NsHjII3zAuixRTSsG7O6sHwp3nwra/xvHwMcR/g56HKAI0dxim+F4M7fN6cKuPGXY2ePBdtMK7umlJl64qGYzZoCatWN8/FzEGWPLpMiTTMq2P6CD+3d4lbeinL8+ctvg+DZVnxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jW4BaM8m; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW4BaM8m"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-437711e9195so3120997f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 23:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772437812; cv=none;
        d=google.com; s=arc-20240605;
        b=K3eku8sS15fJOPOnWFcaxD03d1F3sdDpOOUeIgyg1Mp7II/vVCx+s0U5e+yH4MqBWo
         9DxgmeJKafQV3A+WDbDFhb7rbyT1uW56FIPiYbwYGmY6mba/poklsPv1mEbpf0vcF2M2
         Q7Eegdh4uSr29BhVdD2IeDWvzTZe3ifOMgf4lRofVIj/piMJljrjFhmHG6P11svzPwz7
         RR6EwHnxp37p95gA4v7MqvgzfVayFjNP3VO6IsyyAzs3vFpWDimUsTQwRPY6t7kPV0RK
         T0lQk2JfT/pRk+mO+wlmq+Yy57Kyr2pQID7Eh8jdSoNPfJpPnsJKInIfQ+wH9MS0i2/k
         2JnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        fh=jObtslFjnOFepB1MZ1zjdRVoWDRQQALvRbKEtETQ3Sk=;
        b=ctl30e0cXkyCttUkECSiVVORv5zBiN6p5qlEsoICyjiD592FpuTPm6LwgAB4YnJ4Vn
         mkKW53P6/xr1SOPfL1y9bzd8rWS7GAqP50WoM5eySPxT61oYMr9k/qukr8+3Yzq3TRDN
         End/WQFEE0DXinwRklR+eN8IJzVApxOzujJt1BbJ7aBL2bcOG+1asxjiZIO6URDlmVMy
         VoBhAitasqEs4W8Zku75bdYqvpCLeFHamMP6ntnJPifjiMbBCwpy5GP88tmPgHNVLIIm
         wTdPwGgfmlUCGPfd1Ljm8jVytEzlOmeJy23P6G4JApaG/1cIPkL24gvDQrs58J/WIziO
         ZoMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437812; x=1773042612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        b=jW4BaM8mix8Kprfu0g3fbtY5YUJdAzjjka3t2vuBSMHNwYuQxcGAz4x5Boza5VmCAY
         npuZtXi4eBrC01ygs3hXNNIGL7d7r0eDUP2WwZPPlbVntcphW8PwPRzumxSTVNYK/XBQ
         uuKiUPI1namF6wCaF8U2X4gOkmL2mSe1YzXZpNdSn9TZk2BKKO12tWwi9rXmwVTcvvmY
         C12kHoD39I1JoIF5DYDhWK3ZX8vd1gwkiMakLF/Wzvx/RhQvRCtdct3W+YQ4qFnE2v7P
         Lm8OTRjMyg4RcaGGPAi58l/Jc9hsdFjPyw6WAjsPnQv6fV8gJ/7t6xj+z4C1fI10AhNC
         XudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437812; x=1773042612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        b=jJSkO4AJQVKy7EZjOlpfUeOL4s3Scynf+QXqcVQMQ1cIziuK35xoIspBe26Gmo5+V0
         A5Ebt64pTBL7hdWaSdpNOFfBwnuGAqimKKOIjae5posYpF5Goq6tjVpTJ1TL19tQBpdZ
         RTKK1PsR0kRAKoaPMC1EOgu3sJRbAdIdFdo9xMu8dAujGT+9mF4hZgbveWTcSre7OyPa
         mD+YfdAhXXANOAGTT5OnpR5U3pSP563AQv4k6SglAlWtxRfMaCJhl75t1/vUiv0pncsc
         HRW+yXE7mLs9c5JimYyO1uDq1V76Kra5wsp/CHReaD+dz068JpqEwmQf5lKcowABohc2
         WfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7ek3XtZ/DHI0rKjMMws+X+36Lv0+9oZBJf+Ld1JPIXqcMWSnOsLPVYfJbeLmhzliILG1AJ5QxPGrJQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb79+wZ8D/JrdqbKAc9VJtDi0OZTQFpOppN6oZMMYOKveAx0XG
	KAvyypaZw+wb2dPzv+iG9r1mBLkwg+RYFR2OtxafyA4XqsX8OiEjsSUrrNzvobx1sLI3Z71eXkt
	vyEX6/j8jnqdVErXZOvf+KqtZY55cgtU=
X-Gm-Gg: ATEYQzzM/So6s9B5j6L82KxhNTodU7PbHrs3YA57TLqpU6bHIIRQo/Yjdq+sfqRgEZS
	+NvjwUlJL9nRr7RzgvOFllU+YVm0Bv6pc8KDnaV1ITng0xHndLS6PhRqhHJMguZkRE5XnI4fNHJ
	5ugBkFOMCMO4UXT+xR5jVr38JSLGKZhxszwmAFiBpTnvHv6w6l5CvRMUQBT9wLP99afZWyHZZbq
	LXFoR55CffRlxJ0ut7RNz+ns/NXRP4E9DE5pt5xWYwGv3ElEQyufaZvuULEYDwiqfoS90yHRBsm
	GHaJlwf9
X-Received: by 2002:a05:6000:2388:b0:435:9690:f056 with SMTP id
 ffacd0b85a97d-4399de282edmr19383856f8f.35.1772437812160; Sun, 01 Mar 2026
 23:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185818.78003-1-clamor95@gmail.com>
In-Reply-To: <20260126185818.78003-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:50:01 +0200
X-Gm-Features: AaiRm53sask4yOh7EkJW4oiGP_P-KE9RiiY4x4fThKivWv0vfwt_zCIKqJJLzmc
Message-ID: <CAPVz0n0jgM9+PxH2wHJO+SQY-3ZveuzPPsOQGR=XyTCP0M0q-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] clk: tegra: set up proper EMC clock implementation
 for Tegra114
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 20:58 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Remove current emc and emc_mux clocks and replace them with the proper EM=
C
> clock implementation for correct EMC driver support.
>
> Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.15=
8860-1-clamor95@gmail.com/
>
> Svyatoslav Ryhel (1):
>   clk: tegra: set up proper EMC clock implementation for Tegra114
>
>  drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>

Hello there!

May this patch be picked if everyone is fine with it?

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
