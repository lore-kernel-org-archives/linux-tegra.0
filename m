From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v10 1/4] i2c: tegra: use readl_poll_timeout after
 config_load reg programmed
Date: Tue, 30 Aug 2016 22:32:55 +0200
Message-ID: <20160830203254.GC3645@katana>
References: <1472584279-19924-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472584279-19924-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 12:41:16AM +0530, Shardar Shariff Md wrote:
> After CONFIG_LOAD register is programmed instead of explicitly waiting
> for timeout, use readl_poll_timeout() to check for register value to get
> updated or wait till timeout.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v4:
> - Split timeout calculation to separate patch
>=20
> Changes in v5:
> - Move disabling of clock to separate patch
>=20
> Changes in v8:
> - 1st change of [PATCH v7] series is merged, v8 is rebased on top of
>   merged change, here patch series is changed accordingly.
> - Updated the commit message as per review to properly reflect change.
> - calculate the register offset seperately to make code more readable.
>=20
> Changes in v9:
> - Use readl_poll_timeout() instead of readx_poll_timeout()
>=20
> Changes in V10:
> - Rebase on top of [PATCH V2 0/9] Some Tegra I2C Updates

Thanks for the rebase! However, my code checkers showed a few warnings:

    SPARSE
drivers/i2c/busses/i2c-tegra.c:504:21: warning: symbol 'val' shadows an ear=
lier one
drivers/i2c/busses/i2c-tegra.c:451:13: originally declared here


--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxe12AAoJEBQN5MwUoCm2nXgQAJSYpqZKlhiV+DqmA3hWyhpe
GXJSZLVP4PNdlLN1WfRd8ybZ5QJDRXzTfKuo7Uu/XVfs5tv60PQ8YayrVIiHvWkD
U0DLpWKaT8zQfIc1AgjFjqrG7MiJFH/b/tREYIvY8i2r9ozMc7njP+CXcgFu47nu
59JCEtOP0cjI2rT+xnboF04CiFP/3QQIQPMfDZuzdaMdXf/onmMJzQxyD24KbvPO
z4XBAAsL26C6E1pKGRbCz47H/uoMPt2PSZSu17GueiSLC8Rf7dWE3oBTTfofFyXw
5sa/yvS4GVF05T3h+eeEYhl/1jtTjejaKl6qKB8s5I7izIE/G1Yg5rV7W/iHWJFf
a8NSzytGeLWOWxcKPdbbGUySw5zL7hlL7xZEpH2yTarzJjlrDhWeASNXqhuavRyp
kkEQxqHBicQ6Cdn0pRuxcWfLU+m6iW0DSDukuc/cZ5VVE1XDyghVmpc3VyZJwRH3
EFNU+hyaQLUZV6o1t/uKkQol4disyiEVXQsd5hU1s6Vtl/6t0JqkftC9EPzMkK1k
FciCUf26m+tOBOJqyLz7WdEyRn6b1u2yQZAp2C2T82sBq5GUvxjxuqzaYHGvT1wi
aHlUu4BTPeuV5MrQlAjta3Q+aDP8bmCbwrG/jKsfuLrWCaxCy5n7SgPyOurvZlOE
tCjYCI8TqgTuGAqW3qy0
=3TFA
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
