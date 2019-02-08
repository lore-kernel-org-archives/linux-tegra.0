From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Fri, 8 Feb 2019 19:35:16 +0100
Message-ID: <20190208183516.iwuhx377men2i3w4@ninjato>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <20190205124443.GF1045@kunai>
 <20190206093851.5sxretbl7ajizi5f@ninjato>
 <20190206094912.nnfsfzivwbss4yye@ninjato>
 <20190206120702.GC21676@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0297766713=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190206120702.GC21676@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tristan Bastian <tristan-c.bastian@gmx.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0297766713==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mwefymuwj24575d3"
Content-Disposition: inline


--mwefymuwj24575d3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So I guess you could say we're in some in-between state, but I don't
> think it's inconsistent. It just allows us to do this step by step,
> which I think is good.

Well, I am still not super happy, but it fixes a regression, so I will
keep it in for-next.


--mwefymuwj24575d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxdy+AACgkQFA3kzBSg
KbZ65xAAjzjzjmCg3Mk8qMLBxGBdMyZCNxhorpvZG3JrZSf7D/fkmfS7I6hTDmG6
1BCMpWpMKA0mtTtjR053dQRImyFwSE037BQcEHKnzQ8LGjtOR2xbFgrYHJXj5pz7
W9yrjqkzHLYW+nxUOci85lrCAuKhr0dwW22mVRACgZG8lkYGg67fwNZn2S7GC8/K
fk0bR7N8Cy0yi4weC5ckQvrXeel17p0De468kqYg5XyFgpeFxkg2KauYmRDFLbiU
jBJB+G2gIJlXZskD4A2g1/0QrJi3CJ1IjSZjDNmnh9l6xIbTC/CbcUfrKXEwLABr
/d9R+zZUBdS8CjapoNC4AQ08mAysryjQudtOuko98f/Njb8yTzDVYKG6ZjJXW4Xk
1qmNUyB9mvrvl+aJPbTUO7GHWzKdWd8JgVoBLcCAksaMIV6Piepy9m1n7Cpc9TdC
KN/FOYt4EtUazK8lmDrikuQ0DgQQQklIdwY2aDP8KOcDkPcXYPUMA+c2rfN+pt4l
ygo5o6T3f8wE3S/qAg5IJyGoINpAqd/76lTzTlzu/5SfNv8KB3LtPpzAWgSdt/9N
ZkUByLo9OGS3o6s6Msg1H9TbR2oGgtMTOUYmgDra8Mx5m4yY/U/W4Qo0PWDra0Wa
BA7bO5XJfkEoUopN0O7+7BaOkUdwAIJv1ntLF9RZg97CtyKROHg=
=MrYz
-----END PGP SIGNATURE-----

--mwefymuwj24575d3--

--===============0297766713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0297766713==--
