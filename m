From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: don't timeout if CPU is powergated
Date: Thu, 13 Feb 2014 09:49:08 +0100
Message-ID: <20140213084907.GA11795@ulmo.nvidia.com>
References: <1d5ea6b7df4573d866779857922ac650fe59af60.1392078805.git.stefan@agner.ch>
 <52FBC97D.8040809@wwwdotorg.org> <4050206.sG2EzXyfMN@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4268375214769415983=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4050206.sG2EzXyfMN@fb07-iapwap2>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: dev@lynxeye.de, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4268375214769415983==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2014 at 09:28:52AM +0100, Marc Dietrich wrote:
> Am Mittwoch, 12. Februar 2014, 12:20:29 schrieb Stephen Warren:
> > On 02/10/2014 05:44 PM, Stefan Agner wrote:
> > > When booting secondary CPU(s) which are not yet powergated, a wrong
> > > check lead to a timeout after 100 jiffies. With this patch, we only
> > > delay powergating if CPUs are still not powered yet.
> >=20
> > I've applied this to Tegra's for-3.15/soc branch.
>=20
> also for 3.14 and maybe lower versioned kernels? Since this seems to fix =
a bug=20
> where some core doesn't come up.

Yeah, this bug has been there for pretty much forever it seems. Commit
86e51a2ee471 "ARM: tegra: support for secondary cores on Tegra30" added
tegra30_boot_secondary() (named tegra30_power_up_cpu() back then, which
was renamed to tegra30_boot_secondary() in commit 0d1f79b033bb "ARM:
tegra: refactor tegra{20,30}_boot_secondary". The latter was introduced
in v3.10, so I guess backporting it to stable releases all the way back
to v3.10 would be good.

Backporting to earlier versions (86e51a2ee471 went into v3.4) will be a
lot more difficult since some of the APIs were renamed since then.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS/IcDAAoJEN0jrNd/PrOhNGcP/jEshynHOlWfqieeS4M1Xp1C
qPDBKBn41A+gXjT4utzqQQ5OrYraVk5d9K2A+B7FP3iqHFxZ4gkI2c68g9kbEJWp
SQFXAhJJxNejIaT3/Y5MK6maH/JzdNL0fRKnomrLQYYNOv19zUyZXhbyiy7t48Qg
pbRlUrM2wyLhX1mVHH7VI6I0me0awVZOOPxukEZPY0v+YhiI3V3wjSBZMzdUlwKP
v12vpJc9Zo0sA+HrcgkgvkqoA1GN4fmu5bhcXV8moQyD8RZf6nJl7CO5U/bP+iX8
G8PO9VfdQs9ZxjNg1pR0hJehz7lRX1Dzw13z09cAMxEfTKUHcakWJ/fxxpcd7Yuy
eAJyA46P5DRJ+Xau7QhIdTTAWVDu+Bb7MesJqmGlkR5BYpgniS9n4sA9DnAogYuE
rAYZ/MSs5QF1HDveCPS89JL1tM+mRxDprfailcLTQFvcRJFMzVw2G7gFCnr7HFFm
lodVEgtbKh9FJpjuvzzW87uiylfo+b6CHNPxYoWz2RjQ+Bd6wHkeDMpisVjOzzxk
JtQYPayJh+Z9NVXDmlkoMi5OEknHcWugFrOLE2lexGDl6Lezagm8ylCoFKAoiCwU
0SyEWdkQo9Bx6YHVffOqmfFdX1ZJMeOQ21YrRwHCzok4dkzLi+l1NWYDP3XFKfol
4U9vGyRyj9hj3eYwfT5h
=1/7F
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--


--===============4268375214769415983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4268375214769415983==--
