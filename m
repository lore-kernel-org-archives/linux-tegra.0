From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 1/2] Add support for Tegra210
Date: Wed, 18 Mar 2015 12:02:48 -0600
Message-ID: <5509BDC8.6020706@wwwdotorg.org>
References: <1426546275-6214-1-git-send-email-jimmzhang@nvidia.com> <1426546275-6214-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426546275-6214-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/16/2015 04:51 PM, Jimmy Zhang wrote:
> use option -t 210 or -s tegra210 to specify t210.

"Use" should be capitalized. A slightly more general and verbose 
description might be appropriate.

> diff --git a/src/bct_dump.c b/src/bct_dump.c

>   	{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
>   	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
>   	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
> +	{ token_secure_debug_control, "DebugCtrl      = ", format_u32 },
>   	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },

I don't think the = lines up there. The open " is shifted 1 character 
relative to the other lines, but the closing quote by 2 characters.

> diff --git a/src/cbootimage.c b/src/cbootimage.c

> @@ -71,11 +71,11 @@ usage(void)
>   	printf("    -gbct                 Generate the new bct file.\n");
>   	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
>   	printf("    -t|--tegra NN         Select target device. Must be one of:\n");
> -	printf("                          20, 30, 114, 124, 132.\n");
> +	printf("                          20, 30, 114, 124, 132, 210.\n");

Since the option is deprecated, I think we should only support --soc for 
Tegra210. I won't mention this in any other places that would need to be 
updated to fix that.

> diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c

I did not review the bulk of this file in any detail at all; I simply 
assume that it is structured the same way as the equivalent files for 
previous SoCs, and likewise interacts with the rest of the code in the 
exact same way. The same is actually true for pretty much any part of 
the patch that's just a large list of defines, structures, or 
lookup/mapping code.

> +int if_bct_is_t210_get_soc_config(build_image_context *context,
> +	cbootimage_soc_config **soc_config)
> +{
> +	nvboot_config_table *bct = (nvboot_config_table *) context->bct;

There shouldn't be a space after the ) in the cast.

> diff --git a/src/t210/nvboot_config.h b/src/t210/nvboot_config.h

> +/**
> + * Memory range constants.
> + * The range is defined as [Start, End)
> + */
> +/*
> + * Note: The following symbolic definitions are consistent with both AP15
> + * and AP20.  However, they rely upon constants from project.h, the
> + * inclusion of which in the SW tree is undesirable.  Therefore, explicit
> + * addresses are used, and these are specific to individual chips or chip
> + * families.  The constants here are for T35.
> + *    #define NVBOOT_BL_IRAM_START  (NV_ADDRESS_MAP_IRAM_A_BASE  + 0xE000)
> + *    #define NVBOOT_BL_IRAM_END    (NV_ADDRESS_MAP_IRAM_D_LIMIT + 1)
> + *    #define NVBOOT_BL_SDRAM_START (NV_ADDRESS_MAP_EMEM_BASE)
> + *
> + * As  T35 bootrom needs 8K more IRAM size, NVBOOT_BL_IRAM_START has changed to,
> + *    #define NVBOOT_BL_IRAM_START  (NV_ADDRESS_MAP_IRAM_A_BASE  + 0xE000)
> + */

I suspect we should remove the references to T35.

> +/**
> + * Defines the starting physical address of IRAM
> + */
> +#define NVBOOT_BL_IRAM_START  (0x40000000 + 0x10000)

That isn't the physical start address of IRAM; it's 0x10000 bytes beyond 
that. We should fix the comment or the value.

> +/**
> + * Defines the ending physical address of IRAM
> + */
> +#define NVBOOT_BL_IRAM_END    (0x4003ffff + 1)

Why not just 0x40040000?

> +/**
> + * Defines the IROM address where the factory secure provisioning keys start.
> + */
> +#define NVBOOT_FACTORY_SECURE_PROVISIONING_KEYS_START (NV_ADDRESS_MAP_IROM_BASE + NV_ADDRESS_MAP_IROM_SIZE - 0x1000)

Are all these constants actually required? There's no equivalent in 
previous header files in tegrarcm. Can you whittle this header down so 
it only contains what's actually required and/or the equivalent of 
pre-existing headers for other SoCs?

I wonder if this patch/header-file was IP reviewed before posting?
