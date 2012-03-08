From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 05/11] tps6586x: Add device-tree support
Date: Thu, 8 Mar 2012 15:06:07 +0000
Message-ID: <20120308150607.GP3638@opensource.wolfsonmicro.com>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eBTWNsZZiigckDWV"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1331218291-16119-6-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
List-Id: linux-tegra@vger.kernel.org


--eBTWNsZZiigckDWV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 08, 2012 at 03:51:25PM +0100, Thierry Reding wrote:

> +- gpio-controller: mark the device as a GPIO controller
> +- regulators: list of regulators provided by this controller, must be in the
> +  following order:
> +    SM0, SM1, SM2, LDO0, LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7, LDO8, LDO9

This ordering requirement is fairly sad, if there are unused regulators
they still need to be listed even though...

> +			sm0_reg: sm0 {
> +				regulator-min-microvolt = < 725000>;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sm1_reg: sm1 {

...they all seem to be explicitly named in the device tree so presumably
there's enough information in there for the driver to pick any set of
regulators in any order.  This would be much nicer to use.

Otherwise this looks good.

--eBTWNsZZiigckDWV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPWMp6AAoJEBus8iNuMP3dHwoP/Rb4lgEnjRg/O8qzx0ReG0cR
PxTWrDHrtdUOjLI8E75ZrqZZjlhWuiN5ZtmoPeua+5WK0GjItCEJCvMlJRgOl8Ij
4G4m0ibMCOHWCy/aw60TfH25oPDMtXX/y5if97Rwm5whpggr/Eb2B6P5ujJJL79B
Hkgk2sSeQIqJKV9DGrcTtewQXvJswqo8quG2biV+UTwZAtel1eWf4aX3ZYjic6d8
lZM7TxF43A0E4EYoJPBRCBMsqIbcmVPQl+vRktz0DS0fN33jhrkcTeHWJBYPg5fy
0fabjXDM6nGrPl7BP0H4VdLb57GZ1woCkxJ2zl+Ew4C2E3UKRipj1d5+sHhfP4A7
E6xRRw2OUhdihI0gT3xyp+Aj+2L/JIvIvYbse8ORRTyp6+lsD6ONUgA2al1E2A+V
cgpHOPxcVlc1qRktrs+FZ/mGzbceb/3BDJarX9ZCmoMfvmNKR9GgNNgQH5F0Dh3z
is02SQXzl1F7dtVMnwqYbJtMg3PXCQX/ZM5DEeQ+GI1PtlzuPaHpKo8T0AAPYbLR
PkmfGKz3jWUgTSJQy8odKr9Ay5Jj/ZPySVTsJbRAEGqwPw0DkPnmzORrOYc3q9Th
5+7BRxdj6KMw9aU7flO/NQn5Kp4EeQmdtXV2QH/nmddJnVjEKyBqtqlEAZFAK0WC
yZ0vh0h5B8IQwPcpfvxO
=dfDH
-----END PGP SIGNATURE-----

--eBTWNsZZiigckDWV--
