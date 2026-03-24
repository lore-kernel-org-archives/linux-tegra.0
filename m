Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9245938C431;
	Tue, 24 Mar 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341020; cv=none; b=grW2oml78lEeBNw/937867F85s9h9+rHyXdDUYl4NDdJpjLWqUv5rB9pvxNthXbg6ZArijBtTRFNy9AuOXiuV9jLGNI8e2QQ/scQ2nQRbfjtqRVMc9w+sxFIKGyuNvKRNDBw+jlxSo5a90z91K2bBO/PXpqE9UsrXAs4SKoKSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341020; c=relaxed/simple;
	bh=4qlA6viWpqd13jvr2kafvBM9jjklMzD2WWn9GBDGmlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f51x79ENu543IbGmoAw3EepxknjK7t4k1HeF4gQkD7RpzBOuRw/H71geDRYA06c+KQbwS2fXwd2trQcHHY+BaypSk/39ScCQqOwvZ/T39OnKOQyXGhfnSjtFlRMUbFw7Hvz/EueaMUzurGvMks0jPg50PTGsoGrLY17Y/CgLPXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exKCxVSs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exKCxVSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CADCC2BC9E;
	Tue, 24 Mar 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341019;
	bh=4qlA6viWpqd13jvr2kafvBM9jjklMzD2WWn9GBDGmlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exKCxVSsE4Kl8zy7RG1vmac4iqVwGFD6kxsMi9GwQ44q4THo9tPaqzc5/G64+wSup
	 nFgaTjkcwpUyW7nmd0kapwYbX01+sZgMcM+ITNcIW0NPPHEPgl5jfQVlYQQ3jwUDfd
	 ZW6aijpS6Y5Om2vctLaVhEBBxmW0KhUodLvJC2PhnFA05wd5pzA4ciJ39Rlnst3Bjd
	 QiPZcKKYEZV5Lqa1j14VQJqrdJOv/TeRmYpgX5gfJ3qQdAecqOQlPdtWjLuIZiMwQa
	 FvWJcDfWtgAhao5a25eQcWYS4IDu1VnbCX+FQ4pUYQvNVQqXX+pa04n4DQFFKunJRS
	 UfE6wIvsblxKw==
Date: Tue, 24 Mar 2026 09:30:17 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <acJKkASRYT_iPUrh@orome>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
 <20260321-witty-fortunate-elephant-ce50fe@quoll>
 <acFRczOXps0nRfMl@orome>
 <aa424f26-1bc8-41d3-b83a-5f1879cd2559@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6iyxgnj7nrbixuvz"
Content-Disposition: inline
In-Reply-To: <aa424f26-1bc8-41d3-b83a-5f1879cd2559@kernel.org>


--6iyxgnj7nrbixuvz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
MIME-Version: 1.0

On Mon, Mar 23, 2026 at 04:00:54PM +0100, Krzysztof Kozlowski wrote:
> On 23/03/2026 15:45, Thierry Reding wrote:
> > On Sat, Mar 21, 2026 at 11:47:59AM +0100, Krzysztof Kozlowski wrote:
> >> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The PWM controller found on Tegra264 is largely compatible with the o=
ne
> >>> on prior generations, but it comes with some extra features, hence a =
new
> >>> compatible string is needed.
> >>
> >> Extra features means devices are compatible.
> >>
> >> You also always need a new compatible even without extra features, so
> >> last part is just confusing. Suggests like you could skip new
> >> compatible.
> >=20
> > Erm... if the hardware was exactly identical, then there'd be no need
> > for a new compatible string. It's certainly good practice to add one
> > anyway, but what's the point in having 10 different compatible strings
> > for exactly the same hardware?
>=20
> Because integration is different. Nothing new here, DT maintainers
> request it for years and is since long time documented in writing binding=
s.

It's more subtle than that. The reason why we want a specific compatible
string is because the different integration might potentially introduce
a bug that we might, potentially, have to work around at some point
using a specific compatible string. If the hardware is backwards-
compatible and the driver can match on an existing compatible string and
work, there's no requirement for an extra, more specific compatible.

What you describe is good practice, and I agree it's a good idea. But if
we had chosen to not implement the new features and not update the
bindings and instead reuse any of the existing compatible strings,
nobody would've care one bit.

Heck, if your position is that you *need* a new compatible for every new
integration, there'd be no point in even having fallback compatible
strings in the first place.

Thierry

--6iyxgnj7nrbixuvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnCS5YACgkQ3SOs138+
s6FCFxAAqmNtt6SNkMTQ3ll7RotXQ9JMymU6XjajircnmXoImxBM8CUqLHqkHMww
IzGPQH3xtsggs0zsziFH/Wf6rpE30pqw5awweYxvnZDYD7HHTBknVqfrEgSAx8ez
KU48HSFvdjbOd5+ijk4N0GhbNYQbOIoLJPB2blkT5zYD23VVbMp/8WSEQtnamITJ
8AMU4/5ZkVDuuGGkloR1UO9MYZujW+tlfgildDVNugwpRrJtHgvJezatXIHTcYq4
aCWGo+AUvTv1VsEV0HGOgxDWQbSBryD1ooaAOUtFsv0GUlu15FazB4fS/MUtEohD
jKNcqepiidq2P/6rwq7C4rPBtu+rmMVwJ7NNuWF3wWIx/2AE1wb0bAG/exVgBBbZ
f0wiVWHjyYL8XyYd2LStqwg7GDUzBlvviKfGdKOpmOCNEBUDXr8oE/05zzRZ5Xlw
AnAHbCMkD816eF7Cgw+JWlF3GsVwunUS/YpCZqdubg7KgVw7dcB7HcNcy5hqPCOP
pUZC649+t6WNzDe/NVu1eRHuekKj+YhsBvbHtFTPsbJalk55J4t1cDcD5IOBnTGg
JsyYuI+VndGEylsnvw7b3rQZgVodS+ZPCWXmxzYlgaro9uKFDrTxi/GdLheXFnJ3
ddYWJ9DFrLKAgkuVPI6BONHH4hXqebK7xwwM+GL36YbD5+fwZ9U=
=26Qy
-----END PGP SIGNATURE-----

--6iyxgnj7nrbixuvz--
