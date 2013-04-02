From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Tue, 2 Apr 2013 18:44:10 +0300
Message-ID: <20130402154410.GL22014@arwen.pp.htv.fi>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
 <514B4137.2020707@wwwdotorg.org>
 <20130402083604.GJ30286@arwen.pp.htv.fi>
 <515AFA64.3050107@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515AFA64.3050107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 02, 2013 at 09:33:56AM -0600, Stephen Warren wrote:
> On 04/02/2013 02:36 AM, Felipe Balbi wrote:
> > Hi again,
> >=20
> > On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
> >> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> >>> PHY layer no longer returns NULL, we must switch from
> >>> IS_ERR_OR_NULL() to IS_ERR().
> >>=20
> >> The patches that I'll put into my topic branch are not yet
> >> complete; Venu first posted them a couple days back and there are
> >> a number of issues that will require a repost.
> >=20
> > is your topic branch ready now ? I'm about to close my tree for
> > v3.10, we already have -rc5 tagged and I want to leave my pull
> > request cooking in next for a while.
>=20
> Unfortunately not.
>=20
> Venu's patch series had a bunch of runtime bugs, and I also found out
> that the DT binding /still/ wasn't fully thought out. As such, this
> series won't be applied for 3.10.
>=20
> I still have a vague (and probably naive) hope that the updated
> bindings and DT file modifications can be applied on the Tegra side in
> the next few days so that for 3.11 there won't be any inter-tree
> dependencies. However, we'll just have to wait and see whether Venu
> has found the bugs yet.

alright, so I'll go ahead and close my 'next' branch for v3.10,
tomorrow. Leave it in linux-next for a few days and send my pull request
to Greg by Friday.

Let me just check if there are any other important features to go in
v3.10 which won't cause big regressions.

--=20
balbi

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRWvzKAAoJEIaOsuA1yqREl20QAJdqfkpC6tiSKyF9HDk/qA09
ERnTlMvyjr5eZ2T5qwtxA0qKIZ2tRSBZw4zeuCnlNKsTsMYcmcXw9gvTqxEoHaZ+
swUC1pnP/F4VmcUEV68tWJXFP3px4ou2ivM+JLe6a/+Uf8jBMaqTORPr4eHyXhg7
Hk8wPGWcTI5bEtupcaybbQeHiRFo9paOqc50v83NMBUkL7DBmXcmMnMq4KIRfDl2
GIDrBh29rGuOLQ+qXDD/VGnjOqntS+FBHEjY3NChtQAM/u8t/ueCstC2xvwOX1rl
9JmJA+FoKHSBoIUOkepbpjivHqsqnkOyhiiExID9+q9Ftr5tbW0/LtMbg9MpUFh0
EYwgBmKA1BFJHq/gTORKDrK5bIuIvC8tr33vw87sp99uRRbgSxtrqEkCYcXEJPsf
yMPFotsLnVMW2TmkhlL5rTOCuqk0o3o42uSi+NbGs5OIxsDv28/xm+XXqbR9aNrg
T+ZKpcRsoAt1n3xiSbt0SjK5Zlno15connM2fiBfW84Z5r62t6VPF2YnuKZ5X5rG
mXbJIY+EHg1lJfbxyLJsEEPXQnjdXurSjf4jEsHsB4jcDJ98ICM0mcqqkwazZSXi
HpUr8mZZgxS0OKLL7UvStv7AJz/BCXW1uls4URm/lcF1HWNtI30LjUH5tyYZnGkM
Ejn1DiLG5mjre4Ga0shW
=CLHy
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--
