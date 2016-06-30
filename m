From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Fixes for Tegra XUSB
Date: Thu, 30 Jun 2016 11:30:31 +0200
Message-ID: <20160630093031.GB1776@ulmo.ba.sec>
References: <1467198453-23406-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467198453-23406-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 12:07:30PM +0100, Jon Hunter wrote:
> Fixes for Tegra XUSB dt-binding documentation and the XUSB mailbox
> interrupt.
>=20
> When testing XUSB on the Tegra210 Smaug, I found that USB connect and
> disconnect events were not being seen. I have debug this and found that
> the XUSB mailbox is incorrect and I was never receiving any interrupts
> from the XUSB mailbox. Interestingly, this behaviour is not seen on the
> Tegra210 Jetson TX1 despite the fact that there were no mailbox
> interrupts. The two boards have different USB connectors and so may be
> the connection is slightly different. After fixing the mailbox interrupt
> both boards now receive interrupts from the XUSB mailbox as expected.
>=20
> Jon Hunter (3):
>   dt-bindings: phy: Fix description of Tegra210 PHY nodes
>   dt-bindings: usb: Fix Tegra XUSB example
>   arm64: tegra: Correct Tegra210 XUSB mailbox interrupt
>=20
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt       | 2 +-
>  Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt    | 8 ++=
++----
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi                          | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

All applied to for-4.8/dt-bindings (1 and 2) and for-4.8/arm64 (3).

Thanks,
Thierry

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdOa3AAoJEN0jrNd/PrOhjHsP/0hm6Ndy6YvQTkxNNXdGOa0C
A1qjo9aYMu7xNhB3y8T/Tj1abcaZsJZnuIye90MYYc2DdHIpE4TgQP8fmspDOyA1
RILzWnu/4+mD7Zfk0WmxeA8RschGiZ9NfQeY3aQx1/HCEh2MDC9Zqb51q37A4r7x
bgUlFZK/Qplui/Q1v9PipqK/KHi8GioeElqFlwmnCINm9yKUiKmg/MOpMvFPZ9Tc
7enOYKfZZlvhLyfFf/SEe9+t0MBrrweuaI4uWoUzKIngtKtTGc2TQUXohFgEwV2Y
/X78tIeG86A2ywvFre20RiKVm72aMX+GCppsceB3g51I0FZkPetmaoVD6HI0iAN1
RWsM2uxr9MlHI6KCua635cwkJTJjhb9nva+C/GGJOwVTIgLcSxGqS32I6ySdDRUs
y5avO8gPFcGRGCvS7Xr/jVgOgwWwMPBjItyjVTsfgrCfwXVSL2IKpUBOmhUwENRo
FJiHx4ukAfyntf8L0wGfSEanQxhm+wnYCmGqu8ijGD0hoVMyQoLbqcSZdjUjgXur
LbYqdzjHSDPukKNJqHQgJtnYSSUWUWKNQ9XQax1tT65TRnbmdAG8kdV09JnTrW5a
RKZsnRMLc8qJEgzAfS/zAEI8dtiFTCLg37zwk4WMbaZyZHly0ZuMOIXx541NnYvJ
HhYZ00IofFqrmX+wxlb6
=Sutv
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
