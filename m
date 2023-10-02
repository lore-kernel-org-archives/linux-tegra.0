Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0A0E748FC
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Oct 2023 17:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbjJBRTK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjJBRTJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Oct 2023 13:19:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5BEA4;
        Mon,  2 Oct 2023 10:19:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A34AC433C8;
        Mon,  2 Oct 2023 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696267144;
        bh=88t4OjXZc51C0kAFUiyZuz+p9QqkBW4TTymGySGL8hM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mZz/G8G2cCmjBjDTxvwY+v3UITEye5iTWR1oqlw9njlUvHnWLgapUCUZ/T4BGRwD6
         zRPyXEbo97/QPyAbgdmexwg0XWm3w/J9asAnDT+w9+jjTI3hPSYFkgR8/2NN5ECOEH
         DEP24KdlohfaKrIiwmDA1v0iGIFbvGh9wA+BRxJK77vWG25NzZkLWGUA3rt+qR5ImK
         gt8pKhBAMRX41g/ueZCgj+83h6KHOpvFAIgW+O8ed3qx8uimmu+xrOhpJlvoD8hSwu
         eMkWPwddT7e78qqoYoBpw2iXqy6Xx+qKUlcOPQWjZxpHdwexi6kARHO1EG0/hNAZLU
         LEPsHkxk04PzA==
Received: (nullmailer pid 2034391 invoked by uid 1000);
        Mon, 02 Oct 2023 17:19:01 -0000
Date:   Mon, 2 Oct 2023 12:19:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ninad Malwade <nmalwade@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH V5 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Message-ID: <169626714151.2034330.4248654905752564697.robh@kernel.org>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
 <20230929103650.86074-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929103650.86074-2-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 29 Sep 2023 11:36:47 +0100, Jon Hunter wrote:
> From: Ninad Malwade <nmalwade@nvidia.com>
> 
> Convert the TI INA3221 bindings from the free-form text format to
> json-schema.
> 
> Note that the INA3221 input channels default to enabled in the chip.
> Unless channels are explicitly disabled in device-tree, input
> channels will be enabled.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/hwmon/ina3221.txt     |  54 ----------
>  .../devicetree/bindings/hwmon/ti,ina3221.yaml | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

