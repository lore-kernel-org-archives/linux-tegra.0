Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5B9C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 17:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239688AbiEXRDX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 13:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbiEXRDW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 13:03:22 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7EE77F12
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Lz0otVyUtFXeohL1/7oRGSZAWt7yYFABxglmdvZ5jn4=; b=r5wTJ1eLnvr5r4Aw8+N5/aiNA9
        NyFwjqE4/VqIgtknbWV2et8W4ov0aoy7oC0ateRWbaJpbDSLuD451tZ+sl/x1alvcpniqdHZr/0/j
        hCvgpo0yvJNVnVJGowr94WDRqpOWj/1TFpCIgNhA6F7EZkVf6Cq5zzLCUUYV5OrBtV3Hc4ysvVXw+
        wgUw04ucuCysx92N9fUj8Rf4OSuwGMspjsGHxB5OmMMMDs+3bQHkxUclUFFFgVSz2bBc6g5KleXwx
        wLo3ywMoF0A127DYjWiI9DVrBAy1P6UJrTApVOXZVInhjj7k5g1zUMwMGsscRU0duSJ8miyEz8ybi
        kBT4zW1w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60824)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ntXw6-0003kD-5w; Tue, 24 May 2022 18:03:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ntXw4-00038J-Fu; Tue, 24 May 2022 18:03:08 +0100
Date:   Tue, 24 May 2022 18:03:08 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Message-ID: <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
> Hi Ard,
> 
> On 28/03/2022 14:47, Ard Biesheuvel wrote:
> > The Spectre-BHB mitigations were inadvertently left disabled for
> > Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> > that case. So fix that.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >   arch/arm/mm/proc-v7-bugs.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> > index 06dbfb968182..fb9f3eb6bf48 100644
> > --- a/arch/arm/mm/proc-v7-bugs.c
> > +++ b/arch/arm/mm/proc-v7-bugs.c
> > @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
> >   {
> >   	if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
> >   		cpu_v7_spectre_v2_init();
> > +	cpu_v7_spectre_bhb_init();
> >   }
> >   void cpu_v7_bugs_init(void)
> 
> 
> Since this patch has been merged, I am seeing a ton of messages when booting
> Linux on tegra124-jetson-tk1 ...
> 
> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
> [ 1233.328270] CPU1: Spectre BHB: using loop workaround

Now that you mention this, I vaguely remember some email on the list a
while ago about this being caused by something like cpuidle - but I'm
unable to find it now.

> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/

That was probably it.

We can't really do this for the other print, because the system status
can change as a result of CPUs being brought online. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
