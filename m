From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: Restore DT ABI on Tegra124 Chromebooks
Date: Mon, 18 Feb 2019 16:13:57 +0100
Message-ID: <20190218151357.GA21562@ulmo>
References: <20190211110919.10388-1-thierry.reding@gmail.com>
 <20190211204452.Horde.-B4_UgJoWHc85yxQZVtc9wu@_>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611701629079689294=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190211204452.Horde.-B4_UgJoWHc85yxQZVtc9wu@_>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Tristan Bastian <tristan-c.bastian@gmx.de>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1611701629079689294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 08:44:52PM +0000, Tristan Bastian wrote:
> Thierry Reding =E2=80=93 Mon, 11. February 2019 12:09
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Commit 482997699ef0 ("ARM: tegra: Fix unit_address_vs_reg DTC warnings
> > for /memory") inadventently broke device tree ABI by adding a unit-
> > address to the "/memory" node because the device tree compiler flagged
> > the missing unit-address as a warning.
> >=20
> > Tegra124 Chromebooks (a.k.a. Nyan) use a bootloader that relies on the
> > full name of the memory node in device tree being exactly "/memory". It
> > can be argued whether this was a good decision or not, and some other
> > bootloaders (such as U-Boot) do accept a unit-address in the name of the
> > node, but the device tree is an ABI and we can't break existing setups
> > just because the device tree compiler considers it bad practice to omit
> > the unit-address nowadays.
> >=20
> > This partially reverts the offending commit and restores device tree ABI
> > compatibility.
> >=20
> > Fixes: 482997699ef0 ("ARM: tegra: Fix unit_address_vs_reg DTC warnings =
for
> > /memory")
> > Reported-by: Tristan Bastian <tristan-c.bastian@gmx.de>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - remove memory@80000000 node pulled in from tegra124.dtsi
> > - add device_type =3D "memory" property
> >=20
> > arch/arm/boot/dts/tegra124-nyan.dtsi | 17 ++++++++++++++++-
> > 1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi
> > b/arch/arm/boot/dts/tegra124-nyan.dtsi
> > index d5f11d6d987e..bc85b6a166c7 100644
> > --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> > +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> > @@ -13,10 +13,25 @@
> > stdout-path =3D "serial0:115200n8";
> > };
> >=20
> > - memory@80000000 {
> > + /*
> > + * Note that recent version of the device tree compiler (starting with
> > + * version 1.4.2) warn about this node containing a reg property, but
> > + * missing a unit-address. However, the bootloader on these Chromebook
> > + * devices relies on the full name of this node to be exactly /memory.
> > + * Adding the unit-address causes the bootloader to create a /memory
> > + * node and write the memory bank configuration to that node, which in
> > + * turn leads the kernel to believe that the device has 2 GiB of
> > + * memory instead of the amount detected by the bootloader.
> > + *
> > + * The name of this node is effectively ABI and must not be changed.
> > + */
> > + memory {
> > + device_type =3D "memory";
> > reg =3D <0x0 0x80000000 0x0 0x80000000>;
> > };
> >=20
> > + /delete-node/ memory@80000000;
> > +
> > host1x@50000000 {
> > hdmi@54280000 {
> > status =3D "okay";
> > --=20
> > 2.19.1
>=20
> Thanks Thierry
>=20
> Tristan
>=20
> Tested-by: Tristan Bastian <tristan-c.bastian@gmx.de>

Hi ARM SoC maintainers,

I had almost forgotten about this. Ideally I'd like this to go into v5.0
since it fixes a regression introduced in v4.19, so we'd keep the number
of versions that it needs to get backported to fairly low.

The patchwork link is here:

	http://patchwork.ozlabs.org/patch/1039743/

I don't have any other fixes for v5.0, so I don't think sending a pull
request would help you very much, but I can prepare one if you prefer.

Thanks,
Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqy7UACgkQ3SOs138+
s6HnJA/+PHzLYvNy0GVO2MraG3qTgVD/d+p6gMp9W1C/9XaTG1Sd+RXmQXB7h9aC
UCoSuyu9dCg+fupe3SB9K0NXZi0nIf48rKLMUcDe928B+7LCP1pc2ovcjUn+cbc8
dAzvEZmnfksgnzs+oWQ8ZwfZVGVdb29DsloWssvJ/WW6dTpps27CXD9CbTLCJa/1
v+mxJcvxKP1h+b6bdVtg47r26Yr1zW2NuNuXJey6WyAwqzJxplXTVznkhm4HcfOz
jhMAMmCa8h88fmqp+d4s098LgCNrHRDf1S13cNa7jLo1esciSfVM+pDWm1NlO4uM
g+hceh0thLuiQnGx4kTWZqlfmZ7IWUjYLQeQ5CikmBKrzcgKwmQEJIQu3oy4OsIo
IxyxSJqwQAaHMKoKUmLCTVzM9XRMbdljWIHV5gFgxKCdkKfuCrDEa/pm2Zxk4lO4
D7zs+xGujTUX9sqJ8Nkc3zWTLHnETsykCukkxwmineq34bUEOe1qW9OotqUYsXd6
2VoHhTfxZrKev24g40462MZjds9ZXSnxAocpBczfuK/j2Hsx1MhHC3683KshniyH
xCGBZlvwsbjGcxKZbuBIfnl+ryEbJ4jBqZFt/faos4FR4jKUU5/igQO+7HZrfKft
sdgOhJonMgpN5Cibw3YvWTQ4nTi7QCLmN4QheY8+GKu41LpzibU=
=cvh6
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


--===============1611701629079689294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1611701629079689294==--
