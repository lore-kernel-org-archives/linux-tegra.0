From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dsi: Flag for non-continuous clock behavior
Date: Mon, 14 Jul 2014 10:29:04 +0200
Message-ID: <20140714082903.GL2081@ulmo>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
 <1404822734-8603-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1158199472=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404822734-8603-2-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1158199472==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9JSHP372f+2dzJ8X"
Content-Disposition: inline


--9JSHP372f+2dzJ8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 09:32:11PM +0900, Alexandre Courbot wrote:
> As per section 5.6.1 of the DSI specification, all DSI transmitters must
> support continuous clock behavior on the clock lane, while non-continuous
> mode support is only optional. Add a flag that allows devices to indicate
> that they support non-continuous clock mode so host drivers can adapt
> their behavior accordingly.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thierry

--9JSHP372f+2dzJ8X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw5TPAAoJEN0jrNd/PrOhlUoQAKbtjd+7jG3NQlrpEH5M+uIE
04sBQC/+fBRjfzbSFOvKxrsuVNnhxzWnjh+9C0xHvvZCgF+Nk0lwRr66YHhghIY1
3S+DEzBYK335pwNGND7g7+no4aGc7tfmzV1ufB+wvylynxJncmPFB7FdiIzFXNhW
fMmY+kmDJOndcHHLDQGbiX5mz88Lqs8NRin60COKgsPx9mVybZ7G+Ls/N8RliHlU
WxnvqhPfrp4anZZM6+lSvkCgp1H1gH5wN4RV1t98lzfITDuZHhfEjv8R5joxoWQp
1Z6GTzoAakuM6KmTJ8tOKLG62PeVCWTXibVyMuseRqyMgo8/wTVPGeksMufddnmZ
Cw3hI98ya8xPN6AZfO3w0JrgTlo9syXlTknMcaUXQNSPDHZJJ66ncg7lE01cYKgm
g7RazkfsSe0gMzRmz52IYyJJJ+WFvLeioikPAoOxgfxIwQKLAlnhG2ynFck2dglU
7hwEle3XPv348XjKL0+qleMhrjIckyCZem12h0zMrgOzjmywN60adU/6VlMNEG0h
UWXu5bD8FtEF0w1miCHx2r7J8zDyGR51I/hSsHmZkZJ3gmuooFiTgIu3T6nax/wR
ha21JzP2e6d6PoEdjHJg7xIpey7Yp6sr0ufenFN1tfAw9Q3H6Ab/Ix/DFgYz7WZp
2GFFIQ7gwANTR7c4A8Tu
=JYoN
-----END PGP SIGNATURE-----

--9JSHP372f+2dzJ8X--

--===============1158199472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1158199472==--
