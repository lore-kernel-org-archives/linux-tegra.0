From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2] mfd: tps65910: Add wakeup support
Date: Thu, 26 Jan 2012 10:54:53 +0000
Message-ID: <20120126105452.GB8041@opensource.wolfsonmicro.com>
References: <1327304775-12202-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327304775-12202-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 23, 2012 at 01:16:15PM +0530, Laxman Dewangan wrote:
> Implementing irq_set_wake() so that device should able
> to wakeup the system through different interrupt provided
> by this device like gpios, onkey, rtc etc.

Reviewed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

It will have the side effect of making all interrupts on the PMIC wake
if any of them does but I suspect this is actually going to be fine in
practice.

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPITD2AAoJEBus8iNuMP3d7FUP/iL/NwRCNdLdMYyLds2P7Ipg
7PWeb61jfrbpaclypnLSvDbwMzywCQI7ltVq9GCvY87L/ukw2E18fLXJf+J4AQZD
O3TFqesMJpsi8fxWvppZwIdIjIGgYH4HReEXtOaRo6wHVOadixA94chSNbNXY4rr
rb9RUYKUk7pJszkBhqXRLjtdDqdFLepzU+Do8tKsSPJDZB8kmXyBOlj8uDLPAGlo
B3xkrqxgzcb748aTK6EGz/QVACeI2+hrRM1Fh4Ew9NRqfjZm7S5cOm/eWkDWuSG/
/3KGtljNMpAeVKgkdemVm05r0YRlxQYcH0I3NTMAihZmN4kvPWUmo/qO7szXRoZQ
fSuc+Gv0WKm53DyG6z5UzzPTMDtogaIPNcHArA+l2ilT3AzmZL6DaLASIGXx1Dg5
2M6zwear3Yk0WJaQnqmeshy2zcj0/JDjUQNL86KFJDhNZ4Gl9pm6QzV8iVdyuREX
Ssed5LTQIv6MrTmGZAg9Dt2VI9+XCDHjNe56VeENf71KyPvZuNMelCFxGU8aPlkk
eNkdn2NtnFmBUibP43imLb8/AE57PDpznvf2O8+0mxq5FkEkvPsGTVWe+HTPDsR6
gNE2v6fn7ZfGmxXS6xfayiXn2//IJqacPHAg2N3FggPkJJVvhCyHGqoNqBwW9QdZ
MRdL5E4xHl2c8YQSihpr
=L0QZ
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
