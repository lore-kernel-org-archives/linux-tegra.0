From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: tegra: roth: add display DT node
Date: Mon, 14 Jul 2014 08:05:09 +0200
Message-ID: <20140714060508.GA2081@ulmo>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
 <1404822734-8603-5-git-send-email-acourbot@nvidia.com>
 <20140711131421.GD10827@ulmo>
 <CAAVeFuKMU3vpDoog-k3X82OZn1VR5iRMpwo5LSeX7cPMOqfXVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1770182132=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFuKMU3vpDoog-k3X82OZn1VR5iRMpwo5LSeX7cPMOqfXVg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============1770182132==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2014 at 11:37:14AM +0900, Alexandre Courbot wrote:
> On Fri, Jul 11, 2014 at 10:14 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Jul 08, 2014 at 09:32:14PM +0900, Alexandre Courbot wrote:
> >> Tegra DSI support has been fixed to support continuous clock behavior =
that
> >> the panel used on SHIELD requires, so finally add its device tree node
> >> since it is functional.
> >>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >>  arch/arm/boot/dts/tegra114-roth.dts | 22 +++++++++++++++++++---
> >>  1 file changed, 19 insertions(+), 3 deletions(-)
> >
> > I've applied this to Tegra's for-3.17/dt branch. Thanks.
>=20
> Thanks - how about the other patches of the series? Ideally this one
> should be applied last.

Those will go into separate trees and I haven't gotten to those yet.
I'll probably apply them later today.

Thierry

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw3MUAAoJEN0jrNd/PrOhs+8P/R71NN/w/x8f5TVbiQ5t5l7z
s1qs+h8YRjF7k6cBG73X7l/e/7fhhn0Yq9IfaX/bGYF5YcmKEYd65orm8dOqrpcs
c6qgCiaXr4bl+5jXt3PKHC8ehXI7SnO/pQh3DDvtHVMOuEgvq3Kg1t4JZ2Cz+WRn
MAe72bZlj40Ue+bXXa93kr0hTna1H2XAQGd87V/bjcOBmRE84ZAb/OHODbw35QDm
Gc7BE9gAfrqdDtvW9YntVW3CUmpvZlzZAYXqAeZTh2tE2QrDHpchOwTKbgVQM1VU
z/j5vMqgh3Pilv1B2dzaX4GyNDIon3C2D/f7AqxP1ch5jfUk+e73yyhqjn4aPGhY
29x0sYcvTQ8eNuXBmjtDsgXvKBx0LUMlx/w4Xae7QmUQrJJ97h8gJ6b6snwpoaEc
ujq2mo+TALuFBU+VtLwbAB28upkgfW1es2VbERg1OdcvqLGzoOHbqGohSRGLf6Yg
ASBm8aWr4uFLGFLugDF9H8f5kbypA5WKBA+Up1wKWs6Wh2TOAlhqtNePps2daSL4
1q9CVT25chLS9I+m5Re7EURqlnRVvRkqUim3ctgXfQOFn7vnqhNtxFcH3a9Ijk80
KqGlPxfZW7+Ap+tXoTGLS7cLwivB+FIee/dd1sxjh1VInBC1HMEli+NOydTsgDaf
aNPoC8QaJgYW9zIHjwD8
=0jhA
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============1770182132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1770182132==--
