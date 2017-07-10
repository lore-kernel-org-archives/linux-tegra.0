From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Mon, 10 Jul 2017 07:21:40 +0200
Message-ID: <20170710052140.GA18089@ulmo.fritz.box>
References: <20170709163614.6746-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170709163614.6746-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 09, 2017 at 07:36:14PM +0300, Paul Kocialkowski wrote:
> This registers the host1x node with the SMMU (as HC swgroup) to allow
> the host1x code to attach to it. It avoid failing the probe sequence,
> which resulted in the tegra drm driver not probing and thus nothing
> being displayed on-screen.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Thanks for tracking this down. However, I don't think this is an
appropriate fix for v4.12 because it requires an update to the DTB in
order to preserve functionality, which means we've broken DT ABI. The
proper fix I think needs to be to make usage of the IOMMU completely
optional in the host1x driver.

So I think what happens without this DT change is that the call to
iommu_attach_device() fails and we have no way to recover from that. I
think what we need to do is to free the domain in that case and make
sure we can continue without one. It's probably best to add an error
message, or maybe a warning to make sure people are aware.

Do you have the time to address this? If not, perhaps Mikko can take a
look?

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlljDuEACgkQ3SOs138+
s6HAcg//SLJLE9otp1B3haMpLaH3yhcjMr2cb5lowgpAsznO9nE1STwEkASQtdWz
WOdWYtkdvqRMdgdlreGHkyyqGTU29/bUi6NUOUZwgTeB9fK5wcQMK2MatXY8o2yj
QE5/OWe0SulVJekncF2WnLLOUPzkdLzqKPtICGGcHCyvV5ekwe2ULdle8kWTnJm7
hCOaNDNODJmMGcW74tySjXO44H8wTDyXBRso59IHPpQKbMMJLBF9gBfYE4jN2NC9
Rim/gedBGnhwJi/UKhOj7s8ivLRgwL0OoHFxGujXDSpm7G9st/0oIMRMwzH3OLEF
VmTHmmHgMRsy/JkaRKPJ32mufS1CDeSrKkAWLS8C7TZXmEQONbI8LDXYBiyTohnC
AnKOjPAMnR7f06vVKkRX4sj6OtFl90Hk2N9Vw2C9sp+vlaQB2ZxAohHB+UiIZRoE
HfQ6YxrRHCtuTXg9D5Hnz/SdaIK5z5Tu4EG+JYPKmQO/2bmbBXcjUlBohM0TWAKn
Gsh3ZI7pJ9/3h59wVJCpC7fCf1i7wXkPliLPfKd6c9Y/6uHgAlrf939OiYAqg7im
briy50F7uafFcOiR15zzH0JBMvtIipm+oheAulxD6d5hhLH5hXBEj+zgEZW0uWSG
BYHT+kUqd6i9O+k1D2dlxY/xsrRxX/8opdiydefKxx59ftMnJV8=
=MZe3
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
