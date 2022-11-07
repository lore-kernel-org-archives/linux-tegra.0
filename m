Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F0CC4332F
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Nov 2022 19:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiKGTag (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Nov 2022 14:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiKGTaf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Nov 2022 14:30:35 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA9C2AE18;
        Mon,  7 Nov 2022 11:30:35 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so7139769oti.5;
        Mon, 07 Nov 2022 11:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt/BtquzOdnr+gVhVyK9tm9VLIWqhBtKkDfzPK2GzW4=;
        b=Mfr0f4azqqh6nTx/3I5FuKiZ188lf8X0i5drTmNabQIAmOVjUaotAG3ZOPrmP0J4g9
         ZVbwTy1M5Y9B/WczRnLLVhKn53h+F2kim9DlVb9Nmy1oSyfwQFkeaS1ClHXGssq5iPpC
         agotYmeYCJgw1NWSax12lYMSsGfAEo7yhyRDH1F7VG5r8o2AktxJVqxS2MhstUiCqnpN
         74gNhLDg5hqFfazh871oI1iuRDltWR+7UedtX0p4ntNy4jMON1Bkdz3IF+1z08pVxoLl
         dS3aWkcWuSYjAtvWqjhT8Rtlb1xAH7g306EPv4KKilzIXbkYdS+cuF6aqYXNuKez0keZ
         o6Vw==
X-Gm-Message-State: ACrzQf175y81XcTPs7KDK8+eoh90HtKJHbjuUpu4YQtiyAgFsJQTcfFl
        cXhTOKLOzi/j5uMthQC5FQ==
X-Google-Smtp-Source: AMsMyM4fsk5AFdpe5yRB9WUh3yq1GTsaBKphE1jwQ0VIvogXtXU/3O96k6V2XgCyNwjYQ2nARL+U8A==
X-Received: by 2002:a05:6830:90c:b0:66c:7109:bb5e with SMTP id v12-20020a056830090c00b0066c7109bb5emr16481607ott.231.1667849434121;
        Mon, 07 Nov 2022 11:30:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j24-20020a056808057800b00342ded07a75sm2730214oig.18.2022.11.07.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:30:33 -0800 (PST)
Received: (nullmailer pid 1459973 invoked by uid 1000);
        Mon, 07 Nov 2022 19:30:35 -0000
Date:   Mon, 7 Nov 2022 13:30:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
Message-ID: <20221107193035.GA1394942-robh@kernel.org>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103133900.1473855-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> DMA parent devices can define separate DMA busses via the "dma-ranges"
> and "#address-cells" and "#size-cells" properties. If the DMA bus has
> different cell counts than its parent, this can cause the translation
> of DMA address to fails (e.g. truncation from 2 to 1 address cells).

My assumption in this case was that the parent cell sizes should be 
increased to 2 cells. That tends to be what people want to do anyways 
(64-bit everywhere on 64-bit CPUs).

> Avoid this by stopping to search for DMA parents when a parent without
> a "dma-ranges" property is encountered. Also, since it is the DMA parent
> that defines the DMA bus, use the bus' cell counts instead of its parent
> cell counts.

We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec 
even says that because I hit that case.

Is this going to work for 'dma-device' with something like this?:

  bus@0 {
    dma-ranges = <...>;
    child-bus@... {
      dma-device@... {
      };
    };
  };

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v10:
> - new patch to avoid address truncation when traversing a bus hierarchy
>   with mismatching #address-cells properties
> 
> Example from Tegra194 (redacted for clarity):
> 
> 	reserved-memory {
> 		#address-cells = <2>;
> 		#size-cells = <2>;
> 		ranges;
> 
> 		framebuffer@0,0 {
> 			compatible = "framebuffer";
> 			reg = <0x2 0x57320000 0x0 0x00800000>;
> 			iommu-addresses = <&dc0 0x2 0x57320000 0x0 0x00800000>;
> 		};
> 	};
> 
> 	bus@0 {
> 		/* truncation happens here */
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges = <0x0 0x0 0x0 0x40000000>;
> 
> 		mc: memory-controller@2c00000 {
> 			#address-cells = <2>;
> 			#size-cells = <2>;

I think this is wrong. The parent should have more or equal number of 
cells.


> 			/*
> 			 * memory controller provides access to 512 GiB
> 			 * of system RAM (root of the DMA bus)
> 			 */
> 			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
> 		};
> 
> 		host1x@13e00000 {
> 			display-hub@15200000 {
> 				display@15200000 {
> 					interconnect-names = "dma-mem", ...;
> 					interconnects = <&mc ...>;
> 					memory-region = <&fb>;
> 				};
> 			};
> 		};
> 	};
> 
> During DMA address translation, the framebuffer address (0x257320000)
> will first be translated to the DMA parent's DMA bus, which yields the
> same value. After that, the current translation code will switch to the
> control bus of bus@0 and then the address will be truncated to
> 0x57320000 due to #address-cells = <1>.
> 
> The idea of this patch is to interrupt DMA address translation at &mc
> because it is the root of the DMA bus (i.e. its parent does not have a
> dma-ranges property) so that the control bus' #address-cells doesn't
> truncate the DMA address.
> 
>  drivers/of/address.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 14f137a21b0c..e2f45bdbc41a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -475,6 +475,7 @@ static u64 __of_translate_address(struct device_node *dev,
>  				  const __be32 *in_addr, const char *rprop,
>  				  struct device_node **host)
>  {
> +	bool dma = rprop && !strcmp(rprop, "dma-ranges");
>  	struct device_node *parent = NULL;
>  	struct of_bus *bus, *pbus;
>  	__be32 addr[OF_MAX_ADDR_CELLS];
> @@ -494,7 +495,12 @@ static u64 __of_translate_address(struct device_node *dev,
>  	bus = of_match_bus(parent);
>  
>  	/* Count address cells & copy address locally */
> -	bus->count_cells(dev, &na, &ns);
> +	if (dma) {
> +		na = of_bus_n_addr_cells(parent);
> +		ns = of_bus_n_size_cells(parent);
> +	} else {
> +		bus->count_cells(dev, &na, &ns);
> +	}
>  	if (!OF_CHECK_COUNTS(na, ns)) {
>  		pr_debug("Bad cell count for %pOF\n", dev);
>  		goto bail;
> @@ -515,7 +521,7 @@ static u64 __of_translate_address(struct device_node *dev,
>  		parent = get_parent(dev);
>  
>  		/* If root, we have finished */
> -		if (parent == NULL) {
> +		if (parent == NULL || (dma && !of_get_property(parent, "dma-ranges", NULL))) {
>  			pr_debug("reached root node\n");
>  			result = of_read_number(addr, na);
>  			break;
> @@ -536,7 +542,12 @@ static u64 __of_translate_address(struct device_node *dev,
>  
>  		/* Get new parent bus and counts */
>  		pbus = of_match_bus(parent);
> -		pbus->count_cells(dev, &pna, &pns);
> +		if (dma) {
> +			pna = of_bus_n_addr_cells(parent);
> +			pns = of_bus_n_size_cells(parent);
> +		} else {
> +			pbus->count_cells(dev, &pna, &pns);
> +		}
>  		if (!OF_CHECK_COUNTS(pna, pns)) {
>  			pr_err("Bad cell count for %pOF\n", dev);
>  			break;
> -- 
> 2.38.1
> 
> 
