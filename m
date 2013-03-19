From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 8/9] usb: host: ehci-tegra: fix PHY error handling
Date: Tue, 19 Mar 2013 10:24:09 +0200
Message-ID: <20130319082409.GD17049@arwen.pp.htv.fi>
References: <1363338730-14581-1-git-send-email-balbi@ti.com>
 <1363338730-14581-9-git-send-email-balbi@ti.com>
 <51438EA8.1060301@wwwdotorg.org>
 <20130318080245.GI17135@arwen.pp.htv.fi>
 <514731EE.9010709@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <514731EE.9010709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 09:25:34AM -0600, Stephen Warren wrote:
> On 03/18/2013 02:02 AM, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Fri, Mar 15, 2013 at 03:12:08PM -0600, Stephen Warren wrote:
> >> On 03/15/2013 03:12 AM, Felipe Balbi wrote:
> >>> PHY layer no longer returns NULL, we must switch from
> >>> IS_ERR_OR_NULL() to IS_ERR().
> >>=20
> >> This change will definitely conflict with some Tegra
> >> EHCI/USB-PHY changes that Venu plans to submit very soon, for
> >> 3.10. This is relevant
> >=20
> > but this is such a small change that, even if it conflicts,
> > resolution will be trivial.
>=20
> Well, Venu's changes re-organize exactly the code you're modifying.
> Wouldn't it be simpler to simply take all the Tegra USB patches
> through the PHY tree and avoid any conflicts at all?

alright, I will take all patches, so please create a very small
immutable branch which I can merge then I'll take all other patches.

Let's just try to avoid this sort of situation whenever possible.

cheers

--=20
balbi

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSCCpAAoJEIaOsuA1yqREyxIP/0Xc4tWhFeV5p/w9/Ictb/Xl
D8uG6i36GzuVxTeqLhgtQ1GctdoL3l4QQALhBqXAjq9xJnJdk5fYLqfKDhwKSeHq
Od7XqkyrSg+5J3nMyYaBv9SyjSdTiK9UeKRlWPoVK/H9DZeVT+h2piB7fncWXBhR
scNwgprmWY336GVzXBIy8X5Mo4SXzBeZt4+W4ZmozdbldkYLqCUBlT9PNIMUJdXL
i5NaFC2TUoEc7EQZDtAI1uOBxl4qsgbPo7stR0QbjRsqcuqn+FwlFuEdCZ5eNB4V
E5cCk9uZpqYN38tawwLcSjqco8azW2MvG6n95a/63pcYhA2jh9EfKu2HbYKOyB3r
67b6++NHJAia1EptUUszjdJ3RZqA7iGhWtPh7bMhzBkxMFnox5Ut4xpJNonzTdhn
KLQFkrn0tfA9JusEdLqU2L3olxf13YR7pp+7K3cU4FsZ2dujgwxAK3Gz+3OpHJvG
WtU8uTOWxRGL1skQjmK+kafVeqzinCf/zkjngXtkW878SEU67w14yh2oh8vCogmT
KrEEK/rvSGF+VDAdk54HJhLQTrehJJ2T5UvgXj0Xrt0KiFYm/niXdwg0rMeJuiie
GtJgQ2nucIMc0E7QXKPX/SomHOpKoJZ7zUSqkpIFZkRq3KtzMyIWc7cYZ9FPcCqZ
95uzwMA7xFf9v3G0qrGA
=cFNW
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
