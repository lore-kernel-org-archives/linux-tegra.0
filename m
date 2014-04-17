From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/3] drm/tegra: Use standard suffix for hotplug detect
 GPIO property
Date: Thu, 17 Apr 2014 23:28:43 +0200
Message-ID: <20140417212841.GA11630@mithrandir>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
 <1397755554.2148.3.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1186038369=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397755554.2148.3.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lucas Stach <dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============1186038369==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 07:25:54PM +0200, Lucas Stach wrote:
> Am Donnerstag, den 17.04.2014, 14:02 +0200 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The hotplug detect GPIO in the current bindings use "-gpio" as suffix,
> > whereas the standard suffix is the plural: "-gpios". This small series
> > replaces this in three steps to preserve bisectability:
> >=20
> >   - Patch 1 adds new nvidia,hpd-gpios properties to existing device tree
> >     files while marking existing nvidia,hpd-gpio ones as deprecated.
> >   - Patch 2 makes use of the new property name in the driver and updates
> >     the device tree bindings.
> >   - Patch 3 removes the deprecated properties from device tree files.
> >=20
> > Since this touches both DRM and Tegra trees, I've prepared a stable
> > branch[0] that can be pulled into both trees to make the transition
> > easier.
> >=20
> What's the real benefit to this series? After all you are breaking
> existing devicetrees here, as the driver doesn't continue to recognize
> the old name. IMHO adding a missed 's' to the property name isn't enough
> reason to do this.

The series is explicitly done in a way to ensure that at least in-tree
device trees will keep working across the whole series. Obviously if
anybody were to use a DTB written according to the deprecated binding
that would no longer work.

However I'd like to eventually convert the driver to use the new GPIO
descriptor helpers because they make it a lot easier to deal with the
GPIOs. And with the new gpiod_get() function you loose the ability to
specify an exact property name as it appends the -gpios suffix
automatically.

The idea is to rectify this mistake now that there's still a manageable
number of boards in the tree and we have never really supported stable
devicetree bindings on Tegra anyway. Or to put it differently, there is
not enough functionality on Tegra generally to make it practicable to
use it in production. Therefore I think it makes sense to fix these
issues while it's still a viable option.

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTUEeJAAoJEN0jrNd/PrOhT1sQAKGwGWqBDUpGPYOnj27gotSe
RByyixdIAa1ubiXpdf48D6MiqPtg2PoV4qizzWJfbDYSetdekRaKR3wkC/3D+RM4
IsnSF4ok6OaK71hRxifvjAZgmvAtRVyLuoNPtzTjOz0sqrjPS2DpALcRQX1mP8e7
T/rtXNZgjISVHQOIjciE81Xh2WJou8Ly384GJaofIOBnmS9kAr0swT3CbjeEp1Rc
IaFVVu85AvAss5epBZQ5UPHm+9wcaD/gVAt8cFom3HpoBTrHnnJ5zxdL0di/O/2a
ZKilzl0FmRVBvqmx2o8dD/gj8kEnSrygbi8KiAxO0bLKrz1GRmEndjix98Azd1gD
ZJt3n1f8o0mKVudW3E4xBN0KPbdXJYgSW80/gyBCVJH3FTvXx9z72DwW7NB3rgMP
ZLFEZLg6I1xa3aQH9iiUmFdeKT/dvS45ZQw1Efs86wAh45IDfp2hCZ0qhEtlA6m0
j3s7zUHdH7TiBJc2saVognlntXKgCy7ovgvWUTCwK0EW7zdUlNDAg4BqTHG51B9I
QRB5w/T5hdwU/D7VlcTGb6BXgtHv8TxTZfB8PdClFWoiGaCl3VPI9hGm0/JMEXJW
ykt2Eq25/DDNHW76uXgeBL7jwHwZB5/x6DrELPuyrbv+zjh468FogqecO78UO/p8
xvkQhEdDHru7I0cpMN/B
=neOq
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--

--===============1186038369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186038369==--
