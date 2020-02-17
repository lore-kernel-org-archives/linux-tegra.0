From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 00/21] Tegra XUSB OTG support
Date: Mon, 17 Feb 2020 09:51:30 +0100
Message-ID: <20200217085130.GJ1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zYo4Elh1vtcYNvbq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zYo4Elh1vtcYNvbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:26PM +0530, Nagarjuna Kristam wrote:
> This patch series adds OTG support on XUSB hardware used in Tegra210 and
> Tegra186 SoCs.
>=20
> This patchset is composed with :
>  - dt bindings of XUSB Pad Controller
>  - dt bindings for XUSB device Driver
>  - Tegra PHY driver for usb-role-switch and usb-phy
>  - Tegra XUSB host mode driver to support OTG mode
>  - Tegra XUSB device mode driver to use usb-phy and multi device mode
>  - dts for XUSB pad controller
>  - dts for xudc for Jetson TX1 and TX2
>  - dts for Jetson-TK1
>  - dts for Jetson-Nano
>=20
> Tegra Pad controller driver register for role switch updates for
> OTG/peripheral capable USB ports and adds usb-phy for that corresponding
> USB ports.
>=20
> Host and Device mode drivers gets usb-phy from USB2's phy and registers
> notifier for role changes to perform corresponding role tasks.
>=20
> Order of merging Patches:
> Please merge DT changes first followed Tegra PHY driver changes and then
> USB driver changes.

Felipe, Greg, Kishon,

Given the runtime dependencies between these various parts, I could pick
these up into the Tegra tree if you provide an Acked-by.

Thierry

--zYo4Elh1vtcYNvbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KVBIACgkQ3SOs138+
s6GPJQ/8Dr1CPfELHw05VQk0p62qC/U3hkxpH56/8OSVsICja7BxolBa+2ptmTzw
eB1ltsaiHPgYGvl53lyIlbFDofTaukVG9g52tFx4wJM3VKrGDUwj+7a//egwL9aT
fj+QsOWrvHfLpxYfYiNGl9vhQgVhL3U25c0s0SBzBPxjdcLQbNz0erTiE64G9ZI7
TSdqsijAXQflLfp02uS/jhqWUHHhkav0wf+NrYjyq+O30UBTUjuvNA2zXoee9c1P
n45PMAk7hZ+PS5s2Q51KLcNcA83x52Yf8O5lD16GJgCOWNaGrJR+FQombCMr7Sfo
p8VYNhNlNY+CDtt03YlMqgiJZ+lUx7HAArzPUwLRYyQtY1O9fjfxYQXRzLOhPhpV
uRpBCQ2X75GmlRtVY8HHSk6sCwHGKQbUtysaWna48rsKbNou6vAIUPo62BXV/2xT
QpnuSpAzZzmjnLGEkPyZiGSXZtqIQMrz8YIZXH0TER17o9DpuijLJLO2Gdv1gTZr
CbNAv9WSsn1sNUWpH1B2aUvA2ZgRLpw0TJ+6c8rH5AKMn9/KO3fzmvLCN1jFPctz
oJO2Ctm/pym37bpOVliZzDJleKwe8tLi9afv6+VLYaRZ7P8+F4aM7ijBHuwLHLPb
i7CvOEpdpCu+WxEBihmzFm8AxpT7yc8rnVN/WAMQx5+w5Bbh9wA=
=+r7V
-----END PGP SIGNATURE-----

--zYo4Elh1vtcYNvbq--
