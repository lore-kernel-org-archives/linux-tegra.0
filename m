From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Mon, 22 Sep 2014 12:11:54 +0200
Message-ID: <20140922101153.GN1470@ulmo>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
 <1411376456.2599.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0169981433=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411376456.2599.1.camel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0169981433==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zl+NncWK+U5aSfTo"
Content-Disposition: inline


--Zl+NncWK+U5aSfTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 11:00:56AM +0200, Lucas Stach wrote:
> Am Freitag, den 19.09.2014, 15:53 -0400 schrieb Sean Paul:
> > Per NVidia, this clock rate should be around 70MHz in
> > order to properly sample reads on data lane 0. In order
> > to achieve this rate, we need to reparent the clock from
> > clk_m which can only achieve 12MHz. Add parent_lp to the
> > dts bindings and set the parent & rate on init.
> >=20
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>=20
> NACK
>=20
> You are pushing SoC integration details into the binding of the device.
>=20
> You have two reasonable routes to go here: either the clock driver needs
> to be made smarter to reparent the clock in case the required clock rate
> could not be achieved with the current parent or you go the easy route
> and reparent the clock as part of the initial configuration.

Agreed. There doesn't seem to be a case where it would make sense to
have this configurable per-board. Can you achieve the same effect by
adding this to the clock initialization table?

Oh, I just see that we have this in the Tegra124 clock initialization
table:

	{TEGRA114_CLK_DSIALP, TEGRA114_CLK_PLL_P, 68000000, 0},
	{TEGRA114_CLK_DSIBLP, TEGRA114_CLK_PLL_P, 68000000, 0},

Doesn't that work for you already? If not that'd be a bug that should be
fixed in the clock driver.

Thierry

--Zl+NncWK+U5aSfTo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH/XpAAoJEN0jrNd/PrOh1M8P/AxtZOLbNbgA++oJ1E8pGueE
jH2q86Z/wR9KC7pMDQQBZOObA6q97gWsw1KYRn/wt6hFkPqbwiLcQjxPiqU4byJp
AUky5JgAqUtpnh8scN7fYYMY5xw6QA9swScpZOJAU5QIBwjhq60BMC3qzUey/1Cw
iMiaWRyg2rz4BMSLq024JHprbR9Ghl2GeLcIhoziVl6q9PdWix6MGq3ZAlUbqEUt
RxK4ReS0mEq2/QkjujVRciKJZVm9DdKESAUHH2a5Y/d4Md3ejp/Gq6QtPfxv/4fL
cVyhksfiTVaCL8LFJ8r7OfWXtu60x5V6a93laHBvek2xK+EGL89R6EN0iHcTyEFL
qf81RcpcKl5N/nazqzZEzj1RlybeVY2vRg9a/GV04JYwEnWziDbDrO62Is9Szqak
Bbv0eXpgSojxGGzIXWnY5CXhUzupNq2CESPNXGP3yT5zR5Nbaz4HL7mtCkEXl18A
Ib3cOKeqOIXj/3xIDCmMPEExwoN3G7mvRVeG4CfOWahoCQKW+b/aDe8UkVCnrzn3
GBwmqsMrB8ZwzVMGzM0m/TTlFOs6MVuPxgwbm2JrOSTfbQSEsAvTcysVZw0rdYJu
QWxJ3VLblTALgEA8hv/Ubs8MjFueE0ueI+WfsDp09N1emD2Vbhp1wXdaFUhIMZQ9
JJEl62DwGffoSR/QwO1j
=gwge
-----END PGP SIGNATURE-----

--Zl+NncWK+U5aSfTo--

--===============0169981433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0169981433==--
