From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock
	handling
Date: Tue, 17 Dec 2013 21:43:52 +0000
Message-ID: <20131217214352.GF28455@sirena.org.uk>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
 <20131217140017.GI3185@sirena.org.uk>
 <1387291793.1783.3.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2276202429522927503=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1387291793.1783.3.camel@tellur>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lucas Stach <dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, swarren@wwwdotorg.org
List-Id: linux-tegra@vger.kernel.org


--===============2276202429522927503==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 03:49:53PM +0100, Lucas Stach wrote:
> Am Dienstag, den 17.12.2013, 14:00 +0000 schrieb Mark Brown:

> > I don't understand this commit message at all I'm afraid.  What does it
> > mean to "be in line with the devicetree" and what is the purpose of this
> > change?

> Clocks were added to the DT after the Tegra AC97 driver was initially
> pushed upstream and the layout changed a bit in the process. Stephen
> Warren convinced me that it's the right thing to let the Audio PLL be
> controlled by the ASoC machine driver, rather than the AC97 host
> controller driver.

> So currently the host controller driver asks for clocks that aren't
> there in the DT. This change corrects the clock handling so that the
> host controller driver only ask for it's own clock, but the Audio PLL
> handling is pushed into the machine driver.

Are we sure this is the best thing to do here?  There is standard
clocking behaviour specified in AC'97 so if the machine driver clocking
control includes that it's not clear that we want to vary it.  In any
case a clearer changelog explaining that the driver never worked due to
these clocking changes would be good.

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsMWVAAoJELSic+t+oim9o1oP/A4w3u5CUsRd5fZMpX+58MjL
CtnbvLtlqQIJjpYRxIfkNGSuzrGsFgear31WVPLI/4NdBhSMCL+7ciTB0x78qieH
Uzed0qfrNznabhWRo30HnIu1TP3e6vXKt/sMw0NNrIxGD6BVd1e3aEv/+GFYYc0m
P2Xd9DpwC5nwnUVtuFxg6MgpbRphAVHFCHexoH5W6X5kGnAKJCE5+qwWYaYOPWlF
41UpwNo9btuMl7C3KbRDjP1l6CONdnlbvMt1k0v/Gsl9YiBTi6bddFwy1qmGAPHw
DDV5hErjFwDAxQOacf7Y8jLzDoJsFE+cY4eySvWXtNOPqql0L2H4kBCHvfzQjPiK
Dy8KRPKKeNMGWtiSUTgbcJX9Hx4ysbggjXRTlBnAVIkOAFm+4FBpqrPPfkcNt96S
P4p5vI8zSVU9SASg5HzRvjj8xCIzQOMT6yp0mKEJ7IZj4u1qNPfUUIF7ZES7G/K3
lugnM+YNjfNvs+Qneknv6jTeNByODnAqRBK6nLkulkEpW8L514JOO0HLkATR+bBC
YxsGJYPOLzFSN8Cdy9Ca7CnPKz3/JuUPGHEX/EeXkXv/Gsgs7QRHsduxNtKW8IRh
fF4PV00yO3LxMl7bR8HE1j01lhTsDfKi2c/5TrwZJr8S8c86ywUiWrRsfX6xqA6F
znPepFzIYH6SMelkkent
=TF76
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--

--===============2276202429522927503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2276202429522927503==--
