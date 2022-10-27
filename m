Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB03FA3742
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 11:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbiJ0LFw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 07:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbiJ0LFu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 07:05:50 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6D5DD3B8
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 04:05:49 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id v13-20020a17090a6b0d00b0021332e5388fso1128058pjj.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEwRhdQJcdc4xZoLtd367feLEMlETLt1yb2FFn/p5XA=;
        b=YP/O5W/XhBIROQVWOlPHb/VksUkA9NLH4PIHnj1VW/THheH22UE4AFCOq/aM/RsZpt
         ldzum9OUFrBGbRAwl8jeCOaw7knYL7AEWs158PnAf27trfSec3WI/JeZrGmc887v/WwV
         KqhdVy8rlClRc0To4fOfeHMCofppIYlmVTD4qlE4CwNF0S3ptrOOci9HQPZCwLC1vCw4
         V4qRpKaCW5O8VTsk+/6xfFbd6/1VRGRbE59vjLMnUg65qC7FPrjI3m5VVtiAR47i6CvJ
         8nog5gjiQbUslWsZZOsmBDeSG5KDPjbIG2lVeJbSBQjkvcqtJC8UYkUuh2R1c2Eeydzn
         GQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEwRhdQJcdc4xZoLtd367feLEMlETLt1yb2FFn/p5XA=;
        b=BpqWvIQp6lJCJP7Ce95WhqAPX+9NT9GqVh6vnn3Zqbafhds5BzdAiy8UoF2VJ2h8If
         xW0vUF9M5NpGWxBNHuqzaS0RGc3Aug2mbF/lQJuQ3ROPxibCYpQXjqNeoUUv9DQuV2TV
         ZJydfSFgEx95DaVtFH+3k2u4vwym3AeBVId4Z9P/hZdtPSywfQ2zCH4IQKBJ1SxdGC/Y
         uxSpz3X8WQf9mP/yhT9jYp5nJ6S/F+8DRFFYGpXp0LzWbH1Yr2ptohEgxY9ZwvCVphCW
         /W/5Gi6gxEmUcWE2jNcdfpdG8nz0joc5iFI9p6L1lhMkZ86Zkxr4BvRDcnEqOX9V0N9q
         xbmQ==
X-Gm-Message-State: ACrzQf2rDNKEurNIEteGfJCQZYZLNG4X0LOzrPgDnHQA6DpfhpD7l58T
        btGw5wDtxpJkX1SkeW/19/+L
X-Google-Smtp-Source: AMsMyM7kzSGbqXsxZ1bo/hrYc02Ge8C4ogqMxcjTXdPJQ+1Awiz3BfhKLShVOsvOX7HAavrf04IveQ==
X-Received: by 2002:a17:902:ebc4:b0:186:b32c:4ce5 with SMTP id p4-20020a170902ebc400b00186b32c4ce5mr17564012plg.74.1666868748462;
        Thu, 27 Oct 2022 04:05:48 -0700 (PDT)
Received: from thinkpad ([117.202.186.162])
        by smtp.gmail.com with ESMTPSA id iz15-20020a170902ef8f00b00186a1b243basm916705plb.226.2022.10.27.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 04:05:47 -0700 (PDT)
Date:   Thu, 27 Oct 2022 16:35:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bjorn Helgaas <helgaas@kernel.org>, lpieralisi@kernel.org,
        Vidya Sagar <vidyas@nvidia.com>, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, robh@kernel.org, kw@linux.com,
        bhelgaas@google.com, treding@nvidia.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH V1] PCI: dwc: Use dev_info for PCIe link down event
 logging
Message-ID: <20221027110540.GB76627@thinkpad>
References: <20221018164329.GA3808783@bhelgaas>
 <8670e757-7275-57eb-3f5c-0a21ba354e37@nvidia.com>
 <6bba0876-3002-0614-5aeb-c4cf901938ca@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bba0876-3002-0614-5aeb-c4cf901938ca@codethink.co.uk>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 27, 2022 at 10:55:34AM +0100, Ben Dooks wrote:
> On 26/10/2022 12:39, Jon Hunter wrote:
> > Hi Lorenzo,
> > 
> > On 18/10/2022 17:43, Bjorn Helgaas wrote:
> > > On Tue, Oct 18, 2022 at 07:21:54AM +0100, Jon Hunter wrote:
> > > > Hi Bjorn,
> > > > 
> > > > On 13/09/2022 11:12, Vidya Sagar wrote:
> > > > > Some of the platforms (like Tegra194 and Tegra234) have open slots and
> > > > > not having an endpoint connected to the slot is not an error.
> > > > > So, changing the macro from dev_err to dev_info to log the event.
> > > > > 
> > > > > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-designware.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c
> > > > > b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > index 650a7f22f9d0..25154555aa7a 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > @@ -456,7 +456,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
> > > > >        }
> > > > >        if (retries >= LINK_WAIT_MAX_RETRIES) {
> > > > > -        dev_err(pci->dev, "Phy link never came up\n");
> > > > > +        dev_info(pci->dev, "Phy link never came up\n");
> > > > >            return -ETIMEDOUT;
> > > > >        }
> > > > 
> > > > 
> > > > Are you OK to take this change?
> > > 
> > > When this came up, Lorenzo was in the middle of a big move and I was
> > > covering for him while he was unavailable.  But he's back, and I'm
> > > sure he will resolve this soon.
> > > 
> > > Personally I'm OK either way.
> > > 
> > > Bjorn
> > 
> > 
> > Can we come to a conclusion on this?
> > 
> > We have tests that fail when errors/warning messages are reported. We
> > can choose to ignore these errors, but given that this is not an error
> > in this case, we were thinking it is better to make it informational.
> 
> Is there any hardware presence detect available to just avoid even
> trying to bring a link up on an disconnected port?
> 

PRSNT pin is not available on all form factors sadly.

Thanks,
Mani

> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

-- 
மணிவண்ணன் சதாசிவம்
