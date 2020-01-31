From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: phy: tegra: make the code simple by devm_platform_ioremap_resource()
Date: Fri, 31 Jan 2020 15:21:01 +0200
Message-ID: <874kwb92yq.fsf@kernel.org>
References: <20200127135841.17935-1-zhengdejin5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200127135841.17935-1-zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dejin Zheng <zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Dejin Zheng <zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> make the code simple by use devm_platform_ioremap_resource() function
> to replace platform_get_resource() and devm_ioremap().
>
> Signed-off-by: Dejin Zheng <zhengdejin5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

checking file drivers/usb/phy/phy-tegra-usb.c
Hunk #1 FAILED at 944.
Hunk #2 FAILED at 1054.
Hunk #3 FAILED at 1071.
3 out of 3 hunks FAILED

unfortunately, it doesn't apply.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40Kb0ACgkQzL64meEa
mQa9oQ/+N8kMk+Fj6NEXBzM8cCr8usoHA7A7qOqstj20pLW3cE8yLXehv64Brcio
QromC9dq9QqoFEQmvK7VkZYAMu1rZJxZysZNTO/bNpVdA3mF1/yqKME92oJCg7X5
5+ouEFUQNGvyxNuWX5Uo7SycH66xZm8/vyPwK3dUNA64Ex/gqoDMJomSpdhI7PiS
VUf3Fr+BQNAJ9w5Z+IEsQj/E6dQpVITr17gt426oEQmmhzHmwHX5viypc+jys/Dn
y02SCHcx8IbzBBzNnH31pFFQ+COtT7NbBjTbkeqs0BOGaLSWpFROp/80Jnn2/4l/
d2QNytRnoy9uXpqo3zLAVAJcFakqofr6mgqoEO6FOJ3o+B0uXI3u2JHUkenAUM+v
V/ugEbWI3LHtCCGsWIZHmNtfPxQtxKXyGVEOq7KSvHFMjoVExln+kI7TOrtgZdkM
fpqvqr8uUZiDxSXr2ScF0vtlkZW5ECZPZ74aRl+iznIyYaPHy0ma6vxm12K40HGV
Xdwhdn9D/VD2Zn01rBusPn1wJoZI/E6nhEpe/6XqEEWCghusWP3UpI6u+pTGNyrY
T80o58Ay/F4vGx57vpX5iLWvwFItX3IIfVVbyoV1SlQeLLMChVfX5GaQIzLNJVdi
6naoDsgqekY33RmJ3YqRupMO/gJUu9diGEYyiow1WabipwFNz68=
=doA5
-----END PGP SIGNATURE-----
--=-=-=--
