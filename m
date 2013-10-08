From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: tegra: Add MIPI calibration DT entries for
 Tegra114
Date: Tue, 8 Oct 2013 12:05:30 +0200
Message-ID: <20131008100529.GE19633@ulmo.nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
 <1381146528-18069-4-git-send-email-treding@nvidia.com>
 <5253249B.6010008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5253249B.6010008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:16:11PM -0600, Stephen Warren wrote:
> On 10/07/2013 05:48 AM, Thierry Reding wrote:
> > Add a device node for the MIPI calibration block on Tegra114. There is
> > no need to disable it by default because it only enables the clock while
> > performing calibration and therefore shouldn't be consuming any power
> > when unused.
>=20
> >  include/dt-bindings/gpu/host1x/tegra114-mipi.h | 11 +++++++++++
>=20
> Shouldn't that file be added in the same patch that defines the binding
> that header contains constants for? What are those constants anyway?

I'm not sure. The values themselves are not used within the driver. They
are merely a convenience for DTS authors.

In a nutshell, the values defined within that file are a bitmask of the
pads that need calibration. There are 9 pads (5 for CSI, 4 for DSI) but
the association to each input/output isn't immediately obvious. One DSI
output uses DSIA and DSIB pads, while the other uses DSIC and DSID.

Perhaps in this case it isn't useful to introduce the header at all and
just using the numerical values would be fine?

Thierry

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU9jpAAoJEN0jrNd/PrOhCvMP/ixRct6UF1XbYq8IEvZleAgH
fbDCApqsXvTagInZu0jRdj1sf5Up/8pD1nW9vLNCbOVqYszEYbe7sfzM7DOapcbj
WNRPMQdArCGqsVLVhMS9ZT4gmNoLvWiZYFF7suIFvqZDlCF7zh5LixFPAeaOmRjy
BwaYcMR1MDisWaFtl5Tk3hjn5CA6eu+UBECrV+SBq0W5jKKs3MTUcxuCDWEx45VP
NLRWHxKwNLpc0nvjrx7Lsqey430AgAif3bFfFP057fIKqy9RVVrNXbnIzOqMeC0+
D0Bdd1RllwGMkSO2iIKS+Tp89rsEk2snu0XKA1Gwi8y2PjNsnwL/Qmoxoj5rW6tO
X8mxTxWgHz5lnfGkEjCVeunIZc7UQoSn892J8TWPmSANvcd0YhaITn0EZmFt9Mss
I7aYP4jpmB6oEEjao3BftH4Rou0hne3wzdWOMkaW3p0/Yk7P2FCeUCLx67Zordeh
FGwPoXridR+8AeKJo6VNR8yp0ox8aq2cm6i9BFGhREgYnwsSpb6QkTaaE1uASD+L
VKEILgPbVriCfWV3qpxlhkorGO0NNUAiZRyVy2A/a/3jR+321rxe0IHQ9yvm4mm7
CYu7KzY6I5QJGU5qUDrVgLRTiy1oJP0udCtOvVKR3Hj2FbOibHbJlTuYEcD61Azk
nxmm2szJOkDW0YRw1XaG
=e7WE
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
