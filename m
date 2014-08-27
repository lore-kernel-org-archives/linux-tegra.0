From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] of: Add NVIDIA Tegra Legacy Interrupt Controller
 binding
Date: Wed, 27 Aug 2014 07:58:30 +0200
Message-ID: <20140827055829.GD15640@ulmo>
References: <1409035264-16999-1-git-send-email-thierry.reding@gmail.com>
 <53FCCAF1.9050504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FCCAF1.9050504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 11:59:13AM -0600, Stephen Warren wrote:
> On 08/26/2014 12:41 AM, Thierry Reding wrote:
> >From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
> >the AVP coprocessor and can also serve as a backup for the ARM Cortex
> >CPU's local interrupt controller (GIC).
> >
> >The LIC is subdivided into multiple identical units, each handling 32
> >possible interrupt sources.
>=20
> If I apply this series without patch 2, which is necessary to test the
> support for compatibility with old DTs, then I get the following very ear=
ly
> on in boot:
>=20
> Other than that, I would apply this.

Ugh... this is because before patch 3 the code would always initialize
all five controllers, even on Tegra20 where it doesn't exist. Patch 3
adds a check for that based on the chip ID, which due to other patches
merged for v3.17 isn't available at this point. One solution would be
for this to be moved into an initcall to make sure it's called after
initialization of the fuse driver so that tegra_get_chip_id() can read
the chip ID. But since you're not at all a fan of that I guess the best
we can do is to match on the top-level machine compatible instead of
using the chip ID.

Thierry

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/XOFAAoJEN0jrNd/PrOht7sP/23aZS5XqX5MEVhhOCtbXspz
flaTlIQl6lT6q4DzT5YY5Q3EF6tRxbX/nkEA8ix3fP5RQV05Hf+5qEZEMGrMFkLD
Chdg95Ze+orUQr8I6HSAfR8bsnxSyXtEhWvhI61l4wq7E9yjeC4xZQNqAX2zxCV6
/jk1deQznlQsXAnpP6CjfyDecDZcIVLlLhlx7fygV5DwvkNr+9SKWi7QtVtxp0sA
jO7DBDezgBSUUY1Le04Nqt4c7HRnwb7lqmm1x+QkkjOQ00mb7kdVM/jJoY6r87Rd
4//Z2Nt4WbiqiIiDVQ6KtZJWdWMX5pjcN1x7ZecgH2APkWQ0lOU6aLN+yNbvf0Ge
vkKV6HHd0rXRIQ/FPmYTaDLBBJQznvpWQTCs41xznzqfDscS0/x9VFMh2Ah9Xpgw
guQjEzSXoTgWUxr++4HUWUK+6ied7RJe3oIb5Z0IHT96f9F9F/k0Jz2SO8EKSsKc
yRNB+mWNTypO0duFUUC/FihQA6TMyRmKMAdwB/rU1bDCvMoaGp/sNFBKGmwd1LVG
SZexaveaVNqlGOk9qGpsiU7pOrdqF5BBruSiDEvK0nIgEWEdd5T94jeNYk4AzjBX
LoYtkBmpDW2foSQFIBonfJ7PVtIYqRQCeWry2un3hjYtOAswFPrk5dzuf18yN7Ts
m3PdqNNULCrJtVoM6lek
=iJDL
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
