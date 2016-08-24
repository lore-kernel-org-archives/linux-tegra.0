From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] arm64: tegra: Add ACONNECT, ADMA and AGIC nodes
 Tegra210 Smaug
Date: Wed, 24 Aug 2016 16:53:15 +0200
Message-ID: <20160824145315.GE6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-5-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:19PM +0100, Jon Hunter wrote:
> Populate the ACONNECT, ADMA and AGIC nodes for Tegra210 Smaug which
> are used for audio use-cases.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.

Thierry

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbTbAAoJEN0jrNd/PrOhrr0P/jGB2kYwXYTiLHG/d83IYI0B
Ym40ZoV2ZJdWaGoKGc1B3BuTm1n24i5cA9wxBW+sEBln0b6Y0IM5CCxK/+zQxWMD
hOQ/SUCYMOdZjp+ugaiEYqHPHdnMxkj/9goTPPjUjUyf1e/0t5Slzyhu7XKdPaOM
46Y2nOlDiqQnlxWiIMrFGFajtw2d48WlzEqhLvE4dKzG6ob7JZ59zXAruByLK/6Y
Y/3q1vhR/TaaDk8NYDBtBmaYOSuOLmTjdZVqiWvZVklTzpOEkXwVibRBP/A26FHP
xec+yVW8aeaPVrVIvH3veToSZjR/nrSjtIU9e/ktS/10way3HHjXYTHZxcL4EXhU
wn1YhpRzjPeSRaShX0+acm9y8t8mUFPMh63iAtqzcfqaNcVM2YDgm7F8B7MVn2M4
cPaq8BFJQ3FT/QrmXsQQUItx/TNRwxYwshauh8HBKauTwt49StJEGVmJlCdxjXer
/B2pE7LZFY77sCOFK2wOhAcq05cUIHIjJ/KtclGOHWtLUA4XyPiLuqPSnI/lPZGU
Kwsp22LY21a+mCGT7z9C94igSOQCgjz0bzoorSLUCRQPUBwEzncwAqIcrqE0LFXD
cX+yuLYGywIN+jrXefIRwMCp7wqUDJXYElPGZ5VrVS/NQ5yLdMJbvQvXmPeY0I4t
ubyea/0VfBhjAa8IJMqC
=ifPx
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
