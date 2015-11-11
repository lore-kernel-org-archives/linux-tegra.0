From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [tegrarcm PATCH 0/2] Initial support for secured devices
Date: Wed, 11 Nov 2015 19:38:32 +0100
Message-ID: <20151111193832.10bcad6e@avionic-0020>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
	<56437303.7090006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/fJXhGm2p_K8WDFS6gmzuTvI"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56437303.7090006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Sig_/fJXhGm2p_K8WDFS6gmzuTvI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2015 09:55:31 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 11/09/2015 10:19 AM, Alban Bedel wrote:
> > This series add the bare minimum to be able to use RCM on secured produ=
ction
> > devices. For this the CMAC hash just has to be replaced with an RSA-PSS
> > signature, as CryptoPP already provides this algorith it is quiet trivi=
al
> > to implement.
> >
> > Although RCM is now working this doesn't yet allow running the bootload=
er.
> > The miniloader works and it loads the BCT and bootloader, but the hands=
off
> > to the bootloader isn't working yet. I currently suspect the miniloader=
 as
> > the same bootloader works properly when it is flashed on a secured devi=
ce
> > with the proper signature.
>=20
> CC +=3D Allen, Penny - please see and comment on the patch series on the=
=20
> linux-tegra mailing list. Thanks.
>=20
> I'm rather hesitant to apply this before it's fully proved to be=20
> working, i.e. before you actually get the downloaded bootloader to work.=
=20
> This is simply because it seems likely the patches will need fixes to=20
> make them fully work.

I understand this, I mainly wanted to publish the serie. However the RCM
part is working as the miniloader works enough to at least be able to
download the BCT and bootloader.

> Some general questions:
>=20
> 1) I believe older chips only support only an SBK, whereas newer chips=20
> support both SBK and (RSA) PKC (or perhaps just PKC). I assume you're=20
> using a chip fused to enable PKC.

Yes, I only use PKC.

> Are you confident that your changes won't negatively impact a chip
> without either SBK or PKC enabled, or with an SBK enabled (well, I
> imagine that doesn't work right now anyway...).

As long as you don't give a key nothings changes.

> In particular, I wonder about the comment "above "the CMAC hash just
> has to be replaced"; I hope that doesn't impact SBK/non-security-enabled
> chips.

According to the Android BSP doc (Tegra BSP for Android Development
Guide, Security chapter) PKC always override SBK. If an SBK key is set
while in PKC mode it is only loaded in the AES engine, it is not used
to decrypt the bootloader.

> 2) I believe Tegra supports either/both of (a) validating the (BCT and)=20
> bootloader using the SBK/PKC and (b) encrypting the (BCT and) bootloader=
=20
> using the SBK/PKC.

PKC (aka public/private key) only allow signing and SBK (aka symmetric
keys) only allow encrypting.

> Do you know which options your chip is fused for?

I fused it for PKC.

> I wonder if the bootloader isn't running because the chip is expecting to=
=20
> decrypt it, yet you're supplying a non-encrypted binary, which of course=
=20
> gets corrupted during the decryption process?

I doubt it, first the chip can boot from the signed image I wrote on
the EMMC. Secondly the RCM communication is working, it query the
version and send the miniloader. Finally the miniloader is running as
the BCT and bootloader get downloaded via nv3p.

I currently suspect the miniloader, some steps (like setting the BCT)
might need to be done slightly differently. Or it leave the secure mode
too early, or ...

Alban

--Sig_/fJXhGm2p_K8WDFS6gmzuTvI
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWQ4soAAoJEHSUmkuduC28mFkQAN1zw+xTfH+o1dL1yTndeQ4p
fTcEpxLXA6f9ur8XS6ef5gJFO8zn30H4ggsrXPZgkRRJmL1G8/lggs+OHVqgkyqR
1wepizyTu0wrknP6VkBKmtuS5yRxsCXD452PtEmK+4pvDgAuCdYfU3gnfPtIqAUm
9n79uSi8u6iylMnz2Gg4tJ5dPK3u/Uq/VojZwkq9Ho2JXZ5+IlM2t7h+cbi9sW9u
iOpephLk+G18+68Y/Eg7GugkOicD347JbrE7A/BwqE2jxE2yx9D8GXnj0ThD38Lm
yvWaTLVpcDpeJzV43qiNGTUUtK/5KLWk0T//FTgg9NwiotbVe4txE9LudqSNBS4x
TKmyuQanLtPnZU/tavNgd/OPlTCooQf/09057Wa6zq3IgmYzJCcb0cs8WOBoKIhR
UGr9/KNfdFnoqctGdXa86epBsPsxtV0RM5kT6xyuWeq8E/SOsIDH79n06AEkC8cU
PgK2wyC7wfW+3TOCgSo/lmN/NYGdOUwLfOC9Uwym+OI8vvmzxq8CcL3uYWy1+SAZ
ckmhAgkctE010G+jnB3nvc/gRz8v6I1kTD6pwI+Y+QEtKKtGWvmKb7dAQ5ydIOWx
xSITVl3EhqA+BOiHN5PamZLH/9ZpwDR6Q0Cidfl9g3HS5/bYzj8Pyg8wti1Wmn4w
irGx7V+8qQdSnf/og8hD
=0tbU
-----END PGP SIGNATURE-----

--Sig_/fJXhGm2p_K8WDFS6gmzuTvI--
