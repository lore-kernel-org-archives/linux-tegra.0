Return-Path: <SRS0=Wy30=DW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398BC433DF
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B6022224E
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="sMDGP+jK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387713AbgJOII0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:08:26 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18761 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387427AbgJOIIW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Oct 2020 04:08:22 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f88034a0000>; Thu, 15 Oct 2020 01:07:38 -0700
Received: from [10.19.101.17] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 08:08:18 +0000
Subject: Re: [PATCH v3 12/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra186
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-13-jckuo@nvidia.com> <20200928135021.GM3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <dff331bf-9126-5841-cb14-66ac9b3589e9@nvidia.com>
Date:   Thu, 15 Oct 2020 16:08:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928135021.GM3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602749258; bh=u31K7QfghIARj2BxweQ1NufcjldhMy4w8W9I5Fztz54=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=sMDGP+jKlqecFzcxbvcf0WzXWUsMwVOtaG8yoyBsfon1LFnSeoCVkeXc6JU+zqcW6
         8jiInkFElkilaLqgMu4AFvTwwvAg7GrfG7rBiQ8VgCf1n4k26DhoIekZxCkcZx2r/i
         p7pZeGWQVDEFVOAV6XgsMJzUbSgJpTcyeWkogD2v83uLWENe3dRmvKJa45vklYs8ho
         SIgK9hnWfBWIcUXoMhQPQRwS1ONsButB4mr+79KWyHZSsC7v3jfkhPDeNv6ukXb+yW
         w8qANg3LkvNPu9ueSwHFaz4ayuD3K7MvqfMTSTNMPKHo2vMPYPzynXXfFdoCfHztUs
         x50l+le13/jHw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I will amend accordingly and submit new patch.

Thanks for review.
JC

On 9/28/20 9:50 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:38PM +0800, JC Kuo wrote:
>> This commit implements Tegra186/Tegra194 XUSB PADCTL/AO wake and
>> sleepwalk operations.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v3:
>>    move 'ao_regs' to the top of 'struct tegra186_xusb_padctl'
>>    change return data of .phy_remote_wake_detected() to 'bool'
>>    change input parameter of .phy_remote_wake_detected() to 'struct phy*'
>>    remove unnecessary 'else'
>>    rename 'val' with 'value'
>>
>>  drivers/phy/tegra/xusb-tegra186.c | 626 ++++++++++++++++++++++++++++++
>>  1 file changed, 626 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
>> index 5d64f69b39a9..104e2a8496b4 100644
>> --- a/drivers/phy/tegra/xusb-tegra186.c
>> +++ b/drivers/phy/tegra/xusb-tegra186.c
>> @@ -113,6 +113,117 @@
>>  #define  ID_OVERRIDE_FLOATING			ID_OVERRIDE(8)
>>  #define  ID_OVERRIDE_GROUNDED			ID_OVERRIDE(0)
>>  
>> +/* XUSB AO registers */
>> +#define XUSB_AO_USB_DEBOUNCE_DEL		(0x4)
>> +#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 4)
>> +#define   UTMIP_LINE_DEB_CNT(x)			((x) & 0xf)
>> +
>> +#define XUSB_AO_UTMIP_TRIGGERS(x)		(0x40 + (x) * 4)
>> +#define   CLR_WALK_PTR				(1 << 0)
>> +#define   CAP_CFG				(1 << 1)
>> +#define   CLR_WAKE_ALARM			(1 << 3)
>> +
>> +#define XUSB_AO_UHSIC_TRIGGERS(x)		(0x60 + (x) * 4)
>> +#define   HSIC_CLR_WALK_PTR			(1 << 0)
>> +#define   HSIC_CLR_WAKE_ALARM			(1 << 3)
>> +#define   HSIC_CAP_CFG				(1 << 4)
>> +
>> +#define XUSB_AO_UTMIP_SAVED_STATE(x)		(0x70 + (x) * 4)
>> +#define   SPEED(x)				((x) & 0x3)
>> +#define     UTMI_HS				SPEED(0)
>> +#define     UTMI_FS				SPEED(1)
>> +#define     UTMI_LS				SPEED(2)
>> +#define     UTMI_RST				SPEED(3)
>> +
>> +#define XUSB_AO_UHSIC_SAVED_STATE(x)		(0x90 + (x) * 4)
>> +#define   MODE(x)				((x) & 0x1)
>> +#define   MODE_HS				MODE(0)
>> +#define   MODE_RST				MODE(1)
>> +
>> +#define XUSB_AO_UTMIP_SLEEPWALK_CFG(x)		(0xd0 + (x) * 4)
>> +#define XUSB_AO_UHSIC_SLEEPWALK_CFG(x)		(0xf0 + (x) * 4)
>> +#define   FAKE_USBOP_VAL			(1 << 0)
>> +#define   FAKE_USBON_VAL			(1 << 1)
>> +#define   FAKE_USBOP_EN				(1 << 2)
>> +#define   FAKE_USBON_EN				(1 << 3)
>> +#define   FAKE_STROBE_VAL			(1 << 0)
>> +#define   FAKE_DATA_VAL				(1 << 1)
>> +#define   FAKE_STROBE_EN			(1 << 2)
>> +#define   FAKE_DATA_EN				(1 << 3)
>> +#define   WAKE_WALK_EN				(1 << 14)
>> +#define   MASTER_ENABLE				(1 << 15)
>> +#define   LINEVAL_WALK_EN			(1 << 16)
>> +#define   WAKE_VAL(x)				(((x) & 0xf) << 17)
>> +#define     WAKE_VAL_NONE			WAKE_VAL(12)
>> +#define     WAKE_VAL_ANY			WAKE_VAL(15)
>> +#define     WAKE_VAL_DS10			WAKE_VAL(2)
>> +#define   LINE_WAKEUP_EN			(1 << 21)
>> +#define   MASTER_CFG_SEL			(1 << 22)
>> +
>> +#define XUSB_AO_UTMIP_SLEEPWALK(x)		(0x100 + (x) * 4)
>> +/* phase A */
>> +#define   USBOP_RPD_A				(1 << 0)
>> +#define   USBON_RPD_A				(1 << 1)
>> +#define   AP_A					(1 << 4)
>> +#define   AN_A					(1 << 5)
>> +#define   HIGHZ_A				(1 << 6)
>> +/* phase B */
>> +#define   USBOP_RPD_B				(1 << 8)
>> +#define   USBON_RPD_B				(1 << 9)
>> +#define   AP_B					(1 << 12)
>> +#define   AN_B					(1 << 13)
>> +#define   HIGHZ_B				(1 << 14)
>> +/* phase C */
>> +#define   USBOP_RPD_C				(1 << 16)
>> +#define   USBON_RPD_C				(1 << 17)
>> +#define   AP_C					(1 << 20)
>> +#define   AN_C					(1 << 21)
>> +#define   HIGHZ_C				(1 << 22)
>> +/* phase D */
>> +#define   USBOP_RPD_D				(1 << 24)
>> +#define   USBON_RPD_D				(1 << 25)
>> +#define   AP_D					(1 << 28)
>> +#define   AN_D					(1 << 29)
>> +#define   HIGHZ_D				(1 << 30)
>> +
>> +#define XUSB_AO_UHSIC_SLEEPWALK(x)		(0x120 + (x) * 4)
>> +/* phase A */
>> +#define   RPD_STROBE_A				(1 << 0)
>> +#define   RPD_DATA0_A				(1 << 1)
>> +#define   RPU_STROBE_A				(1 << 2)
>> +#define   RPU_DATA0_A				(1 << 3)
>> +/* phase B */
>> +#define   RPD_STROBE_B				(1 << 8)
>> +#define   RPD_DATA0_B				(1 << 9)
>> +#define   RPU_STROBE_B				(1 << 10)
>> +#define   RPU_DATA0_B				(1 << 11)
>> +/* phase C */
>> +#define   RPD_STROBE_C				(1 << 16)
>> +#define   RPD_DATA0_C				(1 << 17)
>> +#define   RPU_STROBE_C				(1 << 18)
>> +#define   RPU_DATA0_C				(1 << 19)
>> +/* phase D */
>> +#define   RPD_STROBE_D				(1 << 24)
>> +#define   RPD_DATA0_D				(1 << 25)
>> +#define   RPU_STROBE_D				(1 << 26)
>> +#define   RPU_DATA0_D				(1 << 27)
>> +
>> +#define XUSB_AO_UTMIP_PAD_CFG(x)		(0x130 + (x) * 4)
>> +#define   FSLS_USE_XUSB_AO			(1 << 3)
>> +#define   TRK_CTRL_USE_XUSB_AO			(1 << 4)
>> +#define   RPD_CTRL_USE_XUSB_AO			(1 << 5)
>> +#define   RPU_USE_XUSB_AO			(1 << 6)
>> +#define   VREG_USE_XUSB_AO			(1 << 7)
>> +#define   USBOP_VAL_PD				(1 << 8)
>> +#define   USBON_VAL_PD				(1 << 9)
>> +#define   E_DPD_OVRD_EN				(1 << 10)
>> +#define   E_DPD_OVRD_VAL			(1 << 11)
>> +
>> +#define XUSB_AO_UHSIC_PAD_CFG(x)		(0x150 + (x) * 4)
>> +#define   STROBE_VAL_PD				(1 << 0)
>> +#define   DATA0_VAL_PD				(1 << 1)
>> +#define   USE_XUSB_AO				(1 << 4)
>> +
>>  #define TEGRA186_LANE(_name, _offset, _shift, _mask, _type)		\
>>  	{								\
>>  		.name = _name,						\
>> @@ -130,7 +241,15 @@ struct tegra_xusb_fuse_calibration {
>>  	u32 rpd_ctrl;
>>  };
>>  
>> +struct tegra186_xusb_padctl_context {
>> +	u32 vbus_id;
>> +	u32 usb2_pad_mux;
>> +	u32 usb2_port_cap;
>> +	u32 ss_port_cap;
>> +};
>> +
>>  struct tegra186_xusb_padctl {
>> +	void __iomem *ao_regs;
>>  	struct tegra_xusb_padctl base;
> 
> base should always be the first element in the structure to optimize
> container_of().
> 
>>  
>>  	struct tegra_xusb_fuse_calibration calib;
>> @@ -138,8 +257,25 @@ struct tegra186_xusb_padctl {
>>  	/* UTMI bias and tracking */
>>  	struct clk *usb2_trk_clk;
>>  	unsigned int bias_pad_enable;
>> +
>> +	/* padctl context */
>> +	struct tegra186_xusb_padctl_context context;
>>  };
>>  
>> +static inline void ao_writel(struct tegra186_xusb_padctl *priv, u32 value, unsigned long offset)
> 
> I prefer offsets to be unsigned int because the _l_ in read_l_() and
> write_l_() was originally meant to be "long" (from back when long meant
> 32-bit). An unsigned long parameter can therefore be easily mistaken for
> the value. That's arguably less of an issue with 64-bit because u32 is
> an unsigned int. I guess making the offset unsigned int could also be
> confusing on 64-bit because now both the value and the offset are
> unsigned int, but for compatibility's sake I think that's okay.
> 
> Also, offsets are usually pretty small, so a full 64-bit integer isn't
> really warranted.
> 
> [...]
>> +static int tegra186_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
>> +						     struct phy *phy,
>> +						     enum usb_device_speed speed)
>> +{
>> +	if (is_usb3_phy(phy))
>> +		return tegra186_usb3_phy_enable_sleepwalk(phy);
>> +
>> +	if (is_utmi_phy(phy))
>> +		return tegra186_utmi_phy_enable_sleepwalk(phy, speed);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int tegra186_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl,
>> +						      struct phy *phy)
>> +{
>> +	if (is_usb3_phy(phy))
>> +		return tegra186_usb3_phy_disable_sleepwalk(phy);
>> +
>> +	if (is_utmi_phy(phy))
>> +		return tegra186_utmi_phy_disable_sleepwalk(phy);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int tegra186_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy)
>> +{
>> +	if (is_usb3_phy(phy))
>> +		return tegra186_usb3_phy_enable_wake(phy);
>> +
>> +	if (is_utmi_phy(phy))
>> +		return tegra186_utmi_phy_enable_wake(phy);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int tegra186_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy)
>> +{
>> +	if (is_usb3_phy(phy))
>> +		return tegra186_usb3_phy_disable_wake(phy);
>> +
>> +	if (is_utmi_phy(phy))
>> +		return tegra186_utmi_phy_disable_wake(phy);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static bool tegra186_xusb_padctl_remote_wake_detected(struct phy *phy)
>> +{
>> +	if (is_utmi_phy(phy))
>> +		return tegra186_utmi_phy_remote_wake_detected(phy);
>> +
>> +	if (is_usb3_phy(phy))
>> +		return tegra186_usb3_phy_remote_wake_detected(phy);
>> +
>> +	return false;
>> +}
> 
> These are pretty much the same multiplexers as for Tegra210. If we had
> lane ops function pointers we could make this code more generic.
> 
>> +
>>  static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
>>  {
>>  }
>> @@ -937,7 +1556,14 @@ static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
>>  static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
>>  	.probe = tegra186_xusb_padctl_probe,
>>  	.remove = tegra186_xusb_padctl_remove,
>> +	.suspend_noirq = tegra186_xusb_padctl_suspend_noirq,
>> +	.resume_noirq = tegra186_xusb_padctl_resume_noirq,
>>  	.vbus_override = tegra186_xusb_padctl_vbus_override,
>> +	.enable_phy_sleepwalk = tegra186_xusb_padctl_enable_phy_sleepwalk,
>> +	.disable_phy_sleepwalk = tegra186_xusb_padctl_disable_phy_sleepwalk,
>> +	.enable_phy_wake = tegra186_xusb_padctl_enable_phy_wake,
>> +	.disable_phy_wake = tegra186_xusb_padctl_disable_phy_wake,
>> +	.remote_wake_detected = tegra186_xusb_padctl_remote_wake_detected,
> 
> We might even be able to get rid of these callbacks because the code
> that needs to call these can directly call into the lane ops.
> 
> Thierry
> 
