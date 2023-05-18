Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73970C7EE22
	for <linux-tegra@archiver.kernel.org>; Thu, 18 May 2023 09:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjERJoo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 May 2023 05:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjERJom (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 May 2023 05:44:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89404198A;
        Thu, 18 May 2023 02:44:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15749609AE;
        Thu, 18 May 2023 09:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B89C433D2;
        Thu, 18 May 2023 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684403080;
        bh=/lPdoMwbDkyCVE1IkFVr7tXpIhHSbQvwRgh7HQACvq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tvSraOSmfZtc12HnYo4ihQ+iP9cVssbhyZhi8O7C33vWtym52vNlWe00pMFqzE9FF
         Py7JkQPzXAOLnL4bjzxDRRw91+VTHkukV8uWb0zz8YsL8XbJphn9whZJmxSurGOSyO
         Regydb0PS0jFKr7p79Td3CWUrtTqfhxVs0TatPkJZqBHdgsmX7wHAEYFoRkV2fVqd3
         0Lysl15Ru6np2E6GmGtRkDD+STlJmpFrqjfyhwrpV2kT2Hfa/ITd20/MdmxICfRZeH
         MLGHzxxXm/fSPC7XVD/JBYj5srtUDDnLz0lNEaUoGcCIhNEIm6MyrxlweVWiSZpP+1
         BYbtEEWwQxOQA==
Date:   Thu, 18 May 2023 10:44:34 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v6 5/5] mfd: tps6586x: register restart handler
Message-ID: <20230518094434.GD404509@google.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-5-af44a4cd82e9@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327-tegra-pmic-reboot-v6-5-af44a4cd82e9@skidata.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 09 May 2023, Benjamin Bara wrote:

> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> There are a couple of boards which use a tps6586x as
> "ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
> For these, the only registered restart handler is the warm reboot via
> tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
> be ensured that VDE is enabled (which is the case after a cold reboot).
> For the "normal reboot", this is basically the case since 8f0c714ad9be.
> However, this workaround is not executed in case of an emergency restart.
> In case of an emergency restart, the system now simply hangs in the
> bootloader, as VDE is not enabled (because it is not used).
> 
> The TPS658629-Q1 provides a SOFT RST bit in the SUPPLYENE reg to request
> a (cold) reboot, which takes at least 20ms (as the data sheet states).
> This avoids the hang-up.
> 
> Tested on a TPS658640.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

I plan to apply the whole set once you have all required Acks.

For my own reference (apply this as-is to your sign-off block):

Acked-for-MFD-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
