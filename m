Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E25CC6FA82
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Sep 2022 14:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbiIIOpa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Sep 2022 10:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbiIIOpQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Sep 2022 10:45:16 -0400
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA09C642CE;
        Fri,  9 Sep 2022 07:45:06 -0700 (PDT)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id C8BB826F000; Fri,  9 Sep 2022 16:45:04 +0200 (CEST)
Date:   Fri, 9 Sep 2022 16:45:04 +0200
From:   Janne Grunau <j@jannau.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH v8 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <20220909144504.GA4024@jannau.net>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
 <20220905170833.396892-2-thierry.reding@gmail.com>
 <20220908223247.GA3448766-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908223247.GA3448766-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-09-08 17:32:47 -0500, Rob Herring wrote:
> On Mon, Sep 05, 2022 at 07:08:29PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > This adds the "iommu-addresses" property to reserved-memory nodes, which
> > allow describing the interaction of memory regions with IOMMUs. Two use-
> > cases are supported:
> > 
> >   1. Static mappings can be described by pairing the "iommu-addresses"
> >      property with a "reg" property. This is mostly useful for adopting
> >      firmware-allocated buffers via identity mappings. One common use-
> >      case where this is required is if early firmware or bootloaders
> >      have set up a bootsplash framebuffer that a display controller is
> >      actively scanning out from during the operating system boot
> >      process.
> > 
> >   2. If an "iommu-addresses" property exists without a "reg" property,
> >      the reserved-memory node describes an IOVA reservation. Such memory
> >      regions are excluded from the IOVA space available to operating
> >      system drivers and can be used for regions that must not be used to
> >      map arbitrary buffers.
> > 
> > Each mapping or reservation is tied to a specific device via a phandle
> > to the device's device tree node. This allows a reserved-memory region
> > to be reused across multiple devices.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v8:
> > - include validation warning fixes that had crept into an unrelated patch
> > 
> > Changes in v7:
> > - keep reserved-memory.txt to avoid broken references
> > 
> > Changes in v6:
> > - add device phandle to iommu-addresses property in examples
> > - remove now unused dt-bindings/reserved-memory.h header
> > 
> >  .../reserved-memory/reserved-memory.yaml      | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> 
> Thanks for being persistent with this. It looks good to me.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I really don't like new common bindings with only 1 user, so I hope the 
> Asahi folks chime in here. Or really anyone else look at it.

The Asahi WIP display controller/processor driver uses this binding with 
static non 1:1 mappings. The binding is sufficient for our needs our 
needs.

Janne
