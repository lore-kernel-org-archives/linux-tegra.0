Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDC0C63797
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Jan 2023 18:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240332AbjALSFG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbjALSDm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Jan 2023 13:03:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833075D6B1;
        Thu, 12 Jan 2023 09:28:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB9B620B9;
        Thu, 12 Jan 2023 17:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AACC433EF;
        Thu, 12 Jan 2023 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673544481;
        bh=wFw13Nu3ncr/oEbKb/ffo480FdbGpZHX50m/K4RKsJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=otwY419mR0l7/xe7g8iyDAjV/R9ilQUPc/X2xlbE+X9bFvOR90xTdup+DBJXKDNUd
         I9gH4MqF7VdzcHLhaFwa5jBUZp9tE4EdyXgMZ5zpatnevh2kTrifK1EJgdze3suCNC
         MA5tspzwWjx+wQ7thH0xho8y7mwGUHyrFdj+/cPg1YhxU+j16MrC9n9b0IbK97mQYi
         7Dym9tTFXk4jZlqpjqMWfmvxgD4x86St7rFP/jdjt64qLSUm2IOCfQbtcPYUNmYaVx
         Wr0qFeOyg5HRyqNCofeEGGfIaZgIQWae7wZfUpsa7YFeJEvOgAGCP655AgDDt6l4Vm
         QILylIPLnNwJA==
Date:   Thu, 12 Jan 2023 22:57:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com
Subject: Re: [PATCH V6 4/6] phy: tegra: xusb: Disable trk clk when not in use
Message-ID: <Y8BDHVIeKJjVcLng@matsya>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
 <20230111110450.24617-5-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111110450.24617-5-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-01-23, 11:04, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Pad tracking is a one-time calibration for Tegra186 and Tegra194.
> Clk should be disabled after calibration.
> 
> Disable clk after calibration.
> While at it add 100us delay for HW recording the calibration value.

I have applied these two, somehow replied to an older thread..

Sorry for the noise

-- 
~Vinod
