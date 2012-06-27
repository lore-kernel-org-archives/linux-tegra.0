From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dt: tegra: paz00: add regulators
Date: Wed, 27 Jun 2012 12:31:01 +0100
Message-ID: <20120627113100.GF308@opensource.wolfsonmicro.com>
References: <1340757060-27232-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1340757060-27232-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 26, 2012 at 06:31:00PM -0600, Stephen Warren wrote:

> sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a max
> of 1.125v, but this wasn't applied since apply_uV wasn't set.

apply_uV is only valid if a single voltage is specified.  If a voltage
range were specified and it were acted on we'd take the lowest (not
highest) voltage allowed.

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6u5vAAoJEBus8iNuMP3d9OIP/1hBQ7si7GK7S2XzP4H6WYLW
nRXQKYnqX3/ii5BLM8l3aErJHutqLpTedt7A51Ay3VZD2W3VAafwfM1Qw5WEDQUJ
8XD74GGnysZmgX+pF3CZWDCLOmV5t9schiBfAdYkLgEMQ4xXvlmsAZ490P5OoThz
I2xlLo8oDClxo7RtQAAY1Mknjmt1YSKN/w6B84ACMiqsRomk63Fj/J1zJMAmxyEX
J8+VE11S3QD63gnlpBpSTpT7a4e7VItVjjKlYdavtlkZFvo64mZZxYjP0LeCoOqy
0CL1weCkblQEfn9sptJ+WCr4VQTQGuIPbW7GKwC5DgI1XkraeI1taNk2MdqqFzw9
8FmtYVjbaXs2GqmMI+JE1aE6hSqyJ0ettY7m7jRqFXrXEWytj5qj4m7UCVW7jcsV
bR8isGY/0HGObHxuYWXwcGZzIejQJSNOheqFq+2I0voEw1jzsuxGh4J+kwq3QVu4
mp8/UyN40nrQ8AOgKFBcpq76hp3xF9ojXDCQ7MExRPLxwZOadX9o1ORg1E+0Pr5o
BskBXYeGHuoLdXAgabFEEV2wvAINjfxjZoVumRI1YDv0O4S53F8vjY/jZ0qmBAws
eNndu3tNRne3/xuydsZVLUsDySElyxBuH3x5ct1YThRh3BfmooDeGNCGx4XitqMj
EIAuqRd7sjw4Pwwew18W
=ZWJF
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
