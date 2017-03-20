From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] soc/tegra: Move Tegra flowctrl driver
Date: Mon, 20 Mar 2017 15:14:34 +0100
Message-ID: <20170320141434.GC28203@ulmo.ba.sec>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489584715-23138-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 01:31:53PM +0000, Jon Hunter wrote:
[...]
> +static int __init tegra_flowctrl_init(void)
> +{
> +	/* hardcoded fallback if device tree node is missing */
> +	unsigned long base =3D 0x60007000;
> +	unsigned long size =3D SZ_4K;
> +	struct device_node *np;
> +
> +	if (!soc_is_tegra())
> +		return 0;
> +
> +	np =3D of_find_matching_node(NULL, matches);
> +	if (np) {
> +		struct resource res;
> +
> +		if (of_address_to_resource(np, 0, &res) =3D=3D 0) {
> +			size =3D resource_size(&res);
> +			base =3D res.start;
> +		}
> +
> +		of_node_put(np);
> +	}
> +
> +	tegra_flowctrl_base =3D ioremap_nocache(base, size);
> +
> +	if (!tegra_flowctrl_base)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +early_initcall(tegra_flowctrl_init);

Do we want to implement a hand-off to a proper driver at some point,
similar to what we have for PMC?

> diff --git a/include/soc/tegra/flowctrl.h b/include/soc/tegra/flowctrl.h
[...]
> +#ifndef __ASSEMBLY__
> +u32 flowctrl_read_cpu_csr(unsigned int cpuid);
> +void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value);
> +void flowctrl_write_cpu_halt(unsigned int cpuid, u32 value);
> +
> +void flowctrl_cpu_suspend_enter(unsigned int cpuid);
> +void flowctrl_cpu_suspend_exit(unsigned int cpuid);
> +#endif

Perhaps we want the same type of dummy functions scheme here for
!SOC_TEGRA_FLOWCTRL that Arnd proposed for !SOC_TEGRA_PMC?


> +
> +#endif
> --=20
> 2.7.4
>=20

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP48oACgkQ3SOs138+
s6EjMw//UjAvA/xaiULMrW77/A0HZpztJb+MUus8BHNMQq0PxO3KVywqa7FcjXlq
Laue5JiluDWHvGZvnA94XImLaWVIZliLTijFHdzAgmru6uj/AQOibkam9In+PIEu
awoCt89aSMHyVgUfs2Bvu9S/U4DM38kqAbELoUrAACQY2FHW9OplMa+MIXIb99Zs
KFGhZfxkN9+dnYYtKFyHCjrTfPOjgeq9nUIl5vjY986o+6ngKKikrjSBdmTmoNnL
pkNcDHKZUEVf6DoSf6Y5C9ZAAlw/FziI+geKJnXzcoUcrDFEv0rQozSiIixL2brC
vFgPRFFiFrKZBy92IEDyd9hl8auKRYaVVG3O/2UsTwZV5wOC9TlJuWnccuRGp+Ta
3/tpuqpTxuKN2s9TaJgVAPcOxr47NU+y6sAx+182b6sdlPsW96gd/46JKmMobwvx
/MjW1Q39MGRi0ajAUkATrEO5BKesVNSHzMfFob8uyrXp14aBWnCkSaz05jLboZgT
L7PnzIU1f6ZHt6ezkDddRBq8VgO2Mfb3QI3SVgrKTKB/Sia6SOpAIZsTDLc4hO3v
Yj0ZajOwso/k4SupabeOvx5kpaPhf1a+0krPpzybOw7x4VhTleRTpkFMTw0TJqhL
WW1rrkYtRzhqk3PqsIvA/US7uAw5brkIfHBOKRL5Y08aG46b7uk=
=HmeW
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
