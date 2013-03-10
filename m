From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/5] rtc: tegra: Use struct dev_pm_ops for power
 management
Date: Sun, 10 Mar 2013 23:32:20 +0100
Message-ID: <20130310223220.GB4743@avionic-0098.mockup.avionic-design.de>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
 <1362852588-13362-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852588-13362-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:39:46PM +0530, Laxman Dewangan wrote:
[...]
> @@ -431,6 +429,10 @@ static int tegra_rtc_resume(struct platform_device *=
pdev)
>  }
>  #endif
> =20
> +static const struct dev_pm_ops tegra_rtc_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_rtc_suspend, tegra_rtc_resume)
> +};

SIMPLE_DEV_PM_OPS?

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQn0AAoJEN0jrNd/PrOh86wP/jtkPl3VpeO25340mAEGjTER
07bEB94whlRYs0qFvXGlNljnZPesZp73pKVlTbA9V83iRtcFq0Oelp7e1LFlTpBs
ZG8tuKBJU5wIm4r0ajUYw/JAsbqOnRnalvFBqCNHvZ8NyMy2V9Aq9UWhVNI6Z5Nl
5BqpGRokUNzCfCCLPhLbrl/nxtF1Cp5eETmSiDVMM5YS2oiuKIQtspm9cUmr7AXY
nBhxju1YudaQ9Mz1Fx5/n3/C919y+agmZacnc4XuqQHjp+JHivmMTbEdCb/NOGqW
yK/JtSiI+gKRe1nHX5QNVtnDfleHRRTJcM46UICN5SS0j2cz2B0cYQkpG9MyIv85
NmD9io0veBQvlo7tr8olxO0qzUma62iCEkvVlsB6Rfb6rF0ZDGuNY4PvhrSCR1RZ
87dR9oyK9eqwai0OVLqRcCgtYFvVdMUXuirDm69J1rAenmlj1sZozxkXQKZBLdT7
yxIYNgvKRazDjG3yCxAnyhJoyGL0LNqCOuOlACfknpV+v71Db0OAAzVJ08/TBa6w
VF6wao1JM7GrpeWunkhuPF8IzWWEN5j14a+mrPtLJo0D9h/x1Yevr6RknIEPfM6l
N8gFG6fyk6QpxCcVuIt42vxREYF+Rd34DLvG9dKM3AoXUxsP7I6Fo0xmiYP655IY
iYBP+UD6T88daX68JN8g
=QuVI
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
