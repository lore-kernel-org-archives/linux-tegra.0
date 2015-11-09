From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Mon, 9 Nov 2015 16:48:27 +0100
Message-ID: <20151109154742.GE11362@ulmo.nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
 <56310CE8.3050107@wwwdotorg.org>
 <20151109143654.GB11362@ulmo.nvidia.com>
 <5640B994.7050307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5640B994.7050307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2015 at 08:19:48AM -0700, Stephen Warren wrote:
> On 11/09/2015 07:36 AM, Thierry Reding wrote:
> >On Wed, Oct 28, 2015 at 11:59:04AM -0600, Stephen Warren wrote:
> >>On 10/18/2015 10:57 PM, Alexandre Courbot wrote:
> >>>T210's GPU secure firmware loading requires a write-protected region
> >>>to be set up.
> >>>
> >>>This patch reserves the upper 256KB of RAM as the WPR region and locks
> >>>it so the kernel can initiate secure firmware loading.
> >>
> >>On T210, it's the responsibility of nvtboot (which runs before U-Boot) =
to
> >>set up any and all carve-outs. This code should not be necessary, and i=
ndeed
> >>I expect the registers it touches can't actually be programmed from U-B=
oot,
> >>which runs in non-secure mode after WPR is already locked.
> >
> >Can we document this assumption somewhere? It's entirely possible that
> >someone might want to run U-Boot without nvtboot
>=20
> That's not currently a supported use-case.

Isn't the whole point of open-source for people to be able to do all the
things that aren't supported?

> >, in which case nvtboot
> >would still need to be responsible for setting this up.
>=20
> I assume s/nvtboot/whatever other bootloader is in use/?

Right, I was going to write U-Boot here, but that's obviously only true
if U-Boot is still running in secure mode. Otherwise, yes, it'd be what-
ever is the other bootloader being used.

> >Or if it isn't
> >we could still point at some location where the interactions between a
> >first stage bootloader and U-Boot are documented.
> >
> >Do we have a document of this kind already?
>=20
> The L4T U-Boot source code:-)

There's a bunch of things that even the L4T U-Boot doesn't document. The
fact that it doesn't initialize the SMMU or WPR doesn't indicate that it
is something that a first stage bootloader needs to do.

Thierry

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWQMAmAAoJEN0jrNd/PrOhcagQAMAfiFRTh/IYT5J9m/2opY/M
c2+ykk018/ncyn1Ky134rEEJrGb8BnjE+JAWNYVajXoQubSpFbZjYNCrp3B+7dki
mnphYSstZyOkd5Y0lnIX2QblwVVvchZUg/k2sqAC7MIJQqsPQtjEapUoVQZZtv1K
NJfSNysFwOS+5YggkNZW18eMcKF/jrA3usd4AOhny7zODVTbl+w7G3TxHQ/98Vm7
c+FoQL5tWANV49UeTx5hXpdnc0alovSrZVlIfBSA8CT2pYnz1bKtjjbW1/4VJUJe
pUym5I4ROYwgQvCV08geeKR90e0TQ45IVLKHOSF/evcEbd3HiPWjvy6hpoKLBLYo
Tsf0LNgZ1MfI1XvkgrYNuIN+otlwwH+gv11cUo4AFgsprp3OkVWVBvwmJyQvCl5o
rRKUUoSpvm7zXx1CWFZzB5o8NgyqXJcknQ7b6IjNFpUGDHqjnelwfUgeA40qpMNa
BvGhKwQ9U9PAeEt1ybaKvFVSvJtqD7fWSQlF7+jTG9/Q168NcDUT53JeQF4AtCMG
z6NLhighNXxb3C2VWNxgWxyPimOUed+PJJ2DTkOLeHiyMVc2w6lU6YLZWyf9XyXb
BK3282gLrD2Np1KCuW4p54mK46o2YceOow0f++g7gOUrkOK5BF6ez/8cJggcN+m4
teSeKN1fkVrittnxwra/
=Hon0
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--
