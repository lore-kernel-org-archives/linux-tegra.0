From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
Date: Tue, 1 Oct 2019 16:44:12 +0200
Message-ID: <20191001144412.GD3566931@ulmo>
References: <20190829105647.15212-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4955773607390259841=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190829105647.15212-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4955773607390259841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 12:56:47PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> For some reason this was never hooked up. Do it now so that over-current
> interrupts can be logged.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to for-5.5/arm64/dt.

Thierry

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZjsACgkQ3SOs138+
s6GzQhAAp0Igvn8aJSUBOB43OB1hXJ2JhVy10rLBK6HaiyTJhXvIKJ1m3yNjE/e1
J0ab0gMK7TR9zIwqCLUHFgofCssyMmdMaS4d4/IUzMfRE0B/g35e8ysP8wWDgKRs
wS5ISsi2sRbAyVeLCL4tQxcreF9kFEcIvQhHGWmOeAfYZ+vljDtawGnKynJ7IChz
CSkPoSesMQMmp3xcbZY8/F/X928XyluXv4pNuka/os1b2rUeCcjMevOVZxHDLqT7
UZh5W2HSDmweUHDbupQDmjM8mSwou+2yFVziYz0s2FLu6GNGczER1NbXrL6S6GC6
ivUl+1Uk9pyP25oZpVVeE1LZZPddDS9qBKY9amJp7+/DILo38KR1JXGwH5e7pG5l
E8l4vJ+Jwunx4PRHEXABe9MtBCPLUESKEUcBCVwKv2o5HYFYayJXVMVmHskcRosW
9a7CkGM4djMO5ac0ovjziimiun5WS4LYffOv8xzzLV+jUM5tdbM0F7X/NkQHvOmT
w4weKWLgJTebHdDi0lq7N1UxGVwZLUS9uh1MXVDPPToMimiwzrZxCMM4XfCOm0df
sBTJOyeoo/qgOjJNlZmmH+z0oKN7gU1/VyWip9LkxbKzpIyFFkXyg8xDrA9B3SYU
YMt+CRvU0SPTCr27sc8RccL1ZYjW25hU14fUssRwYjaWP422Ngg=
=Fg8B
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--


--===============4955773607390259841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4955773607390259841==--
