From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Wed, 16 Apr 2014 21:49:46 +0200
Message-ID: <20140416194944.GA10258@mithrandir>
References: <1397205401-24148-1-git-send-email-duanj.fnst@cn.fujitsu.com>
 <53480EB0.6050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673464185=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53480EB0.6050606@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Duan Jiong <duanj.fnst@cn.fujitsu.com>
List-Id: linux-tegra@vger.kernel.org


--===============1673464185==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 09:48:00AM -0600, Stephen Warren wrote:
> On 04/11/2014 02:36 AM, Duan Jiong wrote:
> > This patch fixes coccinelle error regarding usage of IS_ERR and
> > PTR_ERR instead of PTR_ERR_OR_ZERO.
>=20
> Same comment as the other patch; I prefer the existing code (although
> I'll defer to Thierry as maintainer of both these pieces of code).

I feel the same way. And in fact I believe we already rejected a similar
a while back for the same reason.

> It would help if the commit description quoted the coccinelle error.

"Suggestion" would probably be more accurate. There is no error here.

Thierry

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTt7YAAoJEN0jrNd/PrOhDJUP/Reuq3REUVpAPFghmexIBVvW
B+SgyY1LFsqWtZcOsaDm+NBnoSSY7dVV+uusJkXqX2rhRWW/0SG13z786NrOPZ2L
gELANVYgIfntUv9ctvv/kgKqQDZD2dLl1G07CJ4fe1temVbQ3/wBQaPZvfmMfr2y
M5kRxPPYqG0en2s6emiE/ePqNFXB04C/090aokVC1sP1FqLExORzPZ5D8ERg1jSZ
MN2kcl2dk+s9KM0/sKuoTFDNo01hAquOqU284nAVqep8aUVivc+o1f/aaBIFTW7V
4UE2N5PKCRYPlRGKspjVJNc63PzZGGvERu3MOl7Pv463ISkizQUqLaqVCaPOGfL/
VdfZUEevNCXQj1kLmIthMxDNQO5KsWlO+l704H5lJmlarhXcNvE/FxFVd9t0W0rM
T0t+oYk5SXFk2gG2afB2d6nEWelXyLvRZCbEBD5zWDXGARjj71GJuuHXG7UOD6wu
rs9Eny16ANQsh3xktHm7XVlvQj78ESxZstYHIaooXrLRnuBzutGcLPWsIgkwlAsg
u7FeY3GrynYJ6Hk+BDTzZK2jWvr1F6QvdQXxY+bHUPyIjRmJ8Y1R5yrDIDufOVKr
AEeJJMMGQ9rdX1wrythFynGV13aJbe/+yPvNg7rXj943VoCU43RlncTdrBb5yQNK
t94JYACQsUUO5LjKn9tc
=+eoI
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============1673464185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1673464185==--
