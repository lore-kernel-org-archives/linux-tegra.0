From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Thu, 21 Mar 2013 20:14:41 +0200
Message-ID: <20130321181441.GC16186@arwen.pp.htv.fi>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
 <514B4137.2020707@wwwdotorg.org>
 <20130321173100.GB16186@arwen.pp.htv.fi>
 <514B4544.4090904@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <514B4544.4090904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 11:37:08AM -0600, Stephen Warren wrote:
> On 03/21/2013 11:31 AM, Felipe Balbi wrote:
> > On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
> >> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> >>> PHY layer no longer returns NULL, we must switch from
> >>> IS_ERR_OR_NULL() to IS_ERR().
> >>=20
> >> The patches that I'll put into my topic branch are not yet
> >> complete; Venu first posted them a couple days back and there are
> >> a number of issues that will require a repost.
> >>=20
> >> I would suggest that you apply your patch to your tree, and when
> >> Venu
> >=20
> > alright, in that case, can I get yours or Venu's Acked-by ?
>=20
> Sure,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Although I didn't really think through any interactions with Venu's
> patch set, I imagine the rebase will be trivial, since the patch is
> pretty simple, so it shouldn't cause any issues.

yeah, I think so too.

--=20
balbi

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRS04RAAoJEIaOsuA1yqREh20P/2o+QVoP3uv7icx9VWmjqKvI
PlKtik1DzZE9NQ8Z2u59AbPalhG1W78X2L0jhaUDjwPPMLsdTWwsN1rHQPt54Yax
dPsqWyBce0XAupRUPDGzW2Ztmd8S1f4ih8lXUt2Cwoqj8/xF4nuNf6M7OG5seas7
p57Fk9DnxAAjzkA9QThwJpKimZFaIqu07BAKsW0QAnx14QM6yPVo6T2iA0qVb4+7
IG9TGcT6VPzLmGLBWgt7zKdN7hhbOzeNhizyc3CRXONqS5CwBnuR44l2m7kE3DVj
wDEaO69E1Zr4rcsc29u9jH8Pd6X1Cvg0VMy02Vy5TOzeELZPdnI+WwB9ysGfnfQc
/Zqxm48gEwdJlFwwsmMWP7xfJm0oDyvdJqzpb1DB5idCDMMh4CYIXmDqQEGkpBO+
hYm/LFzHpOTPAwUUu0h1v0xP7chzDeAmUmzaBYdTp9kXQrwk6uRDwFElVS5j/E2s
CZ06VNXriet0f/341gnd1V0MKRTVWk2CKVdVRvVN/hGbRwZknmqFPhxMR3XwzV7k
3mgvTklJLcXyG9GQzkl5DE5rRIVtEwjMdYn0uwfuofDXUhhJJ48aCaj5l5oOG+nw
vfJGWOHA9R49lvPdNTFbM389jSu3STDv6xCHeKMVX3ion7qqf3g0sh/AHZlmRBhl
FhGXPOnkERx7XLgMlxRG
=McZP
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
