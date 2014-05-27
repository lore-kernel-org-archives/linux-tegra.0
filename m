From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 2/2] nvc0: use SM35 ISA with GK20A
Date: Tue, 27 May 2014 01:26:34 -0400
Message-ID: <CAKb7Uvi_-DrhjFPS+D=P71bF+V5K21xKYK_+FhxmvX-Kyyf89Q@mail.gmail.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
	<1401166783-24086-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401166783-24086-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 27, 2014 at 12:59 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> GK20A is mostly compatible with GK104, but uses the SM35 ISA. Use
> the GK110 path when this chip is detected.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h        |  1 +
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp   |  2 +-
>  src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp | 13 +++++++++----
>  3 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> index bbb89d97932e..aab857ee7e4f 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> @@ -91,6 +91,7 @@ struct nv50_ir_prog_symbol
>  #define NVISA_GF100_CHIPSET_C0 0xc0
>  #define NVISA_GF100_CHIPSET_D0 0xd0
>  #define NVISA_GK104_CHIPSET    0xe0
> +#define NVISA_GK20A_CHIPSET    0xea
>  #define NVISA_GK110_CHIPSET    0xf0
>  #define NVISA_GM107_CHIPSET    0x110
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> index b1f76cf80432..f69e6a183e19 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> @@ -3027,7 +3027,7 @@ TargetNVC0::createCodeEmitterNVC0(Program::Type type)
>  CodeEmitter *
>  TargetNVC0::getCodeEmitter(Program::Type type)
>  {
> -   if (chipset >= NVISA_GK110_CHIPSET)
> +   if (chipset >= NVISA_GK20A_CHIPSET)
>        return createCodeEmitterGK110(type);
>     return createCodeEmitterNVC0(type);
>  }

As mentioned on IRC, you also need to update TargetNVC0::getFileSize
to return 255 GPRs, since that value is presumably ISA-specific. You
could, at that point, get rid of the GK110_CHIPSET define. Eventually
all that stuff needs to be nuked and replaced with an 'isa' property.
But you don't have to do that.

> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> index 064e7a2c63f9..8212bfd9555e 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> @@ -49,9 +49,12 @@ TargetNVC0::getBuiltinCode(const uint32_t **code, uint32_t *size) const
>  {
>     switch (chipset & ~0xf) {
>     case 0xe0:
> -      *code = (const uint32_t *)&gk104_builtin_code[0];
> -      *size = sizeof(gk104_builtin_code);
> -      break;
> +      if (chipset != NVISA_GK20A_CHIPSET) {

You change the code emitter if chipset >= GK20A. Might as well be
consistent here and below.

> +         *code = (const uint32_t *)&gk104_builtin_code[0];
> +         *size = sizeof(gk104_builtin_code);
> +         break;
> +      }
> +      /* fall-through for GK20A */
>     case 0xf0:
>     case 0x100:
>        *code = (const uint32_t *)&gk110_builtin_code[0];
> @@ -71,7 +74,9 @@ TargetNVC0::getBuiltinOffset(int builtin) const
>
>     switch (chipset & ~0xf) {
>     case 0xe0:
> -      return gk104_builtin_offsets[builtin];
> +      if (chipset != NVISA_GK20A_CHIPSET)
> +         return gk104_builtin_offsets[builtin];
> +      /* fall-through for GK20A */
>     case 0xf0:
>     case 0x100:
>        return gk110_builtin_offsets[builtin];
> --
> 1.9.3
>
