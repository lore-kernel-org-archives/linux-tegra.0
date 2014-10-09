From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: venice2: add GK20A GPU DT node
Date: Thu, 9 Oct 2014 09:43:27 +0200
Message-ID: <20141009074326.GA1010@ulmo>
References: <1412835112-7209-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412835112-7209-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2014 at 03:11:51PM +0900, Alexandre Courbot wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add the device-tree node for the GK20A GPU and leave it disabled by
> default. It is the responsability of the bootloader to enable it if the
> VPR registers have been programmed such as the GPU can operate.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-venice2.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Are you going to send the corresponding patches for U-Boot to update
the status property if it's initialized VPR?

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNjyeAAoJEN0jrNd/PrOhwJwQAKPejMRAURt41D8ikCOk/YkU
9kB6r3GtKcLTJLsutbnkscdQmLFO6e00wg7oDicUMsnDkv8YKeFKrdgPCAvEjVXk
F7e2UZ5T+P9sLdVqhJyU7IHgU8/KvCESwApxIlRVrh4Vm5eN5fcH7o/cFnkvmpnu
NtlVJGG4OOV5S04DTgtmQlnGZMoXYKetZ9EVDDLefx/x4/wNhHmakHmQZqeN3vvN
qqcBPO2GT49zd2+BmGEhhIkw7vLW0RRKhQyzGVScXDobn/n6teGJKD8Jz9+eDC3i
QWitD7bgRssmb07ms6H0ys3kCAOrYeHtO1B7EUYB/LQrwpQQCG8wjwdqde6YkZ3n
XVJ3TQNiOqPEyeLXSJKGlJ9z3X3jvF+6b9vyyZFsTy01CYmdDqr4QIUzA05vLHSp
FwBZE3N4HElB8GyC+WDX9vJrCaxUhh39XTr/r0yEi5RGRfFlC15ZmKlc9pKVCx8b
e+yT24BeIIT5WUZZ/yxcd7r8oYl3KC/78OlEJfjqw+Y+VnKqy3JcIcQ7WJhuOwhF
+NtOgtQwaOG695saZ2K14WwsJnTWKtSd2CbPNcZpVkBkoHGLQV4R4FEy7N0d+k2S
w5R1qJn9TJ+LLTbGD+cq9L+J8rWRU+BsOQwrVrwFS0EaDgwNCDJF54n/EE9bDgjS
94mPClY7xtG4yrLWZdAa
=xumw
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
