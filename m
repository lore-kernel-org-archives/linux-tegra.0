From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: import latest Jetson TK1 pinmux
Date: Wed, 11 Mar 2015 10:02:27 +0100
Message-ID: <20150311090226.GE19577@ulmo.nvidia.com>
References: <1424199465-11041-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424199465-11041-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2015 at 11:57:45AM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> syseng has revamped the Jetson TK1 pinmux spreadsheet, basing the content
> completely on correct configuration for the board/schematic, rather than
> the previous version which was based on the bare minimum changes relative
> to another reference board.
>=20
> This content comes from Jetson_TK1_customer_pinmux.xlsm (v09) downloaded
> from https://developer.nvidia.com/hardware-design-and-development.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 557 ++++++++++++++----------=
------
>  1 file changed, 254 insertions(+), 303 deletions(-)

Applied, thanks.

Thierry

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAASiAAoJEN0jrNd/PrOhn6wQAKJ0CpiXZchAbRex+cEqRkfK
iPn7AAp1o61Rf7wiJBhxBct7oKwRsA0VrsObzwC867f66yOSkgmuDuEsMC68uIbs
U26oKddwZRSm9xZVsrm1NUJd/YjNDkWpGkjB6JFfLFpEEa5l8Cu2S83bFe+gyiWO
5k1YVTTDg5vj6OKnF2ADhBYqMDQ3IUJuM8hNy6kMW5rLR6YqsopTTmH8IKgU1C0R
5xEduWnb7+ViI4GIK80huM/TFxpCntaP3YqpaXmE0yu1glCrrBnDzdVHhXoTTwI5
D6y++06aghNBfbH8LUQ/QeAV94q2fG4YxAZKgI16FNGthP3trq2i8nE3VBm6zYeE
fjeNZPBa5N81ocYDM7y4qZ5UMnepqJBJr7/fze1JNyQY1YFeF8hTC/Sb/pG+E19n
MFUL4+dYoiGDS25qIS/wvpMhpurz4nMSQAzWn1SyO3vYOd0g6SqC+W9xxpgGOJUC
FSW1mqL1TOsUQAwT9FJndkALmx0dBpOboIr3rXKkTorm+igG6f3IWh2tFmvRLXj7
1Wldsu/8mvR2fBDiuos8yO6agWmg+Rznk34mkumLOQH7OgcE193xKDuWjbfzmALU
mUj454oGI62Z4sG/47dXQhDhrlsjqaSNRS/YYGWc9TOSKd6W+aVzfBTtM4kI5gKj
mwkeSnmO8Xk7X9o13GIQ
=4rUU
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
