From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: update *.dts for regulator-compatible
 deprecation
Date: Tue, 2 Oct 2012 21:33:16 +0200
Message-ID: <20121002193315.GA30966@avionic-0098.mockup.avionic-design.de>
References: <1349204824-21758-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349204824-21758-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 01:07:04PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Commit 13511de "regulator: deprecate regulator-compatible DT property"
> now allows for simpler content within the regulators node within a PMIC.
> Modify all the Tegra device tree files to take advantage of this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-harmony.dts   |   63 ++++------------
>  arch/arm/boot/dts/tegra20-paz00.dts     |   59 ++++------------
>  arch/arm/boot/dts/tegra20-seaboard.dts  |   59 ++++------------
>  arch/arm/boot/dts/tegra20-tamonten.dtsi |   63 ++++------------
>  arch/arm/boot/dts/tegra20-ventana.dts   |   59 ++++------------
>  arch/arm/boot/dts/tegra20-whistler.dts  |  119 ++++++++-----------------=
------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi   |   47 +++---------
>  7 files changed, 112 insertions(+), 357 deletions(-)

Funny how this has come full circle.

Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQa0F7AAoJEN0jrNd/PrOh5SQQAIoGa/pQPWgQ65wtumli1wlC
9MPMq9R/0LdGpf0ZYZTQJIL7GriPkAQwKFdJX5imH8metODmGZyosj0zpxSl8wRy
VQVV2ZGv+AtZob7lEiCrdrfg5nstJ5/91tQ7H5W6BqsCMwPBw/CZExGi2Eil1h7V
QTay65ztWKXIAJXVeFfsnQJzXGFoLyNQkLcwMDx174HjJWg2ROYCegz36eaqt4iO
zbXMh6lGcvllcQj1G1Sptr2D3PqDCylhdskeKuQ87+X03JUJQh20aOp1fyhVZOzY
+ByFT6tXbXPAetDe/1epQSRwa9l9uc2duA/FGJLQJOFkhTP7w+OohYpfBJfZmhRH
O9nuPu0zrEXzN3LFrLcsXDUUTF7u+N7aR9UvzzeKD9khJ9NdAHkF25AhdroFv6NT
tgPbhIHIiLQWcaV3zUaDmeNBuRNtbRiLlaIiCV6iesb3UcoYwPgMKfPGV0JeXuBV
4ecg5bINR3IpTATJHCLtV+/MMnuE0RIKd9Z2nIMTeUpdTURfr6gjS7solbgHj1WN
Rn8DR3uFwXgmnJrJlK57NLe0G+gMaDKQSlFPFLSkxsoig3UPDAiQfhy4+D52sNZa
POHyV1MRhcVGrhYkcBLl79fnwvGrs49k1wTPpngdV18GHIh2i3KXwH5ZqVMME3zv
GXYluxNAkdiHAv+WUvZa
=fJNo
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
