Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887AA2D4B53;
	Thu,  3 Jul 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538589; cv=none; b=tcQbxddp/dMCcbn7GeQ/nYucw8mFglasI3ymUlj5M7e4tu3JaSpM0eNq/a5JQOSg02ZAmhYHKGQ5gNVTOwpQ7lLM1OBGa6k0zE//QS36bM+ocZQeyfnqJDXb8c7YzwclS3zSspEH/jec4H0d+pA7omDFs4I4Xt8ddpqkQKqsaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538589; c=relaxed/simple;
	bh=DfGnchHk+47aD+/Oq0CFsPCNlWtAsW9vtjjabJOk2KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRftBKv09nFqzzhAOuKHL2D3xMimjg7DA9kIWaXJIJxNC9loHF61N30OTUmnIrZv2/QrfPLHZ4HcxX6EsGeqIsHng0Krs+3Okpmeir5+IoYK52cXvyW5M50gT/WzFYDZno2Y8K60tTt4MAfENJRgCZ36VbmKMpKoD1XjRF3YUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqfI1Eao; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqfI1Eao"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso56037835e9.3;
        Thu, 03 Jul 2025 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538586; x=1752143386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLiPAdPbdrm8jm7i2TOTmg3Lel/oAdjLVNTXmlhCdPg=;
        b=aqfI1EaouWituDLtuxuKFYX1u5tgDwmvQTCJNBFlbRqT6UlVNQbcbsRMpz7M1DMVr8
         0k4UUDbGu0czhGesyg9z8EVzHah2yYCaYtR1TKfjE3piCti9KBsu8oUWJwUUwbP6hgOP
         kNPITT/XZxAzIngCc0HiNqfraIkchxazoz2dkycDeWbJwB7vCAtzXpJWL7SQHqzNY7Re
         +7TQpRC/3rmKsp/9WuXNkNwWcdIj1hk75fHwBEo+CGhbOkr6OVueXFY5Hr596HW3JPub
         urvCqKqZJiiJw65qz0ECkAk4ynnaGwdumWRBONluPf0oplyJ9VTYf2a4sSpmO5uTSBHD
         rX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538586; x=1752143386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLiPAdPbdrm8jm7i2TOTmg3Lel/oAdjLVNTXmlhCdPg=;
        b=bYUPFpmb59QZQq1LSxE07zHFg/CkOgTRO0dmyF5DKxlRNP1GJgVI1UmR4EQdNZeGul
         YQYdo+EhEX+QYMq7JoTnSPqEtIAY04iFGBwn9eJEpc/Coqg6W/F4qr3DdIViQv9pmegX
         /9AxUsJC0Ed41KHwyWF0ayezN1/0VJnpCGLZyTH5JX2hNe9RPyKv54QZMRiQd+Gxl6BM
         FlWprqcn/RayJL1XuL5iZjC2ed/jh5lvOkW7DcwtTXCJN71F3MyQid82kX/7FyVkRNLX
         zHl/jk9c86yR5bwYFXLPQ3Sv08TnjlaX1TAlTQK7vDaPMzhZ/yIfDE6oAEY0DvHjte/K
         3ppg==
X-Forwarded-Encrypted: i=1; AJvYcCU7preJ8DkPwcK0X91Qe6u63d3wfRqgg7ZlPEN1Oh1QHnV2tulQhwRVliITIJZE5TQ/0NimW7UhnKKkOQSQ@vger.kernel.org, AJvYcCUYH3Y5ZtELg4Qu4QD9UKmVSMB57eJMdj3H1m0nGRfSondW9jACX3M1/+RKoixblCAs0kPD28Kpklm1AfU=@vger.kernel.org, AJvYcCVxZBPn6pnqjQHmDX85zkwBsbHbTvEdlmbZ0OTHqBAH0LhgzRz+GGCsED+pme/P+DM8ifOn1TOYRdE7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3FT0WUhghEtBQWokG2/SvSvJOEjj15z1EEflDBr9WhwRQV0wI
	vrYsRMr4IoM4M3cyjrwmicuHuBTUlFV/FZGPSmGHIh838/CMWucalhBV
X-Gm-Gg: ASbGncsdZMkZUI6quykIl4BR1eMyNbbF2K9nr1aO7hhcwRK/mpy4sOAuGvxxTFYZmWC
	4PriLjC8BchloONIYUzgEcx4HONIjRYs2Dezo2hG0+XlArKLRL+ZY6Ywil/aTNUavv8ql7BkhUU
	2sTtMuyj7iuJ3+pYX6sKJyL0BF7dixL+1RSInapvcjmu0/bb7dbOxnDUeKMu+9pJmBE0YIgdzk/
	jcXOuZ3bFkmrcoG0ylr9V4bVy1s6kXLDxa+qaF3ZVlqoaLRMVzWt+YpczZSkDZvkU7xJH53mdh2
	lJzmTLNM2pmWnKUwq95E6Ch8ZB9CDAz6fmOfZ+v1hDuEfkE5SMzyTyaL0xTl5kUozzU/YHGhVoF
	MuifNHX/LsbRgFaACgBjyMapyISKitV9KJPc2IcY0AAia0CM+
X-Google-Smtp-Source: AGHT+IF7Aah1Z5qPJ16tcVaWxl8qXHHeNRRpxEkHvOcdmmujmk4tY04GWfTTFQ7ek84Q7ZKLk8/lcA==
X-Received: by 2002:a05:600c:35d5:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-454a7e978c6mr35782675e9.1.1751538585570;
        Thu, 03 Jul 2025 03:29:45 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e528a9sm18617895f8f.60.2025.07.03.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:29:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:29:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
Message-ID: <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32bsinsadseqwdry"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>


--32bsinsadseqwdry
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
MIME-Version: 1.0

On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> > dt if no reserved-memory node exists. This prevents said bootloader from
> > being able to boot a kernel without this node, unless a chainloaded
> > bootloader loads the dt. Add the node to eliminate the requirement for
> > extra boot stages.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/=
arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..8fc995e71696f2ef5e662a2=
1feb96ea771c7a53f 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > @@ -22,6 +22,12 @@ chosen {
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       reserved-memory {
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <2>;
> > +               ranges;
> > +       };
> > +
> >         memory@80000000 {
> >                 device_type =3D "memory";
> >                 reg =3D <0x0 0x80000000 0x1 0x0>;
> >
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250526-p3450-mts-bug-02394af31f0a
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>=20
> This was sent as an RFC to see if there are any better solutions to
> this problem. Mts in l4t r32 for t210 tries to copy the training data
> to the reserved ram location provided by the kernel dt. But if that
> node doesn't exist, it somehow corrupts that dt, causing later stage
> boot stages and the kernel itself to fail. Since software support for
> this hardware is EOL, no fix for the bug can be expected. The normal
> Linux boot flow on this hardware involves placing the downstream dt in
> both the bootloader-dtb and kernel-dtb slots, allowing mts to work,
> then u-boot loading whatever dt the kernel expects. However, my use
> for Android does not need u-boot, as nvidia's cboot can load a
> standard android boot image without the extra complexity of additional
> boot stages. And I would prefer to keep complexity to a minimum. It
> should be noted that this affects p2371-2180 using the L4T bootloader
> as well, but since I am using the Android bootloader there, I sidestep
> the issue.
>=20
> Are there any thoughts on how to handle this problem? I know that it
> is typically undesirable to add broken bootloader workarounds to the
> kernel dt. But it would be preferable to have a fix upstream, instead
> of having to carry various workarounds in downstream forks.

Given that these are all standard nodes I think it's fine to include
this.

I'll pick this up later on.

Thierry

--32bsinsadseqwdry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmW5YACgkQ3SOs138+
s6E9fw//fouO6a9gP+IJY3hNQFyxIu1syQPPc27sMELhtHdpA4hMnMY6ORM6Gqy/
0japTi8K1uTVV4K/z8xlyfIpb7WfIkqBGYXt9XK6buwKyfT34b69V1OLZBn+ydxW
qN1zzDZUWxvmMvSpOtC+qDdoS9CQ98i9xqQeFuEo4f57yfIax2rdbLfZC1kGp/se
VVumx70VZ60QXAC1O14MRYFrgH66M0h0++mKSLCtZkEC8wu2yThBHQRXIwnjbGXB
PAOcFb+yUm0I75XDhYMZbJx0kOcZEYRlKJM6JwST4lnB6Di8nXXTO6iSqjKjG2ax
oGSoYLJ8tcWNrwpNCZ1D7NdtalcKMNisqvVkDtkedhg4H0+Wgzz3hERtokLnqFjl
Z63B0j1xakbX/yPXpK666MZkCksXcFXgSKP2mHVrfxXzHJiLOqxBcAonn9iskjoK
4dCkQKNfPtLOzDqpu7e8NHlFEJnb0fUyq7G3qtwWSAlfTw549nAr2/OL3vu9/FLR
gIeyqQHXc1PfHce3SiOG3GGeMFw8YbG0aiCtQKCwxR8O2uUJCFHF2rN9/J4jBPIK
DMEEZaDIjCmPdJXozh49XKOV0+/P6aI2/9pumQEjnC19waqkc3PtWT7uuTPBpLqb
G53Eg00xODR0gGjufQHTwKr6WJk0SRBdRHLGgpvB3O7Yd1EfjlQ=
=fuS+
-----END PGP SIGNATURE-----

--32bsinsadseqwdry--
