From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH v3 6/9] drm/nouveau/graph: enable when using
 external firmware
Date: Mon, 28 Apr 2014 08:57:02 +0200
Message-ID: <20140428065700.GB19455@ulmo>
References: <1398410396-23338-1-git-send-email-acourbot@nvidia.com>
 <1398410396-23338-7-git-send-email-acourbot@nvidia.com>
 <CACAvsv51Ju_ZqJfNU5GzzEmDzf2Fr6Xr_5yGRtfqOQRVTgvDPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0723528416=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv51Ju_ZqJfNU5GzzEmDzf2Fr6Xr_5yGRtfqOQRVTgvDPg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============0723528416==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 12:10:27PM +1000, Ben Skeggs wrote:
> On Fri, Apr 25, 2014 at 5:19 PM, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
> > nvc0_graph_ctor() would only let the graphics engine be enabled if its
> > oclass has a proper microcode linked to it. This prevents GR from being
> > enabled at all on chips that rely exclusively on external firmware, even
> > though such a use-case is valid.
> >
> > Relax the conditions enabling the GR engine to also include the case
> > where an external firmware has also been loaded.
> I'm happy to take this patch as-is.  I do wonder if we should do
> something like this though:
>=20
> if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", oclass->fecs.ucode =3D=
=3D NULL))
>=20
> Which will automatically switch to external firmware if there's no
> internal implementation available.

I think that makes a lot of sense. Perhaps outputting a warning or so at
runtime when this happens would be helpful in reminding people that the
goal is to make the GPU run with nouveau firmware rather than external
firmware, and hence that there's some work left to do.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTXfu8AAoJEN0jrNd/PrOhMH0QALxy7ms7OtX9b38FgUKMuWRm
YiCiTLo/GiDc/+QW1tKA4hjnosV3EToj8FAr929QPHRhyXaWDVcjnfNo5+1ksP6u
qp/siG0jkXUi6jU6Bgz/pHr8a3JzhaH0Fcp1imLADgVdjOXRp+z75Q9J8AX4joDa
L2UP4iuqC3BtrLdI2IyIabNkcpzYajmjygHDkA03gTpcD4kPeJpFf04x7HV/m3RQ
x3giIgf5ll1270qQny3Ghy4if/79hx6OVzEhqf2mpfmTxemtJX6DoOFIkNJqzuhZ
j/7EgodWRXzaaTszibkpjJUST1ZQ4sBPKdbQcGy5G4jn/gZAgeCFbImqykmfxnqw
bP3fBP/bPhVwHm9NQuO3/9hXPNVTob+mCa4zdvIGp4eGNJd9c6pdLYclpkOQvOU1
CAsCxb2jMIKUVSUxIUpyha1+vn28NFrXAoN95c6r5cg7Fq9fhgMAosn9xfKYd0kz
bZSOgVIoeRjcbZHsj6HL9qxls9QVCVW3AnS7l2v+femNTl05SCp19xdloo5F9Ejv
bZyTFyxZILtl44hS6eRBY3rBtkVHKLRAs3+8LBDBIBALV8zgvPGeibRQg7tdFmpB
3veefRPdBpc1M1aUG9Sku4IpfdVR7NfdITmPaKCIi1gr+CIrJyyguTHbJb+WsgPO
FrhnCvSZbLtrI3jDrFiA
=GsRW
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============0723528416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0723528416==--
