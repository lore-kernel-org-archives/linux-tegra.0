From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Wed, 30 Jan 2013 09:34:53 +0100
Message-ID: <20130130083453.GA21322@avionic-0098.mockup.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de>
 <CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 10:21:40AM -0800, Jon Mayo wrote:
> On Mon, Jan 14, 2013 at 7:55 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
> > special in this case because it doesn't use the generic IRQ support
> > provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
> > interrupt handler for each display controller.
> >
> > While at it, clean up the way that interrupts are enabled to ensure
> > that the VBLANK interrupt only gets enabled when required.
> >
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
>=20
> Sorry Thierry, but is this a useful feature? Are applications really
> making use of it? Because it means that that an IRQ will have to
> trigger every 16.67ms when it is taken, which means the device can't
> sleep. (probably OK because it should go back to idle when the app
> lets go of the vblank). But worse, for one-shot panels there is no
> continuous vblank. I've been doing weird hacks to run a timer when the
> smart panel is idle to trick applications into thinking they have a
> vblank pulse. But really I think the whole feature of a vblank pulse
> is pretty lame and I wish it would die. Were you going to use it for
> something specific, or just adding it for completeness?

This is mainly added for completeness. I know that on Tegra we can do a
lot better by using syncpoints, but applications such as Weston (in
general applications that use the generic DRM API) rely on this to sync
rendering with VBLANK.

I don't think there's another way to achieve the same thing. And as you
already mentioned, this is only enabled when an application actively
uses it, in which case the device won't sleep anyway.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRCNssAAoJEN0jrNd/PrOh8doQAJ62is3YbxiTXZo3i9ghj5Ka
DMT2DCWBS55pmQwbyNzd4JAMqdjKfPAlk6eFXrjG5ux26V2wY7k5B8WHZ5/MAdeM
890EH5Myiq66ciUADw6myyiXYK8Upt97qEMNrnVcUUzYpOpEIp85z83DJ3TyqaBu
MoMKcAM3t6Q9O/mXFOyzatp7F2DmsHjgq72cysbca9bFjzvCAkya9IJGBdkV4CPS
POx+5q7FJJKO9KnSKg3h8YgqvvYk1VzFuuPZlfhQxQ5Q9XjWo5zxcAXtiTNE91r3
pPpjjPsO+pS5xPTPuSJb+b3YCZ3vvdq8Nw18uD6hlZcJ4ANxJFOcxc2itjrU/iTq
Sh8wScURYzZsIRdn/BjhCGSOQgdowE+KNZRkfLjT7Fgogz4NkSPJilBgl9LNqSt5
S8PliZJ4023IobPge6jlJHSTB3bCZsZMmWYagyDWXJBwGSb1jV2dgK2l8DXggLED
SwY4aY8l+4ZV5FrWp1gIzw5qMVtR8rZ6l5YCW0H/Ek5JhU82JQPTxs/KC5Uw4FIi
JIoZdoU+LVB2WdWgnwonoO+cA5AuaikNX8u9JuyFlU1//hZe+HAnl3OFUwILnYdv
j2U3UfRZc3RdbAjFLH87rB6+CdMs7gOr/dGZ1ASC2w9OdKdLN8dzt2a+UZrt9Soo
GghOazUmGrifRM1VylbR
=Zr3e
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
