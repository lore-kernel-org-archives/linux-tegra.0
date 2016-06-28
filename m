From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 08/12] i2c: core: Add support for 'i2c-bus' subnode
Date: Tue, 28 Jun 2016 23:33:57 +0200
Message-ID: <20160628213357.GB1598@katana>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-9-git-send-email-jonathanh@nvidia.com>
 <20160628210952.GA1760@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160628210952.GA1760-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Would you be okay if I take this patch along with the device tree
> binding change into a stable branch and provide a tag for you to pull
> into the I2C tree?

Yes, once my comments to the previous patch are addressed, we can do
that. For this patch already:

Acked-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>


--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcu1FAAoJEBQN5MwUoCm2kTwP/3kia79Z9rkH1PliyhtW6xbz
qCGsXd8gr58rDLdkREaMSUn6wBKf/huMAPNsW/YkKpM+D5l8xsK74TZZ6vExWgDb
QfQHAY5VGDpbvjvhjxuh5DdpxWlhKnhb6hM0gjW52DNbGdhm8rDnEpugJ2/LMPZC
j1PX9snIRefkFUuEjFlXihNAeZiy/Vc/U1DvDF4yCPGXJ3qlUuK7Yl0LnPKIHvg/
q1F6wxJ/bEeW48Q+Nxrhfz7esCYqjkrw6Gmewm/+CXcXnKYmaTm2wS4hfU3cKwLz
7ZxXXKdnna+JeJ9RPkkO0Tx/NkMof7ihGSUc8QDVAj/gwrfI4eovysirPUlPaieY
beIU+Vh+Rhh/UUXjkPNEbZ5GqinkxN3x9vqM7eDA5pCyCmlFQBM9bTa1T65SpJaT
BVi+kU3k3rEpjQS5z1xtcIyLNchLlN8RaOV+W4TaTsrWqXc1IritthyXWlTChr65
JyC/dxVJTCI06b+3isrnivx7Bzi9vkKlt/0PddXZ+3tkddik0bB8BbHphJZuVfkv
7Vw92HwpNLzDRzOsItiyRNHVXfC7qCUsCtReSGpmRcYFUo64B3DYyx01uH3qpD0F
WAVplZf3Az9cHg+5t1JhcABoPmLPx4X0Z8H4jmJmOgnRgrtB28RFVO6k4YInmc2b
FILM4AlgiKqej+NYHj2n
=PcTT
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
