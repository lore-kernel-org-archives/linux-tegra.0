From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: disable host1x on multiplatform if Tegra is
 not selected
Date: Thu, 23 May 2013 21:28:58 +0200
Message-ID: <20130523192858.GD17462@avionic-0098.adnet.avionic-design.de>
References: <c4e0a1015f6f1e2d5104dd3a7ef1a35f0a88bd72.1369253144.git.marvin24@gmx.de>
 <519D2638.8090203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <519D2638.8090203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 02:10:32PM -0600, Stephen Warren wrote:
> On 05/22/2013 02:07 PM, Marc Dietrich wrote:
> > host1x needs Tegra clock support which is only enabled if ARCH_TEGRA
> > is selected.
>=20
> You should send this patch to the drives/gpu maintainer and mailing list
> (although perhaps Thierry sends pull requests for host1x?). And probably
> explain why it's necessary.

It looks like Dave Airlie is expecting me to send pull requests, so
patches for everything below drivers/gpu/host1x should go to me. Please
also Cc dri-devel and Terje (especially for patches that touch host1x
code).

Since there had been some fallout during the 3.10 merge window I'm in
the process of setting up an "official" tree for tegra-drm (and host1x)
and have it go through linux-next to catch potential issues earlier. I
will make a mental note to update MAINTAINERS to reflect this once the
tree is set up.

Thierry

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRnm36AAoJEN0jrNd/PrOh2GEQAKzctleoaMvdrHer75gy3QVn
lSJUaTrcx8hq/EM93AHShkdu2pLTALrr8IwhlsN9yTO/21zhxWrwJVhBm5wK+QSj
fFpWiAlVS0AwH8/nCizRP6Avv3WYmxjsx+NZWK9ddFABEUPsFAkT8Z68t3j6gxle
U1vmVpdQwZL7F7jKMzjQYCqIDaRIwWDL6SZTGexCf45nEyMzXOF/LtSjCgGzDiim
hYC0ZEgDJtJ7+mjOrlEhY95Hdygb+Zu5PlgD6d2XiehRkxGjm+TITIhIQ7wpiEit
cVkgtsnx6o1jyBv3Bgd08LlFiCeco960LyNSPgYFbHxyxyItvmcvNHgE6ENONCZs
QbO1axWKl1pJqga0tpVYoRBd7eT7DuXt+Gbjbzx+SgoNVW5dk7AmgIQRq9fAA1qM
3d9x2ud4+TVpOb0SlsZSoPP4C3f2NYaRgdwxIPlp87BA72C3vgumHci5dDnBHxf4
zpTJzxQhoxjn0CqDrlr/0jQUuTyWakwtQ3wql8OqUfOqSpzqxuk250nFS0dB18mz
8eiItsAhdIqrRk1yKppm7udGWLQdPqvse9RbZmQD4Q5EHidqTWIx/7NOOsnYjuD8
RtgKgQ6zEuiSDaCJjJuNJchib8zXvF15AnFH3G2C3B4IE8gSISFFEbJLhF4fFNUj
rWaqyBlTqsbHv+ve//El
=rsSw
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
