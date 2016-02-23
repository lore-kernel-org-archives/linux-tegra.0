From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Set the DMA mask
Date: Tue, 23 Feb 2016 17:27:59 +0100
Message-ID: <20160223162759.GA13755@ulmo.nvidia.com>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
 <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
 <20160223160440.GE27656@ulmo> <56CC8652.8020208@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0326863348=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56CC8652.8020208@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Terje Bergstrom <tbergstrom@nvidia.com>
Cc: gnurou@gmail.com, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0326863348==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 08:18:26AM -0800, Terje Bergstrom wrote:
>=20
>=20
> On 02/23/2016 08:04 AM, Thierry Reding wrote:
> >* PGP Signed by an unknown key  > > On Tue, Feb 23, 2016 at 03:25:54PM
> >+0900, Alexandre Courbot wrote:
> >> The default DMA mask covers a 32 bits address range, but tegradrm >> c=
an
> address more than that. Set the DMA mask to the actual >> addressable ran=
ge
> to avoid the use of unneeded bounce buffers. >> >> Signed-off-by: Alexand=
re
> Courbot <acourbot@nvidia.com> --- Thierry, >> I am not absolutely sure
> whether the size is correct and applies to >> all Tegra generations - ple=
ase
> let me know if this needs to be >> reworked. >> >>
> drivers/gpu/drm/tegra/drm.c | 1 + 1 file changed, 1 insertion(+) > > This
> kind of depends on whether or not the device is behind an IOMMU. > If it =
is,
> then the IOMMU DMA MASK would apply, which can be derived > from the numb=
er
> of address bits that the IOMMU can handle. The SMMU > supports 32 address
> bits on Tegra30 and Tegra114, 34 address bits on > more recent generation=
s.
> > > I think for now it's safer to leave the DMA mask at the default (32 >
> bit) to avoid the need to distinguish between IOMMU and non-IOMMU > devic=
es.
>=20
> The GPUs after Tegra114 can choose per access whether they're using IOMMU
> or not. The interface is 34 bits wide, so the physical addresses can be 34
> bits.
> IOMMU addresses are limited by Tegra SMMU to 32-bit for gk20a. gm20b can =
use
> 34-bit if SMMU is configured to combine four ASIDs together.

This particular patch sets up the DMA mask for the display engines. But
yes, most of the above holds true for that case as well, except that as
far as I know there is no mechanism to have the display engines choose
per access, whether or not to use the SMMU.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzIiNAAoJEN0jrNd/PrOhcE8P/1DOtxsFS1voxBknzB2wco6g
GQtBTYN/ecypZ6cFozh4vKx/UiQ7c3RRFXn4NXft0boQnugyb4ps3naaaKYYf6lV
WUR2XyiCEYbbdE05lOAynJs439JWi7t1DNXNHrCUllX4i76naVecnvQzLu5fYt0f
SHJSauHHdsBHTsPjNcms8uzikVYhbMECEZzq7Rh1UjSr9oJM+TlDcd2Cbv0vEqO3
pp2EEUftXc1uX1cHBDeoj9JD6MdB4IbbYd0vcR/fLdGu8VGM8YP3w2bAyINKGSgD
QO6d3LglhhvLarw5II3jmNiNlJSqXOcjyhVbH7PKWfs7b3Oy2jn+T6UT93owuoVA
1nrX1JSa2kifYXQtn3bb/Vb/ZMVzZ1y6c/9ZI0LKuojh/c/ujDzrVwq39CEfGPz+
mx+y2WayPj86E32HybjliTeedgLAo11DtQPsGS8ZHwzmxZHdedVrGRHLOx84G/uw
OJDC84PKNZ5xEfuTnOZ0tTGu45wb/l7Xqz6MAk207RsKjsrQUC1R2HzvAXMpk3Ss
BRaANW3+fBn3zgK682iSKkHLIg2yUIikXDJeRUpcbOk58Ts7J2wPXTfCM48oLmZv
tRRsoxU0nwSuFYIRfj+y/+KfSVy+Tgxw3twqpfKZB+Q+9XKNbjv3VT3u0+neSkE/
gV7v8JNa2r5GnQ4b+gRm
=4ajP
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

--===============0326863348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0326863348==--
