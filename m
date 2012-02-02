From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: dt: tegra: Enable device tree audio codec on
 PAZ00 board.
Date: Thu, 2 Feb 2012 22:29:35 +0000
Message-ID: <20120202222925.GB3112@opensource.wolfsonmicro.com>
References: <1328213618-15870-1-git-send-email-leon@leon.nu>
 <1328213618-15870-2-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328213618-15870-2-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2012 at 10:13:35PM +0200, Leon Romanovsky wrote:
> This patch adds initial device tree support of ALC5632 sound codec and
> machine driver for PAZ00 board. The implementation is based on the WM8903 codec.

Reviewed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

No direct dependencies on any ASoC stuff so I guess it's easier if this
goes via the Tegra tree.  I'm happy to apply it to ASoC if people would
prefer that.

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPKw4kAAoJEBus8iNuMP3dpsEP/ic0l2xUXGCaRC2sylShO8Ug
i/KpcQ0yixF1/5J85K8oHNh745nWR3OMxYjiHmBjEaJtPnRLYt+F4iH23bF0zHO/
6t++MUtViXhafWlPDSByEtTUneU0taKz5NLJjS9uh41qHJbHGz+wJeshyV/yOnUH
4PhJhZcKqNis9XQVjqRd3XMdu/tkEukUgfsoei0c9oal09cswegH3PjN9FEk+Ktj
pXcK5jjEflhK1XOwUOwq7bpLABgivTAXd/TevZdnb1xkpwGHuaFGALVFxnbP/FyR
R0UtE0G2wj6URJObVQhi4XRDTwUL/L3WIYA1sEZAIsMqNiFa7ua7yH+0g1u2yuy5
y/5xxSgdhteK8l/flFAmNTztsbjQ7SPLiVVVuA0f8FuHVPIDMnM8iFzba/4msx0u
e7PiWYkf6y+S3RKTZd4xGpyPjcja6U29PLjsIvhNOSUGdKmeW9o4Vhlqp04NK+/C
6yN1uXRKQ3FLOpEDeK3p+/qyAJCX/VlkcQAq+XsU/aQ7khQidO3mI1XZRuFjDW26
IZmCkM7BeVPQqK9fwA3mzs2tU5HtZY5hWlmlAIf41XCYEHp6N78biiwG3zLA85NH
AqrE4fcLLVvWQUGSVcHHLnW1Aat16NYGl8X8z44TMLjNSwKfRdOu675mBtDD4477
ZgyMiXVevXjeoBIQMHcQ
=ql9w
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
