Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D242FC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB9F64DCC
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhA1MLX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 07:11:23 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18451 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhA1MLW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 07:11:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6012a9c20000>; Thu, 28 Jan 2021 04:10:42 -0800
Received: from [10.26.73.116] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 12:10:41 +0000
Subject: Re: [PATCH V2 1/2] arm64: tegra: Prepare for supporintg the Jetson
 Xavier NX with eMMC
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20210128120851.361401-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4d91c177-4738-c473-250c-a8daf65701a3@nvidia.com>
Date:   Thu, 28 Jan 2021 12:10:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128120851.361401-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611835842; bh=zZ/AOeGosaqknVCmoXuZAocRKl2QvA7jc6h5dFJjcp4=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=ADZZkQpMF2G+JH4vXwd9ft8+9f62YViWddwIWXTvffuhka0pfm2MFzwPZpa5cy/df
         DW5renIAZl84fGty4zE+cHsCYNZei7kTxUqXGHjI14pzOOROMiSB7C1R0adkUz285U
         ZHZSh8nHYEHe0akx2QVDA8sIRDiTkzAZ+lenBFlg3xVrA4wXNLpTc0LyL6Uy9AVGcb
         jEoD07AWEDXiKxjAnAbqH9YbWIkBw+kjYdtJ+wcMtqF9ryMXBF6eYDEuAVdzhWX8ny
         wGdycjc5ivwKKmOi9eO6wmQ2QonS/HlhfgkzYF62WBEGS5B2gQKpLdje1edoRsX/Q/
         UVKYZu2D9g+zw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/01/2021 12:08, Jon Hunter wrote:
> There are two versions of the Jetson Xavier NX system-on-module; one
> with a micro SD-card slot and one with an eMMC. Currently, only the
> system-on-module with the micro SD-card slot is supported. Before adding
> support for the eMMC variant, move the common device-tree parts of the
> existing Jetson Xavier NX system-on-module board (p3668-0000) and
> reference carrier board (p3509-0000) into include files that can be used
> by both Jetson Xavier NX variants.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Ugh, looks like a typo in the $subject. Please let me know if I should
resend.

Jon

-- 
nvpublic
