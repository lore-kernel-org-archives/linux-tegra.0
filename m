From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] drm/nouveau: platform devices and GK20A
	probing
Date: Mon, 19 May 2014 12:06:46 +0200
Message-ID: <20140519100645.GF7138@ulmo>
References: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
 <1400493868.8467.26.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0963050599=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400493868.8467.26.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0963050599==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2014 at 12:04:28PM +0200, Lucas Stach wrote:
> Am Montag, den 19.05.2014, 18:24 +0900 schrieb Alexandre Courbot:
> > This patch series is the final (?) step towards the initial support of =
GK20A,
> > allowing it to be probed and used (currently at a very slow speed, and =
for
> > offscreen rendering only) on the Jetson TK1 and Venice 2 boards.
> >=20
> This seem to still need external firmware. Any chance to get this into
> linux-firmware?

I think that should be possible. There didn't seem to be any objections
last time I asked but let me clarify again and get back to you.

Thierry

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTede1AAoJEN0jrNd/PrOhZHMP/2SupWw3fsvr7q51PvDX9WX2
RwekmBXhTAVq/2v6nttx7t4EMslxrOpJh5fISF1krky/YA6Oh2NjHlt9uddd/dsc
pvV53DkTGJb0ZxLj/DI2/Gq5yDoa0JZ2IkEilkPukfwLL+LmDiDqpkdseZ624TGk
tej5dywxUQ5q6fC0Dau9KRQMUVo4rNlr3hix8Z0W58CEMt17WQxx6UCU1cklejdT
tCnxbNOQPArKnB707E2J6Y9kB7zZ0xza2lUNNikg2o1akO81h5aYaDxcySGEGTl8
Jsn4V2pzlfL52G8D94gzS10u5ju32Z1tz0iGlQPXhVAMufOSdPPr4orqgl6o5Dxt
bKlValK77GC/e5lTAyQZYjCpSdI/5DMdTahfgBzN021M2ZVtTUrPVNyhOwcQO+Yb
01lfahvO/PPDZtAxHyYjj9a42T5PncjbFeyqIwCKjrlLH9yHb3GE/ORa3vbYzuGw
xle9Ru4Labs9Cgn+w5SYkRTpFDiM0LxEoHllo3qvugZ+CD4lOFE+AldNc/h7GjgI
06fd5pSzS+v7P8h1tuiLrOIX5rKX9nx0wG2kqNA1WtDhqIZN1tssJYXPQEJfGfHI
ereDo+hSkArtuesKIOzMpZ4HzP6nG8zbvhroRyVyStHePCxwueX4AjrypM9HF54L
+sqylWoLi+ysu9lxUsfC
=Lkvd
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--

--===============0963050599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0963050599==--
