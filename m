Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A642DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhK2VLc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:11:32 -0500
Received: from mail-oo1-f44.google.com ([209.85.161.44]:39442 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhK2VJb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:09:31 -0500
Received: by mail-oo1-f44.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso6068406ooa.6;
        Mon, 29 Nov 2021 13:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pVijKSVAdiO5Hr/Qp3LKdd0YQdGLG8WUzIVXVSRT2JQ=;
        b=j5VkYu5wKgtmqJh5AeXvSClxlWeGb/xUuJcj9KxztQH35ezMDwSZuzKSRPatS/InrS
         l5R0zmMEbOQ5BF5VK58XYqKWMenYGK5BWqTtrgkCe6Q8h5TDqj8D4y4WqpRNafVQkZnL
         x7MzInv1KL1cM/QoXdfeLNmlWSNZd/+kbpoWRN15FxSxNgav+iEKTIVfXWRxmdmSZg/g
         WBTTSRATl/4sLXLFPPWyJtU1hEPPeDPB5OT9bK3Pu0BPLxsYr+LSbx081/n2LIAJEwxl
         fKj3AlRANJVxNtnpBlTm6fVLl5ciAvCh3F/rtVGlPjGG/67RFmv/oCFua1tTgjTafnjV
         bS/g==
X-Gm-Message-State: AOAM533xjYszvgBI2l728OPHXQhfjlUAQDMwP7v9Li9i4ybzZqkgc5t8
        4ep1mW++4xYbv7mxp0Q5hwaN93e6xA==
X-Google-Smtp-Source: ABdhPJwT6/kdzXDPqyaEzisaAKjU7erPMPkYG1NKGlzvFMwLmuOJTklFfi3NP/bj6Iy0saHyyGNHZw==
X-Received: by 2002:a4a:88cc:: with SMTP id q12mr33432778ooh.29.1638219973402;
        Mon, 29 Nov 2021 13:06:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t5sm2422654ool.10.2021.11.29.13.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:06:12 -0800 (PST)
Received: (nullmailer pid 609039 invoked by uid 1000);
        Mon, 29 Nov 2021 21:06:12 -0000
Date:   Mon, 29 Nov 2021 15:06:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Describe Tegra234 CPU hierarchy
Message-ID: <YaVAxNiU2O7kWXoQ@robh.at.kernel.org>
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
 <20211112131904.3683428-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112131904.3683428-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 12, 2021 at 02:19:04PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 SoC has 3 clusters of 4 Cortex-A78AE CPU cores each,
> for a total of 12 CPUs. Each CPU has 64 KiB instruction and data caches
> with each cluster having an additional 256 KiB unified L2 cache and a 2
> MiB L3 cache.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 365 ++++++++++++++++++++++-
>  1 file changed, 363 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 104e5fdd5f8a..db24f48edc9f 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -736,12 +736,373 @@ cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		cpu@0 {
> +		cpu0_0: cpu@0 {
> +			compatible = "arm,cortex-a78";
>  			device_type = "cpu";
> -			reg = <0x000>;
> +			reg = <0x00000>;
>  
>  			enable-method = "psci";
> +

> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;

Isn't all this discoverable?

> +			next-level-cache = <&l2c0_0>;
> +		};
> +
> +		cpu0_1: cpu@100 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x00100>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c0_1>;
> +		};
> +
> +		cpu0_2: cpu@200 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x00200>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c0_2>;
> +		};
> +
> +		cpu0_3: cpu@300 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x00300>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c0_3>;
> +		};
> +
> +		cpu1_0: cpu@10000 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x10000>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c1_0>;
> +		};
> +
> +		cpu1_1: cpu@10100 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x10100>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c1_1>;
> +		};
> +
> +		cpu1_2: cpu@10200 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x10200>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c1_2>;
> +		};
> +
> +		cpu1_3: cpu@10300 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x10300>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c1_3>;
> +		};
> +
> +		cpu2_0: cpu@20000 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x20000>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c2_0>;
> +		};
> +
> +		cpu2_1: cpu@20100 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x20100>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c2_1>;
> +		};
> +
> +		cpu2_2: cpu@20200 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x20200>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c2_2>;
> +		};
> +
> +		cpu2_3: cpu@20300 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			reg = <0x20300>;
> +
> +			enable-method = "psci";
> +
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2c2_3>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0_0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu0_1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu0_2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu0_3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu1_0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1_1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu1_2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu1_3>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu2_0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu2_1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2_2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu2_3>;
> +				};
> +			};
> +		};
> +
> +		l2c0_0: l2-cache00 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c0>;
> +		};
> +
> +		l2c0_1: l2-cache01 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c0>;
>  		};
> +
> +		l2c0_2: l2-cache02 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c0>;
> +		};
> +
> +		l2c0_3: l2-cache03 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c0>;
> +		};
> +
> +		l2c1_0: l2-cache10 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c1>;
> +		};
> +
> +		l2c1_1: l2-cache11 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c1>;
> +		};
> +
> +		l2c1_2: l2-cache12 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c1>;
> +		};
> +
> +		l2c1_3: l2-cache13 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c1>;
> +		};
> +
> +		l2c2_0: l2-cache20 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c2>;
> +		};
> +
> +		l2c2_1: l2-cache21 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c2>;
> +		};
> +
> +		l2c2_2: l2-cache22 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c2>;
> +		};
> +
> +		l2c2_3: l2-cache23 {
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-unified;
> +			next-level-cache = <&l3c2>;
> +		};
> +
> +		l3c0: l3-cache0 {
> +			cache-size = <2097152>;
> +			cache-line-size = <64>;
> +			cache-sets = <2048>;
> +		};
> +
> +		l3c1: l3-cache1 {
> +			cache-size = <2097152>;
> +			cache-line-size = <64>;
> +			cache-sets = <2048>;
> +		};
> +
> +		l3c2: l3-cache2 {
> +			cache-size = <2097152>;
> +			cache-line-size = <64>;
> +			cache-sets = <2048>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "okay";

That's the default.

>  	};
>  
>  	psci {
> -- 
> 2.33.1
> 
> 
