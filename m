From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch 1/2] gpu: host1x: fix an integer overflow check
Date: Tue, 27 Aug 2013 10:30:24 +0200
Message-ID: <20130827083023.GJ8686@ulmo>
References: <20130823101825.GA1765@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130823101825.GA1765@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 01:18:25PM +0300, Dan Carpenter wrote:
> Tegra is a 32 bit arch.  On 32 bit systems then size_t is 32 bits so
> "total" will never be higher than UINT_MAX because of integer overflows.
> We need cast to u64 first before doing the math.
>=20
> Also the addition earlier:
>=20
>         unsigned int num_unpins =3D num_cmdbufs + num_relocs;
>=20
> That can overflow as well, but I think it's still safe because we check
> both "num_cmdbufs" and "num_relocs" again in this test.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is something I spotted in code review.  I can't actually compile
> this code.  I assume this overflow test has security implications.

It did compile and looks good to me, so I've applied it.

Thanks,
Thierry

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHGOfAAoJEN0jrNd/PrOhj+oP/jAFWTE3EgWri6RAM/vFiFrY
7lOg8hlDZ0cv5v/nJkDhtZ3VOel2hWcEMt0Xx5yGjt/ls4FJ1CehyJwW9HtZEGsl
DVO/1xjwWjpIgGo6OScp192+3/OOMe40drxsw3KYYK96b1Y9RN8IyWC36fBjMhAM
a/jLhpr8PR8Avght5AaCd58+WjZk/9B4YhZtbCh9zBay1iCeiHbS/GnzIoKe6x07
Pl2GybMLXtCPQYahrl1aRhGPgLFnggLoN1LSrS8SCt3GDe0OAkW4fHDUDAbYMk89
2BRNZ2ebjY5PRQmGsNTnFSEjdSsFR6rH6jmCuqpnNe60GJcvIyei9zaIKcNbzU/G
LipkOxlz/Yf49HN2dEQhtdoSY/6X2heAsfpeW7flpLuon+Og7hXRq/jjS491t4gb
STnTCXm3saQ9vomOSbMrSaCscC1WmHuEtBZO8UXTMLsPNshndjoGo4hk9CyGIvmK
+5gIXa1Xezb8ILVj/+fTlZCEwyCwa6q94IofqhPtovAYOWz75MNT+dRm2kDKS7Du
/zfLstgT3mxc226RcviFPo342DV2zl+R5rWFTWLAvlv562Lj4KuXX+Jn2IehMj32
OKCeVpIRgk6jpZB2pJ8g0JRHBk1jGbRhmE+eTWcULQVVJnFDuEmavu9A8Q1LV2DS
9Fm0o4PnlEOQBPgU6PR3
=oKqR
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
