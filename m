From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch V2] spi/tegra114: Correct support for cs_change
Date: Fri, 27 Sep 2013 14:25:11 +0100
Message-ID: <20130927132511.GD19304@sirena.org.uk>
References: <1380214904-12899-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AmJdx/+JAF2YHMk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380214904-12899-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4AmJdx/+JAF2YHMk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 26, 2013 at 01:01:43PM -0400, Rhyland Klein wrote:
> The tegra114 driver wasn't currently handling the cs_change
> functionality. cs_change is meant to invert the decisions of whether
> or not to deactivate CS after each transfer. Without cs_change, after
> every transfer (other than the last in the message) the normal behavior
> is to leave CS active. For the last transfer, normally CS is
> deactivated when the transfer is complete.

Applied, thanks.

One thing I've got planned is to build on the existing factoring out of
the queue code so that we have several operations decomposing the
message transfer, something like:

 - Set /CS
 - Map/unmap data to be transferred
 - Actually transfer data

partly to avoid issues such as the one you're seeing here with fiddly
stuff like /CS and partly because the mapping operations should be the
same for many devices, as should the /CS manipulation for devices using
GPIOs.

I've started working on this today.

--4AmJdx/+JAF2YHMk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSRYc0AAoJELSic+t+oim9SREP+QFVT0/aLicB3VJ0u0oWzuBt
+E5bx6dX2BlmpaXUxYz236YQTDPm1aoXt/DfDU1hpgnrIOkELfZbSlyE6IRPDPCa
GNqpsonDli072PafE5yTp59tJha8H++AKZCkiQpDe9J7SCXjHosd1UiHcy5hzv/h
3OLp+InW3TXEvF4JvbRTmhpEbvLY7U0mNewOUcNdL+EiExuXa31d+SOo9H/PFFeU
x643m09zGpMJ512aobSvjmQ+u6lo7j2An0ovHWESibDOtb+NJk+GU8jeUXxX+S1C
Q4qo8FMvWfrp5lwE4S6miPfSTPRk6zG4n2rWIPsz+sB+7/8OYi0Je8C0CEQAcOwP
QKVMlUja34rDcYLC5qZBtfRT+UqtDKfuuBW1voXjeugaqYr6QsdlaFO4HA2T0TE/
vUD3rcUSMBD/ydMElszDEj0jYL00T+Sj+7pnQO5gFzJmToyG7KkOBSNJdNz8yho0
1tpd8G/qcoz3kbA2VLjPATbqqQkJ/DtRJDszX24XOqK6xqX9F8wIdvWvybXeFy8q
eQhduW6hcJNAdepF61kDtTD4RNGFU/LKNCbI9YFOnUK9iXVBCHeSkDq9zvIWlPKy
SeRzdWUGjV5I0hrzrDSt3xNoW1BfY6XH2LHP7XXcDz1FyB8gFGPJZtsyuubpbKGw
4U+RVNZuZmCc9sfbMfT2
=b6wR
-----END PGP SIGNATURE-----

--4AmJdx/+JAF2YHMk--
