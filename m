From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] ARM: tegra: avoid section mismatch warning
Date: Tue, 11 Dec 2018 11:28:56 +0100
Message-ID: <20181211102856.GI14426@ulmo>
References: <20181210215856.2238253-1-arnd@arndb.de>
 <20181210215856.2238253-2-arnd@arndb.de>
 <20181211100550.GD14426@ulmo>
 <CAK8P3a1zbmYMFZB8R+rs=vdJY=KNqgRPBCQNO91LcSSTR0O03Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1zbmYMFZB8R+rs=vdJY=KNqgRPBCQNO91LcSSTR0O03Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm-soc <arm@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 11:08:53AM +0100, Arnd Bergmann wrote:
> On Tue, Dec 11, 2018 at 11:05 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Mon, Dec 10, 2018 at 10:58:37PM +0100, Arnd Bergmann wrote:
> > > WARNING: vmlinux.o(.text+0x39ecc): Section mismatch in reference from=
 the function tegra114_gic_cpu_pm_registration() to the (unknown reference)=
 .init.rodata:(unknown)
> > > The function tegra114_gic_cpu_pm_registration() references
> > > the (unknown reference) __initconst (unknown).
> > > This is often because tegra114_gic_cpu_pm_registration lacks a __init=
const
> > > annotation or the annotation of (unknown) is wrong.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  arch/arm/mach-tegra/irq.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > I'm not seeing these. Do I need to enable any special options to trigger
> > these? Or are these just so new that I haven't run into them yet?
>=20
> My guess would be that this is a result of the CONFIG_NO_AUTO_INLINE
> option that is now available in linux-next.

Okay, that would explain. It's not set in my configurations currently.

Do you want to apply this to ARM-SoC directly with my Acked-by, or
should I queue it up for v4.22?

Thierry

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwPkWgACgkQ3SOs138+
s6HFnRAAi5OjsnSOJjvHFV0izhJIfhiufCH8ED7aqLMBkYuDJK5t5cKaiSNqeZyy
fpCTBk4mjNBx9MyrDDhZB0YyDs8wDtf6keaBI/7eE+2YOj1Va8o5vMbNWP1EJS3V
3/8O9dXwjEHOiA0aPQ6Gea854Yi4z14aEeH67OqC9UTJ1jIGzYjrYZloV1qSwIUu
o1NVD175zaSK6aFFYWUiDwvTwgA0gnJvho7Uj+zmJ3jdg5vyQxcvqRG41bAdyuZ4
gKksCTnUMT22gyJm0q/w5MHOGekoX4ZmnHJD/H5L47kcjzCqEyjz3kt4ukuRnYIa
aYSe12zAmEE8zrIDn/csSt/FJGgATFBzg3ab0rrUqLP5tLUgE/DOz8RQTeXlF/xN
OrJjrc+0JpiwUiDLcoeAFO0MEf+Z7viPWDNae0X3LQ4Vp4qqrUQW9AlvLtjphAx9
hKMfWbNjEn3w2jXabQ4611nMT8ThIn5P0Mj4y8gTPWFNBb+ruc4t1HBDrZlAKTw3
pIigbiqPp7idDXCu2ybbDe2VxoVi7QnB65L0zj9spF5GfiwkJXelI3G9IjPuwU12
2sN6KZcZ8UcHKMbyOZcyVDuYh0cZn+z9LdGc8HyO5gvwewR1XD4yJ4NeGTNSvF+1
xLcHRPsrRj2AS4g4WYk8P8FKZd8LydwGTbwI4a3uh2tt+IIFFYk=
=INA3
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
