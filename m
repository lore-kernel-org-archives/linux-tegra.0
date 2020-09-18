Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442A0C43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 12:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A2723600
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 12:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Jn/AU3hG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRMyK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 08:54:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16902 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIRMyK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 08:54:10 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f64adc60001>; Fri, 18 Sep 2020 05:53:26 -0700
Received: from [10.26.75.17] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Sep
 2020 12:54:09 +0000
Subject: Re: [PATCH v2 00/14] arm64: tegra: Initial Tegra234 VDK support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d4ddfebc-b307-0e84-96f3-4cb336bf9d9a@nvidia.com>
Date:   Fri, 18 Sep 2020 13:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600433606; bh=WakILkemP2xClmrYY6SFrPy/cuD5ihezCcymcD5Cp2Y=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=Jn/AU3hG684NohD+fi+Xzh+waRnMN14htnluWoky09e/zBzPZVJLjzWmN0J5U8EG4
         ZGm4JILzgSsUx0p9qI2wK+wXV6Ok5AP/CSUppjqfhuy24a3Cdp3bmOQLJhWr8kDhTy
         ZQJiYdkNdmnLGccAZvSHMwO+7xSOYEE+J41V6Yaj1tlij1urWohheXtOgWK8QyWP8a
         Eo1gIXmEJJExBop0lX2pr1rj+VzaeiKArXHGHY9/ZlLhJSECifT1hRtuPB1Dj60pqK
         9yWsSDtGAjciVgdiYymS+bA6TJWPPa0CoWsiYv1rEz35lpfxqIK4Z7yme1HNGwCJeO
         bns/I3689gTvA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2020 11:07, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This set of patches introduces support for the new Tegra234 SoC, also
> known as Orin. Currently no silicon of this chip is available, so the
> support added here is for a simulation platform known as VDK.
> 
> Note that this simulation platform is not available publicly. However
> the goal is to use the simulation platform as a way of upstreaming as
> much support as possible ahead of tapeout.
> 
> Once actual silicon becomes available, the plan is to stop supporting
> the simulation platform and shift focus to real hardware.
> 
> Thierry

Looks good to me!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
