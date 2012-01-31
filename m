From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/5] ASoC: Tegra+ALC5632 machine: Add device tree binding
 documentation
Date: Tue, 31 Jan 2012 19:38:14 +0000
Message-ID: <20120131193810.GD3429@opensource.wolfsonmicro.com>
References: <1327995040-27152-1-git-send-email-leon@leon.nu>
 <74CDBE0F657A3D45AFBB94109FB122FF178E124438@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E124438@HQMAIL01.nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Leon Romanovsky <leon@leon.nu>, "lrg@ti.com" <lrg@ti.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "olof@lixom.net" <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rdunlap@xenotime.net" <rdunlap@xenotime.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2012 at 09:52:42AM -0800, Stephen Warren wrote:

> Hmm, actually the block diagram and "pin assignment" diagram are
> inconsistent, e.g. AUX_OUTP+AUX_OUTN in the block diagram vs.
> AUX_OUT+AUX_OUTN in the pin assignment, or PHONE_N (block diagram) vs.
> PHONEN (pin assignments).

> Mark, do you care about this level of detail? I think we should use the
> names in the pin assignments section if we do change this patch, but I
> guess things are clear enough as it stands, so I'm not excessively
> bothered.

Not really, especially if the datasheet doesn't agree with itself.  This
is the sort of thing that can vary between revisions of the datasheet
anyway, so long as it's clear we should be fine.

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPKEMKAAoJEBus8iNuMP3dLJEP/0KCBDgv0igTEl8r3q32OQN3
w/HY42ew56TaYTWSU+6IsKDLvjb9pJmUfLWq89yErAdAFlFu/1OPpz77f9mK5eSD
1iYopDwMYPz7iT72llSm3RkmMot5DENV1ziScN5M56d0HZN5v7A8zEEMzLjUv8DQ
zMQ0Trsh5/2mv5XLbZZhVKJLBOoLkgmUWFNdHlleTTbsYYJ3pGvtWHuakmbeXiYC
7Svk9x2+KgFeiQZtCMKtxzku94te1D5Vd+ZkXVA+9Lw5SFpZ5vvUUX3+AaDe9nlq
MR7HqgwAk84fWPDohJIkY5RgNHICX0v5ysxIKwHGAzIVwcCVyZXvLiOhE40j+uq+
qAgkV+ZNpORsaL7p3hFoIgVYdeR4HfCtuXBS944DPo63NPiC5LtPwg3KU585IVu4
z//0D+pxmFXlNDBbC07AlowW72GH4f1PsdSchCuIPX749L/YUEx/Dx3LubQxgwhX
TVYD+rN+C+lm7nvCdYLb7tXHkFc0T3Q05pWCJKvwGOIoxAsmtrszwTKSKOrLYcTu
COnjqT5q5OcV7iH8OuvZkdZWbiUTg0gE9TI2oMEPB3+CpGd5CsBAh5p4uADDPZkI
dx+wcYWNnc1jnyU2DWYWi860WtrtFXdkVZHpy8QpxQhAVsNulCwIS3UCzo0PfeH0
VHoUMAbnYtztuZxC6FBh
=IYzD
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
