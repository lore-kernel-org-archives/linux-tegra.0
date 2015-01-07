From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the
 GPU rail clamp
Date: Wed, 7 Jan 2015 15:48:08 +0100
Message-ID: <20150107144805.GF1621@ulmo>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
 <1419426990.2179.7.camel@lynxeye.de> <549B7638.2010405@nvidia.com>
 <20150105150932.GG12010@ulmo.nvidia.com>
 <20150107101900.GP10073@tbergstrom-lnx.Nvidia.com>
 <54AD0F37.5080609@nvidia.com> <20150107132709.GA6988@ulmo>
 <20150107140852.GR10073@tbergstrom-lnx.Nvidia.com>
 <20150107142828.GB7392@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051386999=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20150107142828.GB7392-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1051386999==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 10:28:29PM +0800, Vince Hsu wrote:
> On 04:08:52PM Jan 07, Peter De Schrijver wrote:
> > On Wed, Jan 07, 2015 at 02:27:10PM +0100, Thierry Reding wrote:
> >=20
> > > > Yeah. I plan to have the information of all the clock client of the
> > > > partitions and
> > > > the memory clients be defined statically in c source, e.g. pmc-tegr=
a124.c.
> > > > All modules can declare which domain they belong to in DT. One doma=
in can
> > > > be really power gated only when no module is awake. Note the clock =
clients
> > > > of
> > > > one domain might not equal to the clocks of the module. The reset i=
s not
> > > > either.
> > > > So I don't get the clock and reset from module. How do you think?
> > >=20
> > > This whole situation is quite messy. The above sequence basically mea=
ns
> > > that drivers can't reset hardware modules because otherwise they might
> > > race with the power domain code. It also means that we can't powergate
> >=20
> > The powerdomain framework won't call any powergating method as long as a
> > module in the domain is still active. So as long as drivers don't try to
> > reset the hw without having done a pm_runtime_get(), we shouldn't have =
such
> > a race?
> Agree. And as long as the driver has the correct reset procedure, that sh=
ould
> be fine to occur between power ungating and gating sequences.
>=20
> >=20
> > > modules on demand because they might be in the same power domain as o=
ne
> > > other module that's still busy.
> > >=20
> >=20
> > The powerdomain framework keeps track of which modules are active (by h=
ooking
> > into runtime pm) and won't try to shutdown a domain unless all modules =
are
> > inactive.
> Yeah. By the way, that means we should start supporting runtime pm for all
> the modules to use generic power domain.

Indeed, that'll be a prerequisite before we can merge power domain
support. I do have a couple of local patches that add very rudimentary
runtime PM for various drivers. For starters we could probably just do
the

	pm_runtime_enable(...);
	pm_runtime_get_sync(...)

in the ->probe() and

	pm_runtime_put_sync(...);
	pm_runtime_disable(...);

in the ->remove() callbacks for those drivers. That's by no means
optimal but should get us pretty close to what we do now and still
support the generic power domains.

Thierry

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrUclAAoJEN0jrNd/PrOhUBgQAIT3KSm3lSXbIKfveWEFuAW4
DGSxiOK2+D/1Rx2S/rRkVVdbA5VmFyFEmpb7vuXGyDMlwwr99mV4eQPP6aiMIRqx
T791yVO7SxCeKe5iChHleOg42whahHBiyQSTk2jHcykTlLRO6hwZ8udaaKt8Dz7N
DH4WpBjBf0ZxPRwKQ1RHfdJhoZUqrqoj0drgKgF4tf8r0gTuGzQcpkTUUOvF5Fiw
tWBRprRSUTSIKm0N1P7/Lc+JfmChc2Kjwtr2/zA5yypRKkwtxmbxi2v2Fb1F23i/
w02ykXUIC1ZuWDjBsvL2EdnQnPCRpjvuwAzdo4xHHroHFo7uNcj1PaLJ9POTE5FS
7HBWCpHQlWTjAbJlE3Ffu2ibJymBE8B5DpDE4i+PoAcdvEnGhqe3pH/Ei1z4bBZ4
BctQImX1fxZ2aLtYjDgimWuZzZyvd5kjR4snpWW4C1ZLXAicrtZK6UMrnRY5nCdz
FvbWiiOoBqZ9MS+tcDT/iREK2ZiCCJJKa9TPHGxioBIwMYSE8yb5aUkjlmvGa+8K
l6msTe7DymF3FBxXjzxSnDP5aOvGUzQg+7vyIaEjRpSApG8s9PWGy1oTtZQ9551m
lZF+QluMqVlgtE65yWphUHXFq2EqrxoM2pZs1MXzzsYqTV+G9AEPtoQCytgttsGu
Jhql9YFUDbwL437J+Ftq
=bCIM
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--

--===============1051386999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1051386999==--
