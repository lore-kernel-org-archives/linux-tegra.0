From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 9/9] clk: tegra210: Initialize PLL_D2 to a sane rate
Date: Wed, 13 Jan 2016 15:03:09 +0100
Message-ID: <20160113140309.GB15782@ulmo>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
 <1452278714-10751-10-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452278714-10751-10-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 01:45:14PM -0500, Rhyland Klein wrote:
> Initialize PLL_D2 to a sane rate at the start of the day.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 1 +
>  1 file changed, 1 insertion(+)

There are a lot of assumptions in this commit message. I'm asking myself
why does it need to be initialized to any rate at all? Isn't it up to
the user driver to set the PLL to whatever it knows to be a sane rate?
Why is 594 MHz a sane rate?

A good commit message should answer those questions.

Thierry

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWllkdAAoJEN0jrNd/PrOhCfUP/jGCR7vcSSvoMaIqs5IW4AxO
b2FaAzx3ZbUEg1M0WLpaSKIkupucZz4Z2XuTt/+HEIz5IyUvQ3o1bB57OkgXcYUA
8j/U+RKzAMgc+ns9v/vnrfeg7bwRhdTlXbRkDu7YmguMrxSGC7UMVreC+RfcmniX
lRtsHvdHsPdrpp86IH4113l9bd71+d+qMLoJ6fD3UZ5UVYvCuSLGshQQv88rXupX
oLCS7g8fVYzZintwsr62W1EBScVJjMRC4RJ6ScD7SYhiZTPLVaAkSB7FN+Rtv+oe
+HHQhlHVMabRjJQ18Ek8KiVMVo5/U9JHxkZ/O99/O28VPqPLZHZdgp2EAfvak09v
jKDip86VUXC9AMTfT1krUGWaHQMuEVCpbHrfXlQxu+WgkAXDITnHVecflioWmpgt
XVW5c+ZbGlUaiUj/Esc8X/u7J1a+YPTYZmR79v125jsiq2MQlsDzFtcZH1l3KhjV
hCWNZQDi6D9A35ZTMkCzG0HUIL1P7gEFgReIDcmzQkOvpzwjOtZifuUfDlE9vJmm
eOeCqp1jqv1IheVNeiRZIfRfkDtV7u59prQUrNE9tWuz7WQcl/pWaXTbRvNXoGch
HW6w/dwC8oyxzW5tj4g+9SVWy6h5oelmbaYRa+TBcFLcKqEq/Rm7j+WkjzvPyRPr
IFUj9+QypSKvbMMQ7k8j
=qQzv
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
