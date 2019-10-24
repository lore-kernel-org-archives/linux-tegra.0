From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Date: Thu, 24 Oct 2019 15:47:56 +0200
Message-ID: <20191024134756.GC2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
 <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 04:35:13PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 14:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Jun 23, 2019 at 08:37:41PM +0300, Dmitry Osipenko wrote:
> >> On ARM32 we don't want any of the clients device to be backed by the
> >> implicit domain, simply because we can't afford such a waste on older
> >> Tegra SoCs that have very few domains available in total. The recent I=
OMMU
> >> support addition for the Video Decoder hardware uncovered the problem
> >> that an unfortunate drivers probe order results in the DRM driver probe
> >> failure if CONFIG_ARM_DMA_USE_IOMMU=3Dy due to a shortage of IOMMU dom=
ains
> >> caused by the implicit backing. The host1x_client_register() is a comm=
on
> >> function that is invoked by all of the relevant DRM drivers during the=
irs
> >> probe and hence it is convenient to remove the implicit backing there,
> >> resolving the problem.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >=20
> > I don't really want to do this in a central place like this. If we
> > really do need this, why can't we do it in the individual drivers?
>=20
> Why do you want to duplicate the same action for each driver instead of
> doing it in a single common place?

I don't mind doing it in a common place in particular, I just don't want
to do this within the host1x bus infrastructure. This is really a policy
decision that should be up to drivers. Consider the case where we had a
different host1x driver (for V4L2 for example) that would actually want
to use the DMA API. In that case we may want to detach in the DRM driver
but not the V4L2 driver.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xq4kACgkQ3SOs138+
s6FNag//dCQTLu7oPNT3zc3b6EaUkms9Hy4DuTeMGzeKtu+qZRIc8UeavqaUk+1h
XydJK/GxuftWAPot/ZAPPeczZe5hWM7621VwYhCnArmwZkCmcxgiUDNy2hjgmtmZ
K7PjUUhwLHAvckWHxwfaYy8Fd2m+nK2ALvppph7FNsAxfZrZ28KjEGIFx96mGwdv
/uoZt6jlhjvmEk0C5xRI8CGjZSCUy3/HO8j1oTLiE21ErxreCqAUZNXCKC6otQad
5NsRhzYIQA+SUiFx9a/OcvN9weYTk+9T1+6zm6zwxY1lWdMbsqztu8Ucm8Mt6OYC
20wB2GhKJjEZJrcXGf58CfHrsc8Iv5HzB2ozwVQAZjj3GptZZyTA0xNiJYin5Qso
9bTMICJqwwn2XLjKW/4+mqdZtd1/2fbJ3MOqYAwkCPC5PH/97NNN5RpcrQCYzvPF
XCBUuYA86v4T6o1j0NeooKfPFUiPjIfHbyPigPs9Eb5BzMtcxqh3F3VTVZ0tpcZ0
jl9ZbFNUQs690Zwc6MLTXePx58TwWU3GqHR+zcCEgn+1y7sTiZ9ePzDHuKGN8pnC
xpaur5WtxLu28PS2Q6Uu4o+TD1Ey/Ifc1JJlmyoEzHHsdgOfNPIWPs3MYAZS+Nro
IK8LIOje6av2v2hf1Jelpm/PbtIYOLFV2iFgDxofZy/bEoG0Xfg=
=FCO/
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
