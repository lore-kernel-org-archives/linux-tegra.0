Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C06EC18E7D
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BAE52333D
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbhASRoB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:44:01 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4778 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391584AbhASRkW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:40:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6007195c0000>; Tue, 19 Jan 2021 09:39:40 -0800
Received: from [10.25.99.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 17:39:36 +0000
Subject: Re: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <broonie@kernel.org>, <robh+dt@kernel.org>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com> <YAcTxxyogVgfN1uw@ulmo>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com>
Date:   Tue, 19 Jan 2021 23:09:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAcTxxyogVgfN1uw@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611077980; bh=NYSuQvptGwglsg6hwhbeZo+P6a5iRvHlv/Ac5X3wq0E=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=BkfBjCUirmEPSHaImywpIfpgV7kphUGUianmqeHjkbZ0ygzEmqlRasO7Hwd/L4VPy
         KOO2kYKtrdPTiV4eFWv2p4PUvcSY07KI0LiQ2CZaQQtGpJXn8EjBnfOmzwobA1RVdZ
         MSxH3StnoqYMehpSI9CqmNvITcT7VpsxCqSErtSmKkGgyaqQL90TXladEbNVJGOybg
         PLS6JMYhVbDNvmgjUEg2rAaCoqv08+3EKa/mlMh+SnOTuWQP1v06KTpRg6mHxSlIgK
         uvz8RO5GxtqnZGHBIbwoekZLCd/ajzehQG7HgxkAZy5fj5SXzTAaaFR0QZ9pBUlM7S
         8VOFBzSnarVhQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/19/2021 10:45 PM, Thierry Reding wrote:
> On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
>> Expose a header which describes DT bindings required to use audio-graph
>> based sound card. All Tegra210 based platforms can include this header
>> and add platform specific information. Currently, from SoC point of view,
>> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
>>   1 file changed, 153 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
> I prefer keeping everything in tegra210.dtsi, but I can do that merge
> when I apply, after the DT bindings have been acked, so no need to
> resend just because of that.

I think this may be fine for Tegra210 based boards. But for Tegra186 and 
Tegra194, whenever we add support for it, can rely on a common 
audio-graph dtsi because there is no change w.r.t APE. This can help us 
to avoid duplication of the bindings. This most likely applies to future 
chips as well (where Tegra186 audio-graph bindings can be considered as 
base) when there is no significant change in APE.
