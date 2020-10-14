Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267EFC43467
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 04:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C76CC22227
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 04:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="DQIefb0X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgJNEIt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 00:08:49 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9511 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgJNEIt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 00:08:49 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8679950003>; Tue, 13 Oct 2020 21:07:49 -0700
Received: from [10.19.100.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 04:08:46 +0000
Subject: Re: [PATCH v3 08/15] soc/tegra: pmc: Provide usb sleepwalk register
 map
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-9-jckuo@nvidia.com> <20200928131751.GI3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <89c469f7-60a5-7cc7-253b-a6b98c86e3c9@nvidia.com>
Date:   Wed, 14 Oct 2020 12:08:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928131751.GI3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602648469; bh=CAkNsAlzs/mMmekJo2U2U9pZ4wC3+u0f6W5YdWIzsjk=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=DQIefb0XmATfFRrTSba6wmWIO00Mp93pxH8DUCtbET/MSZQl9NhjRp8GW7X0OVjWY
         R6qT972sjTjy7FdrX53IELURtZ1YEXXvuLHpXtWe5LpEElMPT7YNSBMwvwLdujHc5V
         krCMwZcHgkCAekBTfLzXAvzICGlq8GGjPy5ngw30tLDCwOWa0qB9RsufaP58IUJTuT
         sa1tgtGSL49dPV9M/ptka0Rn5S99j1v1+Z2c9BL5Vh6TaULfZw/JuBQxAlXOegrXHT
         /pBzN2VjbvPKDREF9S6UedWNK0ZthoAcs/AHT69QMc59Z25Z6h8Wrn25dZdDazZo3w
         rrCE2r+h0Hg9Q==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I will amend commit accordingly and submit a new patch.

Thanks for review.
JC

On 9/28/20 9:17 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:34PM +0800, JC Kuo wrote:
>> This commit implements a register map which grants USB (UTMI and HSIC)
>> sleepwalk registers access to USB PHY drivers. The USB sleepwalk logic
>> is in PMC hardware block but USB PHY drivers have the best knowledge
>> of proper programming sequence. This approach prevents using custom
>> pmc APIs.
> 
> I don't think this final sentence is useful. The commit message should
> explain what you're doing, but there's no need to enumerate any other
> inferior solution you didn't choose to implement.
> 
> If you do want to keep it: s/pmc/PMC/.
> 
> While at it, perhaps replace "usb" by "USB" in the subject as well.
> 
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v3:
>>    commit message improvement
>>    drop regmap_reg() usage
>>    rename 'reg' with 'offset'
>>    rename 'val' with 'value'
>>    drop '__force' when invokes devm_regmap_init()
>>    print error code of devm_regmap_init()
>>    move devm_regmap_init() a litter bit earlier
>>    explicitly set '.has_usb_sleepwalk=false'
>>    
>>  drivers/soc/tegra/pmc.c | 95 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index d332e5d9abac..ff24891ce9ca 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -43,6 +43,7 @@
>>  #include <linux/seq_file.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>> +#include <linux/regmap.h>
>>  
>>  #include <soc/tegra/common.h>
>>  #include <soc/tegra/fuse.h>
>> @@ -102,6 +103,9 @@
>>  
>>  #define PMC_PWR_DET_VALUE		0xe4
>>  
>> +#define PMC_USB_DEBOUNCE_DEL		0xec
>> +#define PMC_USB_AO			0xf0
>> +
>>  #define PMC_SCRATCH41			0x140
>>  
>>  #define PMC_WAKE2_MASK			0x160
>> @@ -133,6 +137,13 @@
>>  #define IO_DPD2_STATUS			0x1c4
>>  #define SEL_DPD_TIM			0x1c8
>>  
>> +#define PMC_UTMIP_UHSIC_TRIGGERS	0x1ec
>> +#define PMC_UTMIP_UHSIC_SAVED_STATE	0x1f0
>> +
>> +#define PMC_UTMIP_TERM_PAD_CFG		0x1f8
>> +#define PMC_UTMIP_UHSIC_SLEEP_CFG	0x1fc
>> +#define PMC_UTMIP_UHSIC_FAKE		0x218
>> +
>>  #define PMC_SCRATCH54			0x258
>>  #define  PMC_SCRATCH54_DATA_SHIFT	8
>>  #define  PMC_SCRATCH54_ADDR_SHIFT	0
>> @@ -145,8 +156,18 @@
>>  #define  PMC_SCRATCH55_CHECKSUM_SHIFT	16
>>  #define  PMC_SCRATCH55_I2CSLV1_SHIFT	0
>>  
>> +#define  PMC_UTMIP_UHSIC_LINE_WAKEUP	0x26c
>> +
>> +#define PMC_UTMIP_BIAS_MASTER_CNTRL	0x270
>> +#define PMC_UTMIP_MASTER_CONFIG		0x274
>> +#define PMC_UTMIP_UHSIC2_TRIGGERS	0x27c
>> +#define PMC_UTMIP_MASTER2_CONFIG	0x29c
>> +
>>  #define GPU_RG_CNTRL			0x2d4
>>  
>> +#define PMC_UTMIP_PAD_CFG0		0x4c0
>> +#define PMC_UTMIP_UHSIC_SLEEP_CFG1	0x4d0
>> +#define PMC_UTMIP_SLEEPWALK_P3		0x4e0
>>  /* Tegra186 and later */
>>  #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
>>  #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
>> @@ -334,6 +355,7 @@ struct tegra_pmc_soc {
>>  	const struct pmc_clk_init_data *pmc_clks_data;
>>  	unsigned int num_pmc_clks;
>>  	bool has_blink_output;
>> +	bool has_usb_sleepwalk;
>>  };
>>  
>>  static const char * const tegra186_reset_sources[] = {
>> @@ -2495,6 +2517,68 @@ static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
>>  			 err);
>>  }
>>  
>> +static const struct regmap_range pmc_usb_sleepwalk_ranges[] = {
>> +	regmap_reg_range(PMC_USB_DEBOUNCE_DEL, PMC_USB_AO),
>> +	regmap_reg_range(PMC_UTMIP_UHSIC_TRIGGERS, PMC_UTMIP_UHSIC_SAVED_STATE),
>> +	regmap_reg_range(PMC_UTMIP_TERM_PAD_CFG, PMC_UTMIP_UHSIC_FAKE),
>> +	regmap_reg_range(PMC_UTMIP_UHSIC_LINE_WAKEUP, PMC_UTMIP_UHSIC_LINE_WAKEUP),
>> +	regmap_reg_range(PMC_UTMIP_BIAS_MASTER_CNTRL, PMC_UTMIP_MASTER_CONFIG),
>> +	regmap_reg_range(PMC_UTMIP_UHSIC2_TRIGGERS, PMC_UTMIP_MASTER2_CONFIG),
>> +	regmap_reg_range(PMC_UTMIP_PAD_CFG0, PMC_UTMIP_UHSIC_SLEEP_CFG1),
>> +	regmap_reg_range(PMC_UTMIP_SLEEPWALK_P3, PMC_UTMIP_SLEEPWALK_P3),
>> +};
>> +
>> +static const struct regmap_access_table pmc_usb_sleepwalk_table = {
>> +	.yes_ranges = pmc_usb_sleepwalk_ranges,
>> +	.n_yes_ranges = ARRAY_SIZE(pmc_usb_sleepwalk_ranges),
>> +};
>> +
>> +static int tegra_pmc_regmap_readl(void *context, unsigned int offset, unsigned int *value)
>> +{
>> +	struct tegra_pmc *pmc = context;
>> +
>> +	*value = tegra_pmc_readl(pmc, offset);
>> +	return 0;
>> +}
>> +
>> +static int tegra_pmc_regmap_writel(void *context, unsigned int offset, unsigned int value)
>> +{
>> +	struct tegra_pmc *pmc = context;
>> +
>> +	tegra_pmc_writel(pmc, value, offset);
>> +	return 0;
>> +}
>> +
>> +static const struct regmap_config usb_sleepwalk_regmap_config = {
>> +	.name = "usb_sleepwalk",
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.fast_io = true,
>> +	.rd_table = &pmc_usb_sleepwalk_table,
>> +	.wr_table = &pmc_usb_sleepwalk_table,
>> +	.reg_read = tegra_pmc_regmap_readl,
>> +	.reg_write = tegra_pmc_regmap_writel,
>> +};
>> +
>> +static int tegra_pmc_regmap_init(struct tegra_pmc *pmc)
>> +{
>> +	struct regmap *regmap;
>> +	int err;
>> +
>> +	if (pmc->soc->has_usb_sleepwalk) {
>> +		regmap = devm_regmap_init(pmc->dev, NULL, (void *) pmc,
> 
> I don't think you need that explicit cast there.
> 
> With those minor comments addressed:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
