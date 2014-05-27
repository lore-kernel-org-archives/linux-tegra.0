From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] nvc0: use SM35 ISA with GK20A
Date: Tue, 27 May 2014 11:49:24 -0400
Message-ID: <CAKb7Uvg65NzSSQKxs2ovUEr7aUeX3mm__dov8qve_3epaqG6Fg@mail.gmail.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
	<1401174182-2182-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401174182-2182-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 27, 2014 at 3:03 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> GK20A is mostly compatible with GK104, but uses the SM35 ISA. Use
> the GK110 path when this chip is detected.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h      |  2 +-
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp |  2 +-
>  .../drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp       | 15 ++++++++++-----
>  3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> index bbb89d97932e..f829aac0bcc2 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> @@ -91,7 +91,7 @@ struct nv50_ir_prog_symbol
>  #define NVISA_GF100_CHIPSET_C0 0xc0
>  #define NVISA_GF100_CHIPSET_D0 0xd0
>  #define NVISA_GK104_CHIPSET    0xe0
> -#define NVISA_GK110_CHIPSET    0xf0
> +#define NVISA_GK20A_CHIPSET    0xea
>  #define NVISA_GM107_CHIPSET    0x110
>
>  struct nv50_ir_prog_info
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
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> index 064e7a2c63f9..963b6e47ddfc 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> @@ -49,9 +49,12 @@ TargetNVC0::getBuiltinCode(const uint32_t **code, uint32_t *size) const
>  {
>     switch (chipset & ~0xf) {
>     case 0xe0:
> -      *code = (const uint32_t *)&gk104_builtin_code[0];
> -      *size = sizeof(gk104_builtin_code);
> -      break;
> +      if (chipset < NVISA_GK20A_CHIPSET) {
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
> +      if (chipset < NVISA_GK20A_CHIPSET)
> +         return gk104_builtin_offsets[builtin];
> +      /* fall-through for GK20A */
>     case 0xf0:
>     case 0x100:
>        return gk110_builtin_offsets[builtin];
> @@ -235,7 +240,7 @@ TargetNVC0::getFileSize(DataFile file) const
>  {
>     switch (file) {
>     case FILE_NULL:          return 0;
> -   case FILE_GPR:           return (chipset >= NVISA_GK110_CHIPSET) ? 255 : 63;
> +   case FILE_GPR:           return (chipset >= NVISA_GK20A_CHIPSET) ? 255 : 63;
>     case FILE_PREDICATE:     return 7;
>     case FILE_FLAGS:         return 1;
>     case FILE_ADDRESS:       return 0;
> --
> 1.9.3
>
