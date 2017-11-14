From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Correct Tegra20 FUSE driver DMA usage
Date: Tue, 14 Nov 2017 16:01:11 +0100
Message-ID: <20171114150111.GA20527@ulmo>
References: <cover.1508450681.git.digetx@gmail.com>
 <a149fdb0-64ff-fa99-734e-9335605191ce@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a149fdb0-64ff-fa99-734e-9335605191ce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 02:25:28PM +0300, Dmitry Osipenko wrote:
> On 20.10.2017 01:08, Dmitry Osipenko wrote:
> > Change log:
> >=20
> > v3:
> > 	- Addressed v2 review comments: added 'config.device_fc =3D false'
> > 	  and utilize of_device_is_compatible() for dma-filter
> >=20
> > v2:
> > 	- Dropped DT patch as turned out it was incorrect and made things
> > 	  work by luck.
> >=20
> > 	- Now FUSE driver requests DMA channel from the APB DMA driver
> > 	  utilizing DMA channel filter.
> >=20
> > 	- This patchset now depends on the APB DMA driver patch that allows
> > 	  DMA client to issue a non-flow controlled transfers. I haven't
> > 	  included that patch to this patchset since DMA usage is broken
> > 	  anyway right now. It will work once this patchset and APBDMA
> > 	  patch get applied.
> >=20
> > Dmitry Osipenko (2):
> >   soc/tegra: fuse: Fix reading registers using DMA on Tegra20
> >   soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver
> >=20
> >  drivers/soc/tegra/fuse/fuse-tegra.c   |  1 +
> >  drivers/soc/tegra/fuse/fuse-tegra20.c | 13 +++++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >=20
>=20
> Thierry, why this patchset isn't in 'for 4.15' PR?

Looking at the date, this was sent on the same day that I sent out the
pull requests. For ARM-SoC (and many other trees) the cut-off point is
-rc6 of the prior release cycle. This means that any work you'd like
to see go into a release needs to be on the list a couple of days
before that. I usually do pull requests on Thursday or Friday before
an -rc6 release and by that time I want things to have cooked in -next
for a day or two at least.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloLBTQACgkQ3SOs138+
s6Hlfw/8C79nozvMHFPuVMvTbHAskC8iA9i0uWiou5MQ0xu4Sy0aFOcSXoGFgi24
O+66QAzmxS523r1kL2b4VLQooYePdUxfwWU+KMvdVp0ehQ/u3QvzCCETlgwVq1lD
KqxYk+zrxA4lzMFEvEqid887gj8SfT3Z7DSBUhjhB27isvXempsPyoV+qFU0rVgN
KTDKyvn0i6NXJKewvthbkLc7WHOEvDJ6Cbj/OOm11t0lZzzDHcGvAKrUvzEe3SE6
wm6yO4TBy3aTkHpRD0A7VtQJVJHPawT0vTpGQ8ZjLolNa/2KfYHq0xs3/gXDkghX
rGvjKI8CUA6gUubaapuGoA5zbsQd1ooWdi9XC0n4sBcaxqLRNXDsVCVdzbTnxdJZ
0cmJm2RWmwyDXol8x1yLAsmuKorl9jXyopK772kmqL6zqPuMhKtQtjRf66TVuhCc
kAzes4yqbvd2TxUZZ+MR98ks4jh8r3EvfKh7Mra9DQA/lBOK5koQxl2WDWIfW+9x
OPzb6oqDABKIUU3sObOBYZxnZ83bxo9oOKew7K1RNll5r1XaLAr5uj43sXB0FqjQ
FY8nRz1eda5tMBKX15qKCByxFMKbMaCCCfHxg6K3k8MLLPwg9InZFPauY32FJrsY
oVWVXEl5AYN1B7adXqDxW/YTeE1VZCBRjWfZHenoN0v4dIFAWU4=
=mH8Q
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
