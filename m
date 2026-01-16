Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596293612DF
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565578; cv=none; b=sLqXTNVPyPh7AdAuTUL2xsz4X74RZAoBpgMOPUWaAvwarZyqEMKoeX3ToLMX/q6cikjokakzamefu6MKlozVyi91YjjQj40pwTbe38NWX/I21kvyVr2XyZIibCXb+KjEej73vSvcXieYKmJ+3Xm+ZRAE8jfHuWmek4dvhAPNcOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565578; c=relaxed/simple;
	bh=BQ0cbHfLN9zZur9JCPSr7twpHESSCdMVyeN2+noDSwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVtoI2/UZucxKJDOCLfcxuXPm9L0dri6FqZuS4EI/t1ow60Hs2s5mZxlVMy/fM20jQvzjfQElIRUTmvbtcpXKO+JMzr64UJljdOJMbepEoTAf7paD/DDkLFTIqCEymCvWVAgich+UicEhwnZmXMZ4ecHf7Mht3CfVJchlDMpl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1IV2Ps0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1IV2Ps0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso17728365e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565576; x=1769170376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nezfiu/jRSCcprxtmv1XkgrIIZagcw7MeNBjserFnRM=;
        b=A1IV2Ps0hViRVoKZfFgMcX0JY0BNAfjIGFWQJYhzjkY7PI+NesBuiCi9lgxjsg1tD0
         7oMVjoH6OhBeBUu8alDRsYAw0DTdxeOFMxsBm82UogEZjRAatI/ICifMvdAUD/5LEg+C
         dVchhxwoMK/AEHS3Q1oygqqYK98ietAe21nIxCSn8k0a30VkpCkKmF3AGAUf1cpSYlnN
         auplBxrUgEYQArVxfrLQvtmwSCw+/IUg/7k7xgOJcyIc4zVO6VIiTbfHQKVD55rM5FNo
         ZBHaVoXxtEokacViNveIpXD18FusjAVXu1TTSfUQ5QAen4FsoM0HW4Y6b2KDGQMj7iAC
         girg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565576; x=1769170376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nezfiu/jRSCcprxtmv1XkgrIIZagcw7MeNBjserFnRM=;
        b=LS+BZWHajQsNQJkAGDMagWCGD+ta0P8vSZjVzHAXBEEo5U7Eiq+W5EoXma3KQ430RX
         OHP/IFOcyolEapFqvE+sS/2GgbNb7Sap/QuAfGDuRaslzmjNZ2uz2kOlI5QFskAyGCW3
         Pan8IGcxk/Q4BJV0BsLtASrdy6Vw97IFhQzCnwpA0OlUFV2CCORg1wUQVE7D+i1UDzAn
         kUr5Nv5eIa/9ir/FNwuyQmart67IwF0TqpjQp1LHtLlPMA0Pp4qKJoPjvNeASJOtdCQw
         aWdFimDB1hBxQAOFIkIciB3dDwRVHyxwQ8pXtDwvaNKR1hLYcmyNfILmLm1bROJVQqcF
         ynEg==
X-Forwarded-Encrypted: i=1; AJvYcCXm0yDNKMdBv0/ttcv01XGObjQDVTV45vjGQDq2GdzRwEor/wa/fVQ9rgm/j9mDf7Wvw0IKHb+Sltb8Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWixf4tNUrNN2Ca6DKPd0dmpWN4LByQH9gl9/q1UpoypsVLbL7
	hbPnU7D1a6WECIdBHV77QkuDaapftsAR/b/pJGwH5ziRzpdl/ncMcyto
X-Gm-Gg: AY/fxX4aEOuCB6x7X/hSDnVr47lQh5YmeLvatUc/FiDhnQk2BXRAkfGDCB18KXbRYRZ
	8FM2um0EHMbW+MY7yVnS4xVJMaEdAFNDgJwp8OUYcs1EVORuw0Ks1LPuO3w9YYxyiGdmTH7BfPL
	Eb1JhC5g2pCe5qRBPGPzeK+610YWfLNT9EzlLxnODHLwE3yQzKxzWewIe/v1mLDBuvqcRIGrRwD
	4YCiamCq2Ho/L69/2uX5R5fSkaztJFfTKkwtJdH8fj8/lpTWdSkL2QGKH3KnaVHYkm5MGcrgVTI
	jE/Io0ODGrdQsDEcU7vgbnTF5JpPlhBMBeWeSW6186yhx6nNukPWyJWYycTbC9o9vFsUOEPd113
	PSubpP6XWulhEc25oCQ+BdJtoD+0CtcFzOyA/New2MUOxK+tkpZiXr5qNZqvxXb2/TwrEsvMbin
	Uaip0lrOrMmyy/YE/ixUKapfMOcnQoMQqnpFOWffXwG7u3yX5bbN5HCTANVzkBFClVwar37KLaC
	Q==
X-Received: by 2002:a05:600c:870e:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801eabf1eamr25748685e9.13.1768565575516;
        Fri, 16 Jan 2026 04:12:55 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm4882497f8f.20.2026.01.16.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:12:54 -0800 (PST)
Date: Fri, 16 Jan 2026 13:12:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, arm <arm@kernel.org>, 
	soc@kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaron Kling <webgeek1234@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
Message-ID: <aWorI-Guec_BgpKc@orome>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <aUPrVFWKfFYmuwhB@orome>
 <fced85f4-07b0-453b-9969-19abbef3f840@nvidia.com>
 <c41a9d20-2221-4429-91e6-74835f89c9aa@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bag7egz7mgswbrx3"
Content-Disposition: inline
In-Reply-To: <c41a9d20-2221-4429-91e6-74835f89c9aa@app.fastmail.com>


--bag7egz7mgswbrx3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
MIME-Version: 1.0

On Thu, Jan 15, 2026 at 05:41:51PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 15, 2026, at 10:50, Jon Hunter wrote:
> > Hi Arnd,
> >
> > On 18/12/2025 11:56, Thierry Reding wrote:
> >> On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
> >>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> >>> Tegra210") populated interconnect properties for Tegra210 and this is
> >>> preventing the Tegra DRM driver from probing successfully. The follow=
ing
> >>> error is observed on boot ...
> >>>
> >>>   drm drm: failed to initialize 54240000.dc: -517
> >>>
> >>> For now revert this change, until a fix is available.
> >>>
> >>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for T=
egra210")
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ---------------------=
---
> >>>   1 file changed, 24 deletions(-)
> >>=20
> >> Hi Arnd,
> >>=20
> >> this is the only patch that I think we need in v6.19 for now, so do you
> >> want me to send a PR or would you rather pick this up directly?
> >>=20
> >> Here's a link to the patchwork for this, for convenience:
> >>=20
> >> 	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744=
=2E184153-1-jonathanh@nvidia.com/
> >>=20
> >> Acked-by: Thierry Reding <treding@nvidia.com>
> >
> >
> > Please can you let us know if you can pick this up as a fix for v6.19?=
=20
> > This is still the only fix we have outstanding that needs to be merged.
>=20
> Sorry I missed the earlier message. I've applied it now, but in
> the future please forward patches to soc@lists.linux.dev if you
> want make sure they don't get lost. A pull request or a separate
> patch works just as well, but sending it to the list means it
> shows up in patchwork[1].
>=20
>      Arnd
>=20
> [1] https://patchwork.kernel.org/project/linux-soc/list/

Thanks Arnd. I'll keep that list in mind for the future.

Thierry

--bag7egz7mgswbrx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqK0QACgkQ3SOs138+
s6H9Zw/6AgU5obKTuEfM7NpdrMLmcESlxKcLgpUsvp0zaEso9kqAMtdAyr4I0VRJ
JJ4D+WiKchf7G39Y8+z0WsPlGNuUyu5yDOeMEJkIFnQ23CDf3g3TIkylE/0K/Vn1
Xg4rN77pA/yCswpJdaCET4qsTwgu8LI9/cpKxe2CnA6WLRE4V1yvdZoTCM0LOERq
MRyM+JV84Lke0wUKrSOdtJbf6aPHZcC+93fx8BwQ3p6mdnbT3az4NsnlM3FFED2b
qcN0Ooh576knA8gjGVhAY+3s/GVi1F1+0LlNrtmfu8s2/NKvTCWZE96nL/oABHu+
9Zz3yMYZvE1t9Gzu3a37JUf9AXYrwr8uxMygEuJcUyQfubbvsktGpM0Stndunbja
JEj/fKyUJrp6e3O8K5pPy4l2yVpxom8I8OgLfRVQiG8Xou9DZ8BhjZm84RGXb64g
aLbgYQqDOyZZkcrhwcl+TUpd9XX0AqbU4ChCcEGq3irWm6dV+9neNxHe0wml0Wpj
9n6Ziyx/+zZ7XlZlha7KKRRV/bWcfT2a4gmPJT9EwbpFvhp9t5WMJCqprQqH95zm
sTDxCWTPpz3YLk/zGbxaK3gmSsN8pZyItuM4+WV6no3sOUDz4PzR8lIAev+Icn36
Bd0kHPLNep83NnGQM3pufT6BIKX8KnJK32uWX8XOQXtliW6tFpU=
=lTy9
-----END PGP SIGNATURE-----

--bag7egz7mgswbrx3--
