From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/8] dt-bindings: phy: tegra-xusb: Add charger-detect
 property
Date: Tue, 28 Apr 2020 11:57:10 +0200
Message-ID: <20200428095710.GA3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-2-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-2-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:01PM +0530, Nagarjuna Kristam wrote:
> Add nvidia,charger-detect boolean property for Tegra210 and Tegra186
> platforms. This property is used to inform driver to perform charger
> detection on corresponding USB 2 port.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> V2:
>  - Added Acked-by updates to commit message.
> ---
>  Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | =
4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6n/fQACgkQ3SOs138+
s6Ey8A//Q4uTEuupOy7QQCFXs3b3I4r6jVXyp7QjRGgXc7yHsnbR90IS0fm3eHsx
6sHKZXqZAyGiL31/zqCktQfQZW9pwwizNKwikn0ly6pmr77zDf9zrbL4YyY90Twb
ZNI1kpx88LcjO8rwhS/PAZF7CNzrzMx3uLabAf2oT+d95Lz1OLO+afwd82VTA23t
QDIzlQNFB3UO3yLQbQ+1WIkFsWXEqXgWiHb8F07r1vnI/FqOKhc92dEMskfVxMCH
+pHYOHxF9zqwK1zQcP9BaPtuCDP1jN63ys+xEz7KgpivxK2/Vgsv3Iak7ZdLn3Qd
myldUUl500MjfanZYuIWi0g9QFk0RLuwLuQbak/SiUW53Yh1si5YQixsIk9foiq7
kpW2HVme+iTC7zTYVppxS2sEpKVbFMKZl1eCfTF4nJvQ+nKqVEgh/7xROyN2U5TB
H8eygj9x9sc5/I1Y9GNFF+JSiLsNr/A+IAYnIO/ZRDesMo3QivT8hZLZOfMPx8et
Pkwnf5oWpUvM0X5w71jtc02jewYF4fk4tukanyQR/vdOBZU/XdUqsM+QEjEbN+s6
esBuOAIE5vntKRHJznGOX4eb4nAAI57q1HLg9WQWZssCkPxZKdLrcBePAgFvLmmj
9Rko7SMP3B5YV9s3dW1j9iQUhKzclnr/ceL+3A8Dm9KzinJ11A8=
=n51I
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
