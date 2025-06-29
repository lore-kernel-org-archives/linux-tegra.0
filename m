Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F31F0E55;
	Sun, 29 Jun 2025 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230568; cv=none; b=tBmyy6kZn2MlKFGXnEpFb/ZmBz3nSl2ZQMHKOkxxhvdFOFZ8OMzn7G7LUFKPHhsf3NMG5OZ400Ed9GGnsjFdnyAyEHtCLHOLBPABKDsYjrtZE/qqHQEgZfYxiiuCXAALxw2tmi/jC8NCADjC40kNuF+tqCMSuOwFC+YDdCW9N4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230568; c=relaxed/simple;
	bh=wxPOxZ/UV/k3nkqU8M9ommX7Jy3RtmifN1Lsn4mr+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2aWwJIzshFQN4wNr6Wcw/WJVej6cV3YckeBcMj5OAlRSc8i5o/9GlRYx0adI32rUGh1XPIc2gzhSN8g9P7+ubtRrHWQkkVc100kZkfyjxkPHgO5UWFLaSslhdAVMf2XOf52elU1K0wyQsJWfyGDv2IJ3kphgoZcMoOZ41qQOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JafR0q7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JafR0q7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE970C4CEEB;
	Sun, 29 Jun 2025 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230567;
	bh=wxPOxZ/UV/k3nkqU8M9ommX7Jy3RtmifN1Lsn4mr+AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JafR0q7VK1QSCjrMj0r8VwcsPzjNxnYBbF9x1UCwj5ay0PIUprwQRy73UGFxP+YLa
	 UVVE7jHIrLp1JoHbGJ8cV7v+azD+e0iXxky27zPnOq4SyYtkJMfpdLqqYxUhX5qJH2
	 jhFdMkuEVIJbWh72I8+w86MjFHk4LiS75EBgrUDUu8aZIa84KYAuEWKkMIcCNHeNi/
	 BlV9jSJCnbFWWcFUh9eipj/iNexN3a9ANdxefeYo9OVRxW1gSNxOML3DzlOe5I2Ocr
	 pkaU+54zZPxoifiAGbwKntn6WjiA0mKwDTKQYYCjDTvfbYWkgQJGrNT24Wa8MGuxzU
	 aTaTbLFN0VfJw==
Date: Sun, 29 Jun 2025 22:56:01 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <4s3egeo2fhq6hk7pcsxplsqomiiw6vbnnswhimlekfrl6tsixt@wzf5x63pdvp6>
References: <20250612175515.3251-1-spasswolf@web.de>
 <vvorpevngfle6budlgqhmj3f25lb77czzyvd5aa6jil7zkaqgp@weanygri324r>
 <11898dd756020687c2016a37af3c948b350bdbbc.camel@web.de>
 <szadjbcldmcirdtgiv6wowqumlk4cbthb37f3e42lzcbt4tnla@ilp4m6quqk4b>
 <6eb19bee-c553-4a28-9342-b2b218deabe7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3a3woiyuowbqzbpf"
Content-Disposition: inline
In-Reply-To: <6eb19bee-c553-4a28-9342-b2b218deabe7@nvidia.com>


--3a3woiyuowbqzbpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 12:02:48PM +0100, Jon Hunter wrote:
> Hi Joel,
>=20
> On 20/06/2025 10:42, Joel Granados wrote:
=2E..
> > +		.data		=3D &max_lock_depth,
> > +		.maxlen		=3D sizeof(int),
> > +		.mode		=3D 0644,
> > +		.proc_handler	=3D proc_dointvec,
> > +	},
> > +};
> > +
> > +static int __init init_rtmutex_sysctl(void)
> > +{
> > +	printk("registering rtmutex");
Well that just slipped in there undetected :).

> > +	register_sysctl_init("kernel", rtmutex_sysctl_table);
> > +	return 0;
> > +}
>=20
>=20
> With recent -next trees I am seeing the following kernel warning when
> booting -next on our Tegra boards ...
>=20
>  boot: logs: [       0.231226] WARNING KERN registering rtmutex
>=20
> This warning triggers a test failure for us because this is a new/unexpec=
ted
> warning. Looking at the above it seems that making this a pr_debug() or
> pr_info() would be more appropriate. Let me know if it is OK to update th=
is.
this is just a debug print statement that made its way to next. I'll
remove it. Thx for the report.

Best
>=20
> Thanks!
> Jon
>=20
> --=20
> nvpublic
>=20

--=20

Joel Granados

--3a3woiyuowbqzbpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhhqFIACgkQupfNUreW
QU/4Twv/YnX5yNyWtYD3GHMdqa+5hv6IQk3y+7xhOJTQqTRWU5fhowWTXIYq56uh
5ftswx9HQVOYMf3jbp0o1xTwC4f1AQk8nQzbacmVfj2ZX3XwB0N9xVAumeWCXQc4
mP36k+ixQSE3YqSDAmuBOMdyIpk0GaqepxXDdgEYHQ9OFLJFsqIrcUrQX41sA3Gd
xMpjzkgHCg4+KIE7ow5e3u3SuwS0aaPDylNWXDp8fQI5K03FIwvDOgImR0dHk9hK
LjODXVr6ZN2b4/sYVveAGOKMmwBpON2gHQzpJmf9QRSz0kjp8odYmiUvSoE3D2fP
rtN0Xh2FVIeLA/jPU9iozuWzHQSZl5EuHc81k3kRlKVbvuR9cdCN4zNsfK2Bh0Sg
U3u9zZz9GdUO7CywZqSdPft+KsMZsOOM6cbpIb2WL1EkcjQN58eXGLTk904wMymw
R53xfWZtroYO4+5xANOXAZglx2bEzOa8Q1Q7MmC9ps9s/m9kGydP5oI1pYAlqnlJ
Z1+0F/TC
=ZAFG
-----END PGP SIGNATURE-----

--3a3woiyuowbqzbpf--
