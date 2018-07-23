From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error
	reporting
Date: Mon, 23 Jul 2018 11:25:28 +0100
Message-ID: <20180723102528.GA13981@sirena.org.uk>
References: <20180720080424.31505-1-marcel@ziswiler.com>
 <20180720080424.31505-2-marcel@ziswiler.com>
 <20180720121612.GC10784@sirena.org.uk>
 <1532089865.19673.13.camel@toradex.com>
 <20180721095615.GG16228@sirena.org.uk>
 <1532167581.19673.21.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6362421475197353317=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1532167581.19673.21.camel@toradex.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============6362421475197353317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 21, 2018 at 10:06:23AM +0000, Marcel Ziswiler wrote:
> On Sat, 2018-07-21 at 10:56 +0100, Mark Brown wrote:

> > > > > -		dev_err(&pdev->dev, "no codec-sync GPIO
> > > > > supplied\n");
> > > > > +		ret = ac97->sync_gpio;

> And here I assign ret with that return value from of_get_named_gpio(),
> right?

> > It's not in any way involved in setting the value of ret, whatever
> > value
> > that has it's nothing to do with that operation.

> I really do not understand what you are trying to get at, sorry.

Didn't see the above assignment you'd added, sorry.

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltVrRcACgkQJNaLcl1U
h9BPnAf/X7WpWwT+ycthPvj/M4GzQ9pY0c+5oUCBO66OIRz5TjmLDck3P0oSGlwM
tquV26H2D8YwAjE2QUE9QWH4rMmvObuf+yKEUuBhknCe4Uyk3Jcm3+A+BMtVZQ9d
9GPCyvwG/MeT2YukiJOlsh7TmVgU5qiPNJc2Gb40zeMJf0TxpEHLMut1vU0rqD5i
lwrqnD/iep0GhLrZAPIQ8b+kVBT7kQmrzkHf+YuVCmWqcsvPy7lEIfAYuI+OaNuw
SoF1Yu5t+gMwVgYhxpR/Ta1PHZqapX5yjpWmDtm31052akyXiDXQ0+9p/OOTSO8K
pxH071GVUcHGZPQ5Id9IFfaP4CnAew==
=DxoV
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============6362421475197353317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6362421475197353317==--
