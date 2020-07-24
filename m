Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67010C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 23:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FD33206EB
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 23:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="p8pHYS6D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgGXX3W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 19:29:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19557 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgGXX3V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 19:29:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1b6e910000>; Fri, 24 Jul 2020 16:28:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 24 Jul 2020 16:29:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 24 Jul 2020 16:29:21 -0700
Received: from [10.2.95.204] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jul
 2020 23:29:21 +0000
Subject: Re: [PATCH] arm64: tegra: Properly size register regions for GPU on
 Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>
References: <20200721151055.253644-1-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Terje Bergstrom <tbergstrom@nvidia.com>
Message-ID: <903f1237-82d2-7a32-4ac6-ee780857c19e@nvidia.com>
Date:   Fri, 24 Jul 2020 16:29:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721151055.253644-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595633297; bh=nXyf+IpNtZK+OMXfkgxsiDsw2PKA76nLFcreFu+wnNE=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=p8pHYS6DD7qkJmzGTSkR1iWxXs5R0VHglxABIBshcgv5syCJRScQHzpRso5b0OA8C
         VW35P/3M1d+ZrXLYXyfDQA92CSDKdat4FkpupIVYs5UQ/Tu5H7s7jnmpbElF/4YOJS
         jCsox/WsBZn9WbElquDgyXs1BV2dfzuIDHWEhGtZpiN/vkvQJ7d0ID5x37nSR3MX7B
         w9mKKvIjZPKPvuO7l3xxQC5lf4yCQmNWB1LjOBqekbCaBoKPlCmt59ZbCnzOnztcR2
         vR8Tg9T/rohDFcTbZe/MhcyPEXnryQUIi7CpxWB6t86uf8iLkCVGRrgDk+PFECzQGn
         Nz7dmJDyeut0A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/21/2020 8:10 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Memory I/O regions for the GV11B found on Tegra194 are 16 MiB rather
> than 256 MiB.
>
> Reported-by: Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 48160f48003a..fc36d683049b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1398,8 +1398,8 @@ sor3: sor@15bc0000 {
>  =20
>   		gpu@17000000 {
>   			compatible =3D "nvidia,gv11b";
> -			reg =3D <0x17000000 0x10000000>,
> -			      <0x18000000 0x10000000>;
> +			reg =3D <0x17000000 0x1000000>,
> +			      <0x18000000 0x1000000>;
>   			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names =3D "stall", "nonstall";

Looks good to me.

Reviewed-By: Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>

Terje

