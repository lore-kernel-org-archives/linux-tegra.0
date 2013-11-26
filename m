From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: use section-sized static mappings for
 LPAE too
Date: Tue, 26 Nov 2013 12:13:30 +0100
Message-ID: <20131126111330.GF27752@ulmo.nvidia.com>
References: <1385419003-11348-1-git-send-email-swarren@wwwdotorg.org>
 <1385419003-11348-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419003-11348-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:36:43PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The static mappings for Tegra's PPSB and APB regions were sized at 1MB
> in order to allow mapping via sections in order to avoid burning RAM for
> PTEs. On LPAE, sections are 2MB, so the static mappings need to be
> larger in order to gain the same benefit. Set IO_{PPSB,APB}_SIZE to
> SECTION_SIZE so this adjusts automatically.
>=20
> While we're fiddling with iomap.h, compress IO_{IRAM,CPU}_VIRT together
> to save virtual address space in the vmalloc region; these two regions
> are mapped using PTEs.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/iomap.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlIJZAAoJEN0jrNd/PrOhUecP+waOOfLRYMQMaO8CnxuHHUdA
QDyd0eYUYXVchjunZYOCiTEaMdq3Q8v2K1cCMDgCa02pouF4NTyBzybJY54fOwo7
1jUmPMfW9+YUzmNFBaLQiO4g8d71AjPd/YYdwulDEYrlAkNRH4cNujw3qrX2DW89
qrk+YBAQl+wplC/Mq1e+Cu1BjRpn8EkJ79KX56zaZ9HTZP9d3N2RGzXsS59r2QNA
AmATAaoXj0WJ6tazVnUNYPJHJHVQZzuGi9JdEJldOvuwW1XU/PLwb9iYDo+cpMAk
U/C23YnUjfflBoQzXBg/3x98LUaUbizT7n2h0Y1GW5veOAxDVrAUrqI5hwwINX7z
xS6Ug8bAQ5HLk5T3+8lGOvHG1mvft9oFpktO4F7lN9h9KRLID7Qwgir+dhQwD+/E
NeDLEQG+orqOHXyOJIRhJQFM2QB+sg7ieegYLr1Fuy/GwCPirtfVST5o1VzAna4G
tTILePqk14i/HgI3l81a6PCionz+dhtriTGmuvWAmQJR7e2nAc169Z14QfJ29wih
k10U5jx61uys0m1IeFCkIJ7TCLI0MP7V6v4qUh61/7wq3V+9e9QPPFupgmByBXkV
SdgWoL+Bf6bo6Pm30hmWRBOpTwmHrlQWbO6tjeBOmH92Y4M5xn04ylsx9G4n+77X
uD8q3rShNQv1RnaY5dsH
=FRGC
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
