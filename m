From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
Date: Wed, 4 Dec 2013 11:02:14 +0100
Message-ID: <20131204100214.GT19943@ulmo.nvidia.com>
References: <1386122564-4246-1-git-send-email-chris.ruehl@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lzfPtAjrR1KYNfg0"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386122564-4246-1-git-send-email-chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lzfPtAjrR1KYNfg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 10:02:44AM +0800, Chris Ruehl wrote:
> usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
>=20
> A wrong pointer was used to test the result of devm_ioremap()
>=20
> Signed-off-by: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
> Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--lzfPtAjrR1KYNfg0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnv2mAAoJEN0jrNd/PrOheQgP/iOJBZYnhUHhM7Vq/KTLMuWB
qIrTPPIl+gm1a9f8kmuaxLWDVqBDR8ECB9dD2zdjquAoXF4HWj8OJyTLt40bwlke
PPrvcyHXPHv8Q/A/RZWZvXvt1FnVoQYn0dobc/1ZoViNo7a92SmFCJfaPuQLcA9l
Q4/SjtizMkVFfVyZ0DJhxQXsPaHrbFuk+s8zTr75KTqjMvt2TGU67oA7DngcrmbV
nVrnSkKiUIqux3XI8nmoakdt045mM37NOjs17cbHg/R5Gj5DI2rfpHBPSlH4RGz2
TEhNhDOwhkpQYzO+PjrfYKirIrw79nCYx2i5aLVQF39Epg/mU3GLIff+iWwXCXpc
D+MASJ/stFxdcDvQwXbh1mzStk7L2p8SipDKSEbjHPjvqlbTCLbPNJel/SRsKuiZ
jJ/2tsVTULKpFoRAJyAgYs3mhxROEw1jFD1BnPVlhRPPqPbtXaFbTM3Vq37T5bwf
gq6BHLyL0AyS95Ldrt3+M+hScMphKPv5vvzufYrx+/8OHAv3kDyFHGXSjkWt3vZ+
CXZdzQsSoPFjkWGEaYwIA21EGnqWxXo9mKRq8GwiJBlS3KdpHBH5jOwXxt+HrC14
YkzYA2P32opweUrbjNXy1zd7JUSKlFg7l3ICAfX5RU4eaHJkWgYV/TGSJA0Pdyfx
+nhKm7U45ohXUJz/d2qR
=wQp6
-----END PGP SIGNATURE-----

--lzfPtAjrR1KYNfg0--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
