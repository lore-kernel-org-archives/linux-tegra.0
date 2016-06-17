From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 09/13] dt-bindings: drm/tegra: Add DPAUX pinctrl
 documentation
Date: Fri, 17 Jun 2016 18:31:33 +0200
Message-ID: <20160617163133.GH27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-10-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1596979227=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-10-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1596979227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Content-Disposition: inline


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:43PM +0100, Jon Hunter wrote:
> On Tegra124, Tegra132 and Tegra210 devices the pads used by the Display
> Port Auxiliary (DPAUX) channel are multiplexed such that they can also
> be used by one of the internal i2c controllers. Note that this is
> different from i2c-over-AUX supported by the DPAUX controller. The
> register that configures these pads is part of the DPAUX controllers
> register set and so a pinctrl driver is being added for the DPAUX device
> to share these pads. Add the device-tree binding documentation for the
> DPAUX pad controller.

There are a couple more "i2c" vs. "I2C" in the above. Please use the
latter consistently.

Also the subject line should be something different. drm is a linuxism
and hence shouldn't be used anywhere near DT bindings.

> Please note that although the "off" function for the DPAUX pads is not
> technically a pin-mux setting but more of a pin-conf setting it is
> simpler to expose these as a function so that the user can simply select
> either "aux", "i2c" or "off" as the current function/mode.
>=20
> Update the main DPAUX binding documentation to reference the DPAUX pad
> controller binding document and add the 'i2c-bus' subnode. The 'i2c-bus'
> subnode is used for populating I2C slaves for the DPAUX device so that
> the I2C driver core does not attempt to add the DPAUX pad controller
> nodes as I2C slaves.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  4 ++
>  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       | 60 ++++++++++++++++=
++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a124-dpaux-padctl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-host1x.txt
> index 361a472eac4b..6759554b7b8f 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> @@ -242,6 +242,10 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - dpaux
>    - vdd-supply: phandle of a supply that powers the DisplayPort link
> +  - i2c-bus: Subnode where I2C slave devices should be listed.

Should we perhaps say at this point that the subnode should always be
added, oven if empty? Otherwise we'll still run into a conflict with the
pinmux nodes.

> +
> +  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
> +  regarding the DPAUX pad controller bindings.
> =20
>  Example:
> =20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dp=
aux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-=
dpaux-padctl.txt
> new file mode 100644
> index 000000000000..3be0ced01680
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-pad=
ctl.txt
> @@ -0,0 +1,60 @@
> +Device tree binding for NVIDIA Tegra DPAUX pad controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +The Tegra Display Port Auxiliary (DPAUX) pad controller manages two pins
> +which can be assigned to either the DPAUX channel or to an I2C
> +controller.
> +
> +This document defines the device-specific binding for the DPAUX pad
> +controller. Refer to pinctrl-bindings.txt in this directory for generic
> +information about pin controller device tree bindings. Please refer to
> +the binding document ../display/tegra/nvidia,tegra20-host1x.txt for more
> +details on the DPAUX binding.
> +
> +Pin muxing:
> +-----------
> +
> +Child nodes contain the pinmux configurations following the conventions
> +from the pinctrl-bindings.txt document.
> +
> +Since only three configurations are possible, only three child nodes are
> +needed to describe the pin mux'ing options for the DPAUX pads.
> +Furthermore, given that the pad functions are only applicable to a
> +single set of pads, the child nodes do not need to describe the pads the
> +functions are being applied to.
> +
> +Required properties:
> +- groups: Must be "dpaux-io"

Above you say that we don't need to describe the pads, but then the
groups property does describe the pads. Why?

Thierry

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCXlAAoJEN0jrNd/PrOhCXoQAKf1IHK3zmf58MeZpaSBLTVL
En/okJ3nbEmUdJoVKC3JOXXMClMOj2CXH4+IkkIi5+QM7KjG+h4LFnpJMy4yEWBA
rulmRdjXEhmgnVcJN7jHD/mzZ9R38pJXST/GwlZaGV2duPt0G8YK/RE4Po2pmdVF
kLvW0wnuzzvkypJ5cYRrKBlkKlqyvoWSaCyStGLKJPIb0VpEhF1NPs2iQBacpuOk
a69EN/Ogafb2/P2PBHy9r76d3WxBu82mfwQdkvCnXkUN/ib9GkB0lIFp+bhXavrS
lEuT+LFBfPs5ZshLDeNgvXHphUppgHO1PCO+bYDp5L3XbhqP9hxTNUMgTmntiBbv
RF0hRpQaQenDjSUBCIcte0q9aOln4PXkFfHYs4Fda9JJFoVqqYYFmMULUnsscOmw
fgJJHjCz4twoshUJ5d66srHSjYQJDHDy+7Ynu0XqGMuZOt1rY28rodGK1+URQZtW
+XKoCH4sSOzdckEHBxAv8eEfXHzeuhRVDidGli3sQH/OU/HkHZfrG8GKbQMe4Nsm
oGU/85Yn7+O4kntY162wi3q5t+NJpiS/LxA7RVqQYrDn+LintXuSsr96aeJTkuhS
stOlubD5iAh8/PoXxBhuNHOxt0Zw2pIcb+Cj6os06vhSqnKNqx4gtgFc9168GdqJ
Q95mfUNVGohwvn+aMILt
=tJ/7
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--

--===============1596979227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1596979227==--
