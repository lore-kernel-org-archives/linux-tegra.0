Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6743FD01;
	Thu, 30 Jul 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426906; cv=none; b=C4gAP1QjQ0516wJYHE7ygbu1j1VgGB88GfdHOI9Sjbo7gLvaK3VyHJvdElE2TvVJOTGh3R6uUEAgHxQHNptbxz8Dm6k5F5qhc/A/ntAOheXpt1wuB90U4NqadQSVQveMl+isrwGEvXyX9hWkkO04N0rr29UZt+adZZY5s2fHCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426906; c=relaxed/simple;
	bh=YwjnJRX+gCM2jMV9AoRzadVCMCdrX73u14jvNcV6Kbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyT9zLQkIHqhXiQyP4ixXoU31wjILYsUDeucG0PdlrpyzB4phTqh5vAI+tKMXU9t0B8ddcym2sxxN54648h9W0Z6l+I4AjbwOUnFbxBGuNj2WNOIeX++5phXNXd4rwTG1X6Mgnsx+cZ+fVhO/s43rsz/PLO4w/xrcKuShFtOaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g81dMpo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g81dMpo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B3E1F000E9;
	Thu, 30 Jul 2026 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426904;
	bh=Y7bC1vGxeospaVOAwz5CSSVij1EZoHihYUbflyG26B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g81dMpo8Aq86WvkDpIVK+5WbgrIKWaEdt7FuOQ3aldYRxf1R+uwbeQS/PDMsFnny+
	 0OgHPQoaUf0k7wsreu4AZkeKPEwPAcNU83lrYcVENqOvFKQ5sqguEx1VepDUHJK0d1
	 H3SGkjDHuNoZuFcJL/dYCoI7z9/jmubpLiTn+Dm0cRTKgvnBF7kaNNzIOBq6JOXFk0
	 YJr6KEyrpuyZ3Mgd8wuLv1c04vQ4/CPJIY56qQ295g1kanrgMweanqAu+xrtbVhdQa
	 rYAZKrQmrqC3HOEC6e9dj9knhXtK/K58uilRS3Y194mushg1Xtn/BHsRvKNc/4v5Xw
	 pReAYAWuFDx1w==
Date: Thu, 30 Jul 2026 17:55:01 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Dmitry Osipenko <digetx@gmail.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] clk: tegra: tegra124-emc: fix krealloc() memory leak
Message-ID: <amtyoOXfiPic0f5H@orome>
References: <ahilgKKwkttOd9H6@orome>
 <20260531195313.99447-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktsbmyqbhvpuozjb"
Content-Disposition: inline
In-Reply-To: <20260531195313.99447-1-grandmaster@al2klimov.de>


--ktsbmyqbhvpuozjb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] clk: tegra: tegra124-emc: fix krealloc() memory leak
MIME-Version: 1.0

On Sun, May 31, 2026 at 09:52:52PM +0200, Alexander A. Klimov wrote:
> Don't just overwrite the original pointer passed to krealloc()
> with its return value without checking latter:
>=20
>     MEM =3D krealloc(MEM, SZ, GFP);
>=20
> If krealloc() returns NULL, that erases the pointer
> to the still allocated memory, hence leaks this memory.
> Instead, use a temporary variable, check it's not NULL
> and only then assign it to the original pointer:
>=20
>     TMP =3D krealloc(MEM, SZ, GFP);
>     if (!TMP) return;
>     MEM =3D TMP;
>=20
> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: Separate variable declaration/init
>  v2: While on it, enhance variable name
>  v2: While on it, explicit variable type
>  v2: While on it, re-order variables (reverse Xmas tree)
>=20
>  [=E2=9C=93] scripts/checkpatch.pl --strict
>  [=E2=9C=93] allmodconfig compiled (i686, LLVM)
>  [=E2=9C=93] localyesconfig booted (IBM T43)

The latter two are a bit pointless because they are not going to hit
this because the driver depends on ARCH_TEGRA which doesn't exist on
i686 allmodconfig and booting this on a T43 isn't going to hit this
either.

>  Note to myself: use --in-reply-to=3DahilgKKwkttOd9H6@orome

It's not generally useful to send as replies to earlier versions. Just
regular sending is good enough. We have tools to track versions and
such.

>=20
>  drivers/clk/tegra/clk-tegra124-emc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index f3b2c96fdcfc..81e4c02a807c 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -445,15 +445,17 @@ static int load_timings_from_dt(struct tegra_clk_em=
c *tegra,
>  {
>  	struct emc_timing *timings_ptr;
>  	int child_count =3D of_get_child_count(node);
> +	struct emc_timing *timings;

I guess we could've reused timings_ptr. Or remove timings_ptr and use
the new one, but I guess this is fine, too:

Reviewed-by: Thierry Reding <treding@nvidia.com>

>  	int i =3D 0, err;
>  	size_t size;
> =20
>  	size =3D (tegra->num_timings + child_count) * sizeof(struct emc_timing);
> =20
> -	tegra->timings =3D krealloc(tegra->timings, size, GFP_KERNEL);
> -	if (!tegra->timings)
> +	timings =3D krealloc(tegra->timings, size, GFP_KERNEL);
> +	if (!timings)
>  		return -ENOMEM;
> =20
> +	tegra->timings =3D timings;
>  	timings_ptr =3D tegra->timings + tegra->num_timings;
>  	tegra->num_timings +=3D child_count;

--ktsbmyqbhvpuozjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmprc9MACgkQ3SOs138+
s6EAjg/+NggFhcQJXqx0VYk7iklKkEhSAXctBdS27tzGF9iOPvrlVFB0VID0HbBc
aS/b31peBKERQiO/5+gV5/VSxdmYfR8OvD3J/n8LTHCPUJYE/N/Pg3cvlEsAQxTj
sx6X5BO26AXXKzPYQdstF9aqoG1mZIncW16Mw88dRZjDRvyEidz0VRRhKOqSVQam
bPh7hj93Xx8Nys/09XtvvHV0nFaKkxW1b2ONCkZn2Fq2VJQIu8T0gKZ73I4MrE+Z
7fMFa6vt6pc2Pg8cXuFu95Uk1No6yR/qUJChbdWWwjxU5g4kEDrnCc6RMNSM7u8C
Zz9SUi1Qm9llLSVfmKUv8zTutt80txbTSIZ1cDXRDqF1z7rbRSLcB/XVzTqSVNJc
h113U3UfusavpN9Ro2QPhK1Lls4v9MU96N0AP14jT7gH2cqSui/d+8y7FosVMgX6
0KEF7u/aVQSYf/+W3KZSlevQxYQwIX3sgrJWkRSBvT9EtpxqAUItzUESil7kQhY2
MQGsPwGEUzi8s7Vhc/xBOv1wQ84zG0r0Q2ZtT1kcXV+NuiN9sIYINwvsBObE5JUK
pExg11rE3xlIliidR2RugA8P22pqTdBaG321Tl3fl7yl7y83mfSkYbZW0VjP2WiU
ILp7W2SVEoG3yCFKnSD7dj4xTZ/quzUV1na9Ej6F43NUWJZJKNM=
=OIU3
-----END PGP SIGNATURE-----

--ktsbmyqbhvpuozjb--
