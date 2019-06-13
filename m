From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] arm64: tegra: Add ethernet alias on Jetson TX1
Date: Thu, 13 Jun 2019 18:34:52 +0200
Message-ID: <20190613163452.GA3258@ulmo>
References: <20190613161517.2837-1-thierry.reding@gmail.com>
 <04a355c8-a4ae-9275-a85a-791ce5c1b34c@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1113257302511658468=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <04a355c8-a4ae-9275-a85a-791ce5c1b34c@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1113257302511658468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 10:22:23AM -0600, Stephen Warren wrote:
> On 6/13/19 10:15 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Adding this alias for the Ethernet interface on Jetson TX1 allows the
> > bootloader to pass the MAC address to the Linux kernel.
>=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2597.dtsi
>=20
> > +	aliases {
> > +		ethernet =3D "/usb@70090000/ethernet@1";
> > +	};
>=20
> Don't aliases require an ID in the property name, i.e shouldn't this be
> "ethernet0" rather than just "ethernet"? This is a bit more obvious in the
> TX2 patch where sdhci0, sdhci1, and serial0 are shown in the diff context.

I don't think there's a requirement for aliases to have an ID. The IDs,
in the cases that I'm aware of, are used to fix the index given to the
controllers in Linux (which is sometimes abused to get fixed numbering
that can be hardcoded, rather than having a more robust way to look up
the right hardware block).

U-Boot has a comment somewhere about ethernet being equivalent to
ethernet0 and it treats them the same way, if I remember correctly.

As for upstream Linux, there does indeed seem to be a slight tendency
towards ethernet0, though it's pretty well mixed. 32-bit ARM is mostly
balanced, whereas 64-bit ARM uses ethernet0 almost exclusively. Maybe
this means that recently there's been a push to standardize on always
adding the index?

> Patch should probably be CC'd to some/all of ARM/DT/... mailing lists?

Oops... I meant to include those. Added now.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0CeygACgkQ3SOs138+
s6FZGRAAie3WvvLA3MldS9O2cqq/CUfmWuGxbWSyjTIhIRx49f0S1nHj0WJdYOzA
EP7RUHDgqUwJDqkFsNjyZNU7fatwgd784WjL2vXUKZFf5PX04507kzZQvtDvW6g/
ARzahv1N/zU6YvTtLWGC7jgKRa6e8IltBQPIUYEURFamv3i+N+05oLz1xI22Nj3s
b/UAOncXztcR5tlE2Uusk+Avz+uHva6oNYB6WLyIlB+VZMdlUDruMA1n4uy/QZGH
ejkZOt3KteED40l5jQDxocBtqcJmudxE1HHMUsQh8Gz3JUtXK/l+ofks6DXgJ3H6
1ht2S3FoYJUETcV4GU8g1a8oeyuRGQ2yax8rHTBCiVIwBrlvc0b82wXYVOftPFtD
hCur2A/UqlNS3CYSOsE1GuazVNrFPMuqk9qCs1XU0rnw9QioTkUt305vuxCwFoH1
oVFXQGajdXMiTu4QfTtoolCWAugCQLT2W3YFW1qKJ20egvCkvvTQFvz0MX4Q3wGP
m1KD2eo+xCyWFetwLCZzl6yjaDOlzhqctWmVEhxZjV0Vl/C04KklxrD46gohgqzj
fY6TDnjFHVM64MVy8c55OA3PniCv1aQ1brf54eUdlTWp4MS6R3+4zYBP+X5MF3Vb
LQq624SnGItBbllLT+aoKhq0b8uUYszPiYImjX4VmsMqr+O6Q84=
=LHm4
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--


--===============1113257302511658468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1113257302511658468==--
