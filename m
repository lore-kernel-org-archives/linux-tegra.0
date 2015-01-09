From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code
 from ARM to kernel
Date: Fri, 9 Jan 2015 10:49:14 +0100
Message-ID: <20150109094913.GB27845@ulmo>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com>
 <20141110095325.GC12126@ulmo>
 <CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com>
 <alpine.DEB.2.11.1411132334400.3935@nanos>
 <CAOMFOmVziftM=pWGG-L9J-E6AHYAK7k9bmBcpS1adPboLciX9g@mail.gmail.com>
 <alpine.DEB.2.11.1411150115390.3909@nanos>
 <CAOMFOmV5=tes6Ak1eUKb2qircp8ba6jt6v-bg66Kp_-jYk9m2w@mail.gmail.com>
 <alpine.DEB.2.11.1411150154280.3909@nanos>
 <alpine.DEB.2.11.1411150212210.3909@nanos>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1411150212210.3909@nanos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2014 at 02:38:00AM +0100, Thomas Gleixner wrote:
> On Sat, 15 Nov 2014, Thomas Gleixner wrote:
> > On Fri, 14 Nov 2014, Anatol Pomozov wrote:
> > > On Fri, Nov 14, 2014 at 4:18 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>=
 wrote:
> > > >> So what I suppose to do with my patch? If it does not work could
> > > >> anyone provide patch that removes ARM arch dependency from
> > > >> tegra20_timer.c?
> > > >
> > > > Huch? You want other people to solve your problems?
> > >=20
> > > This is not the point. I provided patch that fixes the issue. Other
> > > people said that they have ideas how to do it different (and better)
> > > way. So I am asking to share these ideas represented as a patch.
> >=20
> > That's not the way it works.
> >=20
> > You sent a patch to solve an problem which you are facing.
> >=20
> > Now the people who review the patch think that there is a better
> > approach than moving code from arm/ to the timekeeping core code.
> >=20
> > So it's up to you to come up with a patch which solves the problem in
> > the right way.
>=20
> And just for the record this whole thing is just hilarious.
>=20
> ARM64 selects ARM_ARCH_TIMER which registers the architected timer as
> the primary clocksource.
>=20
> Now that timer has the following flag set:
>=20
>     CLOCK_SOURCE_SUSPEND_NONSTOP
>=20
> And that flag causes the core timekeeping code to use the clocksource
> to figure out the time which the machine spent in suspend.

As I understand it the architected timer will be turned off along with
the rest of the CPU complex on Tegra. I'm not sure if that's specific to
Tegra or something that other SoCs may do as well.

Cc'ing Paul who's more familiar with the details.

Thierry

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr6QZAAoJEN0jrNd/PrOh8b4QAKk1T/OmshnEPpXYuzDRjfj4
szabobtW+o0t17bRZCOybVhj4hgGQNcUTrv9ukPWAPClrLWfnnD5E07CwEd8IbcQ
qon4NBtzorzo0Q2N9n5oRsYVOKmeg5lRuhvblsXZnlFlv6t28Fc/9bO7ysze5Uch
hPABsTZtRnADI4VJ8D2ijXWhOwnjuN8uTAawfe4I5kuKzOKLMC1auzyfovGhpUCE
EKYMdb5PazXUnyJ7dWI2fFDK5QhUusTxHaVzDzgLhAJf/Q2FajZaliFr6nrf139X
pIwZwqANNXtsSxFIvZI08jQFzzKxy4qzdtqleII6bjoA+so9Nupl46hNrTedrAsJ
DY+1mn3z1a0AEo3QezqYMSkjLkinjvyW6YUmxUPFWJM4RrLa5BYyhVSTTnpCYb4G
c3bad6axkRidnmEOTDp+K5htNKQnXYtApgYivD3LJDK7ZnYGXQdK7WljkFUQuGgP
yUQboMxU2z36hUJWKaaoRooKDfnMaNXJH8JeBK2K/r+rKA79D4qUqOTVDc4QDigK
ZgjgWvTJCPYmDMg7ma3nJfLUBo+lkt0PbVX1U6SfOhsoBBv58NQYORnw0jDRWuCr
tloJhCc1KkiDzgeCx8HPLwPs7a/lWFd763lfYq2BlG3X3Xs6+3cmbZWE+saAAuzf
3WHXykTzV2+2G7NCwue+
=2rps
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
