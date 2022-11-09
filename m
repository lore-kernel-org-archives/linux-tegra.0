Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192D5C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Nov 2022 10:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiKIKHV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Nov 2022 05:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiKIKHU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Nov 2022 05:07:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E8412622
        for <linux-tegra@vger.kernel.org>; Wed,  9 Nov 2022 02:07:19 -0800 (PST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1oshz6-0002ID-MV; Wed, 09 Nov 2022 11:07:04 +0100
Message-ID: <c8bcec17571a896610f225498655025ffc4b092a.camel@pengutronix.de>
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Date:   Wed, 09 Nov 2022 11:07:02 +0100
In-Reply-To: <CAL_JsqJ6XS7UZiEdjb2pyq_LmOLWBGcWHKsntTgjVFRi=4JMXw@mail.gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
         <20221103133900.1473855-3-thierry.reding@gmail.com>
         <20221107193035.GA1394942-robh@kernel.org> <Y2popxNd2uIdXmlf@orome>
         <CAL_JsqJ6XS7UZiEdjb2pyq_LmOLWBGcWHKsntTgjVFRi=4JMXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am Dienstag, dem 08.11.2022 um 10:25 -0600 schrieb Rob Herring:
> On Tue, Nov 8, 2022 at 8:33 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > 
> > On Mon, Nov 07, 2022 at 01:30:35PM -0600, Rob Herring wrote:
> > > On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > > 
> > > > DMA parent devices can define separate DMA busses via the "dma-ranges"
> > > > and "#address-cells" and "#size-cells" properties. If the DMA bus has
> > > > different cell counts than its parent, this can cause the translation
> > > > of DMA address to fails (e.g. truncation from 2 to 1 address cells).
> > > 
> > > My assumption in this case was that the parent cell sizes should be
> > > increased to 2 cells. That tends to be what people want to do anyways
> > > (64-bit everywhere on 64-bit CPUs).
> > > 
> > > > Avoid this by stopping to search for DMA parents when a parent without
> > > > a "dma-ranges" property is encountered. Also, since it is the DMA parent
> > > > that defines the DMA bus, use the bus' cell counts instead of its parent
> > > > cell counts.
> > > 
> > > We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec
> > > even says that because I hit that case.
> > > 
> > > Is this going to work for 'dma-device' with something like this?:
> > > 
> > >   bus@0 {
> > >     dma-ranges = <...>;
> > >     child-bus@... {
> > >       dma-device@... {
> > >       };
> > >     };
> > >   };
> > > 
> > > > 
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > Changes in v10:
> > > > - new patch to avoid address truncation when traversing a bus hierarchy
> > > >   with mismatching #address-cells properties
> > > > 
> > > > Example from Tegra194 (redacted for clarity):
> > > > 
> > > >     reserved-memory {
> > > >             #address-cells = <2>;
> > > >             #size-cells = <2>;
> > > >             ranges;
> > > > 
> > > >             framebuffer@0,0 {
> > > >                     compatible = "framebuffer";
> > > >                     reg = <0x2 0x57320000 0x0 0x00800000>;
> > > >                     iommu-addresses = <&dc0 0x2 0x57320000 0x0 0x00800000>;
> > > >             };
> > > >     };
> > > > 
> > > >     bus@0 {
> > > >             /* truncation happens here */
> > > >             #address-cells = <1>;
> > > >             #size-cells = <1>;
> > > >             ranges = <0x0 0x0 0x0 0x40000000>;
> > > > 
> > > >             mc: memory-controller@2c00000 {
> > > >                     #address-cells = <2>;
> > > >                     #size-cells = <2>;
> > > 
> > > I think this is wrong. The parent should have more or equal number of
> > > cells.
> > 
> > I was half suspecting that. The reason why I hesitated is that I recall
> > having the opposite discussion a while ago when we were adding bus@0 to
> > 64-bit Tegra devices. We had at some point (probably around Tegra114 or
> > Tegra124, 32-bit ARM chips that support LPAE) started to set #address-
> > cells = <2> precisely because the CPU could address more than 32-bit
> > addresses. We then did the same thing transitioning to 64-bit ARM. When
> > we then started discussing bus@0, someone (might have been you) had
> > argued that all these peripherals could be addressed with a single cell
> > so there'd be no need for #address-cells = <2>, so then we went with
> > that.
> 
> I may have not thinking about the DMA side of things.
> 
> > Reverting back to #address-cells = <2> is now going to cause quite a bit
> > of churn, but I guess if it's the right thing, so be it.
> > 
> > Another possible alternative would be to move the memory-controller node
> > from the bus@0 to the top-level. Not sure if that's any better.
> 
> I stumbled upon 'ibm,#dma-address-cells' and 'ibm,#dma-size-cells'
> while reviewing this. Those seem to be for the same purpose AFAICT. We
> could consider adding those (w/o 'ibm') to handle this situation.

I would appreciate this. We have the same situation on some of the NXP
i.MX8 SoCs right now: all the MMIO is addressable with 32bit, so all
the busses have a single address and size cell right now, but we would
need to extend the address-cells to 64bit just to properly describe the
DMA addressing capabilities of the devices.

Regards,
Lucas

