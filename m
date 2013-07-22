From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] ASOC: tegra: move AC97 clock defines to the
 controller node
Date: Mon, 22 Jul 2013 10:46:27 +0100
Message-ID: <20130722094627.GK9858@sirena.org.uk>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
 <1374442132-24040-2-git-send-email-dev@lynxeye.de>
 <20130721233651.GZ9858@sirena.org.uk>
 <1374476927.1644.4.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ai6NJizWfpRUKxSm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1374476927.1644.4.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Ai6NJizWfpRUKxSm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2013 at 09:08:47AM +0200, Lucas Stach wrote:
> Am Montag, den 22.07.2013, 00:36 +0100 schrieb Mark Brown:

> > I'm sorry but I just don't understand what this change is supposed to do
> > - what is the current place, what is wrong with it and what is the
> > correct place?

> The clocks used by the Tegra ASoC utils were defined in the machine
> driver DT node for all boards, as this is were they get requested by the
> I2C and SPDIF Tegra audio drivers. Differently from those two the AC97
> driver has to request those clocks in the controller drivers, as they
> are needed at this point for proper initialisation.
> So the patch moves the clocks from the machine driver node to the AC97
> controller DT node, so they can be requested in the right driver.

Why is the way the other devices are doing this sensible?

--Ai6NJizWfpRUKxSm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7P9wAAoJELSic+t+oim9V+gP/irqFIQHL9zFNHVOuKthlKT4
jMayz5ImfTLW5HzzcDUiJcWwgP44JHgVkbCm9d+DNkvyyFQ5Pom2Md21tKtKNaWR
xuzUq9Y4s4YdG3V7DBkIJ4JwZaBLOKm8f5IM2vwAQ5VQA3lDdU18nvDnKjX7X+N6
Uh0ZhG71y4S5agihX8o6SAr/Wptbm5keKUKXO94x0xBjy5W+2LVOySJqjEDznubR
esIAn5XnmId1+HxbDEUHGIEBACroUmX/sjCohBAbxiuZ/9e50gLKupUGV3kd9cGx
9zrBKcLl4nu8CN7yQdRWxqEKhz/PwumwNdKVe7N8Nm4uzygc4sZdheY8t8Y742zm
3E+9SpgDc98CTQxj6Ck6bfWycd+jdPXsVSqzgx0iDOyEfFTfD1SX8PFPcwYCY7fT
Y2/8nWzv3fcK+OEr7zXOveRmjyZm9fcEF1JTSYlLUbSAsYKyFS66Hs66Z/KyLbtA
a8zV2Ib/ZTrfpoHXSDP2z2OL5U+X3f89avGDu8fS2veoOr+FezuEFJw0d10Yavw7
0Smg7odqEu2L/CMXThvwe+aGTMXtBT8jMqhem8obFH2FjpEFaMN2GrtFB3niM04n
xvOyQkIICHh2vSf9PCa+ZUDqpICWTbTng6mTOjqRGIqoH+wzmAFkActWn9ju6vN8
SwVksuIQ3lgGS0po4gYm
=7vWf
-----END PGP SIGNATURE-----

--Ai6NJizWfpRUKxSm--
