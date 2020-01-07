From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: add iopoll-like atomic polling macro
Date: Tue, 7 Jan 2020 12:09:02 +0000
Message-ID: <20200107120902.GC4877@sirena.org.uk>
References: <1578392889-16587-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578392889-16587-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 03:58:09PM +0530, Sameer Pujar wrote:
> This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
> similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
> is atomic version of already available 'regmap_read_poll_timeout' macro.

In general regmap really can't be used in atomic contexts - we do have
options to configure a regmap so it can be used there but they're not
the default.  It'd be better if the comment mentioned this and warned
against use with normal regmaps so people are less likely to try to use
this in an atomic context when the regmap doesn't support that.

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4UdN0ACgkQJNaLcl1U
h9DYeAf9GaS7jI51qX2g+IBgjs6DjJVcyUu7LnhBIzIIAb9aY3ggw4kxK5cXwz2Z
TcbCCMz8vy4xdiW4DMTF/FZH7m1poO6cHqImuFDBDm21Jiutn4UOgXZyERRuGe0W
QTGNOPukvUCjynzfuW9cYh9TxV+SbICDzAhOw/35cLoakSme8PfMdjCB2BjPzcvt
nmiqo9aQu7MIvTM9ln1P8CDGykJhZpFr30i/Ney0gYKs+/OrOEqmMiIazWDFlSrK
ZVlPTOWDPECaB3zznmiy+Amn9c33tQjtwGtwSUP5NEhslzLzCJ12/xgufXtyz6DA
72ABc7At57aP58stNmyes0JFsrd4hQ==
=gQir
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
