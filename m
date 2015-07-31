From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFT PATCH 1/2] i2c: tegra: update CONFIG_LOAD for new
 conifiguration
Date: Fri, 31 Jul 2015 12:42:59 +0200
Message-ID: <20150731104259.GD1522@katana>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, andrewc@nvidia.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Chaitanya Bandi <bandik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2015 at 04:24:26PM +0530, Laxman Dewangan wrote:
> Once the new configuration is set on the conifg register of
> I2C controller, it is require to update the CONFIG_LOAD register
> to transfer the new SW configuration to actual HW internal
> registers that would be used in the actual logic.
>=20
> It is like, SW is programming only shadow registers through
> regular configuration and when these load_config bit fields
> are set to 1, it causes the regular/shadows registers
> configuration transferred to the HW internal active registers.
> So SW has to set these bit fields at the end of all regular
> registers configuration. And these config_load bits are HW
> auto-clear bits. HW clears these bit fields once the register
> configuration is moved to HW internal active registers. So SW
> has to wait until these bits are auto-cleared before going
> for any further programming
>=20
> This mechanism is supported on T124 and after this SoCs.
>=20
> This is based on change done by
> 	Chaitanya Bandi <bandik@nvidia.com>
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>

Applied to for-next, thanks!


--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVu1EzAAoJEBQN5MwUoCm2TqsP/AmrFY/jQ7FimUuOA3Un4VHc
bF69wIcQuXqDNSdxLObins9iMu9clKLrjEM2rvCrKMKOmOfxBS/fN1umoO9kwama
dMNq6pFLY8Z2bcE7/SAc1u4t/YemEFPitkiez9PADbMb2EuNI8ajed+5YGnRbaEq
qXNbLOYqJsGoTjXaYbRCDZqcVu9tvOH6vy/WWhnYa29e369D4kcWniSrg8JLL1Me
clj0ArPmcMJcjH8eJISL5OwWVSMD9VZu2WIHApXQembnb9aPfpS9xAfbP7gAuJmN
eHeNWkczlLHN9tgPutY456Xj12O7FN39aJrH7Y25Nx80u4v169w4c4hMgUes6KPa
6KNBIB3lJ0qyD494CgazcP1Yyh/NGTlG+DNNPDnIBDWek+JJoOMYhb/m/XHo9NaA
QV3pCZ/z3aKJg+g7YdLVtBnFv23pAoabXSrJr+iuJ8VdaL17iJIYLuk75XVWXpIz
fk/fg44WN/+ipILeOzJlxaXH4SQcUzmu6vCoLcfrTEufUZ842+aKY2iIf35C+8E9
DKiYAkDe0lCAHXmfxrlka6fpegCGivNGgoLrAzM/rbAlIMnC2XSZ/oCV6atP8JEl
FefTpBx/OYRw96IU4jH2zphE1y609VpKoBjcAXy/Jc+hLx1JH5BIx7cgnH2s3PNz
VHy6H6ooywwBuGekWywF
=QTqv
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
