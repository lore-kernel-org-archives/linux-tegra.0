From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Thu, 9 Aug 2018 12:21:04 +0200
Message-ID: <20180809102104.GB21639@ulmo>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
 <20180714212210.at4b2gcpopsznyxx@localhost>
 <20180803104318.GA28546@ulmo>
 <CAHMsQjU=nmpTnPK6Ryhui67YVANHExd=yRB4hp+upd7O-Tjn+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1208241788314556288=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHMsQjU=nmpTnPK6Ryhui67YVANHExd=yRB4hp+upd7O-Tjn+Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anthony Eden <aeden@csail.mit.edu>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, arm@kernel.org, Olof Johansson <olof@lixom.net>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1208241788314556288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 03, 2018 at 07:26:04AM -0400, Anthony Eden wrote:
> Mesa support aside- if I start a computationally intensive job on the
> Jetson TX2 like building the Linux kernel on all cores, it will lock
> up. My only work around has been to disable the Denver CPU's. I don't
> think the tegra186 has upstream support to control the fan on the
> Jetson TX2, could this be a thermal problem?

Yes, I suppose this could be a thermal problem. Or it could be something
else entirely. We do support CPU frequency scaling on Tegra X2, so what
you could do is keep the Denver CPUs enabled, but set the powersave CPU
frequency governor. That way it should use all the CPUs but at a lower
clock rate, which should also be able to avoid any thermal issues. This
could help determine whether or not the problem is thermal or something
else.

Also adding Mikko on Cc who wrote the Tegra186 driver, maybe he's aware
of any issues.

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltsFY0ACgkQ3SOs138+
s6Hu+w/+LIjDv7ziEb6UqYVi2TTMn/x+yFp1UcIrWa2XOz+nmRZ8oXUL6zrqVSEN
Q1PsQCwHPBDDGWghus+XMWDf60f2Ew4qY6vMEtdfIW8yH/xFChzAaxWE3c5iAGBp
q2bitc1qIhjUMmXx+3I5e6bYaRmnZTNej2VPeRJunGfOaiXwFzyW9JFDBWy05tcc
q9Ul6GIzDJvx3Nj9V2IJFxHX2O6Z7183ls05DJFkXdtWatjhqASi8f6VnLELZ3Si
psytrWEfifBFosQm0whKQd0lxAclgGlV3bU3A9YUhsdbS60U32HsgZKTdex7QDvM
WXjspS8lkVQ0TsJIMTLabEgfaVm6EZM09Gdp7IYHt30ZpGvDI/HT7GZTLzEIP7TC
AfaCNQ5r4u6DPZKn85ljLzi7NVU92CJ25teXmoFOfYHclbLn99njimkA/6OACn8H
NlwvGVOAW1ENrty0QLyrfP3nzSTNH6tTs+nb9/PKC14eT0KGEee6BBE50skMTCao
Md0SNyEkGjGM/ogJO3CxdQkGet23Wb88g2JDYX0wb1+y1y7xNw7kQZsegDt6YRLh
Rt/2u2B4U27v0uTiVxq2FXhrqZGKIcxZRV3ZIKfcsrHqTYBePspM10byhd8VMoum
XSuBwny0/eWLYgIEUQeQZI1NCdEVYyFcs5S1ggGeAjfM2JEq5aM=
=VT9r
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--


--===============1208241788314556288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1208241788314556288==--
