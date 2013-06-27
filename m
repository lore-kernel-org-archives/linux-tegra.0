From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: tegra20-ac97: Convert to
 devm_ioremap_resource()
Date: Thu, 27 Jun 2013 12:11:06 +0100
Message-ID: <20130627111106.GW27646@sirena.org.uk>
References: <1372245608-15596-1-git-send-email-broonie@kernel.org>
 <1372245608-15596-2-git-send-email-broonie@kernel.org>
 <20130627102211.GC15081@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4326638614458409942=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20130627102211.GC15081@mithrandir>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============4326638614458409942==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hImnF3KMhyKrbB+/"
Content-Disposition: inline


--hImnF3KMhyKrbB+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2013 at 12:22:12PM +0200, Thierry Reding wrote:

> Can you please remove this error message as well, please? A message to
> the same effect is already output by devm_ioremap_resource(). Other than
> that, looks good:

Too late, send an incremental patch please.

--hImnF3KMhyKrbB+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzB3HAAoJELSic+t+oim9WZwP/Amxsuy8FlTxzzC/Vn3mPAeT
yAkh28l0hbL8dK+kS7BqrPOmAGJ7yDjDcSxUMgNlvUsBwE9dRTC/9N5uybYeaTiG
adAPaeQbll4cP+DjKUYnvlQbvJ30ZbjC1TIHsbyobJD2CVkPfos7sl42+u/qs4mb
hyS+mT92A5tic34F7zSoIRCj+KOiCejWxucC8X1oj1IYftE9i5pnPQWVzqasgxO7
svftltA+L7TrRBMEbJsp//Op8vxzO1bBlqTJuKo/21CZst0t1XjcOFh+lsolK3YM
cHnCm6bM/vcvhJXanPf7kDIUlITelicOa6D3Lzxy9pS0kAJzuxJfpBvF3MlMCi81
Yh4bYNhxhbB0Rn+gNkQMm5TwzBCoo9mhofEG5OgaGujjAiBKpvoCse99o9CIr089
612tfusH77cZrDI1P0BhbTZICz3ZPG2RPDuHjSDgJByMy/02VdpfVH1rAXREadDI
UIZ4ZmE5ajS5n7fqKiz2UO3M8ZLZznF/ZMminq3RmPTeki8+Ze7WGyEV4UGTmwFC
A3BCZq50pjb8P9foNkDq4kYs5fWLBxNKk2mb08r6Qacwvh1Axh6FS+Zgvl3/gRpV
56WqvXmNoukYy4/XCQS7IURkQTcGoOFH0B/1NoU85v83MJ32Z+4DjnrC9TLtbZkD
BnKDAQE29ykov98mLmzK
=nOAL
-----END PGP SIGNATURE-----

--hImnF3KMhyKrbB+/--

--===============4326638614458409942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4326638614458409942==--
