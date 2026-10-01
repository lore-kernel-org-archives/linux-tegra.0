Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987B4B7A4D;
	Thu,  1 Oct 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858742; cv=none; b=OR6IjpFpczv/t59h2WvBEFD/nDmrdjstYxr0pf75QohKMpKnIlIDEF2sCNRAlZ34dgPBIavKhOaSMjoltKek9aqZOQW8v9xM1b9Pkj2+2nZAXeknKhYq1P4Ml5I8u+SOiP2gndEL24EBIBnPyzspJYOv/r/hY0IYfoLpVmeWb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858742; c=relaxed/simple;
	bh=kbIe6gI/x0kWLyEiHsi/nPeyO07/BaXMdm4nxYYYw94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL5QQBTSdNv4s0X/TBF67ij6CndW6GfubW6uhpuwNlklIKEDtNJQQudObIFf8RaeXzZ1icwfnGbFKbEtHpuCI/e7QOAiruUsbFSP/vk2FBRCVIO/ZlksgMncpJwcgvttaMr+WbqVQDmm20yyoe2Me5yZFcusViW+5dhmkSzFMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9XyBN+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9XyBN+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4327D1F000FF;
	Thu,  1 Oct 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858740;
	bh=Jsi/e5O4CEH8kh1Pww666TzAbv1pKd7prA9zguiUvRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9XyBN+vQFSkJqMge0rknUioaCrrC82ryt6AqLC+fGhf5Ln6CW+RvYdsCBgq1e9C0
	 woAyqhr6nyYbVo4AYh4TipCoAm6wAvmi+qacvJgeMId3X48XYf/xFfkees+UoD3ySE
	 cjqibWMGoLca3/iK87xYJHp7y4oPiMqrBDJjCzdc+s5Z+5723xOoYDHBu6EzmTf1vv
	 eUoGc7aO4+w6z2OC9ZBc4Qpf4nOTeSLwC6JOcXHoN5VCN5UOeexca4BLBUswYmslM5
	 hO5SbEw87yGrIj3nF6qg53phxDGooNhN0b7eI6feBiRq1jl7plXTHoyl26J3P0YgG3
	 +C991/7Qkz9cA==
Date: Thu, 1 Oct 2026 14:45:38 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: jiale yao <19888972804@163.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
Message-ID: <ar5VOjWFbZ7orV8v@orome>
References: <20260924111856.622898-1-yaojiale02@163.com>
 <20260924111856.622898-3-yaojiale02@163.com>
 <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
 <7eaa18c1.6909.1a0ec33ffd4.Coremail.19888972804@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iyn5nxl5vinhmjku"
Content-Disposition: inline
In-Reply-To: <7eaa18c1.6909.1a0ec33ffd4.Coremail.19888972804@163.com>


--iyn5nxl5vinhmjku
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 04:07:05PM +0800, jiale yao wrote:
> Hi Geert,
>=20
> At 2026-09-28 21:19:48, "Geert Uytterhoeven" <geert@linux-m68k.org> wrote:
> >Hi Jiale,
> >
> >On Thu, 24 Sept 2026 at 13:19, Jiale Yao <yaojiale02@163.com> wrote:
> >> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> >> node fails after map storage has been reserved, the top-level callback
> >> returns without releasing mappings built for the current and previous
> >> nodes.
> >>
> >> Free the accumulated map and clear the output parameters on every error
> >> path.
> >>
> >> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >
> >Thanks for your patch!
> >
> >> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> >> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> >> @@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_de=
v *pctldev,
> >>
> >>         ret =3D rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
> >>         if (ret < 0)
> >> -               return ret;
> >> +               goto err_free_map;
> >>
> >>         for_each_child_of_node_scoped(np, child) {
> >>                 ret =3D rzn1_dt_node_to_map_one(pctldev, child, map, n=
um_maps);
> >>                 if (ret < 0)
> >> -                       return ret;
> >> +                       goto err_free_map;
> >>         }
> >>
> >>         return 0;
> >> +
> >> +err_free_map:
> >> +       pinctrl_utils_free_map(pctldev, *map, *num_maps);
> >
> >Nice catch!
> >
> >> +       *map =3D NULL;
> >> +       *num_maps =3D 0;
> >
> >Is the resetting actually needed?
> >Only pinctrl-generic.c, pinctrl-sprd.c, and pinctrl-tegra-xusb.c seem
> >to do that
>=20
> No, the resetting is not needed, as the caller does not inspect the
> output parameters when dt_node_to_map() returns an error.
>=20
> I'll drop both assignments and update the commit message in v2.

It's not clear to me if you meant drop both assignments for all patches,
but that's what you should do. The reasoning about the caller not doing
anything with the output parameters on error holds for all
implementations, so resetting in any driver is useless.

Thierry

--iyn5nxl5vinhmjku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq+VfIACgkQ3SOs138+
s6Fszw//S+/h0Ib1CUWwPnCFlxey6/WArFoUZaaZgXNGlypfjVOBTemIJVXhLxHC
M/ONTk9VtO8b0rfHh33dtTROdP8qcccndU3ymeB+xs3dA1x6AI5LdQ3tXoqMViO7
0mSCV2yn0jDUahGmIhGF1F7MyeyTh/QM5OuRPCf/V+qGkaztEC4OtyYGYfRJ5xHf
0SEI3OkKB7lwN5oaffQKAtrzpqP6OeW7HcmM+lfG+vbGpFmnnF9kurLF9hXyJdov
dTYX7HvvbA7Wyv8WkAAb9aoWWls1bLR+haQz4dkKYkPHj4vPvrBoBP91ATaui/r8
ZC7sfO5VmT0gEC3MrtU5GFwC3U5O/W6uXDzWDQ4n2UZVSwb4lFNQaXh1/cdkhOUc
wcS1Dz1GiCeuHqZwlHtQrpMIQTk91ih9CVr9Hm4pPIzYwvp2E3S9EVS5PAXZkm92
MAuDhd4X5l8Ms2oZX83WbV/Vcpv2BriqWm0GDWm0SHLZcHZSTRkfJ0FjEuegJw+G
n48IJ4xpgG/X6GledoD5zTVJ2XD/5SAEOXc2Evq/En3HDSRBnpp2U9IYxH2cE37y
XK7a+5q3Z6yCv8lRp0lbituLjI0SF4OcnzU3Iasy3lUi6cu2A7sP6fThreY3t/7L
qdq+/EDBHubWQ2kdfdWc3MrYiykKH02kWU4mBHv9/vLdSdVE4dE=
=rdgN
-----END PGP SIGNATURE-----

--iyn5nxl5vinhmjku--
