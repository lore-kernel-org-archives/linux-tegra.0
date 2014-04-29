From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add SD wp-gpios to Venice2 DT
Date: Tue, 29 Apr 2014 15:34:50 +0200
Message-ID: <20140429133449.GA23699@ulmo>
References: <1398711219-23029-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398711219-23029-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 12:53:39PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Venice2 can detect write-protect on the SD card. Add the required
> DT entries to allow this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Thierry, could you test this for me; my Venice2 has been sent away for
> a few days for some rework. You should find that if you write-protect
> your SD card, the kernel fails/panics trying to mount it as a r/w root
> fs, whereas if the card is not write-protected, everything still works
> fine. Thanks.
> ---
>  arch/arm/boot/dts/tegra124-venice2.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/t=
egra124-venice2.dts
> index 84a6ec039e1d..00e741ba6927 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -943,6 +943,7 @@
>  	sdhci@0,700b0400 {
>  		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
>  		power-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +		wp-gpios =3D <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;

I need to make this GPIO_ACTIVE_LOW for this to work properly on my
Venice2. With that I can see the initrd reporting:

	mount: /dev/mmcblk0p1 is write-protected, mounting read-only

So with that changed:

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTX6p5AAoJEN0jrNd/PrOhTLIP/0O/NT8tRqPDQLOrVaW8Ubcq
nza+gOCj+o5dNZ2pr5DFXgZZWGPAVtEm2GLJud6rROSlS7GMjrItjaRgTvB8uMBD
vOK9OcBAaKUCClPItTg52iNSap9GJY1OVH51aTwvH14IddrgUhV2/F7hNXV3CuM+
154fZdsHiMZDFr26TeTU7GilrEHahG1FGWBv144FQwV0uc/NEF0+LaT075XjVKUf
IoyiazJkF8/Hpv4cSWn5i1KWEsqSFhztkYPtZcIdwICKN3VYI/DlnTaTi4pwNB25
NXLsMEIRKSZZ9wh20Z2Upo7OwQhQTR5WhaLsAlTS9PHaxjH4KerwhBcXPVU2Nvst
i19uGqM032gjNl5e5qS7LViFKrz7pjRqsVjd1RGBOGieGgtp+/AZCOtYvPjPaHPe
7UaGXzLwIUSlPD8fvvWi6c3PdLtYmgnzLAqsOs/zRE0UFgaLyfVFXgGnF9SlOsp+
Vl9c/QKVyi+CkB8DdevnO+LUhhtQG14NHyBrPt/WUOc3gvs5vHqISE05A/UCZSua
A1LWJaMb4Tq+cE18Xqk4sg6PHTHyDMBQQb6gMCLDBMETf1SbXLpxm9jb4aAoviP3
SLsz4Ytxp1HV1VbXumBnl/pTGTCo02HdvpW16zqUrFDXBW+a8D71HkxVfnZnM+hF
WoHd3It2HTGGiTg4urnT
=4sG1
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
