Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC2C46CA1
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Oct 2023 11:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjJPLWa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Oct 2023 07:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjJPLW3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Oct 2023 07:22:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88CADC;
        Mon, 16 Oct 2023 04:22:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F070AC433C9;
        Mon, 16 Oct 2023 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697455347;
        bh=ttoJu22J3ZNoep78K/TkZ2dS7zV+ZRCWVhQETFFVyrg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QkJcaZmbFHlpred0dmnDL/LT+uT0GZqUUXDZOhhDrQ7s5wSmSkxTo4dSYYcfi56bF
         LHn5weAhYPOxV54sCMpgDJYeP3EkKii+zIRmoJavMIt0KL4NxgrQitqygaKF9XSqtO
         7YS5s9LF74bIZSsaXTY/EWJjjxavcXKzIFnG6AO7yYxlazOZRx3/cME0+5Fc/IBi4X
         uSlzddMlptIIC0nE00l/sZ5xOL5vr7DXiSao6ij6f6gahVzI4cXK9yilKRPdF/7NPi
         /DgNid/jRFxpF+LL53c9HLYv3MG1jxBo8Wki15y96JtwcLq5NOe0ULt/VmzmpJzZwQ
         +sTs+3ETa9g8A==
Date:   Mon, 16 Oct 2023 16:52:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mohan Kumar D <mkumard@nvidia.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V1 0/2] Support dma channel mask
Message-ID: <ZS0c7tvLLfkQhC+u@matsya>
References: <20231009063509.2269-1-mkumard@nvidia.com>
 <ZS0Z2G64rjrQTobg@matsya>
 <DM6PR12MB4435D21F738FF9CA2662D79EC1D7A@DM6PR12MB4435.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB4435D21F738FF9CA2662D79EC1D7A@DM6PR12MB4435.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16-10-23, 11:14, Mohan Kumar D wrote:
> Sure, will send rebased patch soon.
> 

Please **do ** not ** top post! and use a Linux friendly MUA to send
replies!

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org> 
> Sent: Monday, October 16, 2023 4:39 PM
> To: Mohan Kumar D <mkumard@nvidia.com>
> Cc: robh+dt@kernel.org; thierry.reding@gmail.com; Jonathan Hunter <jonathanh@nvidia.com>; Laxman Dewangan <ldewangan@nvidia.com>; krzysztof.kozlowski+dt@linaro.org; dmaengine@vger.kernel.org; linux-tegra@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH V1 0/2] Support dma channel mask
> 
> External email: Use caution opening links or attachments
> 
> 
> On 09-10-23, 12:05, Mohan Kumar wrote:
> > To reserve the dma channel using dma-channel-mask property for Tegra 
> > platforms.
> >
> > Mohan Kumar (2):
> >   dt-bindings: dma: Add dma-channel-mask to nvidia,tegra210-adma
> >   dmaengine: tegra210-adma: Support dma-channel-mask property
> 
> This fails to apply for me, pls rebase
> 
> --
> ~Vinod

-- 
~Vinod
