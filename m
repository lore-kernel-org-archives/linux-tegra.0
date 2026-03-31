Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5BF29E0F6
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 08:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944795; cv=none; b=NTC0ac0GK9AqatOz5+c/Hlgeg2ZFrtu5w7JxsgKlpx3IyZ71mO5C+ofsejKNS1p9TcpfYsRAgvFv/lzI/aKa6N9Sv3HKy2t+4b1GA8AND5DKuwZv7qx2I/fKjTcz5CTN81JW09I2u2NEE7I/Jz0K5QKPLHXQaT4DW0DMrNPrj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944795; c=relaxed/simple;
	bh=pJGLGPlP+pgDoOnMJ+vDANz34nLVCZQqTJjj+JlmLOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otCB5hDHegF5RuhbM5gHWmuBfyw3U0h4MnhG4HdoVGjyzn9zj8je1Gk6WSXR29sv+Vjd+unSKdkYDUBurfwkchRz+OINObnHbhxS9tWvT0HRnH5mIbzTGeNzBRx6nOgaqjVG6GzpjtQSMenJ5v4dy4htwsK1lsdEA6gUQwnVD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKJ1TjY1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKJ1TjY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877CDC19423;
	Tue, 31 Mar 2026 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774944795;
	bh=pJGLGPlP+pgDoOnMJ+vDANz34nLVCZQqTJjj+JlmLOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKJ1TjY1KR5V2fPPOJ8XQi6etBUEiUGhvNaSWz4sQ4vb4o3f7qz6MkCmmuleaP4p3
	 YwUeNMwpx0sd9qjM5cAnmH1wd1zJGdvHG2DTbGscmWNHk0c5hYJgKd9mi7EU9l86m9
	 4dmS4MF6ZeoOiYzBriJJ6lU6kZErxPqRThfAin3Vz/hlq7sWyqnZqgqN4jXNYguAen
	 036nr0blsQWpXDIQTLqbWwM4h7zkS0QyQS7Bl9waqZIQSAZb64NWH7Sw3LQghV3jxp
	 ncbGmmivlJ8q+AR3RvfSpimH9YvOXzDg7pXAUA1YgTq/R/Lc35pfbL5pIkEcI2KMIA
	 LzhHooHZ/9e/A==
Date: Tue, 31 Mar 2026 10:13:12 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <acuBQcq0jEX7fv9J@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <63b6c9da-4c0e-497c-a2a6-8aa5e74e2adb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucvm2dz66opruy4z"
Content-Disposition: inline
In-Reply-To: <63b6c9da-4c0e-497c-a2a6-8aa5e74e2adb@kernel.org>


--ucvm2dz66opruy4z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 09:59:07AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 17:10, Thierry Reding wrote:
> > From: Thierry Reding <thierry.reding@gmail.com>
> >=20
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
>=20
> I guess related to my question why patches were applied one day after
> the list:
>=20
> Days in linux-next:
> ----------------------------------------
>  0 | ++++++++ (8)
>=20
> Commits with 0 days in linux-next (8 of 8: 100.0%):
> ...
>=20
> So you exposed soc tree to all sort of integration issues. No, please
> keep them for some days in the next before you send them to soc, to
> allow people to test and eventually complain/report issues.

Most issues would've been caught by daily bots already. A lot of these
probably were in linux-next but changed SHAs because I rebased them on
top of the PCI bindings patch to keep the shared branch as small as
possible.

I also do fairly extensive build testing on my side before sending those
pull requests, so I don't think I've exposed the SoC tree to an unfair
amount of integration issues.

Thierry

--ucvm2dz66opruy4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLghQACgkQ3SOs138+
s6FfYw/+LNdbCG4yiEIT7ANseqTzRj7TYxgDAAw6I+FYeoOC4PhIliXs7xdMQMC3
b7+LFqbsBcdIjG7TOLKcTeBjYtqOnGgHdWsAq3ZzA/RfZ8CmpjBhdQRC17xj0obs
+WVpMTGcx51B7Am92oJeC8bG20c8q/Pw7E+xdwgO8tGiHY644TH6eWtijj14x94O
JO4TVE8vwtvps8oQnTT49lfL9avljxGGd2M+LXbp1axt923uGfD6gI6NUovrxDXM
Ihp1wln0YW3eF/wvmoxG+487P0GduvA9jrZf4ZGEcQ4bcQv7VebUk9JgVXVHVZII
uxx2BeOdQUaZTcrCBV5/5iUNWORV+hCSblHZCuK+o0+HZ9MXxQi26+C4D7ZJ2RIV
82TWX9EyZXbTl/oRQmOUGPPpuziIL+M0nx8ToRGo5s9wzXmbj5xsC87gtQP+RYZ8
YL7dr1NkUtX+oqTzuhEVpiuR0NDFE0ggE68SL0ItlRiFxi3xATE3ttzvdTWXXawg
7zco6kR+kgnwUURK2i0JD8ZyLx9zqMkux7nQ/NnX07bQdRmJ+rZ75mHzR3C/SPrw
YM0a9EZXicfqrTlidqAYo77d/XVqiVc0zU3rUwXbopN+SS+nYIedyGsdsZNl558G
gHY8TBhuDSYVdB/dYdu7lpzms/Fcl1W23sOjlUPpaXkaFuPlPjU=
=nwD7
-----END PGP SIGNATURE-----

--ucvm2dz66opruy4z--
