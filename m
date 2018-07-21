From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error
	reporting
Date: Sat, 21 Jul 2018 10:56:15 +0100
Message-ID: <20180721095615.GG16228@sirena.org.uk>
References: <20180720080424.31505-1-marcel@ziswiler.com>
 <20180720080424.31505-2-marcel@ziswiler.com>
 <20180720121612.GC10784@sirena.org.uk>
 <1532089865.19673.13.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4247015806527658385=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1532089865.19673.13.camel@toradex.com>
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


--===============4247015806527658385==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
Content-Disposition: inline


--0qt3EE9wi45a2ZFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 20, 2018 at 12:31:07PM +0000, Marcel Ziswiler wrote:
> On Fri, 2018-07-20 at 13:16 +0100, Mark Brown wrote:

> > >  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
> > >  					    "nvidia,codec-sync-
> > > gpio", 0);
> > >  	if (!gpio_is_valid(ac97->sync_gpio)) {
> > > -		dev_err(&pdev->dev, "no codec-sync GPIO
> > > supplied\n");
> > > +		ret = ac97->sync_gpio;
> > > +		dev_err(&pdev->dev, "no codec-sync GPIO supplied:
> > > %d\n", ret);
> > >  		goto err_clk_put;
> > >  	}

> > This isn't reporting an error code associated with the attempt to
> > find a
> > codec-sync GPIO, it's the result of some other operation.

> What exactly is then the of_get_named_gpio() above please doing if
> not getting the codec sync GPIO? I am not following you, sorry.

It's not in any way involved in setting the value of ret, whatever value
that has it's nothing to do with that operation.

--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltTAzoACgkQJNaLcl1U
h9Cr9gf/Uajueh0tP2ANyMJ75Z87P4f3b/nF3mN5D/jxrZYbr42S/NBnjkm+lhEW
6zDiWAkzrTRg+X9WrdphxFZOqitLmrkKycnS8UDQZh0M4ZPSFPTLnXMWS+LHhhoK
lDk1mX7s6unzTF2xGs7FTZKd1PW/BqGTKCDL0MHUoQwLriZ8qsz5qqKV/nnfUSBz
V+1WswE0mMF7eYsWx9J8/Asbslr4QZJ0zT29aqGVyVZnPmrXF6GMXM9Mgg0Se9yf
UjB5AoNSsjgY6Kmz5a68xb/doF7yW3YRfkbJjJg+XrA8R3b2DMYaASdDgi+e0fqf
u15lzygMG5fbKBXhW6758dt2isQd9g==
=8Lir
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--

--===============4247015806527658385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4247015806527658385==--
