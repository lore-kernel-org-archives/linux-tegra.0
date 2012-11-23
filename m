From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Fri, 23 Nov 2012 22:55:28 +0100
Message-ID: <20121123215528.GB21555@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-6-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353577684-7896-6-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:48:03AM +0200, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch introduces support for exporting allocated memory as
> dmabuf objects. Exported buffers are used for delivering data to
> nvhost driver.
>=20
> Change-Id: Ide8244366e83747a108fc3aaf762ec1350dba616
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Makefile |    2 +-
>  drivers/gpu/drm/tegra/dmabuf.c |  150 ++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/drm.c    |    9 ++-
>  drivers/gpu/drm/tegra/drm.h    |    6 ++
>  4 files changed, 165 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/dmabuf.c

Nothing in this patch looks specific to Tegra. This should really be
added to the generic GEM CMA helpers.

Thierry

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQr/DQAAoJEN0jrNd/PrOhKgQP/AtD54WtqKIyPuOm+VaRKOcq
DCLNFyK38h4TkI65qp7CBhhaUbWwool3tkPwdnZFaBWwGaM3LIw6Cn4nKaWFE9u/
ri0gHzdWNX9hMihcsACuykPv3MrEi+D6XppbQqwWEwGIy6j1axNv/8fjMBqW1kcx
PmzRdVKggyjvraP3vbIn6yqBWbt/E6wThb5oNYl/kRr+Oc3AmU+JrIfcOJrF/CiM
YsFkzroQebzs3FM/CwuevQ2crojJAitVsguWcQHybxi61qVv8p6vKODM6TZRK0O0
t5ZnIez1+z3xbOAAany8fPNu8KNVF3s5XfuZbsc0Mafqt8HxNTXqMN/kA9e0+Amx
GVO6KvDN4RVBMko0kGhKUrRg5ivv5iBFII359Bb9LrNlESyOlw/wYgJhX545Sq4Q
FQjFZEU+pz7+KmVnkKvaydktP9G8MmOHl9eBuoLkPAy52V1wxP9C5zzw4UfsL1vL
rxxZPdoxry2E/mAHRysu5dlUnoFdU+XkK2RVcOi3fw3vcBwg9GSHrT2EEpuzDBnF
O1hMH/LC+SR10bx/tGbvl0oo4KUmcer86N0YZ9yLWHqI5pyk6wxAmEhg3hRDtadX
hgDT2noEudRGjhohcYxwJqv1V57BCCLLQkboyVfoYTX3OODGM+JcQtavpMQ6drtz
RYjlJ5F7j+8L1VP+uoEs
=fKw8
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
