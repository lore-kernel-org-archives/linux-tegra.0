From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/14] staging: media: tegra-vdea: Add Tegra124 support
Date: Mon, 3 Sep 2018 15:12:02 +0200
Message-ID: <20180903131202.GA23488@ulmo>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <ddf04f92-f82f-75bf-90a0-102437e3787f@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4258510690063053949=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <ddf04f92-f82f-75bf-90a0-102437e3787f@xs4all.nl>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============4258510690063053949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 03, 2018 at 02:18:15PM +0200, Hans Verkuil wrote:
> Hi Thierry, Dmitry,
>=20
> Dmitry found some issues, so I'll wait for a v2.
>=20
> Anyway, this driver is in staging with this TODO:
>=20
> - Implement V4L2 API once it gains support for stateless decoders.
>=20
> I just wanted to mention that the Request API is expected to be merged
> for 4.20. A topic branch is here:
>=20
> https://git.linuxtv.org/media_tree.git/log/?h=3Drequest_api
>=20
> This patch series is expected to be added to the topic branch once
> everyone agrees:
>=20
> https://www.spinics.net/lists/linux-media/msg139713.html
>=20
> The first Allwinner driver that will be using this API is here:
>=20
> https://lwn.net/Articles/763589/
>=20
> It's expected to be merged for 4.20 as well.
>=20
> Preliminary H264 work for the Allwinner driver is here:
>=20
> https://lkml.org/lkml/2018/6/13/399
>=20
> But this needs more work.
>=20
> HEVC support, on the other hand, is almost ready:
>=20
> https://lkml.org/lkml/2018/8/28/229
>=20
> I hope these links give a good overview of the current status.

Thanks for those links. I was aware of the ongoing efforts and was
eagerly waiting for the various pieces to settle a bit. I will hopefully
get around to porting the tegra-vde driver to this new infrastructure in
the next couple of weeks.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluNMx8ACgkQ3SOs138+
s6HaVhAAmzfAo7klZU1tRE2lpTD8EmgFR9VP3kf28ElofxeRw/KYCyDW6vVX6Yl0
GWOd0uZ4senQytotr0vWXSlROGL2iZFzj11lnjFq+aiNorCwkwWErdGzZqlD7TNY
TRjKu+3P/x0kEKg8NPRzWwkZVxhyspveUFENXILEtIh+/9c/GIOALcrhoTDUQMnZ
E+87Eh2I2MXhybLq0FdmfPpDwVBIWbcZAZUL5MJ/iBQIbceK139MY5jn/oHMpl2r
UzJAl9zZ2TVRC84ne2vZZ/QJIWvGLv3n0Y91kz0pRnyPs1fR1tr/euTj6sbHYH3h
0EANSi1X9dQat8x2c29rT4U6mWsRMqAvoxNzFcLn7MU3aCp8NT8SvwqIQ1c5tWzy
ezxYJHcA4BD4jsgdR+S/HVdU4IhzHlzny38+2bhEShWninsf+glZ3m5BTvQsV+Ri
t0rhVJovoJQR1pR48hgHo3IJt3stZJXm8j1WFPDYIajaVnZCcyDuO/YxdysR0IDk
AvjVIpnPhOap/w/vDDjUrjPEqWrgH4EDXoITn5rPvq15rWxTB5aWSLsM8mqeNe2Q
AmkrCO3sJRkuGIOeQuL87cWGjvXCb8cpYEYXU1MPK19VhHixgJ/gnsV6M5XrV1Av
vRAEBJtWbpRS3aSvYgUwLkqKeYhi5uB+a2OP4cgifPqAp2bbfuc=
=qyca
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

--===============4258510690063053949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============4258510690063053949==--
