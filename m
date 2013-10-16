From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] spi/tegra20-slink: Crude refactoring to use core
 message parsing
Date: Wed, 16 Oct 2013 23:02:55 +0100
Message-ID: <20131016220255.GG2443@sirena.org.uk>
References: <1381957255-24344-1-git-send-email-broonie@kernel.org>
 <525F081F.1080601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WSOhVhnkoy8Ebt2V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525F081F.1080601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WSOhVhnkoy8Ebt2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2013 at 03:41:51PM -0600, Stephen Warren wrote:
> On 10/16/2013 03:00 PM, Mark Brown wrote:

> > -static int tegra_slink_transfer_one_message(struct spi_master *master,
> > -			struct spi_message *msg)
> ...
> > -		msg->actual_length += xfer->len;
> > -		if (xfer->cs_change && xfer->delay_usecs) {
> > -			tegra_slink_writel(tspi, tspi->def_command_reg,
> > -					SLINK_COMMAND);
> > -			udelay(xfer->delay_usecs);
> > -		}

> That chunk didn't seem to end up anywhere else. Is that expected?

It should be handled by framework code and it's buggy anyway, the two
fields are not connected and cs_change looks awfully like it'd at best
only work the first time it's used.

--WSOhVhnkoy8Ebt2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXw0MAAoJELSic+t+oim9PP4P/1k+Tlk45+4eGcyfVhRg8iPY
4TyBezgBQLav+Q77xkMA9xpkeIkFdCueKvceCg2uWfLnCmP8BhGjA9FVpnNOLzye
yHxwDQTWjXeoqnfWQni0Hy4pJXKMt6TQ+dYr+b43VWy7RvTURWidsP3hY6OGPKkN
FCJZyHTTv6X0xQK6n24Nti8HTVHMKdHHDyXXbTthScE1lIdnh2x83R0RYK1JtxwG
C0tnkvVmYJ6DH2tLk5ideynqvV+sVofL7y6hOqXfYTwiwJV5tZ/xIvebFn3qnVDK
k3gHX4ywq28uZdgi0sUkSGI/7GQEVjPzLDEDW1YqORG2Ba7Z4LYFVSqVsknHeAoc
PinNCyOfDDtA845uhCvJAfqaRoM10gb3LvOjmsTEXj92NajMuLcRG3wbngE+7CBx
PHXU31EL7wN9P5Y19tEHCePG1IWBOWn6YkeN81/wnbboTw7aNPDiwZEXqW/hh0WT
p70XrH7IzxZU3gJAuGda3AoboCFEflD/B45HEHr0wy33/p7PdNedNDrKPxXQD7yk
QT/FSyohfN1RSEIYNCpaNp90KlOcx1c9s8WGIFOfrGbFZsLjJWU8iEM2D5a3MTcJ
T2LTif5kG6GMJGDc2VX+8d4qXkpxZhf8To0eb5YRw0rh3o4erkA4xZOfcr4EjlBE
uuc7L2TYUOkS8PrLLI2B
=fafO
-----END PGP SIGNATURE-----

--WSOhVhnkoy8Ebt2V--
