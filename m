From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] host1x: cdma: use completion instead of semaphore
Date: Tue, 11 Dec 2018 11:27:10 +0100
Message-ID: <20181211102710.GH14426@ulmo>
References: <20181210215119.1903413-1-arnd@arndb.de>
 <20181211100832.GE14426@ulmo>
 <CAK8P3a08VEReXUZ39f3iQS3wUZSwKYObnn-jQrUiMJ4Gyx6hVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131341977=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAK8P3a08VEReXUZ39f3iQS3wUZSwKYObnn-jQrUiMJ4Gyx6hVQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: emil.fsw@goode.io, Mikko Perttunen <cyndis@kapsi.fi>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--===============2131341977==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wayzTnRSUXKNfBqd"
Content-Disposition: inline


--wayzTnRSUXKNfBqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 11:11:38AM +0100, Arnd Bergmann wrote:
> On Tue, Dec 11, 2018 at 11:08 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Mon, Dec 10, 2018 at 10:51:04PM +0100, Arnd Bergmann wrote:
> > > In this usage, the two are completely equivalent, but the
> > > completion documents better what is going on, and we generally
> > > try to avoid semaphores these days.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  drivers/gpu/host1x/cdma.c | 6 +++---
> > >  drivers/gpu/host1x/cdma.h | 4 ++--
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > My understanding is that potentially many userspace processes could be
> > blocking on this, which I think is the reason for it being a semaphore.
> > Is the completion going to work for those cases as well?
>=20
> Yes, it behaves the exact same way here.

Great, I'll queue this for v4.22.

Thanks,
Thierry

--wayzTnRSUXKNfBqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwPkP4ACgkQ3SOs138+
s6HIbA/+JFwP435Ilng50f4ZLkabfeZnPpo3KewBVB3x9kqif203Z/fvqNPtnW61
bHltheckdQUJitANGYP2sehBL+bfld6jkFrguQVjLkinZ6LIAeNszxaQGS5RQxny
a8L4IE/TGkpWmVhMFvfE2emcaGXBD5XwyU9eSYKnH+wMKAVqzpNIQW+I0vKVPLF6
60dPm/KJBZtDXrorAlv8NuZjcYZA66NQIjUS2aLw4zykjFiNdI8gc3DHzTrBYGHF
OI//UPtbD1Z34jJ+yrMKXC1BMj8TI5jW6Ze6f6Go2t8GJpsELs9L897ti8/8AuDp
AY3NJ2pNoLtJaurxomJJqXILDCj/uHNQ6dcKMtNxQTEbWjYVslAeo9sp9LSkGHLW
fy/Oo6GiTw7dlQQ581Efao1L7zADnMxsOjsPN0QIAoFYTWrgyM5MaaVvqSO4ckxk
cMpe2lLnB8Q0N8XuLVue7fwe9a634mqYgfwRsx3WE/SSkAO8GuHFtJlGquv/MDm7
q+a/Wlf8Si6j0N/S2psz9e5DAIbjTv3VyGxeEbAV/rR7OHOYTvdOwZI5Z+XWXuxs
8aQbo9ct8LhlCDB0SpRAc69p+CbdEzPJYw0m2Tce/qLDxY7+G0mb5nYQthARBHF4
JSY7iOpNm03GOC2/AiBxBJzndN5dTOC58cwDlRSRkfgopB2UCcg=
=f3WX
-----END PGP SIGNATURE-----

--wayzTnRSUXKNfBqd--

--===============2131341977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2131341977==--
