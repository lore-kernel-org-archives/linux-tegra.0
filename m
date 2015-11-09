From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Mon, 9 Nov 2015 15:36:56 +0100
Message-ID: <20151109143654.GB11362@ulmo.nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
 <56310CE8.3050107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56310CE8.3050107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2015 at 11:59:04AM -0600, Stephen Warren wrote:
> On 10/18/2015 10:57 PM, Alexandre Courbot wrote:
> >T210's GPU secure firmware loading requires a write-protected region
> >to be set up.
> >
> >This patch reserves the upper 256KB of RAM as the WPR region and locks
> >it so the kernel can initiate secure firmware loading.
>=20
> On T210, it's the responsibility of nvtboot (which runs before U-Boot) to
> set up any and all carve-outs. This code should not be necessary, and ind=
eed
> I expect the registers it touches can't actually be programmed from U-Boo=
t,
> which runs in non-secure mode after WPR is already locked.

Can we document this assumption somewhere? It's entirely possible that
someone might want to run U-Boot without nvtboot, in which case nvtboot
would still need to be responsible for setting this up. Or if it isn't
we could still point at some location where the interactions between a
first stage bootloader and U-Boot are documented.

Do we have a document of this kind already?

Thierry

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWQK+GAAoJEN0jrNd/PrOhNHUP/3woEryiahJlRn2jywayFEpI
buEH6eDZ4fGN4mxMOQFdDRh9YISsEadOAqNwz5k12ivYCzmbHHdFokGFS7uQd3lr
GKbvpg7ywwSbfOSfbkLeuIDlQlI7nvmhTKdS2cNd+vmBA7eH3B/3nEmT7Q/PYmky
i8wPdnYu/tzki4UlB+B8zJbvnQyK92CAZTLaQV40aVM2M6il6+VDdjS97lwGCFZn
KnZahUF0MRlCBMO8aADacsiJ7RrMK9x+2l/o6OocNwSfNT3mteQXOK37qGGDvmTC
jAtEo1su5nWG2RguZKNHbbMGKT/Sm3P3sN/bBa2+LKFkJIsuPAS6RaMbmjjpqejb
5WU2DoDq8xrvogn1oPQLw1GbcTb6QJoaS/WYxNwy51SJFLEQXj21TnZx/c5LtCse
oLGGS3J5wfVhZBDLoeJkGPgGgJxjtOrMLxC6XEIFQPjG8GyPAk8ZHmerswT8aAhS
YVyEXKnrCJ0lBv5qCGpfiize5gVXRZDSsYdn1xucC1j4N4yT1S6CP72KoyK1PMQe
S6WvvA+l+/93gqRSn68NZfDvxlPJUm9w1yw1G2pgNTGS0PM6q8nxwiBYmp0YtUt1
hr5+9W5aPewzEcJ5w+9QVs4nZPyndJyCwiR6KrZJw+kjoC27NvtuOXfE1blYP+Zr
2HxXsgWh+HxRY3LjkRIa
=durI
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
