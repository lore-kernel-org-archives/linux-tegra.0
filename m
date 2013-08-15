From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Thu, 15 Aug 2013 13:05:53 +0200
Message-ID: <20130815110553.GB14301@ulmo>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
 <1374442132-24040-5-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1374442132-24040-5-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2013 at 11:28:52PM +0200, Lucas Stach wrote:
> Core and CPU voltage settings were a bit on the safe side. The actually
> used chips on the Colibri allow for lower voltages and work just fine
> this way.
>=20
> SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
> Colibri uses a different version of the TPS with other voltage mapping
> tables for SM2, currently we cheat by setting a fake 3,2V which results
> in 1,8V physical.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> The issue with the used version of the PMIC having a different voltage
> mapping for SM2 should be resolved properly. As this needs some bigger
> adjustments at the regulator driver this quick fix is just aimed at
> stopping slight overvolting of the ram with 3.11 kernels. A proper fix
> should land in time for 3.12.

This wouldn't happen to be the TPS658640? I remember a similar problem
with a special version of Tamonten that had this version of the PMU
which supposedly is pin and register-compatible. Well, it is register
compatible alright, and the pins are the same as well, but the voltage
tables are slightly different.

I did attempt to work the changes into the tps6586x driver at some point
but there were a few things that made it much more difficult than I had
imagined.

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDLYRAAoJEN0jrNd/PrOh0tAQAMASdwiPLtjXZox0B1w+eAFr
LbDS8IXT9HdXQ1hL3/8X5Y7h2ZkvELyKIETJFvUkKJSWR9NmrcJEjEeu5CR6dkjg
dg7jQwSxzn1E99mhx1NSA3oYX+d4SnRoBXQL8U5gjrvHMz3XTYWekC4ptYMxMxTZ
lvetlkUasFhIgIsdtmDdLfmU/QHZn0x3EV4ss9qEAQJVhOmkrnZ/luCeoOeZVt9i
YeuHhqJ5fXIWPXi6+WZQcEA66e4PGPlzHlzpmFhi5OjtD0LMDwneOPNZH063fjWR
Pkhx3dX8LKYoNLNvNk77L5w3H+WMwuBaSQkAdVYs7W6AqXQHyJ1YQpxD7dNU3qCu
wm7+4xO6UD7/VRk6rdp1udE4H45vhqoNVU7pL4zF00V0Gy4cIpZQ5MQjcEMlzk3M
1rO9z1neY1Lm5yqFYWQ+UDWZ+5X8+BhokLM6SZyJ2boRqVFy+I0fLA3JKSs90fTk
i27eb7ftwTBhehKPZNnY0+Xl3urpvpAtAgDCtHKKsux+wTmQJOSkJHanWtrukSBr
+aummhJQBTF6yCZDJN9VqQLhdi3stMTFtHdHZCNjSsqN4aoMUl0qdm2Ir18eRBIw
I0G76/sYOnCyTlB7I+N+D5bec98JjDXg42LmtQe9FPYpuKOktHm6LXgJBjtu78BE
q4nVE2Bzqyle6bEvh3+/
=wQDp
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
