From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: fix compatible string for Tegra132 fuse
 node
Date: Wed, 4 May 2016 15:32:34 +0800
Message-ID: <5729A592.30407@nvidia.com>
References: <1462266577-951-1-git-send-email-wni@nvidia.com> <20160503152111.GC19539@ulmo.ba.sec> <57295DAF.1050800@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57295DAF.1050800-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B405=E6=9C=8804=E6=97=A5 10:25, Wei Ni wrote:
>=20
>=20
> On 2016=E5=B9=B405=E6=9C=8803=E6=97=A5 23:21, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, May 03, 2016 at 05:09:37PM +0800, Wei Ni wrote:
>>> This patch changes the compatible of Tegra132 fuse node
>>> to "nvidia,tegra132-efuse", instead of "nvidia,tegra1124-efuse".
>>> Because the CONFIG_ARCH_TEGRA_124_SOC will not be enabled for
>>> Tegra132, the fuse driver can't find the corresponding node.
>>
>> Okay, that's not really a good reason to modify the DTS. What we sho=
uld
>> do instead is make sure that the OF table contains the entry on Tegr=
a132
>> builds. Unless the IP block really is different and Tegra124 and
>> Tegra132 aren't compatible in this regard after all.
>>
>> In the latter case the commit message should reflect the real reason=
=2E

Hi Thierry,
I read the Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.t=
xt, it
has description:
- compatible : For Tegra20, must contain "nvidia,tegra20-efuse".  For T=
egra30,
  must contain "nvidia,tegra30-efuse".  For Tegra114, must contain
  "nvidia,tegra114-efuse".  For Tegra124, must contain "nvidia,tegra124=
-efuse".
  Otherwise, must contain "nvidia,<chip>-efuse", plus one of the above,=
 where
  <chip> is tegra132.

It mean for Tegra132, it should use "nvidia,tegra132-efuse".

So if we don't change the DTS file, I need to fix the OF table in the d=
river and
update the of-bindings, is it right?


Wei.

>=20
> Hi Thierry,
>=20
> The fuse driver fuse-tegra.c has following OF table:
> #ifdef CONFIG_ARCH_TEGRA_132_SOC
>         { .compatible =3D "nvidia,tegra132-efuse", .data =3D &tegra12=
4_fuse_soc },
> #endif
> #ifdef CONFIG_ARCH_TEGRA_124_SOC
>         { .compatible =3D "nvidia,tegra124-efuse", .data =3D &tegra12=
4_fuse_soc },
> #endif
>=20
> It defined "nvidia,tegra124-efuse" under CONFIG_ARCH_TEGRA_124_SOC, s=
o if we
> don't change the DTS file, we should change it as:
> -#ifdef CONFIG_ARCH_TEGRA_132_SOC
> -       { .compatible =3D "nvidia,tegra132-efuse", .data =3D &tegra12=
4_fuse_soc },
> -#endif
> -#ifdef CONFIG_ARCH_TEGRA_124_SOC
> +#if defined CONFIG_ARCH_TEGRA_124_SOC || defined CONFIG_ARCH_TEGRA_1=
32_SOC
>         { .compatible =3D "nvidia,tegra124-efuse", .data =3D &tegra12=
4_fuse_soc },
>  #endif
>  #ifdef CONFIG_ARCH_TEGRA_114_SOC
>=20
> I will send it out.
>=20
>>
>> Thierry
>>
>> * Unknown Key
>> * 0x7F3EB3A1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
