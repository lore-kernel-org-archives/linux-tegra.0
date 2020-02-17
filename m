From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Mon, 17 Feb 2020 09:29:41 +0100
Message-ID: <20200217082941.GB1339021@ulmo>
References: <20200212061133.11665-1-jckuo@nvidia.com>
 <20200212061133.11665-4-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212061133.11665-4-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 02:11:31PM +0800, JC Kuo wrote:
> Extend the bindings to cover the set of features found in Tegra194.
> Note that, technically, there are four more supplies connected to the
> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
> , but the power sequencing requirements of Tegra194 require these to be
> under the control of the PMIC.
>=20
> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
> is possible for some platforms have long signal trace that could not
> provide sufficient electrical environment for Gen 2 speed. This patch
> adds a "maximum-speed" property to usb3 ports which can be used to
> specify the maximum supported speed for any particular USB 3.1 port.
> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
> property should carry "super-speed".
>=20
> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v6: none
> Changes in v5:
> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - fix a typo
>=20
>  .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KTvUACgkQ3SOs138+
s6EgGA/9HHQ/W5xAPjiotHh+vzcc4EPcUPP0rhHbbk+7zfuuRrZnsOClobb9t7cC
F6FO19opkXm7X0XxNGGZTxoV/1tF2icNNj0Lsmxd1sTz8LksZ+cMM6OjIE8DN4pM
ZdRTAlQAMti1dHoDZi7fF3JZgVx9LL38RsFGFe4rIq4CWEwuBfZQ+ZJzszxneOJP
rLgBM7rFiP8lc4IpAq7E2DDBzfuQa8vocvxb5BbuzXi3DIOnEG4zyM7RRHw6Y5u2
cIoO3oww3l6O8JDwPIm+ncze6K/3Pq2ZWbpRxQB0+Upnl7Pz7HYgB26QZRELJUue
EnUfAHiBloWFKcEvjWX8k3zUA+OSFM/yGXzZenOuWhF2WDp5/v7MZ+OTQfKEM8PG
+Vrfjh1T7Gp7HLyhu9ICj1EtIs2tfQZgUQACIbpnei0cmVGuIkhY51z/kYXIdZIc
/lkmT7h5ClDYmB9QeWUA7I4/2dwpSM/aZqbbpt58T/Q23bOYFwl8qLa89TY3ec7h
17KSsN8pKv5nojIdROBYHWBZNLOPI+9Tq4SXUrXYTgzaKGdiEeTy2J8U40s4Z5XB
NIDw8lwrerJ8lKoDiJrEODz05Hv40edMBwAEQgfFF8Yk1vcFUL69wUmvipu5Hlwy
ezZYiHh0CplKOS79I4/BEyFS5RPZ80nH3gmftOHu81JnhTumj/A=
=J9v7
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
