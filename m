From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] usb: xhci: tegra: use time64_t for printing timestamp
Date: Thu, 2 Nov 2017 17:17:19 +0100
Message-ID: <20171102161719.GA19015@ulmo>
References: <20171102143435.882290-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102143435.882290-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2017 at 03:34:27PM +0100, Arnd Bergmann wrote:
> The time_t type and time_to_tm() function are deprecated because
> of y2038 problems. In this driver, they are used to pretty-print
> the timestamp of the firmware build. This is fine as long as
> we don't get a firmware build past 2038.
>=20
> Converting to time64_t and time64_to_tm() avoids the deprecated
> interfaces and works until 2106, when the firmware-defined
> data structure overflows.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/host/xhci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAln7RQwACgkQ3SOs138+
s6EIDQ//Zd+gyXnMMQjPmdsMjYM+Zrsj9zpNCPeRCRsfxpSpp7/M1BMninrIaP6d
EBTp1uca075nWhCcfjyHqJqEeU/ldbxwx6E3HEyabvgI9OC5ijcOnIM29CRs3E0i
o6DI4yMBJIJh62/GBtGguH7LCaDgC9o3r4HmDTOo0OwTchfm7CumrUyKmcZ7EP+6
QQ4c95sEu87LsiM3qycqhZY5abySYSzgbqdYkaRWsDGJ29ax86dvM1/2UdG9Ek25
hT/pHia+ynOfwibpMs1bRRmpYnLg5pPaKcnGzpYaJIvxyxblfjmHovd5N7Xo7s6D
IoFnVYYmCKbpN9e3sksr2qvZLDM+KhYDqZ8g4HSSk3aB4qqv6yjOUA6sZsKCn/mG
0QgSfDSo/mkfUSk1uv8t3ZmowedT3TUtShBBJ5b8tO8t1doIgjvWphBqiD3bEmLY
RH7owODUQxgZCUcAs/oZj+AkinUgehJ8m88VZTUL+C8T0xOMeJLf7DixxMmoP/Aj
asJaErKJxWq9nii4dQqtMq2itliekKGM1HjlOYDD7QzvSMTOswamgCk6pVRx5ShW
g13rcyXJzF+1xE9Ug5JsH6eHIDG0AnLx8TRlzPmJjcZFbFtK0XbwxDH+7uwLrVVx
2WBtW8O4Uk0xvuDdusLfmAbip47GsJ40uA8XI27nkiCwk9XHcho=
=GSBe
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
