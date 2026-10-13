Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC20513554;
	Tue, 13 Oct 2026 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906667; cv=none; b=K1Z+xoWtl1D1WAuGNcqAsihoQo3Wmuwa4qF5TBq+z+U90ZfHpaBWEgnPjjVtKi/HG+qXEAcFQjeX5TF5UmKsS07z6g3rlvabaA0UIIfpP8ii+Vh4pKo9nw1g4JADy1hBe2sW+8gggdJ7NXYf8gHE8osEkjbiY7RVvat3f5v0nD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906667; c=relaxed/simple;
	bh=r3dPIqJVZRDrga/MJbTb3/5uaWkSC7+Lc43sA/eq0hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZC6z0ETHKyvLJVwguzUtl2+mIGS8+3LQdWuBhRwzILCAQLXqAhFHA1Q7xzxU82nmGWy7Dv9IOg5lxb1ltgX0U9f/V0d57SuKNajirpdsHRfeYi9W73//0RBO9qQZm9u56FEbFRONwqWIPH/GSVKUB6liKGA6EAVCPW95juRh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7k7sMsx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7k7sMsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230E81F000FF;
	Tue, 13 Oct 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906665;
	bh=MJ86ar7ft1Sjd5oHlVMjY4gwK71NzHJf7v8T3vhrJ3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7k7sMsxNzFfFxydRPey+N/9CCSkwmN5DyNYLRN5dFgRPYd43mfp0TWbfEdFgtY/w
	 H00/6MvApVWWBqq6LDZx7/+XInjZmbM5zuio3/3YukuSPwX35+4v+bZT4srhksV8Y/
	 8bn1MH/mlIp1/ryVdV5wSZQDhrWJpceSWiOoCDwcWL+D5pwOATLTjZsmlUmRJ4pMfD
	 kLlwAqKnCSGxhK43xZgCQAZ5VYC99wMNctVqXBsraoV+Tk46krOgTi1shEbqCtFfVL
	 Yf1Ycg8KCjLzBo9AnqlKiK7HQ47FXsYThbecmNPzqLxcksT0Py5AI5nA/VimCa4vcF
	 VB7t70b3CeeaA==
Date: Tue, 13 Oct 2026 17:51:03 +0200
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
Message-ID: <as5TMuJUE3H7bcFX@orome>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
 <as5S4eXw9_olPYTK@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ta66zshbuz6aaek2"
Content-Disposition: inline
In-Reply-To: <as5S4eXw9_olPYTK@orome>


--ta66zshbuz6aaek2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 05:48:58PM +0200, Thierry Reding wrote:
> On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> > Use a designated initializer for the acpi_device_id fields which makes =
the
> > code more readable and consistent with how lists are initialized in the
> > rest of the kernel code base. Also drop explicitly setting fields to 0
> > where it is redundant.
> >=20
> > Unify the list terminator to have a single space between the brackets a=
nd
> > no trailing comma.
> >=20
> > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> > ---
> >  drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Nevermind, I realized too late that this popped up in my inbox because
of Andi's message saying the patches were applied.

Thierry

--ta66zshbuz6aaek2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOU2cACgkQ3SOs138+
s6EkQg//Q94g8lhAZ9FF1mSkUo8+4iAGe4AwVPaHJcaAsp/d3MMwLNgGHDNCCUTg
G+wEpoEVHWYXoLXJdfApoubX1HNKCyZixOydZMuy/vyjfKK8d24WoUwsrruWKNoC
Qr6q3NbnPuILsnE6wQDTVdRqZ5iJlmJKMwdL9zfnVqM3bLVwpDqLWA7QkJrqsNY+
XJcQw62QQ2bvNUYmnEMs96w/3hFC5bQeQkZcRFHxT5YaZwH7n8XX3hvrMUqPUclG
PWzaf3rRgKJvhonQNuJSHjaSbHTtBt1uuxV/RncTBbTqczCwADWg+huMeyInDKNG
9jZddMF5telzFS0C6Qm320brFB2ZzTRmjHM+2QzdwwnIN48mkmpy3lwdzBDIsd1O
aHW2OyY2zyfp3NG+HeVuBNWw3ctMLcffAk5pdZeVvW15ZaAYUMBFd6xMDS40I4TX
6zJCJz7BRWHyAxLcuIK90E5LgVatIVCJvHGaYnwGPWgGan7CvL3WC+bGGu9u5huD
LdxQ8jbuT81xOMrbWy9h8so1N+3KjZXMnz12Z2TD8mK+BJpgZt52vXOSzmNWB5Jt
O1f8qDoslIrvaisD5tgoXZmn9NhZquYjFl1HqpnHxWpBK4rCW0fzIcMO1vByl8eF
cwD+MtMt4inGeVuyn7CCI4ntQKPY1jGEF0X9EwXGBBfcYoocK/A=
=H7B1
-----END PGP SIGNATURE-----

--ta66zshbuz6aaek2--
