From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: don't depend on OF
Date: Fri, 15 Feb 2013 23:26:35 +0100
Message-ID: <20130215222635.GA14328@avionic-0098.mockup.avionic-design.de>
References: <1360965179-14815-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360965179-14815-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 02:52:59PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ARCH_TEGRA always enabled OF, so there's no need for any driver to
> depend on it.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRHrYbAAoJEN0jrNd/PrOhCQkP/jxLBXZ+AeRpp7GDEyXvGlp2
n84M2QQUpnvzKPXE+YQAc0MjQXxabGiaoolGaGl4GeY7TpgYXq0+q+MQTn82rtzr
2MRCfCOA6jqKGWrXDXHZGXumKcP/SNiql6pP11sLh0p2XKZT0ZogWf9xz9YVg964
dMIfOCZlQBPxRXZV/7A79ZS5EPG8CN/Ixa20eFs1vktI+fIa/o/+rm0fRabDWkc0
PN2cZcfiRw73FpK18dCl4kSwcSiK9jdJnebT9TA/HEXX2n9DFS1kj+WLhu4d+ZxU
jeWEybR9jZLYhqZq7aTcwWfKAm2CbMMzvqDtvDxie/pwT6yvz/vxJi+5GywG6HJ4
AzSIK2LOL34VllNqAHEHTNTVv1ezIBz65O8JGo5V5525AJa/dmIaBDI7FnW1LtDB
+w0Rd+B4Iwwru94Ce1JE5BMesE5tf0+5Fw2eSqq3uNNqxjVeBuSOsUO6LcdW9JLy
oyf6Xsy14cmXSVmoFitDajYCGXHPfwk+2W6DQoFtlZT6zP0gg4dFbEPRa8XMrMta
r/bWWpRVY7xy4RL8n23XA0703OQo1B8NCOSHPlCjPBcyGY0LH16D0on1ehD6NoIT
qQAcln5U+tWzGQaElKufV9mxoskWt0Wq7Nt9p33KQcW9YIaA3361HwpLxv1WU6Ht
TOu4wdLgRDXOt1EIUoT8
=kltT
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
