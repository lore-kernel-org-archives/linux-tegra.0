From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Thu, 27 Jun 2013 11:26:13 +0200
Message-ID: <20130627092612.GB13562@mithrandir>
References: <51C9AF96.3040107@wwwdotorg.org>
 <20130625.193628.2143557800560690024.hdoyu@nvidia.com>
 <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com>
 <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <51CAE235.1000807@gmail.com>
 <CACxGe6u=BfnbwmS=7X5eYqKuSkmGdu9v-StAx+m7fLd+8C69pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6u=BfnbwmS=7X5eYqKuSkmGdu9v-StAx+m7fLd+8C69pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 02:12:06PM +0100, Grant Likely wrote:
> On Wed, Jun 26, 2013 at 1:44 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 06/26/13 12:03, Grant Likely wrote:
> >>
> >> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >>>
> >>> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013
> >>> 19:52:33 +0200:
> >>>
> >>>>> Here's my workaround. I need to call of_detach_node() with OF_DYNAM=
IC
> >>>>> to avoid duplicated device registration.
> >>>>
> >>>>
> >>>> Gah! my eyes!
> >>>>
> >>>> Don't do that. It is incredibly problematic. Look at inhibiting
> >>>> duplicate device creation instead.
> >>>
> >>>
> >>> I may not follow this thread correctly, but could anyone point out the
> >>> above "inhibiting duplicate device creation" if there's already such
> >>> solution?
> >>
> >>
> >> No, the solution doesn't exist yet, but it wouldn't be hard to
> >> implement. What you need to do is to add a struct device pointer to
> >> struct device_node, and set the pointer to the struct device when
> >> of_platform_device_create creates a device. (it would also need to be
> >> set for early_platform_device creation, but that's not something that
> >> should affect you). You would also add a check to
> >> of_platform_device_create to check if the device pointer is already
> >> set. If it is, then skip creation of the device.
> >
> >
> > Grant,
> >
> > What about the other way round, i.e. check if there is a device with
> > .of_node pointed to the struct device_node currently at
> > of_platform_device_create?
> >
> > That will avoid adding struct device to struct device_node which you
> > fought against for good reasons.
>=20
> The main thing is that it means searching through the entire list of
> platform devices every time a new platform device is created. That
> seems unnecessarily expensive to me.

There's not really much reason to not add a pointer to the struct device
of a device_node because you can already obtain the platform_device by
calling of_find_device_by_node(). That doesn't work early, but if that
gets fixed, then of_find_device_by_node() could also be used. And since
adding a struct device * to device_node is pretty much required to fix
of_platform_device_create() for early, of_find_device_by_node() can be
implemented much more efficiently.

> > Also, I guess of_platform_device_create could be exported and used
> > by anyone who wants to create platform_devices early.
>=20
> Yes, but in that case it is probably better for them to call
> of_platform_populate early if of_platform_device_create is fixed to
> support early calling. Then you'd just set up all the devices earlier
> in init, allow drivers that support early probing to do so, and then
> everything else uses the normal initcall path.

I've been bugged by the recent additions in drivers/irqchip lately
because they all rely on only the device_node and therefore none of the
functions that require a struct device can be used. If things can indeed
be fixed to call of_platform_populate() early that would restore a whole
lot of consistency.

Thierry

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzAU0AAoJEN0jrNd/PrOhCxoP/icHksiErZySYZvnImCm9pbS
IEh4BMNOec5L0N97x6mCcLMrC6kdRyTaMUdT7f347f0Dv5EEkBsTerXL+GGmA1V1
BPZ+2dw7nPlU47da3PeZ7valVqCwC6tXV7WtieROCtUiBYq+9v+rUQE3gbL9qXGm
gnBX+98o6QTgRT8hr0DAMKYfzocsxKFgILptmaL6la7advR3zADuoZF1ELXw1Y7N
R+9nt6IEVJQHDAvPhSxMXvZpx5z6AfcEPjd6nnPYVAwHjxXLXWZyg+DyKLVQTZF9
p5mrhPQzTosBpPXo9I7p5gBaZCp5Uhf0hhrg0CX6YkuDFXbg/gw53qp/jP00DF8E
I4D/IiIMzaTrSxL9Ki4ljGinn0FwSgXP63/HLGNY/H6edYMtHqxASBHmbzC3sWfk
KamsWj1ArKlTuLGsXF0idxdpmD2Dysyi2ZKT/PiGWodaLkc50AF3xfqqFwO3PUhe
CEHIrcn7ABpE9ZWABLSabxy3mDLJ+fsLYdlEKD+QBmeWwsU30snalLSXfcPye4nx
a3Wvm1NepPTaKRBwbYj3SEI0Uzntf+x6d131HUBGo/eVAL5MX/xpuRAZErXJOWlt
K+Fj4edQKAF2K2vRNNn8+l2c5Y/SpZmjXilEtnWxz1JGxzhx1zrPPgyM3U+GR/SJ
giUk1GqnHQNLvhLFMMa3
=pZry
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
