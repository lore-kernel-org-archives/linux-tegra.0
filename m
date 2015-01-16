From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 05/11] drm/panel: add support for Samsung LTN140AT29
 panel
Date: Fri, 16 Jan 2015 13:23:30 +0100
Message-ID: <20150116122328.GF4885@ulmo.nvidia.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
 <1421338359-27467-6-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0122523319=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1421338359-27467-6-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org


--===============0122523319==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 05:12:17PM +0100, Tomeu Vizoso wrote:
> From: St=C3=A9phane Marchesin <marcheu@chromium.org>
>=20
> This panel is used by the Nyan Blaze board and supported by the simple-pa=
nel
> driver.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

This is missing device tree binding documentation. Also since the patch
is from St=C3=A9phane you should probably add a Signed-off-by line from him.

Thierry

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuQLAAAoJEN0jrNd/PrOhkKcP/0jBgzKukKSCYc7TZ5YzrBtR
9MFosWBdzVY27Ng02LojgIChzQRld24/ZUe/eRRQm0V5fSxV/gogrpK84X9cBLaj
4JdSQHJ6b1lrucHaaaDq3vR/WPDdbBm6Aupjs8XEWHa0rEyGUrZictiKG36v9jaS
Kc/V8Rn1aylfUHrh42Y1qgpJTbuPYCZOIgQjFSxUolpM9sOx+5W4scRHYMUrlTBI
Xngy5/uOMHIGoiTiA2BAHSzRaQnkaUyqhPTJRNVoo+JGPo/K4aNjMY4r87HsDR/o
oXlVVdOKM1uO57u/7H3/q3xfe88lpLNJcksGaWqiJzymXiR6Ru7LLuoL+SDELz8X
jw8m3ZawtPh75fJFDoCWc8LBBTa480GWZopx0zLBjdLba71BBN2BhDHyUdpEZRHM
OtsDaOlQXRT7UuGRoMQxoALI7OWcg/vPN2wrhhiRwrGN0v3hMerRhly1gzQIjhJK
G0XMPQKynSONCOCOmrquYByQRi92LeympmAx4yTEyUq0s3f9ZsBaJMtP+fJFgOW/
BUUtnS/2PNmBijZ2xatz0/vtVNisWHQKMu8WWtbq3haAbudEjJOe5q0pBOQZNRpv
857EbU1ThcaFQ8ttjBf5hu+aSc+1UxmUGLVxHGZjUm/BHmi1YNRnEC1o8MTGfsAE
ndPlAIjePnEHN+pNPARi
=ZbRH
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--

--===============0122523319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0122523319==--
