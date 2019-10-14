From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Mon, 14 Oct 2019 15:17:52 +0200
Message-ID: <20191014131752.GF422231@ulmo>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-4-jckuo@nvidia.com>
 <20191009233900.GA9109@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009233900.GA9109@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 06:39:00PM -0500, Rob Herring wrote:
> On Wed, Oct 09, 2019 at 10:43:41AM +0800, JC Kuo wrote:
> > Extend the bindings to cover the set of features found in Tegra194.
> > Note that, technically, there are four more supplies connected to the
> > XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> > , but the power sequencing requirements of Tegra194 require these to be
> > under the control of the PMIC.
> >=20
> > Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it is
> > possible for some platforms have long signal trace that could not
> > provide sufficient electrical environment for Gen 2 speed. To deal with
> > this, a new device node property "nvidia,disable-gen2" was added to
> > Tegra194 that be used to specifically disable Gen 2 speed for a
> > particular USB 3.0 port so that the port can be limited to Gen 1 speed
> > and avoid the instability.
>=20
> I suspect this may be a common issue and we should have a common=20
> property. Typically, this kind of property is in the controller though=20
> and supports multiple speed limits. See PCI bindings for inspiration.

Given that support for gen 2 speeds is dependent on signal trace length,
it doesn't really make sense to restrict the whole controller to a given
speed if only the signal trace for a single port exceeds the limit for
which gen 2 would work.

Also, the USB PHYs are in a different hardware block than the USB
controller, so this really is a property of the PHY block, not the USB
controller.

Thierry

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kdYAACgkQ3SOs138+
s6HMkQ/6A3Fj9ZJJsdJnHLfvMDhmqc/ZtjXEf75kGFK8o5zyYn7mMEiIX7UJwn0v
u17ZP3AEz0nPbMpQ6VFkAH/JijR1m4P2vtl4/sxEpqWUpllPgb7cmK2ZefL8Wa5/
+tha3SoS//h5XjI/lwVfaxnzJyE7owSaumpZG5NzR5fk4UWcUOzmZXAQSedOKppX
3Jh5+pMwNenrbzvqxt0w1Lv0L3KMRH8rZN/r4m2WXNKqc/Zsb+zGAyF9uXylNd33
Q29CpQvAJZwuyPj1NGsSJqwo/rl65QiHmXqwJh8azlUL9LBpGurYtox1kytVbtrY
zxBxtLPuCabG5EvEPlGv0yv0no4kMvnZu1qCG10veWGkOGq7XHGyG8jdyBJDhBgt
Ahin5YDmVrfG1c5balwzNgE5ZMNOF074JgcL2MZN0ac5NKky2yFPSvdBxJvGLt90
etu2wctrjXOUmUj4Lr8mOh3QTD/mVHecHRfCWpSaaasDlQPj9g3NvCxvut8RWHDH
z9irlyyUI5ahytdR1bxhq3UsuDDT3W6rRrVuwjo3Rw37NYwaa4M7ppB4Zqv8rUkz
BGM9UTk+K39ZBBYYcHxdAJ1x5EChqh2WzAC/nGiwVd2hbgqj1I2zpZMSALBTUtlg
fno5aAC10Un6nevQlxAJ/yBxynSbGEhBWt1yVXKzdHSJhB6VKz0=
=+5Sz
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
