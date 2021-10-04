Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9746C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 08:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1BEC6139F
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 08:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhJDIzs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 04:55:48 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56928
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229836AbhJDIzr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 4 Oct 2021 04:55:47 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3E2D340314
        for <linux-tegra@vger.kernel.org>; Mon,  4 Oct 2021 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633337638;
        bh=71ELWtPpZZISf+1vUEjSA6ln2kWthmOsT7ZPHlj/b1k=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=CHqVlJnss8yWo4sYbnPR0yjg3z+7broLzGUKlXQ51knKN8Xidj4uTHpXtTzQssR1d
         rnylqyJbbLjNfoWMcJD4An6sEtJgG9rxub5S/SqrfiD4horX1peCUnpsAbgqxCjo1X
         4HjySLtid9WBOfnzvIG6k2MzlhAB98YZeEM5DEY/63SCw3Ch/loMzRlcznACfq9UG/
         QqrSz+kwYKJondigw+73uNPW6nOhIOSB1Oen1+MNrGVhBvBpbTXG/2XMEYx/Rpr/gE
         FstlGIX1W5v3xPQx4TAq8XdeO9N7Bt5ZshKzKy4W9YLfqxZJHlYbKwNv5y9D00yTvR
         6TQ0y/6FLDkBA==
Received: by mail-lf1-f72.google.com with SMTP id i5-20020a056512224500b003fd2d62dcaaso3541301lfu.23
        for <linux-tegra@vger.kernel.org>; Mon, 04 Oct 2021 01:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=71ELWtPpZZISf+1vUEjSA6ln2kWthmOsT7ZPHlj/b1k=;
        b=u/iNE0TnKJeu5ZB813L/K67NHUc2wpd4EmGF1oY4GokoymjlK2refWavP/t+Vpp3sG
         QhBWJ6oy/yk2FIDfbf316nWybJyPjUMSOJ51bU/xmcoP42tAIvfpvAYlgB8pPzin/qUR
         5KLzJ4Y6Jkp6RV9YeYXGR9O74h1E4ow/0UVa2KiwzclZ1yAiBcSzqBqe6FMHWSspFNvq
         iAMhvRVmgAS4iOBWYnFHigFWWmFerUmKLC4fuArdYjuRYAwNw4jjYuuiUnZRrvCEQ0gx
         x5JIOfPyQUT38NQy0t9J6upAE8lX51eCnDbK8OccUbBl4HluZ9Cr3Qm/SupJl3v/bOS6
         wG5w==
X-Gm-Message-State: AOAM533ond42XOhuyPZBCQhvO6+4OJJMu8bE/yPhwK/e0wwTrG6tdqGm
        BgpiCwPHhW3Nm1YI4aghGjkYSEWRJQsjND7DU4nv4UDVoKPuCxOAb2V2FYV60KPsjwZuEI2DJ51
        2pwcCDwfLqYeBtURRPAIswPy771rvnINm3f8Q9aT0
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr15139264ljj.430.1633337637179;
        Mon, 04 Oct 2021 01:53:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfWdSl7B2R3oNBVCNp9YpdKqL28Kn2UfjHTQQDrfgBzJ0Tji2prhmuXItfwhgI0canmNE1Sw==
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr15139233ljj.430.1633337636857;
        Mon, 04 Oct 2021 01:53:56 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id f10sm1556552ljp.55.2021.10.04.01.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 01:53:56 -0700 (PDT)
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003013235.2357-1-digetx@gmail.com>
 <20211003013235.2357-4-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 3/4] memory: Add LPDDR2 configuration helpers
Message-ID: <b1454c93-375c-f4e3-0da7-291bfcc53897@canonical.com>
Date:   Mon, 4 Oct 2021 10:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003013235.2357-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/10/2021 03:32, Dmitry Osipenko wrote:
> Add helpers for reading and parsing standard LPDDR2 properties.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/jedec_ddr.h      | 21 +++++++++++++++++
>  drivers/memory/jedec_ddr_data.c | 42 +++++++++++++++++++++++++++++++++
>  drivers/memory/of_memory.c      | 34 ++++++++++++++++++++++++++
>  drivers/memory/of_memory.h      |  9 +++++++
>  4 files changed, 106 insertions(+)
> 
> diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
> index e59ccbd982d0..14cef272559e 100644
> --- a/drivers/memory/jedec_ddr.h
> +++ b/drivers/memory/jedec_ddr.h
> @@ -230,4 +230,25 @@ struct lpddr3_min_tck {
>  	u32 tMRD;
>  };
>  
> +union lpddr2_basic_config4 {
> +	u32 value;
> +
> +	struct {
> +		unsigned int arch_type : 2;
> +		unsigned int density : 4;
> +		unsigned int io_width : 2;
> +	} __packed;
> +};
> +
> +struct lpddr2_configuration {
> +	int arch_type;
> +	int density;
> +	int io_width;
> +	int manufacturer_id;
> +	int revision_id1;
> +	int revision_id2;
> +};
> +
> +const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id);
> +
>  #endif /* __JEDEC_DDR_H */
> diff --git a/drivers/memory/jedec_ddr_data.c b/drivers/memory/jedec_ddr_data.c
> index ed601d813175..1f214716ac45 100644
> --- a/drivers/memory/jedec_ddr_data.c
> +++ b/drivers/memory/jedec_ddr_data.c
> @@ -7,6 +7,7 @@
>   * Aneesh V <aneesh@ti.com>
>   */
>  
> +#include <dt-bindings/memory/lpddr2.h>
>  #include <linux/export.h>
>  
>  #include "jedec_ddr.h"
> @@ -131,3 +132,44 @@ const struct lpddr2_min_tck lpddr2_jedec_min_tck = {
>  	.tFAW		= 8
>  };
>  EXPORT_SYMBOL_GPL(lpddr2_jedec_min_tck);
> +
> +const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id)
> +{
> +	switch (manufacturer_id) {
> +	case LPDDR2_MANID_SAMSUNG:
> +		return "Samsung";
> +	case LPDDR2_MANID_QIMONDA:
> +		return "Qimonda";
> +	case LPDDR2_MANID_ELPIDA:
> +		return "Elpida";
> +	case LPDDR2_MANID_ETRON:
> +		return "Etron";
> +	case LPDDR2_MANID_NANYA:
> +		return "Nanya";
> +	case LPDDR2_MANID_HYNIX:
> +		return "Hynix";
> +	case LPDDR2_MANID_MOSEL:
> +		return "Mosel";
> +	case LPDDR2_MANID_WINBOND:
> +		return "Winbond";
> +	case LPDDR2_MANID_ESMT:
> +		return "ESMT";
> +	case LPDDR2_MANID_SPANSION:
> +		return "Spansion";
> +	case LPDDR2_MANID_SST:
> +		return "SST";
> +	case LPDDR2_MANID_ZMOS:
> +		return "ZMOS";
> +	case LPDDR2_MANID_INTEL:
> +		return "Intel";
> +	case LPDDR2_MANID_NUMONYX:
> +		return "Numonyx";
> +	case LPDDR2_MANID_MICRON:
> +		return "Micron";
> +	default:
> +		break;
> +	}
> +
> +	return "invalid";
> +}
> +EXPORT_SYMBOL_GPL(lpddr2_jedec_manufacturer);
> diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
> index d9f5437d3bce..8aa777f2a090 100644
> --- a/drivers/memory/of_memory.c
> +++ b/drivers/memory/of_memory.c
> @@ -298,3 +298,37 @@ const struct lpddr3_timings
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_lpddr3_get_ddr_timings);
> +
> +/**
> + * of_lpddr2_get_config() - extracts the lpddr2 chip configuration.
> + * @np: Pointer to device tree node containing configuration
> + * @conf: Configuration updated by this function
> + *
> + * Populates lpddr2_configuration structure by extracting data from device
> + * tree node. Returns 0 on success or error code on failure. If property
> + * is missing in device-tree, then the corresponding @conf value is set to
> + * -ENOENT.
> + */
> +int of_lpddr2_get_config(struct device_node *np,
> +			 struct lpddr2_configuration *conf)
> +{

Interface should be rather like of_get_ddr_timings() - allocate memory
for structure and return it. It's less error-prone.

> +	int err, ret = -ENOENT;
> +
> +#define OF_LPDDR2_READ_U32(prop, dtprop) \
> +	err = of_property_read_u32(np, dtprop, &conf->prop); \
> +	if (err) \
> +		conf->prop = -ENOENT; \
> +	else \
> +		ret = 0
> +
> +	/* at least one property should be parsed */
> +	OF_LPDDR2_READ_U32(manufacturer_id, "jedec,lpddr2-manufacturer-id");
> +	OF_LPDDR2_READ_U32(revision_id1, "jedec,lpddr2-revision-id1");
> +	OF_LPDDR2_READ_U32(revision_id2, "jedec,lpddr2-revision-id2");
> +	OF_LPDDR2_READ_U32(io_width, "jedec,lpddr2-io-width-bits");
> +	OF_LPDDR2_READ_U32(density, "jedec,lpddr2-density-mbits");
> +	OF_LPDDR2_READ_U32(arch_type, "jedec,lpddr2-type");

density and io-width are required properties in existing bindings, so
return code should not be overridden.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(of_lpddr2_get_config);
> diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
> index 4a99b232ab0a..95eccc251b04 100644
> --- a/drivers/memory/of_memory.h
> +++ b/drivers/memory/of_memory.h
> @@ -20,6 +20,9 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
>  const struct lpddr3_timings *
>  of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
>  			  struct device *dev, u32 device_type, u32 *nr_frequencies);
> +
> +int of_lpddr2_get_config(struct device_node *np,
> +			 struct lpddr2_configuration *conf);
>  #else
>  static inline const struct lpddr2_min_tck
>  	*of_get_min_tck(struct device_node *np, struct device *dev)
> @@ -46,6 +49,12 @@ static inline const struct lpddr3_timings
>  {
>  	return NULL;
>  }
> +
> +static int of_lpddr2_get_config(struct device_node *np,
> +				struct lpddr2_configuration *conf)
> +{
> +	return -ENOENT;
> +}
>  #endif /* CONFIG_OF && CONFIG_DDR */
>  
>  #endif /* __LINUX_MEMORY_OF_REG_ */
> 


Best regards,
Krzysztof
