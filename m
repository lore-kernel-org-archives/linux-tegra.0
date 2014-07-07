From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: rework PCIe regulators
Date: Mon, 7 Jul 2014 07:52:12 +0200
Message-ID: <20140707055211.GA15216@ulmo>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <20140707003854.GD8469@quad.lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140707003854.GD8469-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 06, 2014 at 05:38:54PM -0700, Olof Johansson wrote:
> On Mon, Jun 23, 2014 at 03:23:44PM -0600, Stephen Warren wrote:
> > This branch reworks the set of regulators that the Tegra PCIe driver
> > uses, so that the driver and DT bindings more correctly model what's
> > really going on in HW.
> >=20
> > I've made this a separate branch in case it needs to be pulled into the
> > PCIe tree to resolve any conflicts. Any branch that adds Tegra124
> > support to the PCIe driver will need to be based on this branch, and
> > such patches might show up for 3.17, and be taken through the ARM tree
> > so we can manage our own dependencies.
>=20
> Isn't PCI broken if you boot with an older device tree now?

Yes.

> I would like to see this as two branches: One to the PCI driver, and one
> modifying DT contents. The PCI driver should remain working for old DTs,
> so the last couple of commits on this branch can't be there.

This is one of my main gripes with device tree these days. We have many
situations where device tree bindings got rushed with the result that
many of them describe hardware in a *completely* wrong way.

The Tegra PCIe binding was designed with an incomplete understanding of
the hardware (I wonder how many other cases there are like this in
mainline) and it just happens to work by accident on existing platforms.

So this really boils down to one question: how do we fix bugs in device
tree bindings?

I suppose we could keep some sort of backwards-compatible shim inside
the driver to cope with the existing, wrong device tree binding. However
that means an additional maintenance burden and I'm not convinced that
there's a need in this particular case.

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTujWLAAoJEN0jrNd/PrOhjHgQAIlkXhaEnDKfqls9E0EjOAqb
F2dMov2ww7FfJtlbEP1i9KPHrZB7Mrw2Nu4h9nJPeCTl41Ot9WuSLkQLu+8Mk//i
iJgjgartp8Hlkbga6iLIOH2qsyOHll1p1r/pGp4dnVyVOb0geH1hM71k6w0njC7n
9zaWDC7rKopk8AgHm+vpE7eV7WIttx9UXKTPGEUPyAKmzPa2Ui4bOJYbqjlAL5Xb
zEHx7uWUv6E5b2OTmH0rU8QZ67jMuehYlFP1+PwBqDFt/TYjZNWpb9It6Bc7EEBO
YOkTnHaEZW99cXIwxAtRTinc4mqUZZloiBSCHQpTIZ2oS/pgVjh1roOzU4gda2qR
Li7awiFJVibxdj7E1rMDaelbPNbbXbdCSti9z4zjtB8X/3Mdh4Q/yFMOr1wbiSMU
uTHaUMm8h8mzlCkegoVssyEdy6AT0F6p5sjKwDCg04cOP2zhXE4rrwy30FD8v6Lg
FcdlNkNhCMmn5jkod/jmjANRSPGAFtrY+22tAif5Ma2M/one/Vt0GxuS+dw8YaZi
Ukna49F0XbGTbTUFjk9sU1g+w5sghQQjyt6iTNd0w9T/jUo/UdOBJNKDYlZSvZGj
fUCDMpXY3YYJfcvM64DAnzPmRfq1hvgq5CxUwcHc0G9lFqX4m7D73mbjNZg8NVbM
TvOHJ6LJ8aZOtu+Bffnc
=zZkH
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
