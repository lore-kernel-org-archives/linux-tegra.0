From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
Date: Tue, 19 Nov 2019 07:31:39 +0100
Message-ID: <20191119063139.GF2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191118200247.3567-13-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:30PM +0300, Dmitry Osipenko wrote:
[...]
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..593954324259 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -141,6 +141,11 @@ struct tegra_mc_reset_ops {
>  			    const struct tegra_mc_reset *rst);
>  };
> =20
> +struct tegra_mc_icc_node {
> +	const char *name;
> +	unsigned int id;
> +};
> +
>  struct tegra_mc_soc {
>  	const struct tegra_mc_client *clients;
>  	unsigned int num_clients;
> @@ -160,6 +165,9 @@ struct tegra_mc_soc {
>  	const struct tegra_mc_reset_ops *reset_ops;
>  	const struct tegra_mc_reset *resets;
>  	unsigned int num_resets;
> +
> +	const struct tegra_mc_icc_node *icc_nodes;
> +	unsigned int num_icc_nodes;
>  };
> =20
>  struct tegra_mc {
> @@ -184,4 +192,22 @@ struct tegra_mc {
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long=
 rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> =20
> +#ifdef CONFIG_INTERCONNECT_TEGRA
> +int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +int tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				     unsigned int dram_data_bus_width_bytes);
> +#else
> +static inline int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +{
> +	return 0;
> +}
> +
> +static inline int
> +tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				 unsigned int dram_data_bus_width_bytes)
> +{
> +	return 0;
> +}
> +#endif

Is there really any reason why we should make this support optional? It
seems to me like we would always want this enabled once it's tested and
known to work.

Thierry

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TjEsACgkQ3SOs138+
s6FtYA/9ES4ueQlrGUANiXpnoYLp+gOvUdGR2Om0k7LXGB1sAbdfCnAXEGv8Nh06
zMwoIQoF7yOagtouSroSK5930bLbrxrxffMXiYMzEZxzH3KmuRbxwxsN+egCLHUH
3aAfDm67bO2QmGnQTltM/nyC22xfvjCr7Eb7Lr2uhoPv+j8Gs8nwev15gw3F/TuE
fD2uAof3D/hlCwQ1eGVJf+PAQQ5c3Et6ivWXj1dLxw/bf2Fho7pxZt+B0XqvLlVR
eoPTflPJAPdqZfYTrkijN+KmHu1S/pzYT/LcTdQij3sTSn0t/rLDA4n15P78KMPd
XsKE8mUVQgJH+891UzGQLfAbmoX3UWAoQSiVMrEJ+6hLlHHEa620QWtIni46gZDP
6bryzTb4s/zkPeNrMbb2+X8iibLCWfI9i+g+aHfaqdSdmyuLj3fwFdcOqLTL1fxr
Pux+quH9+5M+brNCzkB0xBzvPqG4DSQ/Nu9WKHgf4RXARCrhqgauBYAlrK1UpnhQ
PYjrooXnMTFULsmm7r9ysaOQfsTgy7v6UDWlgKAwZApfvVv2F86bJ/jvmN0IOtpA
yiL2iBc27c24lKyzn5s4vLoy1tKEVkVO6D0e2rwP1M+cH7kU8IOXysAFGgNGcc1I
3fyAlnc9BV2mA6kqh1y6UGctADv/EA+uooJ0l4RkhClzWAlry5E=
=BBMX
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
