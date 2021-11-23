Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50081C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 05:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhKWFwV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 00:52:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:35366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230036AbhKWFwV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 00:52:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C82060174;
        Tue, 23 Nov 2021 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637646553;
        bh=1pN+MGPYLaxOv215SX069r2aoliyKZqf2lL8USnoshA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oB6o+b7FcB51m3tNOvO3ouaG3Uo70zHal+wsEztKjQp64468JblEBComKh557HpwD
         cQXoUz6Cam0cATTfoA40/rw2Z5rDGAEdA5vhWWIpfZ6ZeHUSl7evPLEv8C1ZAcVMkf
         ZqelToFpTpEUo5zdPzBLEuew6DTK3wAuZhMbyT6H5hSINM9GLwPE9vAO9AwKnSjt8k
         KBcLDgrd7fZeXwZkrDya75o86OzkV8Y6T66AYjPXsrxk0zkde6G1kOZ9enK61T2F4V
         ZjXbYzjnWWGidfZcyJCiiO/KG1qttFJRXhRWHXduBOlwgckYe8tEtvtuipRQWmUAOx
         ovXFpKqnc6s4w==
Date:   Tue, 23 Nov 2021 11:19:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        ~okias/devicetree@lists.sr.ht, Thierry Reding <treding@nvidia.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Tegra194 P2U convert to YAML
Message-ID: <YZyA1L/6/xMpYzwR@matsya>
References: <20211031113236.29712-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031113236.29712-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-10-21, 12:32, David Heidelberg wrote:
> Convert Tegra194 P2U binding to the YAML format.

Applied, thanks

-- 
~Vinod
