From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Fri, 20 Jun 2014 11:16:18 +0100
Message-ID: <20140620101618.GU5099@sirena.org.uk>
References: <1403164154-1362-1-git-send-email-acourbot@nvidia.com>
 <53A308C8.2070004@wwwdotorg.org>
 <20140619175643.GR5099@sirena.org.uk>
 <53A3C613.8030207@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncfrQ09dBbS73TfA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A3C613.8030207@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--ncfrQ09dBbS73TfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 20, 2014 at 02:26:43PM +0900, Alexandre Courbot wrote:

> So I can see three questions here:

> 1) Why does _regulator_enable() on vdd_1v8 return 0 while everything
> suggests that it is enabled (this regulator powers lot of devices, like
> eMMC, which are working fine). This may be an issue with the palmas driver.

Returning 0 is reporting success and you say it is enabled so I'm not
seeing any contradiction here...  or do you mean regulator_is_enabled()
here?  An always on regulator should report that it is enabled.

> 2) When an always-on regulator that is not yet enabled is registered,
> shouldn't it be switched on by the regulator framework?

This happens during set_machine_constraints().

> 3) When a boot-on regulator is registered and _regulator_is_enabled()
> returns contradictory information, what should be done?

Same thing here (same check even).

--ncfrQ09dBbS73TfA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTpAnvAAoJELSic+t+oim9BkwP/37LtNgu5Src16mIeQcafYF/
dpONEBPZyXaV3K+Oxg5PuanPNN+VaSi3LxQoDYMnXYq4TC1VbzDk6Hpb4Wi8dAJL
0BpVRX2mhOvNL5x9DmE+Dt1JrNIeTIuLqDjZXKx3li3dfRUsStSd10TA2z6TbMT4
B4tW8YSgep+Nfd5xngw6+6AFRNNOlMG32EsRtgkACdvwkQZoRowl0jAis3z7C1N+
3Q6A61KApTvV2NxqkpUa0ny1gqWtd7lEstc4OLlvJDw+gGzJK/oTQp4haz6ITCnT
NXpeJkJ530g6+H08r0ex4dy2WyEpmssXJobFL0ASIDh/2wImTBxag6rQ2KZ9Pfjf
ur8N4M4GGLBqukWiU/8hGPsncm+lXjKe5INDqyYKCBTLHzExAE8vBDrAW4cxzQQH
ykDEmLHzA860A0rVyZXkp/DoMNPek8Bwzg/pT4cO+4o1OA1XYCNzXOs1YajAGvtR
VjWL/EWV22hwf7GFgw2VG5mjq0/GsmOzJwVZqyRiDFCipu8hhTv59t3WVA87L3EB
87oMhTNgQjOgAQ67R2k20sTpUb/43bnbX8QQoGcyoD3GmuZDb3T0l1niMhMtxcfn
D7a4lqXByHk14Gf0PVNkZuJJGBVqI6uXIu6o5v8DT9k+nWjs3/zrT5WLo+r2srfD
1zU+OfsUn83vqnOVOcaM
=2SD8
-----END PGP SIGNATURE-----

--ncfrQ09dBbS73TfA--
