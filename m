Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3389BA33
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979585; cv=none; b=HWpFU3wyW1JLqWoShyuG13LWHEBOSsXrhfMRObNi9g/767XdBrdeCUuO2q5Dw1Ehw+t8ic5iKdB20TwdgOc01Yehk/CDr76eZ6UTpwHWZTxgXZg6Q878rjLyD+ewDrucCqqYuD7RzJMy2vigUyftN5lbteTSIeQ/x9r3tvk3Cac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979585; c=relaxed/simple;
	bh=mXciF9Fm6pC7kh3B8YP5xVXVt7rIWeqAyWcLPQYDdPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbZj5+Fy3s3otKk94j0OJ91+vdXy6/Ru9fqb4AqoXw/DVR5wQscxaubHdH5zPEMwa5Wz92RFo5wfuI8iazyeE6NYX6XRB7oCT5CmZWkJ99saJ1nSyndNvQ30JOxzq21J9jsjza0jCI/5UBe6QSPgwqQVbPNeVm8o2E7LcOKTM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0ZeOQ20; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0ZeOQ20"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4561607166aso8189545e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979582; x=1754584382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=d0ZeOQ20tqpA4F0NA2dpL0BeaqMEcQMksT1HHnWatULohLush+eZ/MlxpXGDMbFlSF
         pS3bnI3tsLtdYLnEwxJOmXjnhdC9ZSVOvc6nuwxD6T2SUXJ/JInkJVX3uOoYbgysWY/N
         E+tihS0YoUH3H7riWiBeOe53Gaw0WloyQMTl72vrewjgyDNcoIcF2pbfInUI7jdnA9Wx
         HFVftcVBKKnAuWbcllQyHghYoss3bNut5ACWUNBRFB41jPePtOjJ1+4o9tyzWISFOA9q
         ZjLlbN2TpEzrUSBQr+z0d1XFck26UvI/8yKokGzM+jNPlHcOfcmMY5D6eidXtGlFh1XV
         8d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979582; x=1754584382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=qAqrtFwcK//OjfHmBqSDCBtgNxqiCKtRYyWTrMMO9C9tqPGvmriywuac94oZl88Z1c
         5sUaGo8PnOH1pr3rcd5A6NpDwlHkNPz0x2SEOIwpCgFtBs9+ZHzWIUxqsMLNZmSUk1k3
         X1huH3ZsOLi/Aq0pXZi3zjiKSL12CvaSNB18OmXbo7/6LzdWogqDR+/mKhBz86dInY/C
         mb4IsV9y4Jq//bkE7hoG1dFhDmFLDcqvw7zDhMeXOoGet8rPuC3Qs40yuWQdVBzbff+I
         6JSKaOEPfcjZAJnbPiKSGIGcTO0M/HqCaJ8ImYAmXFSw/qegGumurdT4HYT6DHHAdY72
         4iDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW48AFk3OK2WH1qMs8lrgDk5HIswgexG1JtLdVaW7NgORj2jRMMo3Dm29yoetEnVCwr48Zs/KWR0sE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE09Dzyam413nJEaX0BWIfuc/22Q6w1eM5d/uJMn+D/vYAmx1s
	N7QtGX2KEwg/kbPqXVSigWDTMza7I2VcfR3FertARzkFvY58GJ4GqhKJ
X-Gm-Gg: ASbGncuR5x9DRqLEDab97W1AN7Ecf9dmCCstgFwNo5CCY1t0adWPtSLqXutBxQWyXk/
	le4yoAH52IcKpFq+rwXVltlBX6pVWXuCWPgB2SEiDA1hMphd/5BNT/v0+apjLibKX34o/lM7kO+
	Q6S+yd8pxVq9VdIyyOROCxlnSIigvk03Hen60beIG6yKPZgg9nGPWPtyRQcjAcYFSzzA30YrYIq
	bGBekUCqlAdiSuZeL5/r153QtHAEgv8ZOZ1dxj+Les2/uC1a1yNJqp6ZPS1JKWZXWSLiH7CVqZ3
	U/MazVsZORd4sDTfJzpf3VfWMlXy3MJEFWuooPwdDHdoVt5tFYB3RYX+hNcgatJsnr38sQ/2ITV
	HTJRXTvIl6vKPN3bmBJGBJ45KnKAQbQBLrWWAj7+jZtWdsdgro5AIn87IPu1vt6nhs/iB3rICRy
	BlR6MpDSh1
X-Google-Smtp-Source: AGHT+IE42z7i7CovswTO03kEARLVTHTFnCJDTexv2D207gRXY26yhBPPOm+9zcqlKYN2OgVEMQVr4A==
X-Received: by 2002:a05:600c:4fd3:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45892bd1a95mr70310155e9.26.1753979581888;
        Thu, 31 Jul 2025 09:33:01 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm77810615e9.4.2025.07.31.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:33:00 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:32:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <llqwla5x22fmhktolfyfmfkeur5z46v7j54mr6bkxm3i7avwqu@57kwpnif3zjv>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
 <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
 <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyb25h5bm2euygmp"
Content-Disposition: inline
In-Reply-To: <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>


--dyb25h5bm2euygmp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Thu, Jul 24, 2025 at 02:17:08PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 22, 2025, at 14:21, Thierry Reding wrote:
> > On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> >> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269=
b:
> >>=20
> >>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47=
 +0200)
> >
> > Hi Arnd,
> >
> > it looks like you haven't pulled this yet, in which case, please hold
> > off for a little. There's a missing dependency on another branch, so I
> > need to redo this. I'll send an updated pull request ASAP.
> >
>=20
> Sorry I missed your message here and ended up pulling v1, which now
> conflicted with v2. Can you change v2 into an incremental series instead?

Sorry for the delay on this, things got a bit complicated as I was
trying to untangle everything. I've now sent v3 of the DT changes which
is effectively v2 without the dependency and with a patch on top to get
it incrementally towards what v2 was.

I've also sent v2 of the DT bindings changes which are needed to resolve
a DT validation issue for the new Tegra264 files.

Thanks,
Thierry

--dyb25h5bm2euygmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiLmroACgkQ3SOs138+
s6HtAQ//eSz+Bw+2b0FTb/6yzmbLV8BKO4lC7yIl+7FhjfmORCS05Fp7e1QRjuPS
bbAl5I9ubAxMtCG65Av112IIsC1jzy7wGiIKHZlyJ1mCyD6tng//b4TjWoaMZrv9
iIZ6VMuAnd2eBZyIByNOc+y6uTHhT4NQndUpDYuGgAyoZj1KxSaaEFggFJWv02Ej
roINesBhWn0vUJ2tPIq3a3KyyW7ewqV3sdKDJBQRwv1cCTm7MInGFAWZvNI38gPq
D4OPgKin7he9Ys3ksv/oTsRBsJ1U18vqoXIT2pVoc/vFyKc2kxQo6idHzztEdsyS
BzETIFoOG8LCMESiRRPF5ihJYA4hub9L7dVn8qFy9G4gvgyTRvO3ClN8XR4yf+91
NKy1ciKRRd78CAwGvRvyl8Dc7VBSBnTZRvRC6Asp+X9hqiDS3v38zf2ZMfUjRCt2
GrOrq5I/hq6MfTySyFxV6EJaqJqgTshD0NCC1sG7X2DPO10N2A3wfOZNDFFX8Voo
i3y5yAyGHsq+hbzzBOonRDKUFqzp1w4r/A9pjRpxl0fmb4IrlyCqbw/Q0AfxvPdj
ZS/iiiKv4UMrWKmqX9QzlrQqo1uT+1vj7wrMjs19gu5D2jURT7D49XPu6NjLquVD
XFD5ZsecCiFnDnqzkjJl0c1yhdwqjAsbFZIzjJf1IM3cPPvrFn0=
=Us0s
-----END PGP SIGNATURE-----

--dyb25h5bm2euygmp--
