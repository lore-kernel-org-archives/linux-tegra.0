From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Fri, 28 Dec 2012 14:47:23 +0800
Message-ID: <50DD407B.3030306@gmail.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355407268-32381-2-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Arto_Meril=E4inen?= <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I just skimmed the code of libdrm while I'm trying to understand the
host1x driver. So below is what I found.

Mark
On 12/13/2012 10:01 PM, Arto Meril=E4inen wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch introduces tegra stream library. The library is used for
> buffer management, command stream construction and work
> synchronization.
>=20
[...]
> +
> +/*
> + * tegra_fence_is_valid(fence)
> + *
> + * Check validity of a fence. We just check that the fence range
> + * is valid w.r.t. host1x hardware.
> + */
> +
> +int tegra_fence_is_valid(const struct tegra_fence *fence)
> +{
> +    int valid =3D fence ? 1 : 0;
> +    valid =3D valid && fence->id !=3D (uint32_t) -1;
> +    valid =3D valid && fence->id < 32;

Hardcode here. Assume always has 32 syncpts.
Change to a micro wrapped with tegra version ifdef will be better.

> +    return valid;
> +}
> +
[...]
> +
> +    /* Add fences */
> +    if (num_fences) {
> +
> +        tegra_stream_push(stream,
> +            nvhost_opcode_setclass(NV_HOST1X_CLASS_ID,
> +            host1x_uclass_wait_syncpt_r(), num_fences));
> +
> +        for (; num_fences; num_fences--, fence++) {
> +            assert(tegra_fence_is_valid(fence));

This is useless. We already add "1 + num_fences" to num_words above. So
move this "assert" before adding "1 + num_fences" to num_words makes se=
nse.

> +
> +            tegra_stream_push(stream, nvhost_class_host_wait_syncpt(=
fence->id,
> +                fence->value));
> +        }
> +    }
> +
> +    if (class_id)
> +        tegra_stream_push(stream, nvhost_opcode_setclass(class_id, 0=
, 0));
> +
> +    return 0;
> +}
> +
[...]
> +
> +#endif /* TEGRA_DRMIF_H */
>=20
