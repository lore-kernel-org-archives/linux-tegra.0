From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 13/17] ASoC: tegra: set a sensible initial
	clock rate
Date: Sun, 1 Apr 2012 11:36:29 +0100
Message-ID: <20120401103629.GF3153@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
	<1333148852-17806-14-git-send-email-swarren@wwwdotorg.org>
	<20120331201754.GM5012@opensource.wolfsonmicro.com>
	<4F77B856.2050708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7723810822637106746=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <4F77B856.2050708@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org


--===============7723810822637106746==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 31, 2012 at 08:07:18PM -0600, Stephen Warren wrote:
> On 03/31/2012 02:17 PM, Mark Brown wrote:

> > Applied, though 48kHz is a somewhat surprising choice for the default
> > CPU audio rate - the overwhelming majority of audio played winds up
> > being 44.1kHz.  Still, it's just going to get changed as required.

> I may as well change this to be consistent with the Tegra-side patch. I
> note you said "applied", but I don't actually see it in your kernel.org
> repo.

It was there, probably forgot to push it out last night.  But I just
dropped it since you're about to replace it and I just rebased onto
-rc1.

--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeC+cAAoJEBus8iNuMP3dz8kP+gMSv5gw/PEcsOIUMVd65kH+
3EEFOIp1r5pHy5fz8fBPPf3S3nP22KS0xD936eJiuM8meQzsz2scJNi4Iwl/XDw+
ysjK2udmrtIPI6PpMAT1XTV4Q41l8RAWuqcu1/+cF3adsKWmVYwWsebi2BHkdcTu
OywC5WQ7jv+pRm1zKzymwRAkc7Ln9BQ/nDg5vDorZgOZQfdrkTB4+eJsjRbT421c
yAzMRPfs85VwsyELymCJdO0/gzMy9cpEQtYRfCB49kGMc0p15HGun9s6A4KUkz2C
4mT8ucMfP1vdN7p7suRygsz3HO1Xo5iNVTbxgmQUuA/duIbhcHqMXEFdCo+qpuwp
8TW6cty9hGF0pTBq1EunRS+2fdNMXCpRkq5FAq6ivjRX9m1Dm0nJnhLeZ6povRw6
GgVgxBzUp7Febtn5qWJ3cxoBgsetIcxa2mRlNwr3DgFCrhr/94nqdeVt86NyyceD
aDGo5fTvWossqcVjh/R/+EFN2sRqnD43V+iSCIP6WIaxuY+sKCMcK4y3sx8eq38k
NwA+HkB7k5vo2lcelpSBrv/kyr5vs5YfeALhm6Z123eKUKbbf+fcsV5ETjZmpVSA
xuzPt48j9RYzrhMKcN/u0VTe9clNprd+Id+1sZoIaLuddSWrhIHtXj/wa7LbjqFQ
MFFPbA5bGa67NFcTjfzt
=rt+V
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--

--===============7723810822637106746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7723810822637106746==--
