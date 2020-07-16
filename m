From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v6 2/3] arm64: tegra: Add t194 ccplex
 compatible and bpmp property
Date: Thu, 16 Jul 2020 14:37:15 +0200
Message-ID: <20200716123715.GA535268@ulmo>
References: <1594819885-31016-1-git-send-email-sumitg@nvidia.com>
 <1594819885-31016-3-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1594819885-31016-3-git-send-email-sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2020 at 07:01:24PM +0530, Sumit Gupta wrote:
> On Tegra194, data on valid operating points for the CPUs needs to be
> queried from BPMP. In T194, there is no node representing CPU complex.
> So, add compatible string to the 'cpus' node instead of using dummy
> node to bind cpufreq driver. Also, add reference to the BPMP instance
> for the CPU complex.
>=20
> Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Looks like the DT bindings are now done so I've applied this for v5.9.

Viresh, are you going to pick up the other patches, or do you want me
to pick them up and send you a pull request?

Thanks,
Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QSfkACgkQ3SOs138+
s6EbDxAAhqiTFGVj3wdEIaQIT0jcQR9+VZIbrzcT3Wob4TFu4TTP+vNGQj6zvqw4
sluL9jQ8fg43Hl/rR3wsxJvp9IqSqWOeIcI4cqJ3a4ztIC2jyqCL8NDbr+oaL3K+
k+teHfVv/VqluTyqJC0N9Q+0yOifuZ3BXSmbW8Mfh0VH5U0RX/sYW0Clzsa1dK1t
LJscfWRHRyoEIi+GVL+B8at7xK/vxP/LjIncFufO//LwAxqb0qm4HUmdixHLESDd
tnIlUoe2Cta8Q9ksQXsas+6hW7ykoDTlnfLVvJ3WmjBrJPhTMRwub7tglL0smQs6
KkP2d1cRmCeRIbJkcttClKo/poBGRsANiZrz97ljGujPNjJl8heCcYqdQhwvOvie
dw2Yv7vATSMxTv0qSBFUqFi7wfevvhRys3Z3qc4Br6o0VsxtR/dmaiOhxcd2xMSk
7e4bi9/g8NlljezdeI5L8VDj3Phjzho2ItYNFBP3CCLTZwHGVkVsymT+wvoN9TgF
rU24SGbvTP6/Op8gZ+Gm/CeVuYfYaZ7mRhp0XZVy1Gqw4wnpiVp7/+cM5EIXQTFt
1tN5+WpPlmH9WDLVWfo2lBKekw5om++Xpvpo7WlVe7FB66XcNtyecmXYWa8SzQQi
OCFGLe9PDlxfWR6Vi4TIZ5yhLkiaszewktYYt+fo6v8tUaRyxw0=
=UgfU
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
