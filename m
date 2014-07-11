From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] Add Tegra132 support for the cbootimage utility
Date: Fri, 11 Jul 2014 11:23:17 -0700
Message-ID: <20140711182317.GA1730@nvidia.com>
References: <1404987710-26375-1-git-send-email-vinceh@nvidia.com>
 <1404987710-26375-2-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404987710-26375-2-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 10, 2014 at 03:21:49AM -0700, Vince Hsu wrote:
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Need more of a patch description here.  At least mention the new
command line arguments, and what Tegra132 is.


> @@ -327,6 +328,27 @@ do {                                                        \
>         SET_BL_FIELD(to,   field,  v);                      \
>  } while (0);
> 
> +#define SET_MTS_FIELD(instance, field, value)   \
> +do {                                            \
> +       g_soc_config->set_mts_info(context,         \
> +               instance,                                                               \
> +               token_mts_info_##field,                 \
> +               value);                                                         \
> +} while (0);
> +
> +#define GET_MTS_FIELD(instance, field, ptr)            \
> +g_soc_config->get_mts_info(context,                            \
> +               instance,                                                               \
> +               token_mts_info_##field,                                 \
> +               ptr);
> +
> +#define COPY_MTS_FIELD(from, to, field)         \
> +do {                                            \
> +       u_int32_t v;                                \
> +       GET_MTS_FIELD(from, field, &v);             \
> +       SET_MTS_FIELD(to,   field,  v);             \
> +} while (0);
> +

The trailing backslashes appear to have a lot of variable whitespace
here, can you clean these up?


>         return err;
>  }
> 
> +/*
> + * Load the mts image then update it with the information from config file.
> + * In the interest of expediency, all mts's allocated from bottom to top start
> + * at page 0 of a block, and all mts's allocated from top to bottom end at
> + * the end of a block.
> + *
> + * @param context              The main context pointer
> + * @return 0 for success
> + */
> +static int
> +write_mts_image(build_image_context *context)
> +{

This whole function is almost identical to write_bootloaders(), can
you pull out the common parts of these functions and parameterize the
differences to avoid the code duplication?

> @@ -87,6 +89,8 @@ static parse_item parse_simple_items[] =
>         { "BootLoader=",    token_bootloader,           parse_bootloader },
>         { "Redundancy=",    token_redundancy,           parse_value_u32 },
>         { "Bctcopy=",       token_bct_copy,             parse_value_u32 },
> +       { "MtsPreboot=",    token_mts_preboot,          parse_mts_image},
> +       { "Mts=",           token_mts,                          parse_mts_image},

Whitespace looks off here


>         { "Version=",       token_version,              parse_value_u32 },
>         { "PreBctPadBlocks=", token_pre_bct_pad_blocks, parse_value_u32 },
>         { NULL, 0, NULL } /* Must be last */
> @@ -105,6 +109,8 @@ static parse_item s_top_level_items[] = {
>         { "BootLoader=",    token_bootloader,           parse_bootloader },
>         { "Redundancy=",    token_redundancy,           parse_value_u32 },
>         { "Bctcopy=",       token_bct_copy,             parse_value_u32 },
> +       { "MtsPreboot=",    token_mts_preboot,          parse_mts_image},
> +       { "Mts=",           token_mts,                          parse_mts_image},

and here


> +cbootimage_soc_config tegra132_config = {
> +       .init_bad_block_table           = t132_init_bad_block_table,
> +       .set_dev_param                          = t132_set_dev_param,
> +       .get_dev_param                          = t132_get_dev_param,
> +       .set_sdram_param                        = t132_set_sdram_param,
> +       .get_sdram_param                        = t132_get_sdram_param,
> +       .setbl_param                            = t132_setbl_param,
> +       .getbl_param                            = t132_getbl_param,
> +       .set_value                                      = t132_bct_set_value,
> +       .get_value                                      = t132_bct_get_value,
> +       .set_data                                       = t132_bct_set_data,
> +       .get_bct_size                           = t132_get_bct_size,
> +       .set_mts_info                           = t132_set_mts_info,
> +       .get_mts_info                           = t132_get_mts_info,
> +       .token_supported                        = t132_bct_token_supported,
> +
> +       .devtype_table                          = s_devtype_table_t132,
> +       .sdmmc_data_width_table         = s_sdmmc_data_width_table_t132,
> +       .spi_clock_source_table         = s_spi_clock_source_table_t132,
> +       .nvboot_memory_type_table       = s_nvboot_memory_type_table_t132,
> +       .sdram_field_table                      = s_sdram_field_table_t132,
> +       .nand_table                                     = 0,
> +       .sdmmc_table                            = s_sdmmc_table_t132,
> +       .spiflash_table                         = s_spiflash_table_t132,
> +       .device_type_table                      = s_device_type_table_t132,
> +};
> +

Since Tegra132 and Tegra124 are so similar, can we reuse the Tegra124
version of any of these to avoid the duplication?


-Allen

nvpublic
