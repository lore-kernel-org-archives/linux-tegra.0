Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88213BE16A;
	Tue, 13 Oct 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906541; cv=none; b=IHD2Mil+KqsEIGBnI9kqzrdkaOptYO/1u5vnkh9EOkKJ0ti5+EW1PMeU6hRBWXkFbuUuEGrW0ncRFuj/XMmPZoqWOA9Hi0b0xofLp8vQGNum7q/Q1cdKKZ7i3XlFRLcLHZnRNhW6lKSBc/KDpZ7fh+PhEsnib91PYau2tES5fn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906541; c=relaxed/simple;
	bh=YJ6vYcPmPnjYkJFJjJE8EJJRT9npufNwYBiIpSAHuZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk/QTBlA/UwfXdk58GegQRoUqIGbkzuOfoiYBy1IR7QtKVC+QrMpF8OQSzyAL4swer2yROPqkp9iDV51XTKKarNEcrG4U7HIyoSd7/oFKPGQBlsSgT0dI245vcXATLqezOPVEHs+JNFHjuccrjvxI6jLJg4M5VF6ZwukLBsrrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbcaSXqU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbcaSXqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B381F000FF;
	Tue, 13 Oct 2026 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906540;
	bh=8HIRM0RG8gr/DXh0YsHOuMrZwiwotXguOVcFJ3C/Z+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbcaSXqUcaVh+Dn4Szez+2sa+s1pn6dxh4rk0zuD2iS8MtxWqlXtsDeQFdf0+ndoN
	 e/DNfTRvn9qFxjEsaqLCCTMDD/EciCocH2iWVubkVKjRrjDeFtkfl4bHHsA9fVSzY2
	 5PmwFn+sUQg6zBbcWR6OfrGEZezUr/RDrg6k9Zk3/Zy0QMcHqh3uzg1+sU+SMZxRYt
	 okNpdlpySaXg9Sp07feU4V5/NVpd6+Y7lfTLm1c6W1XLDwF8W5TWDC8N4VrC5JR/32
	 9jFemyokGfVPK87YKsMrGcqPYVVpQOwv5ubDWtaUKYdhlrgu4gTkUxTQAH+//kM1Lu
	 y9f6egNh+AXDA==
Date: Tue, 13 Oct 2026 17:48:58 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Devyn Liu <liudingyuan@h-partners.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Message-ID: <as5S4eXw9_olPYTK@orome>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdaukvpfqy47g5lz"
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>


--bdaukvpfqy47g5lz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--bdaukvpfqy47g5lz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUukACgkQ3SOs138+
s6FUgw//WLO80tnSOWkfuTVznJOATqQqtXNIxuY17kM5m1EEoZt1NHMjgBpv4ylb
UVXRSs8cAFNkUsmkCkeMiPaJiPSWLzGuuTJ0sE4E/yH0MMoIDPf8b1RwifvG2sSN
ZGDPA+UWX7NANExmBZdu/Fs06EC5xjQtH23rqXP4Yh79x2ZPSkLP6yWrhrY7y+pW
NZbhO6sZK5RmU+vX8JVgFot2fc5kuCXxXhhZP9nxMeiofepJlKO6pK0CgC2h3lMY
rnaNREXSSruDZU4a+NXJtxkuPsKR4wQGGr3bcYJCyjcVmP4z6uUMLSI0YAT1Rgaq
Y/kgJcAvgVY0JtyL2vUcU8IK+8dfiZT/j16cBPlrdlJcETavrz6C1/ySJsl14wmu
o/y6FcKOZHXvLhPA4za1bQU5O8b7UZtP1MyvClac1rSzfL3V/9bb8+evmlWV944X
aesOgjT5EptZyVYamUKXsFYP/XRUgMXykA1QChwVOtfFS4yOXc6k5TC/HbjY8dsq
/7v+zkFiG0oI63U1dGMWWyCSjykdZaS4KyXLzFHptkgUCjj34C76CmENPztxCA+E
M9m2Bac9gmYqgnyPE2QxC8l+s+nl6B+RA3Ajiuve2HQ6ZM8I9AJNKFGfR1kKu5Gf
5CvbCSpmxrZzyS/Bt0DlUt1ZtYkHBF055ZwQtlBWs4AAAFsvcVA=
=wgwe
-----END PGP SIGNATURE-----

--bdaukvpfqy47g5lz--
