Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5E6EB64D7
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Jun 2023 13:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjF1Nd6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Jun 2023 09:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjF1Ndv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Jun 2023 09:33:51 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F72BE6C;
        Wed, 28 Jun 2023 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sKQ2ZYLWE38psHNkLxXDehP/4I0z5AYg3CmqnrxtrtU=; b=oXNiyGZO4XpWSZpSv/b5IaW0dT
        eTeEUBpJDFw9OKseUwsaqRg4XkeUqb82kF8x4mfri1fKZLvGL7VmQjYrhM10INLLOMjRsIN7JjJLn
        6i+q4VQkdeNnf257lR8ocXftOHewGgX5Mkg10I07bjQ+6CDp1cjNIsx2PccsUz5MWB0AUX9lLto4+
        nOiQjKeAWZKgTsf/3RgE8c6o4e+Qrt7Z4fn2lt+g+4C6Dkqx+HsW1yRUuVqYTfUHtvnkx5LzvzWsh
        iQ/e1S0KJO8uN5rFG0/FDePVDVPE+CxgUvVO/ZtRsBmh6EPVx7NW65J9gaJ2yGqnSJkWXn3NcO2yq
        voE0Hmqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39496)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qEVIq-0007XG-0c;
        Wed, 28 Jun 2023 14:33:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qEVIp-0006nk-J1; Wed, 28 Jun 2023 14:33:47 +0100
Date:   Wed, 28 Jun 2023 14:33:47 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Revanth Kumar Uppala <ruppala@nvidia.com>
Cc:     andrew@lunn.ch, hkallweit1@gmail.com, netdev@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] net: phy: aquantia: Poll for TX ready at PHY system
 side
Message-ID: <ZJw2u6BIShe2ZGsw@shell.armlinux.org.uk>
References: <20230628124326.55732-1-ruppala@nvidia.com>
 <20230628124326.55732-3-ruppala@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628124326.55732-3-ruppala@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 28, 2023 at 06:13:25PM +0530, Revanth Kumar Uppala wrote:
> +	/* Lane bring-up failures are seen during interface up, as interface
> +	 * speed settings are configured while the PHY is still initializing.
> +	 * To resolve this, poll until PHY system side interface gets ready
> +	 * and the interface speed settings are configured.
> +	 */
> +	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PHYXS, MDIO_PHYXS_VEND_IF_STATUS,
> +					val, (val & MDIO_PHYXS_VEND_IF_STATUS_TX_READY),
> +					20000, 2000000, false);

What does this actually mean when the condition succeeds? Does it mean
that the system interface is now fully configured (but may or may not
have link)?

If that's correct, then that's fine. If it doesn't succeed because
the system interface doesn't have link, then that would be very bad,
because _this_ function needs to return so the MAC side can then be
configured to gain link with the PHY with the appropriate link
parameters.

The comment doesn't make it clear which it is.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
