From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,libdrm 2/3] tegra: Add 2d library
Date: Fri, 28 Dec 2012 14:48:59 +0800
Message-ID: <50DD40DB.5090901@gmail.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-3-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355407268-32381-3-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Arto_Meril=E4inen?= <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I just skimmed the code of libdrm while I'm trying to understand the
host1x driver. So below is what I found.

Mark
On 12/13/2012 10:01 PM, Arto Meril=E4inen wrote:
> From: Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch introduces a simple 2d library on top of stream library.
>=20
> Signed-off-by: Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[...]
> +void
> +g2fill_dispatch(const struct tegra_2d_g2fill *hw,
> +                struct tegra_stream *stream)
> +{
> +    ASSERT(hw);
> +    ASSERT(hw->is_valid);
> +    ASSERT(stream);
> +
> +    tegra_stream_push_setclass(stream, NV_GRAPHICS_2D_CLASS_ID);

I think at the end of the "tegra_stream_begin", we already pushed a
setclass opcode into the stream's active buffer.
So why we need another one here?

> +
> +    tegra_stream_push_words(stream,
> +                            &hw->block,
> +                            sizeof(hw->block) / sizeof(uint32_t),
> +                            1,
> +                            tegra_reloc(&hw->block.dstba,
> +                                        hw->dst_handle,
> +                                        hw->dst_offset));
> +}
> +
[...]
> +#endif // TEGRA_2D_H
>=20
