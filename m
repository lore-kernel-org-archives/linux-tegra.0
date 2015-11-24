From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: use "depends on" for SoC configs instead of "if"
 after prompt
Date: Tue, 24 Nov 2015 16:58:57 +0100
Message-ID: <20151124155857.GB32623@ulmo.nvidia.com>
References: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4441376934294068470=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1447643170-23773-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-
List-Id: linux-tegra@vger.kernel.org


--===============4441376934294068470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2015 at 12:06:10PM +0900, Masahiro Yamada wrote:
[...]
>  arch/arm/mach-tegra/Kconfig      |  3 ++-

There will be a slight conflict between this and a patch in the tegra
tree, but nothing that the ARM SoC maintainers can't handle, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWVIk+AAoJEN0jrNd/PrOhnzIP/1jQCataECT3jzWxP30Hc9ki
wkBigP29aIoVh9DlXbukNYCM2SVPHpBZC+EcTXRNTWPxRRFJULjjxOfLGLOs0V9b
/w+j+rQN6ujkT3cfSMOTshTYNlAgoMt/oN1ss9UfjnBaLxcbVZ/qYxIoS0t7Qyms
+0Fc386BliBz0/tXrFA87yWIV+OR9NNS0AQaeGZ23d/UzRjpJIRs2rNwCeppE/zw
UN/kN8jw0rRpkQnozEmfaYoggA+ln5NMY4+dQi9Zf69gNVvtBu1XfpLAMmsy/I2S
2sYjlOPVZkpUGhI1gTYnfoNuIt0acyfC7pF51NpQYViu2jdZUxpDecZbuEIq8vpU
uWOOR4QIRrHIs6zxlt3+qF4V7tpEXgoOpu1iUQyMEDeEsZTVPjXbxOE0yCCFKZ0+
HPn7j49444OsWIm79bSEHX0emesPq1bDgAxXSm+xF7cJeqLEDgmt8QvlmTVCcbOU
8knTBVrUbC3mqNT7FWYKSPEPvGIsnkH4JQS3ExuLSldDCvON2+SVSUA6BI4dti32
8s55nBBkn0liRK5hU0fmqMzeUH4BZ3sHcA3sBYuXeDOhae0oBGLRe07lwCivBr9o
5nfhR/Ky2vJekAhp4zed1cSLPDdewBooaI79KA3YErvsH2oSVcZuH+uM0CeFBZ2p
H13dNVvpi5mmZ8ppl3Ov
=y6xG
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--


--===============4441376934294068470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4441376934294068470==--
