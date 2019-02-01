From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 08/16] gpu: host1x: Use correct semantics for
 HOST1X_CHANNEL_DMAEND
Date: Fri, 1 Feb 2019 14:41:34 +0100
Message-ID: <20190201134134.GA12829@ulmo>
References: <20190201132837.12327-1-thierry.reding@gmail.com>
 <20190201132837.12327-9-thierry.reding@gmail.com>
 <07572051-6189-5fae-f76f-b885d8454fa5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270998858=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <07572051-6189-5fae-f76f-b885d8454fa5@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0270998858==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 04:37:59PM +0300, Dmitry Osipenko wrote:
> 01.02.2019 16:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The HOST1X_CHANNEL_DMAEND is an offset relative to the value written to
> > the HOST1X_CHANNEL_DMASTART register, but it is currently treated as an
> > absolute address. This can cause SMMU faults if the CDMA fetches past a
> > pushbuffer's IOMMU mapping.
> >=20
> > Properly setting the DMAEND prevents the CDMA from fetching beyond that
> > address and avoid such issues. This is currently not observed because a
> > whole (almost) page of essentially scratch space absorbs any excessive
> > prefetching by CDMA. However, changing the number of slots in the push
> > buffer can trigger these SMMU faults.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/host1x/hw/cdma_hw.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cd=
ma_hw.c
> > index 485aef5761af..a24c090ac96f 100644
> > --- a/drivers/gpu/host1x/hw/cdma_hw.c
> > +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> > @@ -75,7 +75,7 @@ static void cdma_start(struct host1x_cdma *cdma)
> > =20
> >  	cdma->last_pos =3D cdma->push_buffer.pos;
> >  	start =3D cdma->push_buffer.dma;
> > -	end =3D start + cdma->push_buffer.size + 4;
> > +	end =3D cdma->push_buffer.size + 4;
> > =20
> >  	host1x_ch_writel(ch, HOST1X_CHANNEL_DMACTRL_DMASTOP,
> >  			 HOST1X_CHANNEL_DMACTRL);
> > @@ -126,7 +126,7 @@ static void cdma_timeout_restart(struct host1x_cdma=
 *cdma, u32 getptr)
> >  			 HOST1X_CHANNEL_DMACTRL);
> > =20
> >  	start =3D cdma->push_buffer.dma;
> > -	end =3D start + cdma->push_buffer.size + 4;
> > +	end =3D cdma->push_buffer.size + 4;
> > =20
> >  	/* set base, end pointer (all of memory) */
> >  	host1x_ch_writel(ch, lower_32_bits(start), HOST1X_CHANNEL_DMASTART);
> >=20
>=20
> This seems fixes problem that was added by a previous patch in this
> series, "gpu: host1x: Support 40-bit addressing". What about to just
> squash the patches?=20

This actually fixes a bug that's always been there. This just happens to
touch the same lines as an earlier patch as a result of some refactoring
that the earlier patch did.

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxUTIsACgkQ3SOs138+
s6Gs2xAAjkx7w1L1G2KUx3qdS3eXKBnMvZ+E04VGwQiXm9v7HAiGd3SQyykJSGTm
HQjnBNRkoHE5AMOsVv2BilEgje7EzQvqJHyc8cuv/WfUeuLLGuIQBtqqAu+7xRby
fAyX2jac/PFiY7y43oXBLl6VmPpu4/M6wZfc/SxNI6skkS47RcLf5L8CVSM4lLye
PDvTWmX9tCAsNBYThAGWL7q3pKodpVie3hDLUyOKerFICwpyxNtKZ2TsXJ40kspM
B3F+sV/Mc1YqhfTdrdfnuus0PgzaN48Vs3x7cnf75DSkok1Pbf4MuAK8N2YCACXM
DZ348jgpdlK+cRghDI6/2CFxW7oiZFlS+vPqmeP411MYMOPq9jdNMwRPobTufl1V
0OThyBbExso5go57N4VbDu0dQzTSNEzr5FRF5c63a0YYgiKfciAo+jgOKr7eJPpg
jxKCAQrCI1DSQ8R89OGSIk04HXXIKrTAeg2HnSYD18WeX/tqQZQcPsJ5Lb34SyIv
ccSmXDuVWQ1M38jsCPFtvcbZkYBn2obdPAH9e3nOH3f7bJljDlrOp/LcojcvWrbF
taCf4xf+cKAYncWC4CQoZyuC3WwWL//9E2GgvUIJj8TJ1EB6ea36ceHRd9Z7OpdZ
p1B5LUVrQ9fUuUeL5OdMrdui3C22gpsQLz8CSRBDFLjSEyDEiPA=
=pE1H
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

--===============0270998858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0270998858==--
