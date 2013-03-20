From: Felipe Balbi <balbi@ti.com>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 19:56:16 +0200
Message-ID: <20130320175616.GO1567@arwen.pp.htv.fi>
References: <51489251.5040504@wwwdotorg.org>
 <20130320122031.GI29659@arwen.pp.htv.fi>
 <5149E62F.9090705@wwwdotorg.org>
 <20130320164553.GL1567@arwen.pp.htv.fi>
 <5149E925.7030302@wwwdotorg.org>
 <20130320171147.GM1567@arwen.pp.htv.fi>
 <5149F15A.1000806@wwwdotorg.org>
 <20130320173006.GN1567@arwen.pp.htv.fi>
 <5149F4FC.5040103@wwwdotorg.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hXth9cGL35Nvpk4x"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5149F4FC.5040103@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: balbi@ti.com, Venu Byravarasu <vbyravarasu@nvidia.com>, USB list <linux-usb@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

--hXth9cGL35Nvpk4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 20, 2013 at 11:42:20AM -0600, Stephen Warren wrote:
> On 03/20/2013 11:30 AM, Felipe Balbi wrote:
> > On Wed, Mar 20, 2013 at 11:26:50AM -0600, Stephen Warren wrote:
> >> On 03/20/2013 11:11 AM, Felipe Balbi wrote:
> >>> Hi,
> >>>=20
> >>> On Wed, Mar 20, 2013 at 10:51:49AM -0600, Stephen Warren
> >>> wrote:
> >>>> On 03/20/2013 10:45 AM, Felipe Balbi wrote:
> >>>>> Hi,
> >>>>>=20
> >>>>> On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren=20
> >>>>> wrote:
> >>>>>> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
> >>>> ...
> >>>>>> The patch you gave fixes the Kconfig warnings, but not
> >>>>>> the build failure.
> >>>> ...
> >>>>>> For now, I think the correct solution is to have=20
> >>>>>> USB_EHCI_TEGRA select USB_PHY. I validated that solves
> >>>>>> the build problem, and has the bonus of not needing any
> >>>>>> changes to tegra_defconfig.
> >>>> ...
> >>>>> Alright, do you want to send that patch ? My bad that I
> >>>>> missed that build error...
> >>>>=20
> >>>> Sure. Do you want to roll it into your patch and repost it,
> >>>> or me to send a separate patch?
> >>=20
> >> Oops, sorry, I meant to write "Do you want *me* to" ...
> >>=20
> >>> updated patch below:
> >>=20
> >> Anyway, the updated patch you sent does solve the problem, so:
> >>=20
> >> Acked-by: Stephen Warren <swarren@nvidia.com> Tested-by: Stephen
> >> Warren <swarren@nvidia.com> (both build and ran it on HW to make
> >> sure nothing was missing)
> >>=20
> >> Feel free to use yours or the separate one I sent; entirely your
> >> call.
> >=20
> > I wonder if the third option isn't nicer ?
> >=20
> > select USB_PHY if USB select USB_ULPI select USB_ULPI_VIEWPORT
> >=20
> > then all changes are in tegra's Kconfig itself ?
>=20
> I imagine that'd work although I didn't try it. However, I suspect
> it's more correct to have USB_EHCI_TEGRA do the select (or later, do a
> depend), since that's the option which actually has the dependency.
> Otherwise, you're just making USB_EHCI_TEGRA's dependencies work via
> selects in some other pretty unrelated node.

alright, let's keep it your way, I'll add your Acked-by and Tested-by
tags and push the patch to my 'next' branch, should show up in
linux-next tomorrow.

--=20
balbi

--hXth9cGL35Nvpk4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSfhAAAoJEIaOsuA1yqREzhIP/i9bUV9XoZmrQ2//YLzxbYDX
BVA9WD47Hi+fLHM8zb/Z6c3o2meBVqc2IiCPPt05ftlc8uh5JJ6t5N2NvvNETs7W
hIz4MIJN0zGGh3UardwvNG+Fzm+mdeSRX+h+BgDdbqK6Bpdoifbl4vi+6XH2itbG
Vz33VmUt4u1GSDos38k5Rlx6RlIQd7xLSkNxB36gGc6ajb7N5YJ04MohwzokYQYq
xYay/GY0ZzDLeM1HJ6pM1FT8Wj4T9WkI+GXM0qIl5VuNcBsK8wIdIc+FTNH2C5ME
If4YC9dMEe+EuWuWivaZ5ae4obTXNGSCCJ+DHfyKu1haBqTyNJ/rTt32NrEKat6Q
kV3zyjQEi75+x01QTVljhm14mF1KROmn2qtZGuz/rZxLvlAmKa8TpfvNcN/D7MNM
QINoTABcdwGQxWnMr7kcuWDAjBJ7A3FBZiqY0Rn1qeok4jdvf7m1tTzhm4LnQ6Ud
RHGgSQ9moDwXnrAQQROZYhJuyPqSJvD9rdlgo6FL+VLqvjkXp965y1U8HEVP5nzJ
pNQGqYle3b18xajOaIZln8NY0ctIqFm+C0PP5lUHaeKdHyTKmrh0KtsBnP7hsERN
uIYr56W5mXHGQnXNVb/5K2Xd3yGrVbvsUSVpDQg+gA70zGxK6qrd0qY/cRXqpPps
5aKHAlX9YA4W8xbqr43Z
=9HnH
-----END PGP SIGNATURE-----

--hXth9cGL35Nvpk4x--
