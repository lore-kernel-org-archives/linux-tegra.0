From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions
 by name
Date: Thu, 16 Apr 2020 01:35:32 +0200
Message-ID: <20200415233532.GA211822@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-3-thierry.reding@gmail.com>
 <20200415162449.GA1842@bogus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7093004101106947435=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200415162449.GA1842@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============7093004101106947435==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 11:24:49AM -0500, Rob Herring wrote:
> On Thu,  9 Apr 2020 19:52:26 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add support for looking up memory regions by name. This looks up the
> > given name in the newly introduced memory-region-names property and
> > returns the memory region at the corresponding index in the memory-
> > region(s) property.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
> >  include/linux/of_reserved_mem.h | 11 +++++++++++
> >  2 files changed, 30 insertions(+)
> >=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

thanks for the review. Do you want me to apply this and patch 3/14 to a
stable branch and send to you as a pull request? That way I could use
that same branch to resolve the dependency in the Tegra tree for the
memory controller driver patches.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6XmkEACgkQ3SOs138+
s6Ez0hAAhoJ+N1kIOrfHX3YiD1o4HnSvBdA5fzev2mOBfWSzcbDQtQuO7PYw6yCq
IeyEbUuehKpQL/OQASwHkJ4m3iRr8tH5PddGl1DF36Vu3bqAxr8opKZIi1S2hXHE
2iXFY48PzN9aDvLIilAylO12RtZoTD0yI30BpucJYhATovmkzvzNuhaJ8CDYjf07
4OJ0HoH7hOn9rhjHNQVq755OESyUTtRIqHxEw0150PJG33O1cjruRc9WgI5GVjO7
4MQSqFHmyOcfNWZZTins29E9Cnd/zy2nkj+YXsp7eBRG2QFjrlN+y7evCduhOdbP
moJzOF+e4dqEOZDwlVeqPni6UVFu4Zr5HWJw790osuG1oOCwB4NVpNRz34VjM7kD
nYoZaqIm9X5Foeus0Rl94cBreI0Bg1lCsM8CCoANE42t2NOlumnMsJoLWt4T+cBb
F5JoiSCC4JKIbuYedHI00W/9U6LcPqBcd/NZ2ZxYSVAibApDfG/APsy8a5gRLRgZ
460CNbf4e7p7lyN5c4l58DLJvEsT/jYd/ap09KZnUZmQgcfxAHmCVQUMFq+VIb2k
1gePNObVfuvOC6Q1KwGEcbgYlNKd/e6uGwn2FP5jzWYQr9Co8R8L+kRvIaHkuVl5
o7TOw5dujpA6zalLJnecmj8XrL5uGRTvE6AwpGujw1UgN4QTGVs=
=W/7i
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--


--===============7093004101106947435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7093004101106947435==--
