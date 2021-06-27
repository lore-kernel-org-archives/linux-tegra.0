Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689AAC49EA6
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 17:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43FFD619B2
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 17:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhF0RnH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 13:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhF0RnH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 13:43:07 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E055C061574;
        Sun, 27 Jun 2021 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=AA69vzxih11U5MuE/GmZroNFCJKvt8rIWMvFWoHd/pg=; b=NUJ9r/OQBsU6kssvppMUexY85C
        Y/C0ANFZG76q0ZXnGYJyjCyDIvxje0CbVFy1zi+EDE5vLgh8uybYPOezdRuLp/fLtWwYCl0eiXcqv
        dPqZPrq+5CG7AjJ8YkzZaxCRKTc7/q019hzcfkrrlwrFLNl2N+3whXtXd9QlYQeBfNkWNBr2j3Mna
        TNHLtLeIVfH2xVgoTT0vliOW4Z7v/eFqpGWz9j+Ojj7E/B7ZoO0oGusQ96CaTpy81+zTxpzlW4bur
        2/Ww4opt2DuHMicF3zPOovlLitqQIN9cC3sDDDCAgrmu7c7qtGcKb+lsSmKKmmZGgtwaGmBa/IgQW
        1koBfiqA==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxYlu-005wNY-4J; Sun, 27 Jun 2021 17:40:42 +0000
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-3-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <306ce8c3-8919-f2aa-5fbd-7ac9381e70c2@infradead.org>
Date:   Sun, 27 Jun 2021 10:40:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625235532.19575-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/25/21 4:55 PM, Dipen Patel wrote:
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> new file mode 100644
> index 000000000000..394e112f7dfb
> --- /dev/null
> +++ b/drivers/hte/Kconfig
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig HTE
> +        bool "Hardware Timestamping Engine (HTE) Support"
> +        help
> +          Hardware Timestamping Engine (HTE) Support.
> +
> +          Some devices provide hardware timestamping engine which can timestamp
> +	  certain device lines/signals in realtime. This way to provide
> +	  hardware assisted timestamp to generic signals like GPIOs, IRQs lines
> +	  comes with benefit for the applications like autonomous machines
> +	  needing accurate timestamping event with less jitter.
> +
> +	  This framework provides a generic interface to such HTE devices
> +          within the Linux kernel. It provides an API to register and
> +	  unregister a HTE provider chip, configurable sw buffer to
> +	  store the timestamps, push the timestamp from the HTE providers and
> +	  retrieve timestamps for the consumers. It also provides means for the
> +	  consumers to request signals it wishes to hardware timestamp and
> +	  release them if not required.
> +
> +          If unsure, say no.

semi-bot:

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


thanks.
-- 
~Randy

