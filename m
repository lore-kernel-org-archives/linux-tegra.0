From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 15:34:50 +0200
Message-ID: <20200716133450.GJ535268@ulmo>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200716090323.13274-1-miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qinglang Miao <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 05:03:23PM +0800, Qinglang Miao wrote:
> From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>=20
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>=20
> Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/debug.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

This doesn't apply. Can you please resend, based on something like
linux-next?

Thanks,
Thierry

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QV3kACgkQ3SOs138+
s6GieRAAjSgN0wLDgrWyzyjLy54sFADuaoAruNpwMPVnPG89QRmsEboAxzzDdZDD
/zlTd/PJVCZVKWbIlLkP7Rna+jyUuhamF/BgQujzjbSYk76Gk1KCuhoZw86z8KGG
Fh23wZ+zX1RP+URwJatUvhZUKKEVaQl8ldHWBQG32bChAJLf2EhOqrIsMA0v0FE7
CQneC38MD9kT3m/LqV2yWyvGAP0Xy8/n0hqLSyZpPBvGLpZ/D4doXZb1Xs1PTQIp
kMi+Ia4RKh4VHRxVTDovG9v/3aBY4jX8SqFqZBUM9CMJynezT4+iZtHSx7xxw7Ir
9a1BO0r/xAMcgq5m4N8RTE5Q07kOCf/Hi4qTP5MQu1E3jYitOUB0AAuyvwFYa074
NBx0kOJmJq/rL03WZ6RM/euMCQCDwh2e9zJfiXu2eLA8R73bW+kClRv4u7RstsKc
rwQn3BjuJWY6Y183D6ZnAN7IRwZL/vxFoWvK5LhfnDTbNtHWGmZMvf3Q6FRk9U1r
jUdSy8Ptc5ozFt2IGWzTePsYp6BCwRMQ0Ja6CpMiw4hMgRJDSHmk5woB8heUY6LK
O8GbqeQ3vkz96MLjtoUxsdsPEz/Ebkh7GQXOzrQ9QyN+/jAgvE5QfGicXK+HbGrO
TcTST7suEXl4F+LubMElfG7k87ZvgRTPYaKNBo3tTOKhaX8K9dM=
=3yVO
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--
