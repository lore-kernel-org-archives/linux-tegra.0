Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DB1C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C3360F5B
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhKLNmf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:42:35 -0500
Received: from foss.arm.com ([217.140.110.172]:37478 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231436AbhKLNmf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:42:35 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11DCEED1;
        Fri, 12 Nov 2021 05:39:44 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020143F70D;
        Fri, 12 Nov 2021 05:39:42 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Add ARM Cortex-A78
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ee1fff5f-cbf9-845a-0b7d-9602ec987c11@arm.com>
Date:   Fri, 12 Nov 2021 13:39:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112131904.3683428-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/11/2021 1:19 pm, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ARM Cortex-A78 CPU can be found in a number of recent SoCs such as
> the NVIDIA Tegra234 (Orin).

Oops, that reminds me that I'm sitting on a patch somewhere to bring 
these fully up-to-date (I got sidetracked pondering what to do about PMU 
naming). I should track that down and post it next week...

However if Rob feels like applying this one first,

Acked-by: Robin Murphy <robin.muephy@arm.com>

Cheers,
Robin.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index f2ab6423b4af..452bfd1d4ecc 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -137,6 +137,7 @@ properties:
>         - arm,cortex-a75
>         - arm,cortex-a76
>         - arm,cortex-a77
> +      - arm,cortex-a78
>         - arm,cortex-m0
>         - arm,cortex-m0+
>         - arm,cortex-m1
> 
