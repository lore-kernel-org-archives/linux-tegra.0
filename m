Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F829345A;
	Thu, 10 Jul 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139289; cv=none; b=ErLvGNy5uHfRxuwWJQ4ctGLJvZxP8LlNTNj69MtnWugikU6g6DE0RJCNfbcWu25RQqVHnlsC8Y3n9Lj52lshyV0sGsJIiD+BOvtD8HXJ21947KfGTTsKliGwB//cWPRnKGZXGc870bApSkT9QojYN/C+3x+MWoizkIF6CkSWHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139289; c=relaxed/simple;
	bh=aTcOifgKeVOo1BUVCcufR3MG9mr0xg/Uq+4OS714JN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVop1vuGclsS/QZNy8kXAJYbbVMUFvU3lx1abz421qyfcAYbYfJfbzy8l/mSF5o+RNwTuaCwCTUzcwpJ3QXUHUOpH9yfT2fO4dYXdzl7nlJqGEzZo0LUthTYhxVaYENrBcalncFfX2miUdsfB5/xncb07/FM+YrML8JvUNF/u0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=l1quA2DE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="l1quA2DE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202506; t=1752139210;
	bh=HfT7iDuh3LiR16pu2N8FA8HCpxbEywHzXQ8Qi+G4v1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1quA2DEbh3sElQ5//lO3Tsop/74InuSr/4Lc9MCHYaz/QcsBqgBBqeaoXnR/cV2u
	 lhH/TlK/R2JPPE/fv58m0x8dmOaBpviicNMAqnQWsXNbzsFSWTowuNfQ5mtOoyPkqk
	 Mnbrrx8q0ECOgCXrnHfV516MMtyKVWGzrbipE7BYsDJrVr04moxcR96fua0ZeJKybF
	 6Dr6NrZxDbj4Z3lTTioWKqJxh+DLDf8+ChKllsBz0zjn/cExnvLVLwPU+cgyCULbM/
	 2uBumDxlcL+3Uo6N4S1S+fh2wZkBsOucYyU/5rzj9dyG4SH6v8lxFRXjqEnhCEIJDO
	 vUeWqOj3IXKJA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bd8Sp1wqSz4x3q; Thu, 10 Jul 2025 19:20:10 +1000 (AEST)
Date: Thu, 10 Jul 2025 19:17:48 +1000
From: David Gidson <david@gibson.dropbear.id.au>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] checks: Fix detection of 'i2c-bus' node
Message-ID: <aG-FPE9rBRqhq70h@zatzit>
References: <20250709142452.249492-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yCSc6OZWW0AuejUe"
Content-Disposition: inline
In-Reply-To: <20250709142452.249492-1-jonathanh@nvidia.com>


--yCSc6OZWW0AuejUe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 03:24:52PM +0100, Jon Hunter wrote:
> If an I2C controller has a 'i2c-bus' child node, then the function
> check_i2c_bus_bridge() does not detect this as expected and warnings
> such as the following are observed:
>=20
>  Warning (i2c_bus_bridge): /example-0/i2c@7000c000: \
>      incorrect #address-cells for I2C bus
>  Warning (i2c_bus_bridge): /example-0/i2c@7000c000: \
>      incorrect #size-cells for I2C bus
>=20
> These warnings occur because the '#address-cells' and '#size-cells' are
> not directly present under the I2C controller node but the 'i2c-bus'
> child node. The function check_i2c_bus_bridge() does not detect this
> because it is using the parent node's 'basenamelen' and not the child
> node's 'basenamelen' when comparing the child node name with 'i2c-bus'.
> The parent node's 'basenamelen' is shorter ('i2c') than 'i2c-bus' and so
> the strprefixeq() test fails. Fix this by using the child node
> 'basenamelen' when comparing the child node name.
>=20
> Fixes: 53a1bd546905 ("checks: add I2C bus checks")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Merged, thanks.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 123f2eb425f4..7e3fed5005b3 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1024,7 +1024,7 @@ static void check_i2c_bus_bridge(struct check *c, s=
truct dt_info *dti, struct no
>  	} else if (strprefixeq(node->name, node->basenamelen, "i2c")) {
>  		struct node *child;
>  		for_each_child(node, child) {
> -			if (strprefixeq(child->name, node->basenamelen, "i2c-bus"))
> +			if (strprefixeq(child->name, child->basenamelen, "i2c-bus"))
>  				return;
>  		}
>  		node->bus =3D &i2c_bus;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yCSc6OZWW0AuejUe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhvhSwACgkQzQJF27ox
2Gd26A/4i1INuUVnYIhUjSa7EnBNB+F6YLtDjjcc7ux8idax3svy4Nlv5dP9FYLD
tjcXfKYptZaKejhntmFIpUgKlGhquvH762/96A9KrYlFT3NaPAg1nQu9aEZFRCXz
meuoSgGZjVMUblzj2XwJ7g+wYb6fdMVal6STw+Jm6ExHJDrauCng1VKcOK1Shoec
aX1BvUlElLvSyoOOc41oBgxqgorNopVnj9rcFsY7AJ/EByBl1kRntnxfrlWktqV1
QTuajgId8dLZpU7PpSCHLEmofFyr2uqF1kmIoPq99KOuWRnpEXwZlWfb8D4K3a6V
MurHhDohFGa12KQrMS7xOoUi1ZD+NEB9ACkqsTX833bGGhmpXdkeY+VeAOHKbi9Y
hWXxVBS23hV7jZrc548zpdBvCXRw0xor5MerxgcYuNZ6eNXpE1XJfxWul3xfBOhD
GdF8uekdinN8A1MojAG0nXqYGppqL10SPYxCI/PjanKCsOcVQUPaQUo35Oeo5cJl
t2K1Nl/2ilDc/P4eiEuHlDx4G5Z3Rtx6TWa3iX5x307mxGwC+mzRF2/+ZVkocfsk
+CybUGCGY2vq2yUEgB1gUMg5xtXpx1XDHRJhgGeTBCGzGUvnJHX2UylOdal24oLE
sQ9RhZ+3bBc/tU2ayw9jgePl4gV/Kc/u0i7q5ibvjfUBDX5Ucg==
=ID+b
-----END PGP SIGNATURE-----

--yCSc6OZWW0AuejUe--
