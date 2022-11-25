Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF4BC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 13:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiKYNAR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 08:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiKYM7u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 07:59:50 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F8C4D5FC;
        Fri, 25 Nov 2022 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669381179; x=1700917179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvuglFeB3E8qOHc4hSxCFvXoeA7UNSrrSaSwNuZUUWI=;
  b=R7whgxIYQ/Uyr4GcrRYnzfBgsXz7lFX8r+eLFS3HeVAgoVND8OoUuV22
   vaETzBWz8uEmDw2ayDvOIdTMTwpUze+x5cMmKFV2mzfl9FhabfU+IYRVn
   1Y/v8sBRfdIS1yATv77jY3iHU07r+oqH9yt5Y1/96BkpIBpop3YvrA+53
   8kWhE4OJ/CeIUsWPXcYwYGZpu21awbsFgZ37dHpp2qXZgd59bSQyHsGCS
   WRVFTLedYjctWo7iQ270I7vPy/Z0rB/CU4T6nrU4JWKRfoIT6JfPNUuOi
   M5wdokNBeqTwBw2VjPGHaDGn03L58ct/8RDUpcCFagwLKiEjcVvLxbTFw
   w==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="190537280"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 05:59:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 05:59:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 05:59:36 -0700
Date:   Fri, 25 Nov 2022 12:59:18 +0000
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <Y4C8JvSQuNZiDmJb@wendy>
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
 <Y4C4Cp1D+QEKWiaf@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4C4Cp1D+QEKWiaf@wendy>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 25, 2022 at 12:41:46PM +0000, Conor Dooley wrote:
> Hi Thierry,
> 
> On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Convert the Tegra XUSB controller bindings from the free-form text
> > format to json-schema.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> > +        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> > +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> > +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> 
> This seems to be breaking dt_binding_check in today's linux-next:
> FATAL ERROR: Can't generate fixup for reference to path &{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}
> 
> Am I missing something? My dt-schema is today's main.

Apologies for the noise, it appears to have broken several days ago and
is not caused by this patch.

I'll go bisect :)



