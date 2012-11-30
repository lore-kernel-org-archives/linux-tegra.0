From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Fri, 30 Nov 2012 07:52:34 +0100
Message-ID: <20121130065234.GC26474@avionic-0098.adnet.avionic-design.de>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com>
	<20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
	<50B7AB93.5060207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1016941831=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50B7AB93.5060207@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============1016941831==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2012 at 11:38:11AM -0700, Stephen Warren wrote:
> On 11/29/2012 04:47 AM, Thierry Reding wrote:
> > On Thu, Nov 29, 2012 at 12:21:04PM +0200, Terje Bergstr=C3=B6m wrote:
> >> On 28.11.2012 23:23, Thierry Reding wrote:
> >>> This could be problematic. Since drivers/video and
> >>> drivers/gpu/drm are separate trees, this would entail a
> >>> continuous burden on keeping both trees synchronized. While I
> >>> realize that eventually it might be better to put the host1x
> >>> driver in a separate place to accomodate for its use by other
> >>> subsystems, I'm not sure moving it here right away is the best=20
> >>> approach.
> >>=20
> >> I understand your point, but I hope also that we'd end up with
> >> something that can be used as basis for the downstream kernel to
> >> migrate to upstream stack.
> >>=20
> >> The key point here is to make the API between nvhost and tegradrm
> >> as small and robust to changes as possible.
> >=20
> > I agree. But I also fear that there will be changes eventually and=20
> > having both go in via different tree requires those trees to be
> > merged in a specific order to avoid breakage should the API change.
> > This will be particularly ugly in linux-next.
> >=20
> > That's why I explicitly proposed to take this into
> > drivers/gpu/drm/tegra for the time being, until we can be
> > reasonably sure that the API is fixed. Then I'm fine with moving it
> > wherever seems the best fit. Even then there might be the
> > occasional dependency, but they should get fewer and fewer as the
> > code matures.
>=20
> It is acceptable for one maintainer to ack patches, and another
> maintainer to merge a series that touches both "their own" code and
> code owned by another tree. This should of course only be needed when
> inter-module APIs change; changes to code within a module shouldn't
> require this.

Yes, that's true. But it still makes things more complicated since each
of the maintainers will have to do extra work to test the changes.
Anyway we'll see how this plays out. The ideal case would of course be
to get the API right from the start. =3D)

Thierry

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQuFeyAAoJEN0jrNd/PrOhOI8P/inHtC84X2k7WjhRqJtOxDHs
h09MgHk00hge9NCHdo/UKBQgFCT3/VXHzBoft+PYND1kwVK67QFN7OdRFfzDiQHL
ntHh9LxOMzgsHGgzvOl7PHivjQW5Js/6K+n2Ct3UQTup7FDbGub1piW8ftWVugA3
Alv56GZIVh4YlmO/p7stLNknzg4JX9SecQ+z+zS47VbEl8/7kSODdiBdTnYF/slr
JHXylWHsG7IS+c4wVsd4x1bJYJWqItOoJzGj0aqMUXuf3vnTsh5yKm3NKQDUTbEB
20PqQc3ZCRjfK2Ziunx6iWElbiFIUcRWwqV23BufKpLQNSHZTCgtyMOBUMY5Yxqb
YJz5JkC1OzPXYYh31LNnRFv+8XPt1oBuJEBwErVWBWB4BNF0Uj95JDsBnq4D2Z+t
qOKeM51NGzmoDZ4fvC9m9DSadyJQku1aB5dLTViWt9mUPWxkx0RGjvrBfcG3r7EK
c0RVBlp4Z3xqDhZamqbnpwUB7zDs5NER1hsJuLeCpaC2Hvu3O/7LD+pMlDLwvy9g
dd9zPm8183FxANrWoJ0YZAtymWcL7oQEiaYqNCApibyIfvXMgGi3lnAR7JPLpTpn
SYe4dApnlKRo8Nq1vxwJ0oT8m8pzYKtyn1Bl0HEITI2msAdVmZQSrS40yAJXglup
hPx9XQ4dHQghd3IuSqGH
=8WVF
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

--===============1016941831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1016941831==--
