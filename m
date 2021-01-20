Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37278C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 05:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEC9623132
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 05:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbhATFN7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 00:13:59 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14679 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730601AbhATFHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 00:07:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6007ba6e0000>; Tue, 19 Jan 2021 21:06:54 -0800
Received: from [10.25.99.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 05:06:48 +0000
Subject: Re: Re: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header
 for Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <broonie@kernel.org>, <robh+dt@kernel.org>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com> <YAcTxxyogVgfN1uw@ulmo>
 <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com> <YAcdi7ARk0imXafQ@ulmo>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <fb0d0f14-e038-cb0c-542e-011ccb4beb93@nvidia.com>
Date:   Wed, 20 Jan 2021 10:36:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAcdi7ARk0imXafQ@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611119214; bh=TrUW/bRVd0y6RBunmo1Nvw8U/CisQ85mSiTQB96uz4Q=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=iqJqehfrlGaLEYWRtxL8pSQcX78r9QttWiB+MThCuJIKgzBAG05ePIeO7kEtH3u/w
         lKt3gIrqHKl2y2rosb6wvtl0mGOf4xTMhixn97FdZEXDfyp1TXk1MBmpz4dGKFTh0p
         6yuyUPjOwC1fWbInmd2GX5IlkNh0bscT1c4rJ7bz5rkxVsv8a+y8jLOEHjV27Dw+Np
         CXv7nlVgSuim4YEU3v93drYtjTu4UdfUo66xQPY/+Vh21xrI9i/319L0kc1ub4RLYK
         XuVuyONSrYrmMpaopjtSGaxQSv2E0F8WFn/+psAoaISZ87LPRUOIIH62rj+IqyrO3i
         lYpd9Yh5WOaEg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/19/2021 11:27 PM, Thierry Reding wrote:
> On Tue, Jan 19, 2021 at 11:09:32PM +0530, Sameer Pujar wrote:
>>
>> On 1/19/2021 10:45 PM, Thierry Reding wrote:
>>> On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
>>>> Expose a header which describes DT bindings required to use audio-graph
>>>> based sound card. All Tegra210 based platforms can include this header
>>>> and add platform specific information. Currently, from SoC point of view,
>>>> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>>>>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>    .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
>>>>    1 file changed, 153 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
>>> I prefer keeping everything in tegra210.dtsi, but I can do that merge
>>> when I apply, after the DT bindings have been acked, so no need to
>>> resend just because of that.
>> I think this may be fine for Tegra210 based boards. But for Tegra186 and
>> Tegra194, whenever we add support for it, can rely on a common audio-graph
>> dtsi because there is no change w.r.t APE. This can help us to avoid
>> duplication of the bindings. This most likely applies to future chips as
>> well (where Tegra186 audio-graph bindings can be considered as base) when
>> there is no significant change in APE.
> Maybe. Although that argument is somewhat extreme because we already
> have some of that same duplication throughout the other .dtsi files. By
> the same argument we could save a bit of duplication by having something
> like tegra-gpio.dtsi and including that in all the SoC .dtsi files and
> only update the compatible string, because that's the only significant
> change.

> Duplication isn't a big problem for DTS files because the data is meant
> to be stable anyway. So once it is in place and doesn't have to change,
> it really doesn't matter if it comes from an include or it's duplicated.

OK, if there is no issue with duplication then fine with me. Thanks.

