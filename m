From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Rename supports_blending to
 has_legacy_blending
Date: Fri, 4 May 2018 14:16:09 +0200
Message-ID: <20180504121609.GT13459@ulmo>
References: <20180504000844.18661-1-digetx@gmail.com>
 <20180504000844.18661-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0527284798=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504000844.18661-4-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0527284798==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jZNlLGxhPb4urluq"
Content-Disposition: inline


--jZNlLGxhPb4urluq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 03:08:44AM +0300, Dmitry Osipenko wrote:
> Older Tegra's support blending. Rename SoC info entry supports_blending
> to has_legacy_blending to eliminate confusion.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 20 ++++++++++----------
>  drivers/gpu/drm/tegra/dc.h |  2 +-
>  2 files changed, 11 insertions(+), 11 deletions(-)

Looks good to me.

Thierry

--jZNlLGxhPb4urluq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsTwgACgkQ3SOs138+
s6HR5A/+JmNuN32atKzA6N6awXY1rRzfZyTL6Cg3NfHiBmboLwv1g6VIJt1fd6Yl
vZwFE8UDfoZWMkCDZokedEBwzzUB2Ojue841FH8NBnwDk6A6IRhiVqBzJk3S0Kp3
VDkInGVkRYT5H/Uxn4VXRA7NHVsPHMEAgxIgnT+1XwMXxqtXB37t4+TmEjV2Ox7N
z5qla4QMFDi9cDAhFSFwp3T9TCe6Puc6vo9ktor33OIjOHmB27rpxfyHlGoWcVg4
SyN1H+ibRqCncGIYJwGQq+SvHLig4pnAoAcmrDhwtaU1proN4wDDJeUD6VnZbT6n
5jBfHDpTXaOdU4G7a3Msduk84DNTFxEli/IanNN8gfL0kwi1BppKBE24c9pAUm9u
GUdgzzXzdZ38qU0cxxQ6o2rts635GY1tNFRmpL7ReqdZQG8i4RM11GhCZ0IhxYpa
cnWM6z1jsGJhyp89xlRLai8Mkk++eFf4K5x9bJ9KaEHuhwJZJEQCP3n1KkvdkBmn
iIY2p447ZxsZm2uXtSlfwRVzo+TaDo/tFt4PFJtdRr3IldjADD3X32f4e1OYrYAR
Mf6PpDrOWZXLcpwMyqqrqYPIfwEBMnoCcvVsTa/f1jZv2J9chg5uJfvSiMXeFFOp
nP/cx0njeUsvh4nnVylghEm8q5Ki+ZbfFOzO0IcI66QedRIbHL4=
=tSAC
-----END PGP SIGNATURE-----

--jZNlLGxhPb4urluq--

--===============0527284798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0527284798==--
