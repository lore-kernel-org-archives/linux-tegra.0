Return-Path: <SRS0=/nj9=CE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE73CC433E1
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Aug 2020 09:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62357206FA
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Aug 2020 09:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="LnYiAQap"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgHZJVl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Aug 2020 05:21:41 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12311 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgHZJVk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Aug 2020 05:21:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f46292c0000>; Wed, 26 Aug 2020 02:19:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 26 Aug 2020 02:21:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 26 Aug 2020 02:21:40 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Aug
 2020 09:21:40 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 522FF42775; Wed, 26 Aug 2020 12:21:37 +0300 (EEST)
Date:   Wed, 26 Aug 2020 12:21:37 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3 resend] dt-bindings: Bindings for reserved memory for
 BPMP mail
Message-ID: <20200826092137.GB9594@pdeschrijver-desktop.Nvidia.com>
References: <20200807162006.17333-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200807162006.17333-1-pdeschrijver@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598433580; bh=IgZ9D8kj8Ws8KdDfV0GqwE/BWT/dLRsg8NwOwEBz4b4=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=LnYiAQapIlzBFcyGTZCj5c9pMPMvqqqtMY1QVacVOAC1+Ojc1HJ3rKbehujF7gDsK
         eM53sd2Sop62pJOq29fhmaBB7/YNYUAHOJIaMHitUQ87XejGtg5TS61/xBZf/8It+X
         4frc2kCGHWt5iBNkAqPfkIGhr3ke9rCu8qXUG11Cd4kdkG1Ubvj8zfwkwMHzmBFFs0
         OzfVUbYcoj5+9usQwSaCdDx4ek0J6V+v1vv06u4YbhUIHj8wwMHpncAYj/MwNtPN66
         SDsO4QIZTheBm7KLjAd82kC5eMemDqhbDVPKTzG0iukRh09xawJqnJTxD3lXR4sIet
         hCw1yQ0Vfugsg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 07, 2020 at 07:20:06PM +0300, Peter De Schrijver wrote:
> Tegra234 will use DRAM to store the messages exchanged between Linux and
> BPMP firmware rather than sysram as used in Tegra186 and Tegra194. The
> kernel will be informed about the size and location of the DRAM area to
> be used using the DT reserved memory bindings.
> 

Plans have changed so also on Tegra234 the IPC messages will be stored
in sysram, hence these patches can be ignored.

Peter.

> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 38 ++++++++++++++++++-
>  .../reserved-memory/tegra234-bpmp-shmem.txt   | 33 ++++++++++++++++
>  2 files changed, 69 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> index ff380dadb5f9..ff8fc4b6816d 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> @@ -13,12 +13,18 @@ Required properties:
>      One of:
>      - "nvidia,tegra186-bpmp"
>  - mboxes : The phandle of mailbox controller and the mailbox specifier.
> -- shmem : List of the phandle of the TX and RX shared memory area that
> -	  the IPC between CPU and BPMP is based on.
>  - #clock-cells : Should be 1.
>  - #power-domain-cells : Should be 1.
>  - #reset-cells : Should be 1.
>  
> +Optinal properties:
> +- shmem : List of the phandle of the TX and RX shared memory area that
> +	  the IPC between CPU and BPMP is based on.
> +- memory-region : phandle to reserved memory region used for IPC between
> +	  CPU-NS and BPMP.
> +One 1 of the above 2 properties must be present. In case both are present
> +memory-region will take precedence and shmem will be ignored.
> +
>  This node is a mailbox consumer. See the following files for details of
>  the mailbox subsystem, and the specifiers implemented by the relevant
>  provider(s):
> @@ -105,3 +111,31 @@ bpmp {
>  		...
>  	};
>  };
> +
> +memory-region binding for BPMP
> +------------------------------
> +
> +The shared memory area for the IPC TX and RX between CPU-NS and BPMP
> +resides in normal SDRAM and is defined using a sub-node of the reserved-memory
> +node. See ../reserved-memory/nvidia,tegra234-bpmp-shmem.txt for binding.
> +
> +Example:
> +
> +hsp_top: hsp@3c00000 {
> +	...
> +	#mbox-cells = <2>;
> +};
> +
> +bpmp: bpmp {
> +	compatible = "nvidia,tegra234-bpmp", "nvidia,tegra186-bpmp";
> +	mboxes = <&hsp_top TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
> +	memory-region = <&dram_cpu_bpmp_mail>;
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
> +	#power-domain-cells = <1>;
> +
> +	i2c {
> +		compatible = "...";
> +		...
> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt b/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
> new file mode 100644
> index 000000000000..44338184d94b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
> @@ -0,0 +1,33 @@
> +* Tegra CPU-NS - BPMP IPC reserved memory binding
> +
> +Define a memory region used for communication between CPU-NS and BPMP.
> +Typically this node is created by the bootloader as the physical address
> +has to be known to both CPU-NS and BPMP for correct IPC operation.
> +
> +The memory region is defined using a child node under /reserved-memory.
> +The sub-node is named shmem@<address> and has the following properties:
> +
> +- compatible:
> +	compatible = "nvidia,tegra234-bpmp-shmem";
> +
> +- reg:
> +	The physical address and size of the shared SDRAM region
> +
> +- no-map:
> +	To prevent the OS from creating a virtual mapping for this region.
> +	(See reserved-memory.txt for deatils on the no-map property)
> +
> +Example:
> +
> +/ {
> +	reserved-memory {
> +		...
> +		dram_cpu_bpmp_mail: shmem@0xf1be0000  {
> +			compatible = "nvidia,tegra234-bpmp-shmem";
> +			reg = <0x0 0xf1be0000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		...
> +	};
> +};
> -- 
> 2.17.1
> 
