Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AAEC7618A
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Mar 2023 11:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjCTLfo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Mar 2023 07:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCTLfo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Mar 2023 07:35:44 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B1412058
        for <linux-tegra@vger.kernel.org>; Mon, 20 Mar 2023 04:35:39 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9C1F86000871;
        Mon, 20 Mar 2023 11:35:35 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id Cr-K0CIzyMNv; Mon, 20 Mar 2023 11:35:32 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D60EE6003434;
        Mon, 20 Mar 2023 11:35:32 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1679312132;
        bh=j4GUA+D08c1fSLySupRSzz1aenuvH2Z1CAqM8XGDu3c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=LcxHOivmvnMlgPhdVaI8+8YpCDqYkh0kuqZDNOjBK3HGJQ8US5qFnWY3AX7Oz8b4+
         0jX3amHVnx4bEuJIJQqfdyi8VdXCl4uJGY4oukahEdViAJ3nBKsZHJ5LoOsxX2uAna
         QlM6jIB6EJsp7h+oWgyA9xd7BhkKmG1QDCl2g7Ew=
Received: from wslaptop (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4B32E360071;
        Mon, 20 Mar 2023 11:35:32 +0000 (WET)
Date:   Mon, 20 Mar 2023 11:34:03 +0000
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, arnd@arndb.de,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <20230320113403.4oyp7anjuh7azy6q@wslaptop>
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
 <a464381c-bdff-4b8e-6e41-229fbf332372@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a464381c-bdff-4b8e-6e41-229fbf332372@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 20, 2023 at 07:50:27AM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2023 20:42, Diogo Ivo wrote:
> > +	emc: external-memory-controller@7001b000 {
> 
> Node names should be generic, so memory-controller.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Check your code for warnings (dtc, dtbs_check). Node with unit address
> requires reg or ranges.
> 
> Best regards,
> Krzysztof


Hello,

The external-memory-controller node is declared in tegra210.dtsi, so
here I am just adding more properties to it.

Best regards,
Diogo
