From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 2/10] firmware: Add Tegra IVC and BPMP support
Date: Mon, 21 Nov 2016 09:29:59 +0100
Message-ID: <20161121082959.GE25171@ulmo.ba.sec>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
 <20161118161719.24153-2-thierry.reding@gmail.com>
 <20161119023138.GL2543@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161119023138.GL2543@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 06:31:38PM -0800, Olof Johansson wrote:
> On Fri, Nov 18, 2016 at 05:17:11PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 1001354ca34179f3db924eb66672442a1731=
47dc:
> >=20
> >   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.10-firmware
> >=20
> > for you to fetch changes up to b704ed8095ee91af5f3f7343bb3be23aae1cb26d:
> >=20
> >   dt-bindings: firmware: Allow child nodes inside the Tegra BPMP (2016-=
11-18 14:33:44 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > firmware: Add Tegra IVC and BPMP support
> >=20
> > IVC is an inter-processor communication protocol that uses shared memory
> > to exchange data between processors. The BPMP driver makes use of this
> > to communicate with the Boot and Power Management Processor (BPMP) and
> > uses an additional hardware synchronization primitive from the HSP block
> > to signal availability of new data (doorbell).
> >=20
> > Firmware running on the BPMP implements a number of services such as the
> > control of clocks and resets within the system, or the ability to ungate
> > or gate power partitions.
> >=20
> > ----------------------------------------------------------------
> > Dan Carpenter (1):
> >       mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
> >=20
> > Joseph Lo (3):
> >       soc/tegra: Add Tegra186 support
> >       dt-bindings: mailbox: Add Tegra HSP binding
> >       dt-bindings: firmware: Add bindings for Tegra BPMP
> >=20
> > Stephen Warren (2):
> >       dt-bindings: Add power domains to Tegra BPMP firmware
> >       dt-bindings: firmware: Allow child nodes inside the Tegra BPMP
> >=20
> > Thierry Reding (5):
> >       Merge branch 'for-4.10/soc' into for-4.10/mailbox
> >       mailbox: Add Tegra HSP driver
> >       Merge branch 'for-4.10/mailbox' into for-4.10/firmware
> >       firmware: tegra: Add IVC library
> >       firmware: tegra: Add BPMP support
>=20
> Hi,
>=20
> Again the format of the pull request here is a little confusing, since it=
's
> a cumulative shotlog and diffstat, while you already sent the bulk of this
> as part of the driver branch (1/10). It'd have been better to use that br=
anch
> as the base when you generate the pull request since that's the delta we =
see
> when we merge it in.

In the past there had been occasions where it hadn't been clear what a
given branch was going to pull in as additional dependencies, so adding
the complete shortlog seemed like a good way to document this in a more
explicit way.

If you prefer working things out yourself I can tweak the scripts to
generate the pull requests on top of their respective dependencies.

> Also, I can't seem to find the key you use to sign these tags with, it is=
n't
> uploaded on pgp.mit.edu. Can you remedy that please, and get it signed as
> needed?

Works for me:

	http://pgp.mit.edu/pks/lookup?op=3Dget&search=3D0xDD23ACD77F3EB3A1

Thierry

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYMrCHAAoJEN0jrNd/PrOhTrQP/0kc9rYhYrApoOyDH5qIdqVt
ugm4t4L3x/0M2TSGZv6vlCRYfs6MeSLvZG/k/AYV7HLK/q8EQRr/8acfuEMU4DT+
oTY9/TWB3ZJZjednwuYRccp8E1LOIu7REVD10r6K2i/ohT5/pXpQPq5dAx5sGkMO
bamXSJ6Sa1DrXYumnLXeUwabdd7HuEns/QjUnCps/mE1x52gajeYcr/Qlzp8APtR
m5xCMh6Vbo8HK+05ctxUe5s0SutDFaqpGVT+/5KeY6eyhAWec5yfUKHJBxunYbFS
eoQQCiUnOzsXhCnU3PRbM1n58V5rCGwXVoEfR/A2PpH0CIQHst0V1s7GQ/G7LisO
T2tRNjIlCG4iub4+jWodDgNy9+l8dCY0ewivv06QiKLPecGizFO/NlUvNyQuqm05
muvHxEhwbYN20MrDQsKoac0CEDrc7hle0i3SGhzp73DPzy8OYFMGeLb69Y/6G29z
dyj0JXkQjtfsYg95+//XoAeE2CfTrpieHktSNEp60iW6S0v93ur+H0qLhzfF+KAA
a0ktAhbJirlGPixHZMb3bbKwhUfAtVYmQ8FP9uziiBOzlOvXNgE8c7iJN/sv/Epk
RtA8pUtqCQPyXRFGuA/Tx8/4yWzC6JcJKGsNH4uz9wBJVMSF9wRyqp2s69uGtTIq
OhnjJdnnuHvHsSE3L1aH
=tXjX
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
