Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D3C388F7
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 06:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC737222B9
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 06:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="pGLNxA/D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCGJ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 01:09:57 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14640 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgKCGJ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Nov 2020 01:09:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa0f4380001>; Mon, 02 Nov 2020 22:10:00 -0800
Received: from [10.25.99.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 06:09:52 +0000
Subject: Re: [PATCH] ASoC: tegra: remove unneeded semicolon
To:     <trix@redhat.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20201101172412.2306144-1-trix@redhat.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <353e4c77-7166-071a-b1d9-2c1e0b2548a4@nvidia.com>
Date:   Tue, 3 Nov 2020 11:39:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201101172412.2306144-1-trix@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604383800; bh=Kt5ReNuEC/rMDljs+qABItHrQ0K29W2bd4ESZVCRebQ=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=pGLNxA/DnK69oH1y9GE8RkfmH9QWFqusHNw+jJ1J9boBX8FgDTZVbfIgbAtJ8SOFo
         MiT4kiQf+9BQVAm5CAnA6m7rskFLXkQcA+oP0UhVjeVgQzJbD3rsIsa6aebqXb4iXg
         L0vKO1u5c6ASyyO8h/tcGlIjVdSKsfgtXQlmqxy1cNwYRrdjptU0xlHOniZ4n0ea4M
         TkBJt6ZduB3JQIg/O01z9vRPfSjGfPiIZmtNRay12Q9CVpK65CZq2B6uWktbCXyejg
         ps31j655soRrO5xzWWI5F05NuIFQ5RvvwMFVjxdL81I62st5t9yR3JUxtF7rBkfUfk
         /z4TBrmF3vH4Q==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Tom,

> From: Tom Rix <trix@redhat.com>
>
> A semicolon is not needed after a switch statement.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Acked-by: Sameer Pujar <spujar@nvidia.com>

Thanks for the update.
