Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC9C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 15:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35BBC2399A
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 15:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbhAHPOG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 10:14:06 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16921 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHPOG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 10:14:06 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ff876950000>; Fri, 08 Jan 2021 07:13:25 -0800
Received: from [10.25.98.33] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 8 Jan
 2021 15:13:20 +0000
Subject: Re: [PATCH v2 1/2] clk: tegra30: Add hda clock default rates to clock
 driver
To:     Peter Geis <pgwipeout@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Peter De Schrijver" <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mohan Kumar <mkumard@nvidia.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Ion Agorria <ion@agorria.com>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-2-pgwipeout@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <ea422151-b4df-f7d3-c695-b4ebcb251307@nvidia.com>
Date:   Fri, 8 Jan 2021 20:43:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210108135913.2421585-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610118805; bh=OVh5cu6AG+BPRULLnidGp+AXOyPhHTYBhMs7JavYrOc=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=sSidw/slIQ9npmyK4Om8U5bcnuD7kXNCpbqKEZuvuINwRSjfoqp54zM8HvBbDlLZ3
         jVnKVrC9VLjaeqespOieFT2Zl0CckYNHZJ3qyeX/tET9IHdBojThZnZZlGxcgYAByr
         kbpS0UpKkBZElJ51nb+5cz+is36K20nRGTg2bReJUDpu1HJI3UMh1xuuHjoem0/zom
         PaE2nfPaqfLsmDewNNpLwXgZmjotjvxrDjdOFL5/dRpwLCtdkV1imSwpac9u1i/34V
         RIEkL578uRA6bUKLHa52pfQ0S2ElfYO3L6YDTXhT5eHn/CBkEUbclYnDEQdm7gXgQE
         jqNm7LQB5vD+g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/8/2021 7:29 PM, Peter Geis wrote:
> External email: Use caution opening links or attachments
>
>
> Current implementation defaults the hda clocks to clk_m. This causes hda
> to run too slow to operate correctly. Fix this by defaulting to pll_p and
> setting the frequency to the correct rate.
>
> This matches upstream t124 and downstream t30.
>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   drivers/clk/tegra/clk-tegra30.c | 2 ++
>   1 file changed, 2 insertions(+)

Acked-by: Sameer Pujar <spujar@nvidia.com>
