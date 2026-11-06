Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974205;
	b=jgx9pmtxi83FTmRt7iLofLsStgpXQNejjckGaUPmKgNr+YyHyF5yHiWUteG8aZm9ACC3
	 ydj33rNvr3vtuwCPfKb8TuCVmfnENc2MzVrwdtpKBc7Ms4T4eNWmRrQZAJwm50vKJZDL4
	 soaaRJl81Gda0kbMvILgD7awEDNiTHleis+tarzOZUCqH5ymaBkd4JhseEh6KcZfW0IgK
	 zv2vt5H1RrijqAIxHnrw00Ts4oDb6NAeOHWAp3dZlQnKnZUWNcN9EAxH5RFcooj9tU2Zs
	 bzQgWxGFrt2+HMrRoi4qKHAs+8ITKl9MXZvddsg06iHIyjM3nHsoyDpHeCg77Hi2jvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
	b=DXDRhevmTJh56rdR50iyXBp/5QO6N0mEi6RMHxw+OPpLcK5hmBVcOeLzRT5a6XBR1m6G
	 dk2/CDOMlF3OIdWk59rNljORTG9Ts/lAOtCelTy8bC0V1RmLCXDI2Bt0L4+yBm7Qw/YZX
	 gPrMpBxOByV7G3LA3S1OOnH1CkqQRh3y5ku1+GlTI7OMfZWO6FjkafNb4mWGWVvp3/9R5
	 pNaeSz3iCdIh4EjPbGHht63nDjVYMXcSwgDxlErDjfIMbCaT1rjfKwCWAs+0eNVVIDXYs
	 p9Fqilm19aFcPL8G+AlKkOfqoRK0w62EXwuG6XV3P98l9jRQDNDLdd+v7Yd53UwuEgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oWxmGrI/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C64606A338
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C64606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWxmGrI/
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso105623166b.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974192; cv=none;
        d=google.com; s=arc-20260327;
        b=iSuKBExswpBskscs1iABTuK8P+Fssc2AaGKyboy/eiX9OWcj0Q0atFIDd44MfYxUKC
         3TOtzlN6E2XFwUy6B1YsdJWPOipzUliJNw6qav0XCSnzTNg8KW1RSg3NWsjIzazNj5QG
         UARX7zYgOBPWuIyUA9SPFKnS7FoBCV17jTp2lALqN8SpoZDL3Ht4yuoh0AaMIKtJbAJ0
         lYfB90Gb3gO/bshDJJdbaVE7ggKVStCWRGevsUu0k03lw2FMiDtPiYyVAbmMZwD4Ii/W
         Cc5UGgwMKuhHgkVGEr9/E1qXhQ6tV5q/o8ZzudZ+03juNfm5g0ESesXAOmW3tKRnJjw9
         tfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        fh=+FTc+IO/p3DwvLYlKnGy8X8Bumaa7Dqu5/GXVmpks9U=;
        b=ItrFDu7x3AHCqKfzuey5fRb537TP1qRj13el8SoYFJc99CkH80sHiRWLuquOBXwzpx
         z/GqlCZ09ujAFCI8PIeXKwwbJ4zp4Xn3f0cJMaG8KG5/dCvnFPAO0q3rm57/+5uby28H
         ppMvoop2Uq5tge1uv8ytf3zK4ry62wwV1sB87i79U3ycfM7XWCgN8eZO14dY7/dew9lx
         SYrg/cu9HFFAr/ak0auGfgqH/Zpejk5/cfN0cyGgOyEotxN+BOAih4iv/WrWoM59W3mr
         /p7oCP2udIRRmmoGJHpqYxSPbm5AL0ihJ//ptxmzOgmjhC5OFV8+LNhwbiYB9+gQCTJT
         8UbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974192; x=1794578992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=oWxmGrI/VLJ1xkgXDpseuv1p5AaWUS4yXjq0c4PJZxvcDs7wn41s5xKxp/hpBp1jOb
         rawxidujgp1ZMtTuPLlKDGJiDNUnIWuqEqlbOo1MkBoSyhw8OU9StvTCZvQ0r6o0aJZ9
         iJ61Zxh++Llmfcvtz+7Ekdl2U6+8qrAw3X9aN/iZlqFTGFWKK8OUi/ngoRL9HXF23nnt
         Jd9Kch5lbgQM/f/WMcdqeowB8nYYRi9kg7SMzhvwHg3Kig6nMDaph9kx+nf+o2zyyD5r
         DFeeUlCokM7AWYjCtqhsPzR5JDFGQnzQi38/Dbvk7ZdxI4gT7eAYem2qSINnCMwwLpb7
         Uxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974192; x=1794578992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=gA+P/tyuJ9FxtrK8aXbGkG1b671G3EzriYU/jcPx8N8zCoQAj5ZCc6GvGNKojF5kLT
         V7CGVXyOvIXpdTmrjXG/C692eQbz07gdSvVVouvM/Ms9h3gkjZ2YlwHmxGNHfhpKLcbx
         ngzWgOKKAruxM+ZXxVYvnr5TPn54s/Nhb2VThyTdDLTct09MVWbPHwYKGEx8JKvRw2UZ
         /yaTC6aUNKXs4Q9QG1D4Lan76ktAfUdDHeqUvbZdZZO0SyQXtlYFVlroik2qoUOWe2mm
         e6KpLpKNQ+LmfOWJ7SggH8sZxBMazAEF9UhggFG5yAespvEHLZ1eRjyCa8K3gpIo+7Mw
         7h2A==
X-Forwarded-Encrypted: i=1; AKwUvBwQ2wM5iph4jF5aWtcJUar39/BRl+dZZI29MevKngonONKMv3w2vj7JSoN7Dd2mcF/QmFE//mJQdAvtSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GycWHyWT9fWijT/YxIxVCy7xguB/Inox4k7+0Ayu2wyEHtq5e
	0otFEVhuvkmkD11Wbo7VBGXl0ZDg5zoX6NEqq1UT9DgvHsHMSvtYvQUv64rM7lL7xjJwYC83iUn
	qcxYSxj2pjfwVPDya2wWyBFXZJ3/zprU=
X-Gm-Gg: AYBFou2R85FJL/ruova/Gf4zhYeovTSAZ1XteoTbS+XWTOssbslYBVYUBag4GnMI5Bp
	oNa6ilT1lJWdXLcqOxHfni0iV0PiTXG4l55567G8Em2zT+onGpYS91wBhIYhT/GPP5bbJazvz/m
	NJPW1DxcDxmUsqDiOkRi5ijEUUBGCELyszGmTn+4EAmPFh4YLiLisBkNCOJb/SfXpMUVrm/u9uQ
	vKC7XA5tULGDPCfCxA5CdQdozj8Mvxh7Oab8F5hvSHp0TJFRQuosU846kh+JXhE7UP6OjfwwC1w
	n+oJEokNKNH7O3TbMzBwcJXlI1peUTV9dx/LWJNVRLChpqptdyYFyvt0g22VoMFiHaS2vcykFiX
	tVZJ/M4P6jk9zGwcUNmL4k6N51DQ8GbNadyusnMCpciatQICehWJlHw/guFncEq1P2wuX3bQ4zb
	MwxCmkSJX6/Z+lHJQ7iqFMOiMea6KLblc=
X-Received: by 2002:a17:907:c0b:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c4d352c83c7mr245800666b.24.1793974191437; Fri, 06 Nov 2026
 06:09:51 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-7-clamor95@gmail.com>
 <au3dMlmsLEOUqan9@orome>
In-Reply-To: <au3dMlmsLEOUqan9@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:09:36 +0200
X-Gm-Features: AclHuK_cVVXjJEkd02nCSMWJMQCoAmARR5pIv9xMRuv91xrb2JMaT2_t676ijeQ
Message-ID: <CAPVz0n3=R1UhyTw1o-ZR2hMyXwKAomNkb5O-cQbG+TBFJi5=JQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm/tegra: Make panel parsing by
 tegra_output_probe() optional
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:00=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:06PM +0200, Svyatoslav Ryhel wrote:
> > The tegra_output_probe() performs panel parsing unconditionally, even f=
or
> > devices that do not require it (such as HDMI) or that handle panel pars=
ing
> > on their own (like DSI). Make panel parsing configurable.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.h    |  2 +-
> >  drivers/gpu/drm/tegra/dsi.c    |  2 +-
> >  drivers/gpu/drm/tegra/hdmi.c   |  2 +-
> >  drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
> >  drivers/gpu/drm/tegra/rgb.c    |  2 +-
> >  drivers/gpu/drm/tegra/sor.c    |  2 +-
> >  6 files changed, 32 insertions(+), 30 deletions(-)
>
> Does it break anything to try and parse this even when it's not needed?
> In all cases we error out early, so there shouldn't be a whole lot of
> extra overhead either.
>
> Adding this extra parameter just adds extra complexity for seemingly no
> benefit.
>

Dual DSI panel fail for Xiaomi Mi Pad. Maybe you should check your
email a bit more often?
https://lore.kernel.org/lkml/20260305161035.64548-1-clamor95@gmail.com/#t

> Thierry
