From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: make pinctrl_register() return proper error code
Date: Tue, 9 Jun 2015 10:00:45 +0200
Message-ID: <20150609080041.GB28198@ulmo>
References: <1433822476-26531-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6865195001731083367=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1433822476-26531-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
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
Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Varka Bhadram <varkabhadram@gmail>
List-Id: linux-tegra@vger.kernel.org


--===============6865195001731083367==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2015 at 01:01:16PM +0900, Masahiro Yamada wrote:
[...]
>  drivers/pinctrl/pinctrl-tegra-xusb.c          |  4 ++--
>  drivers/pinctrl/pinctrl-tegra.c               |  4 ++--

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVdp0pAAoJEN0jrNd/PrOhlqUQALlwj9nDH++aHIG3k7pspP+U
Sj1qbDlS72QtIMZm3xQznCq305wYNPpo5oWmgKKbTpbUhswdjNSplYZbFQOcWIgU
OmzycvK2LHjA3OPO9OzfjG5xoqqR0Xr3htZ7SvWrNsL718YVNzycLok4GU7qcP8o
Z90sVCLPPmeO41S797hiqv3diF2PKGXIS/MLYmqWjq5ieVqEKSZwIhaW3O4mNXK7
Taeha8gH9LHZcXX4CCDUR8qSfjfs2y3yYdeeoPi/gmZmMMTHTy/fiveJH95Xj9hW
b2e4uLpBaSbKzIU+IrqAEAwoDWVZjs9KFOqxvdmE8I8Fo/U5jFcLhLV42yWlYOOo
DKC8rq83pKzXivOOe5ZWarN1ZdXCmszzk4feFifsfT34xVg+R5jRbsGiqwJt7M1i
DS8Nmyg4H6/cjn5cgmXAD7MxRv4PGCCWT0vm0kYssimMeLkTrxAp+V87XJtSMDka
UQwI1xrqvQ/WccLYyrKIyJuok5jFmgNYtFMpUOl+q4MnqAmqXeC2EHsY0yKira+W
I4geBX1NFS8ncIkYXhu15o43sVLmI/8ZOGBHGb9p5+xZ/sHPBT+EzDv0NOlREZ+w
D95OptISHDAz5qeD4XuHRJLbmmJgNQJT8+ZKxwFkfhGg7iuvyjlwunYI3FWj9wQ6
5oKP5vv55lVqXKd+HNDW
=Tr6Y
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--


--===============6865195001731083367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6865195001731083367==--
