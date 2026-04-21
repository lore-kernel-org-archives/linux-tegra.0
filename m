Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857793AB269
	for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763950; cv=none; b=VA1i7nHYeg87SjI37QmpofoliC+8Go/SM+LvP31j7dOZtkcA1ZGi1uD7L9iAvkh1SMzCD0ODSiCjwXNHbIt0PSMxO/KIRQwbDlqF1rTaEO6OrCFMO8u9U9AjaMgDRLuV5AxmfrYA8BYg6rWnNJ3cjrUIAEwY+SLsvy5j9u5ALQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763950; c=relaxed/simple;
	bh=RIJ5ZndJvGd6ssreqo5at9CUOsJVsflPdB1Jiq4Nklw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXvccLPSChehxvsSJzaZ16wx36Ycqs+txUnniwdAEpXVUrN+dBExFXdGfWmnFK2nVzqV0Q9tdzsb9RuLJSyfuMM8GCjj5LwCayeCqdG3BbRVWm4IfdHFsyAavyVhpx2D9BI12xF1ubjjmt8bxsk3uKXzq+1ZVNY/RhjxEEljarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAt/U0rn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAt/U0rn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf7683a28so2707057f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776763945; x=1777368745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1BwtVt8bKFpbQGVlkdldux3RDIWFxamHAEC+xVHx6I=;
        b=lAt/U0rnJgAbgnlRam/V9PG98qwM3f0UR/1t9YiViLWfmxjlFXO6JdqU3BHTRULD+k
         PsvC9HOkoEZBUuGsI7kNqmjLqdm5eeho2m0aMZRSqZSIhVNCMWtSaZVm0b5zs9V2FBpW
         V64h7aRtwjsEemRNNHE8sfBmTuee3ovD7gxSuDkfIB+vrkS5ufOuqWGUDxLBYweFiV61
         hX6qxuVL2jprptBYNrS3QHIy52TjFbhWdh9VFR9AOM4rhGK2PsexyYJ5XWfDBkAk9+MB
         8QEaGEYHEWDDeev0v7sra+FuCVQyeuKfrONL5ZsjcZVJWiPiZmcAdfVMJr18aUsEWEK8
         2Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763945; x=1777368745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1BwtVt8bKFpbQGVlkdldux3RDIWFxamHAEC+xVHx6I=;
        b=ssRtHEVfG2+8zdsG0zdrKBElAiqvJneNoLF5UnMa2wWOJKr5lY/yzUuduUEvQmNo7P
         lobB+iRwrctlF4psh8lDnAS6gqH9XX9nCvg7hkZDF0pMKJyk0vaMIw3+/dFFtOLzocmn
         r+b/eKnwh1U/KJS4sLwu8YLiDpT1OdwmCxmCLk++iVzTNa/iOjf80dHlksjX7DaGdbX4
         kkkzVGg8Ilfr7hl0A9IhpukwhSyvr1KxyayNWENr+0uZ0E5HYbQ7BUSEz3Fx1VjKiivj
         ytAc/x4wuvigPSbGZ4GTfJsjHDvRofNNwsgZBdlgkc9fRq+MMqdS3/VDk7nbG4FWYZhk
         NvbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X2fWMIbHnK50vvLtGp8YHFIudcmGGVrhh7S+caPjTujqXHaDstkPh+ci635qcDR4l+8Gf+UvjdIwScQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0aNodpCnLrk6W2TA+6vMot3/XLhnzZ/KYc9fjniD3tKEoSaov
	SKzmdlxZz3eXFsefjYn6Ze9LyyB/4TNuCb9EbFpu+8Oj5FXbuYS35PsE
X-Gm-Gg: AeBDievG38gIwAhIe8UZDfe4CQQFG91ssNWrNCJNpcQkEZ3D+kdxFBBjDv0jsh5qaqb
	6K/R1hHu0FLVYTkpw9zEU3viakLcCmzPnWYY/2cmLYiJLRLLFwwWMhlwwFsrNktocZNyX757aB8
	0L5rXjUp57aKYAnNWnVnIifSKGGjIxluXlzLbeCSwVPAwmA3FSm3AixFoYI+4khk1YTx79kP0bI
	CAudWZU5zJ27yu8AbdiWxXor1e9JxruAJbu9opvcEpy+R7WZXwqXW7r8w7ylCrFjVhdMq08RH/v
	WBAJ+IIfxmEsWXQHsmCpqyO69Pb++dI5/6bV/xtl9XWuKB6Y0We3hPC2w/XDuUchklZyvQBgU6j
	MX4/412qNV9hdZq/dCz27PZo9/5Hpixpjcmq6Z9phVBtUlpOKD+bgeusOe3hDD5y5fI/Y9I+YMt
	Ysqk71k9zPdqC8l7OtYmXALjl4Evv0MH7++ILWyaNqfzTeEY160E7LyGJrge/0vTXkK+Fl2LXRV
	wyGqYqZmB2aQDw9Q274hFTT4jNbDCJkBo8=
X-Received: by 2002:a05:6000:2303:b0:43d:73d4:b34 with SMTP id ffacd0b85a97d-43fe3dcb1e9mr27481040f8f.16.1776763945123;
        Tue, 21 Apr 2026 02:32:25 -0700 (PDT)
Received: from orome (p200300e41f131500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f13:1500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm36932206f8f.2.2026.04.21.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:32:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:32:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: pshete@nvidia.com, linusw@kernel.org, thierry.reding@kernel.org, 
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	webgeek1234@gmail.com, rosenp@gmail.com, linux-tegra@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <aedDEkawf3cYxQm5@orome>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
 <20260420100601.343707-3-pshete@nvidia.com>
 <20260421-spotted-trout-of-satiation-1dab00@quoll>
 <11de368c-960d-441f-a0e2-574de444fd1d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4sxaixc2gc3gnn6"
Content-Disposition: inline
In-Reply-To: <11de368c-960d-441f-a0e2-574de444fd1d@kernel.org>


--j4sxaixc2gc3gnn6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 10:37:46AM +0200, Krzysztof Kozlowski wrote:
> On 21/04/2026 10:31, Krzysztof Kozlowski wrote:
> > On Mon, Apr 20, 2026 at 10:05:57AM +0000, pshete@nvidia.com wrote:
> >> From: Prathamesh Shete <pshete@nvidia.com>
> >>
> >> Tegra238 contains two pin controllers. Document their
> >> compatible strings and describe the list of pins and
> >> functions that they provide.
> >=20
> > Please wrap code according to the preferred limit expressed in Kernel
> > coding style (checkpatch is not a coding style description, but only a
> > tool).  However don't wrap blindly (see Kernel coding style).
>=20
> Heh,
> wrong
> template :(.

No worries. We all make mistakes. =3DP

Thierry

--j4sxaixc2gc3gnn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnnRBUACgkQ3SOs138+
s6FyFw//QdJRT9MF2TxHiVVlcS8hnaW+gsVzqB1O8v2vGMWbE8mYQqB9Z//Iq7bC
K0ZZGbJvFaWBUKW89uZc5rb0NtOYkm2BXG8PGUUCS2mV7s4qZuwxcMrAshCjJxwa
2zvkjg8lHWkPEvT11VqNOLZbvrP3DknG1yWVW4GIq8gaETMFIiuq6XCSUzCCjOBr
FdUMRpLM432GU4qHsGOWSELCX0V/FaoNXDagvhlzrQW1ok/I2zvabuGLE57WDTyB
QbovjvwijC0+OCfl0C2qAj1CtLNI+cWQ9Swi7BUTaTx6MNXHXpCQbD9o/8Qu2Ogj
//hIp+0GPySfAPFNOZmU9mKpvY+HzUAvQvExd36z87EW7yR5CRrv2vwaS5W2hRus
RGTkWn9AbkRlM7lnrOsXFqMmjqeOF16hXrOZJqYkHxVoGRHFAg1rA8hKEpe8dQO4
zmVGojcuWj4nAoQGKr2ntQrQ67dXx68BCMG9ljz7pZXAXvghmbI7cxy+B0M5gGq3
bQY7tNxgrjy0tOjxk5Dtkv6AoiWCSDdSUntgaw0Nvi+5Dss42vs2CBVXseCcOmCe
TR5M6cj7J6S90kWPot1Xrfn2GWqq+7iCYaXWb+DGMUyCDzMEQ25yhS6rSCzmR8OB
GzxxL62sHXOCYacjkupe9fzyUWHdUE8pRqGsR4byfJ7N4NJ4pok=
=Psrd
-----END PGP SIGNATURE-----

--j4sxaixc2gc3gnn6--
