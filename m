From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/core: Remove drm_dev_unref() and it's uses
Date: Thu, 26 Apr 2018 14:06:57 +0200
Message-ID: <20180426120657.GB11985@ulmo>
References: <20180426102819.6985-1-vthakkar1994@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1995132105=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180426102819.6985-1-vthakkar1994@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, alexandre.belloni@bootlin.com, airlied@linux.ie, kraxel@redhat.com, nouveau@lists.freedesktop.org, marex@denx.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, linux@armlinux.org.uk, krzk@kernel.org, jonathanh@nvidia.com, z.liuxinliang@hisilicon.com, maxime.ripard@bootlin.com, kong.kongxinwei@hisilicon.com, kgene@kernel.org, bskeggs@redhat.com, linux-arm-msm@vger.kernel.org, airlied@redhat.com, virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org, puck.chen@hisilicon.com, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, brodkin@synopsys.com, boris.brezillon@bootlin.com, zourongrong@gmail.com, rodrigo.vivi@intel.com, matthias.bgg@gmail.com, wens@csie.org, vincent.abriou@st.com, linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org, laurent.pin
List-Id: linux-tegra@vger.kernel.org


--===============1995132105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 03:58:19PM +0530, Vaishali Thakkar wrote:
> It's been a while since we introduced drm_dev{get/put} functions
> to replace reference/unreference in drm subsystem for the
> consistency purpose. So, with this patch, let's just replace
> all current use cases of drm_dev_unref() with drm_dev_put and remove
> the function itself.
>=20
> Coccinelle was used for mass-patching.
>=20
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>

Yes, please.

Acked-by: Thierry Reding <treding@nvidia.com>

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrhwOAACgkQ3SOs138+
s6EGqg/+JmUt+aqBk15/OXUKzwedusn2nurTmzPRqGoZEK54C7+31kYWTZJrfyn8
0YB/LnpBFLPsv0n2h5NAxTqdrk3XwnZnsh74EFMWWLT0xj05ieLMg/TfbQmwM8p/
keZqR/h1C6MpS5KXblD2tM7Gx7Nsp35RdhchLobvvXR2yUDxZO4afSKCehyeVnuv
57JIN5zMp+bQkuBMwjIEcCIqOxjQv5ISLzifNFdmHWLIJ3RO6W17MyrFYJzzQEqe
x2PLjnaaSashIqtezCM8y3K04QvclybTHT9uQ1SB7YmEj+R4U/ywLLWkDr346hNL
uVsx2P4Rgnj9y0hqaf5f37Z0peThUWU0vcNRcHCfNPrzJhZa1EQDXkeLItACiSNO
+qJFncLsqNYuV/Pq5gcPLaQe3C88Uh//dL3HKN3b/3OfmXmQbVVH7XKRWng2U0Fm
oTxpOG1l/GSEwkr/gjpuebN2VkxmITYLHjKc2QYZtD2j49gB0CPEsK/pPC5vmdso
/OmBBSlkvG6wqmCwW7FfXD+m+rtV5s3pFTL99/37lKE6jLqteXbZB1eXWjCktDSG
SA8grVw8+LiTmKyNAhg+B85bgGm7TVuym+DqkzUaMjkdQlISjMGCX6jMHtjila0+
skm7Hqo/qwKR+I3JOa0TMtFKmKero2xpRcSk8EFI2fnUy1UBwoo=
=nKx9
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

--===============1995132105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1995132105==--
