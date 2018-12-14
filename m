From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 1/4] thermal: tegra: remove unnecessary warnings
Date: Fri, 14 Dec 2018 15:18:55 +0100
Message-ID: <20181214141855.GC23379@ulmo>
References: <1544780993-20744-1-git-send-email-wni@nvidia.com>
 <1544780993-20744-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544780993-20744-2-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 05:49:50PM +0800, Wei Ni wrote:
> Convert warnings to info as not all platforms may
> have all the thresholds and sensors enabled.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwTu88ACgkQ3SOs138+
s6HyeA/9Hbpg/h06eVIY3q7v790VEtaJDqATatMu0O+LJmOoG5E5jKRV9sCtNcs/
BvSchLZF38VKsNwzNCNWBCvRHy6IYwRkgU6Gjdkp86ffkZuETIgmtcbp7ML+IlrN
ezR0C/IXeEtu2kwyk2glUfvZpd7t3DF1knVlnXKl8eJNXOKW6NkGEHNCpsBwK+mh
ERnQs2Fs//Cr6takvlI1CRVkgUiNu3Q+j3IdVL7qabUtWI5vYAZLn5ml4cds71Qe
jnrOzbgSgN+DpTIb+J1C2pbHbHatBwTZmeJNoGr468k/OW7+jOdpLoajJMVdWMTy
QFf2V9/nOivlIXEKPDU0TXr8eZHgw1NGX9DCMuL3/GhqFE2f8ipwlEr8YNWcJNXB
KWKkqvy92aZfE3gX6ggEyQzNq6g+5MjNErsNQzEs1dXHChfwbXMQ1ZUYeJk/HcPs
OwIZYJTsgWr0n8C1QT/N0LftekvXAq+CkJzH6I/ZSPb3m6n2SA/qRGfnG4HILzT4
BASYIhHQaUw1oeVKYQp5spQYfSdFGsw3gupIwSBq/5r5d8SROeReLhAiUPQUzXfQ
70F6YLBgv1pCcV2Jd2ovPvT58TiYL2xbdmO4mN+H2lgOu6wpu2Tiw4xR8ImzATqz
0Kl3y3eIa80hGzl8hgUv5ahem//Emst6fGhE7N/TzM9kd9NPCNY=
=CsGw
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
