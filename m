From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: drm connectors, tegra,
 and the web they weave (was Re: [PATCH 58/59] drm/todo: Add new
 debugfs todo)
Date: Thu, 20 Jun 2019 16:50:14 +0200
Message-ID: <20190620145014.GB15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com> <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
 <20190618180113.GA26105@kroah.com>
 <20190618214656.GH12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0218323316=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190618214656.GH12905@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-tegra@vger.kernel.org


--===============0218323316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 11:46:56PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 08:01:13PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 18, 2019 at 07:32:20PM +0200, Daniel Vetter wrote:
> > > On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > > > > I could just "open code" a bunch of calls to debugfs_create_file(=
) for
> > > > > these drivers, which would solve this issue, but in a more "non-d=
rm"
> > > > > way.  Is it worth to just do that instead of overthinking the who=
le
> > > > > thing and trying to squish it into the drm "model" of drm debugfs=
 calls?
> > > >
> > > > An example of "open coding" this is the patch below for the sor.c
> > > > driver.
> > >=20
> > > I think open-coding is the way to go here. One of the todos is to
> > > extend debugfs support for crtc/connectors, but looking at the
> > > open-coded version we really don't need a drm-flavoured midlayer here.
> >=20
> > There already is debugfs support in the code for crtc/connectors, these
> > files are "hanging" off of those locations already.  I'll keep that, but
> > indent it one more directory so that there's no namespace collisions.
>=20
> The todo was to have some drm wrappers here for the boilerplate, but after
> looking at your version that's not a good idea. So not just making sure
> crtcs/connectors have a debugfs directory made for them, but more.
>=20
> Wrt adding a new directory: debugfs isnt uapi, but there's usually a
> massive pile of script relying on them, so it's not nice to shuffle paths
> around. Plus the lifetimes match anyway (at least if you don't hotplug
> connectors, which tegra doesn't do).

So, I think you two already covered everything. From a Tegra perspective
there's not really a need to care about the exact structure of debugfs
because there are only a handful of scripts that use this and they are
not exactly widely distributed. At the same time there's really no need
to add another level of directories, since the connector really is the
SOR, so an sor directory in the connector's directory is just redundant.
Cleaning up and lifetime management aren't issues, really, so there are
no good arguments for adding it, in my opinion.

Historically, the sor.c driver is interesting because it used to be just
plain debugfs calls. Only when I added a second debugfs file I decided
to go with the built-in DRM infrastructure for this and then later went
and converted the first file to it as well, for consistency. I do
remember though that I was very unhappy about the fact that I had to do
all this kmemdup()'ing just to make debugfs files per-instance (the DRM
infrastructure doesn't allow that by default). In retrospect that was a
poor decision and I should've just stuck with debugfs and perhaps just
spin a couple of helpers around that instead.

So I'm happy to see this effort.

Thierry

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LnSIACgkQ3SOs138+
s6GbLg//Tf3ufNZkqFacywTcO2/eLYw94OGpRZCe4oB2e4jJKCHs1SWTUWtDPWZU
b0R/dzDuxQNct7JbIFyEvXpJ82NiXN3tffzxbE7xQ0KrEQMqaVV2vM3rf9WqNHMV
ibx/VzorAkbvXEkODn8xmx33ieDsJOzlRVq3Oo3/Lw8oLs7+mYrr/LHzYGuGA8ue
XYFGzR8xdRTlbXNxQQ3EgsUn0ILD+UwGxaVb4lJnhtCf0M1auQwFclxO9T253mJO
mbrdEcpoQEUWBrdXjdicazSiiB6TrfH066uERoG4+AyFJbVP872FJVTkp5p9RGXj
lLgZcVJJrleSMPXSZIX3lqsvOpVsXrzxDsPN+Wswx2j0fLl62/drAthWoV1M9LPE
p6x5gx262qT5+qxWJOZaNcSrPYIuaz3SqFclSTWaDZTllVopS/y6QSXX9bg5cTHk
6HRQZ7lmega0AcQb+acdqjQDJWz+dje8ZAKAVZFAiB2wfQXbpRP+UptUP5X0qyz+
PZUpTWrn+vzEYtao4iflUL/lgLw6d+Zd4n2JRNjp4SCcuKP9/r88IJ8kIwVyem8X
sGO8V0IF8aVR6eH6VYX/xrAsalrFOAuhAWpD1c5IJtzjtwg99xCADR+Wv0WU1N12
+l8viBAMu1vgmbrwbGIqRv0sHXVa/v8qlPvP5WuhwQnOI59TsHk=
=UkZH
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============0218323316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0218323316==--
