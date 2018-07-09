From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Skip IOMMU initialization if firewall is
 enabled
Date: Mon, 9 Jul 2018 10:32:41 +0200
Message-ID: <20180709083241.GB13963@ulmo>
References: <20180519010710.11693-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714316277=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180519010710.11693-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0714316277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 04:07:10AM +0300, Dmitry Osipenko wrote:
> Host1x's CDMA can't access the command buffers if IOMMU and Host1x
> firewall are enabled in the kernels config because firewall doesn't map
> the copied buffer into IOVA space. Fix this by skipping IOMMU
> initialization if firewall is enabled as firewall merges sparse cmdbufs
> into a single contiguous buffer and hence IOMMU isn't needed in this case.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/dev.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied to drm/tegra/fixes, thanks.

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDHakACgkQ3SOs138+
s6FwVhAAjre/WY/Ok/bDtwsnpcIu2To5xzRs8sTVaEYyecBce+YXqdiPDBoLSwd9
OkIXKJCmGkk7gTNxndGi4yTlG1F6BpvLvc3YFAtKLnJTR/DsZyXvLvxl91TO17fN
HSdfr0uU7eouwlj6btk3TNXDUeePFSByoCMdnrvjGM53w4LzVPovnt7/qha3Lxzq
yNevta4oPpA6Jw86lICIgVrgEfvM1Z5V7ea/r2MB03TbUt9IuyZD2PRYYBaBOSFk
H4ABykLhpkXEfmGCKCgFco21ckPxP5FvHzzp0VDAVIoNDpPN1eYYrMGtDN9zBQ1z
TVPzT70PPbKGeh/Pa3Z2RnxY318RkVwD17AdmlVocEKJnLkC/wa/pA5q6COW202F
P+G4nxqhFuAaolobxpgemTdVrQTvxspVmFGqBtSBBj05iFv17syuTYfsKsK0Cuzl
J8fnhWyE6T++0nfFL2eZLvZKbb6SconzvdHDAnjrIjAbB+yN12YJzkrZ0aDU9bRN
abxy1PmF8kJA9prwgSG3b31b5cvb0GkABNBmFzNUs75KNVyWQgkVgA2U/ADcitWA
EcOz4XB6zgGPsbcI3Bw5gN8p/oah2/n+0hlu3diC7ZdcMfDF+wshMcQ9YBlwScgR
KFULIFDBgKunGQgSCONDBPC/G8g2FAt4R0GYW5aAgygdkhKESPk=
=bDX6
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

--===============0714316277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0714316277==--
