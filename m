Return-Path: <SRS0=rvI8=CQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464CBC43461
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBE2C21556
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="SfPTNLRf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgIGT3b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Sep 2020 15:29:31 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7488 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIGT3a (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:29:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568a0c0001>; Mon, 07 Sep 2020 12:29:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:29:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:29:30 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:29:29 +0000
Subject: Re: [PATCH 1/9] dt-bindings: tegra: Add Tegra234 VDK compatible
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9ecdb496-6fee-a912-7c5e-0cb78fe2d080@nvidia.com>
Date:   Mon, 7 Sep 2020 20:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599506956; bh=sZpVOm9hSkZooOxIUMe4mTtom44DdERMr6sWtI7wAig=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=SfPTNLRf0ZISp/k7ka5lsm9MW4uAIAZ/MofvSlhhSZyO7VBg7T04jSZ4HnaLb7N4g
         AYiL1u6NNImtyp37gZfAZDjUy8pfmd5D1Mttn/VOfD74beysOXD8aOHy5tMpEmhKOa
         WmV4acrzyw17rXgdQoPQ86kll17wMNPxXj0ey1BIaVxusloFh3xtpxr5eqgAlLRsVZ
         6CZ6qCDsZhDFJatSS0yJekmUSzUvQbJQQskGYyQaLztUA/k/I5gBkyH+3zqA16pSZ+
         wvB/rdWdIwiWTEQXv5KTj3SamrMmYXoJfUgFElTA+eEUDpph5AC1sEZ+4qjYDxUHxQ
         MrUrU3mkyka/w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
> supports a subset of the peripherals that will be available in the final
> chip and serves as a bootstrapping platform.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 53845db64df1..5c781e6d8878 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -109,3 +109,7 @@ properties:
>          items:
>            - const: nvidia,p3509-0000+p3668-0000
>            - const: nvidia,tegra194
> +      - items:
> +          - enum:
> +              - nvidia,tegra234-vdk
> +          - const: nvidia,tegra234
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
