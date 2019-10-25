From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload() callbacks
Date: Fri, 25 Oct 2019 12:59:06 +0200
Message-ID: <20191025105906.GA928835@ulmo>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
 <20191024181539.GA31268@qmqm.qmqm.pl>
 <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1447372081=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org


--===============1447372081==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 12:10:49AM +0300, Dmitry Osipenko wrote:
> 24.10.2019 21:15, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> > On Thu, Oct 24, 2019 at 07:31:37PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The ->load() and ->unload() drivers are midlayers and should be avoided
> >> in modern drivers. Fix this by moving the code into the driver ->probe=
()
> >> and ->remove() implementations, respectively.
> >>
> >> v2: kick out conflicting framebuffers before initializing fbdev
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> Micha=C5=82, Dmitry,
> >>
> >> do you guys have a way of testing that the removal of the conflicting
> >> framebuffer actually works?
> > [...]
> >=20
> > I might be able to check during the weekend. Is this patch alone enough
> > for v5.3?
>=20
> I don't think it will apply cleanly on top of 5.3, but should work with
> linux-next or by cherry-picking 9d5a54987265.

I just noticed that I based this version on top of a local branch that
will cause conflicts if you apply this to either 5.3 or linux-next. I'll
resend this later rebased onto drm/tegra/for-next, so it should apply
cleanly on at least linux-next. drm/tegra/for-next also contains this:

commit 051172e8c1ceef8749f19faacc1d3bef65d20d8d
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Sep 25 13:26:59 2019 +0200

    drm/tegra: Fix ordering of cleanup code

    Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
    initialization") changed the initialization order of the IOMMU related
    bits but didn't update the cleanup path accordingly. This asymmetry can
    cause failures during error recovery.

    Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initia=
lization")
    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
    Tested-by: Dmitry Osipenko <digetx@gmail.com>

which will conflict with the ->load() and ->unload() removal patch.

If for some reason you can't use linux-next, it shouldn't be terribly
complicated to backport this to v5.3, though.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2y1XcACgkQ3SOs138+
s6GUUw/+JX4T/+S+Np6c8xtia3ypDnqM/9eryUpqn+hyZ634Kk5VwjduevZoaLR/
KmOKEIA0xD9+ZFylmKsb/sFdgbmkCBx6rlNJhZq5uleGjnNi+6Ybokl4KAtGbzST
u2xGRWNfv/yGy7mmx720nZVPcFpWaXNDCUqlDUVBE1UvIL6LlMKLzLCEdZn7tr8Z
zetlXNd41+l2Me19xAUIZrl3pPEslM0JjvR9i2oEduHTUkITK1+QudFZhDYRJwcm
a9ZEV0qabJpp8AZBLn7cPkyhNPLl2vasuCFIAHBW5+7gtjX3bgtTq5hO5bD8zaKs
3K5G8ZNUHitZcWetD4O298tJqLgrzLSOVuUcCIigsgzmE16VHoxNu9w4kzFBVHwn
BPbcd6qvf6nJeuwagRZ6u2V8jJlFPnzv8RZcRT8DW/R9yAtcEYOItm2LkN1OAtiG
UXaCCccYgl17fhuvdzpS3MCQjSEw7wA3kwbuPWaVUXGSvVZsVrzXwZdN7Q4hfwMV
q/N+Dtn4s6Xv7ia3/cxETW7KVYdEFVPSN2Be6hN5olcnQnjvos8OJII9H4ivGk9+
KhxZYv0LBL7S6yZeoQTZmTpUOTVnEG5a0mVf4UG3QPGwe2kkschynjjQ101IG/v6
9/0ylUXbXeV04bfvliLASaHIwbJ6K6+rTrwjXNq0zSqtcIFVlh4=
=Esw+
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

--===============1447372081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1447372081==--
