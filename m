Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CCBC433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 10:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52EEA60F4A
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 10:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhJHKxc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 06:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhJHKxc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 06:53:32 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF984C061570;
        Fri,  8 Oct 2021 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dMUi9fUk9Sl1RKpo0LrAUB/zQghMevCatyl2BQsJhqI=; b=DPyq9tYdKHX5MIMlxg5ptXmbvs
        IsxJ8MQGTTQLcO9qpDk5Sv/gRhGgkLc1PL4gsQvwPCaZdOoUGRZJRSKMqia98Trd5GmFteaUAl5Rz
        65YmtlkgM2Cp033duDQjLBO3s6rGONvDBesae+043lom0pzbma+QjV4PzhJJAqvcYZsKsL+sng0dF
        5sJGDW7RBDe+jLwWtjBQ5U9t/ZvHdFM9cS+aWDaLp0NYNhdMLyakFYsN9fHqFBZKxoqVTStnOqNme
        HXUCpTL1bn8Us/27enQMT+if6J/QpY078SGOQ+zL82yCk2jiWc6g0z2lWj+KBtL4HSNA/AaKHGa/2
        9IbmEMLA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mYnTR-0001QZ-Td; Fri, 08 Oct 2021 13:51:33 +0300
Subject: Re: [PATCH v6 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device
 trees
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-3-mperttunen@nvidia.com>
 <YV3ojTpZuH9HU5DU@orome.fritz.box>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <bd6b2743-65d1-7af5-41f5-ecfa5981f30c@kapsi.fi>
Date:   Fri, 8 Oct 2021 13:51:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YV3ojTpZuH9HU5DU@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/6/21 9:18 PM, Thierry Reding wrote:
> On Thu, Sep 16, 2021 at 05:55:16PM +0300, Mikko Perttunen wrote:
>> Add a device tree node for NVDEC on Tegra186, and
>> device tree nodes for NVDEC and NVDEC1 on Tegra194.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> * Change from nvidia,instance to nvidia,host1x-class
>> v4:
>> * Add dma-coherent markers
>> v3:
>> * Change read2 to read-1
>> v2:
>> * Add NVDECSRD1 memory client
>> * Add also to T194 (both NVDEC0/1)
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 38 ++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
> 
> The driver patch adds support for Tegra210, so could we also add NVDEC
> entries for that?
> 
> Thierry
> 

Yes. I don't have my T210 system set up right now to verify, though, and 
I don't have time to look at this in the next few weeks.

Mikko
