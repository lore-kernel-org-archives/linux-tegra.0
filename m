From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: NVIDIA Tegra DDX
Date: Mon, 10 Dec 2012 13:34:57 +0100
Message-ID: <20121210123457.GA22428@avionic-0098.adnet.avionic-design.de>
References: <20121210105627.GA7503@avionic-0098.adnet.avionic-design.de>
 <CAOMqctRAgO-ApTHiPVpcq69e3uE5Ec6N_jxz+wotgvjbhA1tmw@mail.gmail.com>
 <2016185.oZ1QsIlQyO@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2016185.oZ1QsIlQyO@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 12:40:21PM +0100, Marc Dietrich wrote:
> Am Montag, 10. Dezember 2012, 12:01:26 schrieb Michal Suchanek:
> > On 10 December 2012 11:56, Thierry Reding
> >=20
> > <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > > Hi,
> > >=20
> > > I've upload a rebranded and cleaned up version of xf86-video-tegra to=
 a
> > > repository on gitorious[0]. Don't get too excited, since this is real=
ly
> > > just a fork of the modesetting driver with some unnecessary pieces su=
ch
> > > as PCI support removed.
> > >=20
> > > Aaron had some reservations about calling this xf86-video-tegra becau=
se
> > > it will clash with the binary tegra_drv.so provided by NVIDIA. Howeve=
r I
> > > couldn't come up with anything more creative. Distributions will have=
 to
> > > deal with this in some way or another anyway and there really isn't a
> > > way of running both drivers on top of the same kernel currently, so I
> > > decided not to care.
> >=20
> > You cannot run both drivers on top of the same kernel but the X server
> > could possibly load and probe both drivers in turn and keep the one
> > that can work with the current kernel.
>=20
> exactly, don't shift the burden to maintain two name identical drivers fo=
r the=20
> same hw to the distributions.

Okay, those are good arguments.

> > Perhaps it could be named xf86-video-tegra-kms or something.
>=20
> or opentegra (to make clear that this driver is not the closed source one=
). I=20
> know this is a bit fanciless but it fits better IMHO.

I just remembered that back when I started working on Tegra DRM I wrote
some small utilities to help with the reverse engineering and some test
programs. At the time, some other projects were appearing and the trend
seemed to be to reverse the syllables of the original to obtain a new
name. So I went ahead and collectively named the utilities "grate". I'll
throw xf86-video-grate in as another potential candidate.

Thierry

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxdbxAAoJEN0jrNd/PrOh4a4P/Al2CEvK0zbpSd8S8QXdZ/rJ
RcHqZQle2qelwkZVkVNiBgnfqIBT737IqBXYlBfdyNaZtKfa6arhEwQVh5CKBwjV
cA18g0/JdeI+Tkl94Neaxo1GSbTKz3FETzP4ONgom5cmnK/k1JN6UMW5oxrWxWHo
+QzHL+opMqeBMEnhA23wMxfVIAYlRQLEyTNlcXd9RwAqYd/mTGLczofcyYwl67+P
kSVI4GVQcBW6UmbF79DDkgL0fCPIiquWQWOaHXXXFgLHisY2/dN9KcOlcwIpLiVu
3QdMpZ6+PnYhoqQdlnCjVmrtz79nIEErqeU/dC3MKmQKQ+rNbf22JYe5kg50OYjC
A4idAzyY3nqu+mtIhGz9RJG2y2hMsrLUIRc/um5FoI2vqQHl7trT+YFa0od488Wo
EAmEeDFPxr0ISmSilg0nD4djtuMDGIA7XWLi0TPLMIFrnGkEUJgVvU0p8/uNv2O1
2mthNxUekkcIWK8yj9VJScRkWTQiZ6VnuDv9LhB+kZTAQKFmbHEjBh0OYlIhDQls
FHANGUhT7RQ7THLzIU7XbPYEHTdVM+OWFZm7JZRCetrOZi0L7G4DE9joBFp9Gfdo
LtCBCnTewgZG0MYYPdJVK7lelDzN8ng+gDc2lIkvWHAzEDYLyAYfEUeLAt9IuNaJ
eNAXpcA+PL/ik8wRZvn9
=nFwv
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
