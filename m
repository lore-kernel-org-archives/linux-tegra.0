From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Thu, 9 Aug 2018 16:07:53 +0200
Message-ID: <20180809140753.GH21639@ulmo>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
 <20180714212210.at4b2gcpopsznyxx@localhost>
 <20180803104318.GA28546@ulmo>
 <CAHMsQjU=nmpTnPK6Ryhui67YVANHExd=yRB4hp+upd7O-Tjn+Q@mail.gmail.com>
 <20180809102104.GB21639@ulmo>
 <51a19ec3-8b34-56f5-d9c7-69397d3d11ff@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5130846813602692072=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51a19ec3-8b34-56f5-d9c7-69397d3d11ff@kapsi.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Anthony Eden <aeden@csail.mit.edu>, arm@kernel.org, Olof Johansson <olof@lixom.net>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============5130846813602692072==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="saTAHnV464s+57Yq"
Content-Disposition: inline


--saTAHnV464s+57Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2018 at 01:34:37PM +0300, Mikko Perttunen wrote:
> On 09.08.2018 13:21, Thierry Reding wrote:
> > On Fri, Aug 03, 2018 at 07:26:04AM -0400, Anthony Eden wrote:
> > > Mesa support aside- if I start a computationally intensive job on the
> > > Jetson TX2 like building the Linux kernel on all cores, it will lock
> > > up. My only work around has been to disable the Denver CPU's. I don't
> > > think the tegra186 has upstream support to control the fan on the
> > > Jetson TX2, could this be a thermal problem?
> >=20
> > Yes, I suppose this could be a thermal problem. Or it could be something
> > else entirely. We do support CPU frequency scaling on Tegra X2, so what
> > you could do is keep the Denver CPUs enabled, but set the powersave CPU
> > frequency governor. That way it should use all the CPUs but at a lower
> > clock rate, which should also be able to avoid any thermal issues. This
> > could help determine whether or not the problem is thermal or something
> > else.
> >=20
> > Also adding Mikko on Cc who wrote the Tegra186 driver, maybe he's aware
> > of any issues.
>=20
> I haven't seen any issues myself, though I haven't stressed the CPU too
> heavily. We also have a thermal driver for Tegra186, so we could set up
> thermal throttling with a device tree change.

Do you have an example of how that would work? The DT bindings are a
little sparse on the specifics. It seems like something similar to what
we did on Tegra124 could be done on Tegra186.

Anthony: do you think you could come up with something suitable based on
what arch/arm/boot/dts/tegra124{.dtsi,-jetson-tk1.dts} and the device
tree bindings for Tegra186 contain in

	Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt

as well as

	include/dt-bindings/thermal/tegra186-bpmp-thermal.h

? That's provided that reducing the CPU frequency does indeed prevent
the lock up that you were seeing.

Thierry

--saTAHnV464s+57Yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltsSrkACgkQ3SOs138+
s6HM0Q/+I7UHDOqhyL/j9SggVwJB5lKC3skz7mP+uHUhGeaYK0UYhL6I0tvv7mrI
Su5q/WKJ/iq0oYckPKuJ9/AKYAfzf4OXUArEbDReRjhgdmAL9lDIq3YqWh9DhXqN
ZgpBstNUQo9UPVuNQxIo14m6O6ZzrxV1zD0FBfwvH6jcqmnDr/6dYihDifTn2zbL
Ems1fgQVzohiTfXlJZ7dsBPi7IdmJILuMdEvglZWbCNVCxJxeSxkyxLkkBtUop5l
8iOfdtagx8ZgCxMM4UghrpZdVAF9BkjNhoFJgdjEm5UQJJWxXhVBka0JBwTee5aW
FJ7vMGnxJZ/MVcDL4EYfQb3eibH8SwOhLJfvYtzgVYM631wzRUE34cg80j9b3l3Q
hCjRZbWWrZrYWCFT8H7YhSUMX0Y4urtGOLJe+/oqTpxzTdKZ5zt/He/B2yoddkdA
4SP6WLISQyglAjhbrNX1z44n0+rzMBamq4lEabscYeO1/PnhWQaja2YDeOIMF0KH
oy5xO6i5iGXdNwyy+3Ml0xFmig1t1/bf/PoMUmsP+a2qAvPv+5It9mMHCi5cLc/O
Vf+EVnaUVYyj1eMK+Ef+QY6MJJZIbKDWpKRmpYXJVB5PJeCOv0rdlckVzDVALLKh
AoNhp5wL/Hwqi9gO73QuHSmkWl6bE5XmwT0MmgCwh7QZkp9I0bI=
=ZtTm
-----END PGP SIGNATURE-----

--saTAHnV464s+57Yq--


--===============5130846813602692072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5130846813602692072==--
