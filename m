From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] drm/tegra: sor: Fix hang on tegra124 due to
 NULL clk_out
Date: Wed, 20 Dec 2017 19:15:20 +0100
Message-ID: <20171220181520.GA9687@ulmo>
References: <cover.1513768618.git.guillaume.tucker@collabora.com>
 <0f776b7500ee0e74b316b9803803b309779d2ff7.1513768618.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2088142099=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <0f776b7500ee0e74b316b9803803b309779d2ff7.1513768618.git.guillaume.tucker@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: David Airlie <airlied@linux.ie>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============2088142099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 11:32:23AM +0000, Guillaume Tucker wrote:
> When neither HDMI nor DP is supported such as on the tegra124, the
> sor->clk_out is not initialised and remains NULL.  In this case, the
> parent clock can't be assigned to it so revert to the previous
> behaviour of assigning it to the main sor->clk instead.
>=20
> This fixes a kernel hang on tegra124 and should also affect tegra210
> as they both don't support HDMI and DP.  Tested on tegra124 only.
>=20
> Fixes: e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> CC: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

How about just the below instead? It's one more line than your patch,
but it will automatically handle all occurrences of clk_out properly.

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f6313c4d612e..4be9edf9c6fe 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3047,6 +3047,8 @@ static int tegra_sor_probe(struct platform_device *pd=
ev)
                                name, err);
                        goto remove;
                }
+       } else {
+               sor->clk_out =3D sor->clk;
        }
=20
        sor->clk_parent =3D devm_clk_get(&pdev->dev, "parent");
--- >8 ---

That said, I suspect the SOR might be compatible from a clock point of
view with later versions and perhaps we just didn't implement clocks
correctly back in the Tegra124 timeframe.

Maybe Peter knows.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6qLUACgkQ3SOs138+
s6ES+RAAgRqyO8N0gGsuUhtbFl3dco69vQXdclHi14rogMv8ykELpSDMsMR3bprD
d8vlmu/bV/CmY7Mht+AwVC55vTPXoPpkweMUwJZ4Vgr/Whdu3XMYQ4O8EBdvA8jB
mBwAQXjiPibKZUuTHmEUJexARPDkJB6PE4eu9LljmL1fCKvFMFZpFCI1Ow/+kpfM
5j9AnbRjns/Oldqntd9ttTgVKdlrCsXdFnRwcW3PvvbHWiqqZJR7taoMJUwycD3d
MsMYF6k7/XAiVYskRl7rA0OkGlxpSHyX1HmscKdpzj97COTugvDw2v+Y2H4tg3h5
rCpesXoT09sjEXoEtlbUW4XmdLlg/zmQnkfkHaiIsgN3DVi7T/FZCMmCeRg23lm0
urz7+SJXP0tUUyEbjFF8PFHrfWPGPI3Av6plaTQcW9mpQj+PHYK6oa3ORU5+/7S1
9JiVTjL+KtCNx7Sq8Gi12ejal3Qx4zUsTwXKRwLkmAlt9Elk1iT5Hgw9XclZfqRC
dwADlML3fSsmesCiLJr/TgXOD5Zzy1nub0C/Xg+WITuJKqJ2VZ4E2FgHEmUrsp1T
EXV8PKl1+Qli8SDVt6KnYSFay4G4TIf5yeiJTOaYtWskCQhLHk7BongLFS0lUKX6
DCf9s46c5QjO6KzHfXT51ouYmygpnoTjagZTlpjiJsSraFOjQZc=
=aG50
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

--===============2088142099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2088142099==--
