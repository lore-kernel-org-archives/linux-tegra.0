From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] Add Tegra132 support for the cbootimage utility
Date: Tue, 15 Jul 2014 13:40:51 +0800
Message-ID: <53C4BEE3.7080604@nvidia.com>
References: <1404987710-26375-1-git-send-email-vinceh@nvidia.com> <1404987710-26375-2-git-send-email-vinceh@nvidia.com> <20140711182317.GA1730@nvidia.com> <53C44402.8020803@nvidia.com> <20140714223659.GA13652@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140714223659.GA13652-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/15/2014 06:36 AM, Allen Martin wrote:
> On Mon, Jul 14, 2014 at 01:56:34PM -0700, Vince Hsu wrote:
>> Hi,
>>
>> On 07/12/2014 02:23 AM, Allen Martin wrote:
>>>>> +cbootimage_soc_config tegra132_config = {
>>>>> +       .init_bad_block_table           = t132_init_bad_block_table,
>>>>> +       .set_dev_param                          = t132_set_dev_param,
>>>>> +       .get_dev_param                          = t132_get_dev_param,
>>>>> +       .set_sdram_param                        = t132_set_sdram_param,
>>>>> +       .get_sdram_param                        = t132_get_sdram_param,
>>>>> +       .setbl_param                            = t132_setbl_param,
>>>>> +       .getbl_param                            = t132_getbl_param,
>>>>> +       .set_value                                      = t132_bct_set_value,
>>>>> +       .get_value                                      = t132_bct_get_value,
>>>>> +       .set_data                                       = t132_bct_set_data,
>>>>> +       .get_bct_size                           = t132_get_bct_size,
>>>>> +       .set_mts_info                           = t132_set_mts_info,
>>>>> +       .get_mts_info                           = t132_get_mts_info,
>>>>> +       .token_supported                        = t132_bct_token_supported,
>>>>> +
>>>>> +       .devtype_table                          = s_devtype_table_t132,
>>>>> +       .sdmmc_data_width_table         = s_sdmmc_data_width_table_t132,
>>>>> +       .spi_clock_source_table         = s_spi_clock_source_table_t132,
>>>>> +       .nvboot_memory_type_table       = s_nvboot_memory_type_table_t132,
>>>>> +       .sdram_field_table                      = s_sdram_field_table_t132,
>>>>> +       .nand_table                                     = 0,
>>>>> +       .sdmmc_table                            = s_sdmmc_table_t132,
>>>>> +       .spiflash_table                         = s_spiflash_table_t132,
>>>>> +       .device_type_table                      = s_device_type_table_t132,
>>>>> +};
>>>>> +
>>> Since Tegra132 and Tegra124 are so similar, can we reuse the Tegra124
>>> version of any of these to avoid the duplication?
>> Some of these functions like setbl_param refer to the macros/definitions
>> in nvboot_bct_txx.h. So maybe they look similar, actually they don't. If
>> we want to generalize these functions, we might have to refactor
>> nvboot_bct_txx.h and some more stuff. Can we leave it as is?
> I can see how this could turn into a can of worms.  I just seems like
> a shame to have to duplicate so much code for a new SoC that's ~90% the
> same as the previous SoC.  Can the token tables be reused, or do they
> have the same issue?
The token table is something like supported feature list. Every SoC from 
t20 to t132 has only slight differences from others. But keeping a 
simple table for each SoC might be reasonable here?

Thanks,
Vince
