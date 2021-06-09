Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEFCC48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FD18613C7
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhFIQ7s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 12:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFIQ7r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 12:59:47 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A78EC061574;
        Wed,  9 Jun 2021 09:57:37 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c11so724691ljd.6;
        Wed, 09 Jun 2021 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rhOiM+M3O+xQ7gJUAO0buvm9+/qkjtxDLmSasWrNeIA=;
        b=vbWQGKIgLlLNsu7TqvM1fa0bIzlDPM/OcMU1di/aQVML/yM79J1wMVCebUfAdy6z2X
         WO3OrLJjxRyQ+PSp095q1DJ91171DJFAHxbWSk31k3jJzXKFUmImqrdT5nj5F9FWsgk2
         FdyUy5JMRvmTSf4i3IOB9ohsGkHuxIpBlO1I4nm7Qvj7nSpzWQBhxHOM6qDNmKDo+5xP
         X/0MxlUj5QGrpsz8nH4PQfS9fxwVPi0m4SGpW0rzm1JQrI2Vx9Y/7G7zsCSNZO8VGaNo
         7wsGH2YVEFJ23K4sT66gW2vOCB4dnd6eHo2/gQyJvkNHqMNuKG3wDSN0ZzDXeUbtGvik
         YF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rhOiM+M3O+xQ7gJUAO0buvm9+/qkjtxDLmSasWrNeIA=;
        b=Kk5iWYkS0u59y2Z98our9RlCBPBGk6m8trB63aQj6P51SBBjhdURqjTjM57XDhV3ro
         G+b1cb1VaAMPgqf4dqs96AT34m4SU1OLtyK0IyDXYw/iNz2g85RUT+NfaGbG1U/9fMTI
         XnOMya5u+Ds2gkz4LPNG3USBhGDASae3siDS0XVxkR5uYABADuTZAZVybQDwjuxyvSrj
         fJwDwovshDJJHF7SwFZ43pBypv4R3p+UDPvcI43d/6p4fdGo/hAXs2Ej7AXkZLRmLB10
         RiJOzqQywM0gWZgCIL+qtmX/6xrg+4EPl8pKuMeTxfcTA9NgERWM1+X8Clm/01u2h5T+
         5MaA==
X-Gm-Message-State: AOAM5310quvpQbFsLlTQsdl/T33AVLhEeyxj2rSMTkCURGjG833NeKv/
        xNvhmHBYcXNtgQ7XXkDHxIZ6NbHakNQ=
X-Google-Smtp-Source: ABdhPJys+RDo4Mo/fo3Pd9Vi+5a0dwi9/uP8gfbNx1Zzy/USczdnV0yb1ryAY89+66glxLsyT6WEIg==
X-Received: by 2002:a2e:b5c1:: with SMTP id g1mr648831ljn.83.1623257855139;
        Wed, 09 Jun 2021 09:57:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id n5sm37239lfq.107.2021.06.09.09.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 09:57:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a3110fbd-c4af-0317-5a6d-1f780f1dac91@gmail.com>
Date:   Wed, 9 Jun 2021 19:57:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.06.2021 16:19, Krzysztof Kozlowski пишет:
> On 09/06/2021 13:58, Dmitry Osipenko wrote:
>> 09.06.2021 14:28, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> When enabling the COMPILE_TEST Kconfig option, the Tegra memory
>>> controller can be built without ARCH_TEGRA being selected. However, the
>>> driver implicitly depends on some symbols pulled in via ARCH_TEGRA,
>>> which causes the build to break.
>>>
>>> Add explicit dependencies for OF_EARLY_FLATTREE and OF_RESERVED_MEM to
>>> the Tegra MC Kconfig option to make sure they are selected even if
>>> ARCH_TEGRA is not.
>>>
>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/memory/tegra/Kconfig | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>> index f9bae36c03a3..ecfb071fc4f4 100644
>>> --- a/drivers/memory/tegra/Kconfig
>>> +++ b/drivers/memory/tegra/Kconfig
>>> @@ -48,6 +48,8 @@ config TEGRA124_EMC
>>>  config TEGRA210_EMC_TABLE
>>>  	bool
>>>  	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
>>> +	select OF_EARLY_FLATTREE
>>> +	select OF_RESERVED_MEM
>>>  
>>>  config TEGRA210_EMC
>>>  	tristate "NVIDIA Tegra210 External Memory Controller driver"
>>>
>>
>> Will this work if CONFIG_OF is disabled?
> 
> Yeah, good question. That's why I propose "depends on". No issues with
> unmet or circular dependencies.

What about to add stub for RESERVEDMEM_OF_DECLARE() + CONFIG_OF_RESERVED_MEM=n?

diff --git a/include/linux/of.h b/include/linux/of.h
index d8db8d3592fd..9c2e71e202d1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1329,6 +1329,12 @@ static inline int of_get_available_child_count(const struct device_node *np)
 	return num;
 }
 
+#define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
+	static const struct of_device_id __of_table_##name		\
+		__attribute__((unused))					\
+		 = { .compatible = compat,				\
+		     .data = (fn == (fn_type)NULL) ? fn : fn }
+
 #if defined(CONFIG_OF) && !defined(MODULE)
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
 	static const struct of_device_id __of_table_##name		\
@@ -1338,10 +1344,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
 		     .data = (fn == (fn_type)NULL) ? fn : fn  }
 #else
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
-	static const struct of_device_id __of_table_##name		\
-		__attribute__((unused))					\
-		 = { .compatible = compat,				\
-		     .data = (fn == (fn_type)NULL) ? fn : fn }
+	_OF_DECLARE_STUB(table, name, compat, fn, fn_type)
 #endif
 
 typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 76e4a0fffba4..4de2a24cadc9 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -27,11 +27,11 @@ struct reserved_mem_ops {
 
 typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 
+#ifdef CONFIG_OF_RESERVED_MEM
+
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
-#ifdef CONFIG_OF_RESERVED_MEM
-
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 int of_reserved_mem_device_init_by_name(struct device *dev,
@@ -41,6 +41,10 @@ void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
 #else
+
+#define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
+	_OF_DECLARE_STUB(reservedmem, name, compat, init, reservedmem_of_init_fn)
+
 static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 					struct device_node *np, int idx)
 {


