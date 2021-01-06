Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D31C43381
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jan 2021 06:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A777022D01
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jan 2021 06:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbhAFGGQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jan 2021 01:06:16 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15341 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbhAFGGQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jan 2021 01:06:16 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ff5532f0000>; Tue, 05 Jan 2021 22:05:35 -0800
Received: from [10.19.109.31] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan
 2021 06:05:30 +0000
Subject: Re: [PATCH] xhci: tegra: Delay for disabling LFPS detector
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <mathias.nyman@linux.intel.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robh@kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20201218164234.128762-1-jckuo@nvidia.com>
 <X9zelLu26bcQd7bs@kroah.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Organization: NVIDIA
Message-ID: <d508a7f9-da00-99a3-cf87-d1234efb10c9@nvidia.com>
Date:   Wed, 6 Jan 2021 14:05:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9zelLu26bcQd7bs@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1609913136; bh=fZXtoHUvqkDYSMdcFakYxvfrLLyKSwtZorDz9eY/riU=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Organization:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
         Content-Language:Content-Transfer-Encoding:X-Originating-IP:
         X-ClientProxiedBy;
        b=E3EDbZ2g3F0icWth7JcHSdl3TkDDzusPFteq40XYlUGUmFpDIIMsAzHygCkzXVsec
         fMk+OpCtNcrXvzgM0dgP9/Q71KbaVS49cdcdXeYkonhdewQatX6cpPGHy+hfRjHDC0
         n496A2TeB76GMx4EjGIvAO5djDk3sGeqEfxFuY4wqE7ZbFGccY8gZPA9t+QymzfN0t
         HB7fpCbXyEGtOdC7V/uP+CcR2zmc4nCKgPejzYsAVSlxnye5u8+eC6u6ch3b85OxRN
         D3+hWwnd1kj9k6sY2aaRO9urvzB96L1SiU/HQJpIy6WNPPZh0Vz0oQH71rc2nCm62D
         YQ/8QZ1d5Yu9g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/19/20 12:53 AM, Greg KH wrote:
> On Sat, Dec 19, 2020 at 12:42:34AM +0800, JC Kuo wrote:
>> Occasionally, we are seeing some SuperSpeed devices resumes right after
>> being directed to U3. This commits add 500us delay to ensure LFPS
>> detector is disabled before sending ACK to firmware.
>>
>> [   16.099363] tegra-xusb 70090000.usb: entering ELPG
>> [   16.104343] tegra-xusb 70090000.usb: 2-1 isn't suspended: 0x0c001203
>> [   16.114576] tegra-xusb 70090000.usb: not all ports suspended: -16
>> [   16.120789] tegra-xusb 70090000.usb: entering ELPG failed
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index 934be1686352..20cdc11f7dc6 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -623,6 +623,12 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
>>  								     enable);
>>  			if (err < 0)
>>  				break;
>> +
>> +			/*
>> +			 * wait 500us for LFPS detector to be disabled before sending ACK
>> +			 */
>> +			if (!enable)
>> +				usleep_range(500, 1000);
> 
> Where does the magic 500us come from?  How can we "know" this is long
> enough?

Hi Greg,
The register write passes through a few flop stages of 32KHz clock domain. Our
ASIC designer reviewed RTL and suggests 500us delay. It has also been verified
thoroughly.

Thanks,
JC

> 
> thanks,
> 
> greg k-h
> 
