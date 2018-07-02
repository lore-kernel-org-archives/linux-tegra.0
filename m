From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/5] gpio: tegra186: Add support for Tegra194
Date: Mon, 2 Jul 2018 14:38:58 +0200
Message-ID: <20180702123858.GB13096@ulmo>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
 <20180620125406.11906-2-mperttunen@nvidia.com>
 <CACRpkdY899HBsj4BAtVGXj7=KLhpJmLYzKLmyDL3TcJjp8a6SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526628919915040303=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY899HBsj4BAtVGXj7=KLhpJmLYzKLmyDL3TcJjp8a6SA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, vbhadram@nvidia.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


--===============1526628919915040303==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 10:14:12AM +0200, Linus Walleij wrote:
> On Wed, Jun 20, 2018 at 2:54 PM Mikko Perttunen <mperttunen@nvidia.com> w=
rote:
>=20
> > Add support for the Tegra194 GPIO bank configuration.
> >
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Patch applied as pretty straight forward.
> I don't think Thierry would mind, in worst case I can revert
> it.

Sorry for not getting back sooner, I was out sick last week. I don't
mind at all, so for what it's worth:

Acked-by: Thierry Reding <treding@nvidia.com>

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6HOIACgkQ3SOs138+
s6ETpRAAtPj7GyAdA6BWqvXEYaqho2D0m3pCTeDcAK4OGjV7muPV33okefYIKAfQ
VJsRX/qH1oNa94oCcPXEqifV8XfRKfbDWJeQlmcQ/9P5GgXvf5GTkBt7CF1HZo8y
e3AnaCbZAo0clMm+mwIq3oLWTIY+ZH79W7xPEGr19Zl7QLP1ytsr0veH7CPLNV7F
MKAyn/nHYF6qbcZ76XWWyXd0STnqF89ajm2CdHSgOeE2z4kwYaq6AyegNVMyjidm
1BadVAQedhCw9gjerMS93KQ0VJXdl9lqZkeePQ0ZTssogSI+M6ZOXGzEydwFPfnF
jbSqS0x9v2cJ4StCRWN7/Sz8fPfhoTpF8T2KW72rjT9NpqqY4EfA4R6ErWSR/bjm
hgp2ImAZ7XSa5dHIa7LKhP2UBnffdCNSVkS/Wki+t6hO/GXelKve3bwTB3HWEq3B
6+SymZnHSKddHFMxnMqnh48FXD+2lgi0juc8I3HM69GrBkhj1Vd3HBsIX1EedHst
f0ckAuYOajoksrPrVPZLoh0YDCOQzkEjGRRjEmCz90aM9OmRiJ9Dkvhj9Q/ejzIg
CuHq5FlC3/iAIpHOz2qep5wrN+ccRDb9Cw9iEncMZH4SffVowtJpstWx4xJU9fc3
b3D44b9yLbHFzQpuaTTIv8u3TogtIDn3jJPmq+oo6mt6hZ1z6tY=
=/xor
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============1526628919915040303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1526628919915040303==--
