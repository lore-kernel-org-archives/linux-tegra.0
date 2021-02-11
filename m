Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F08FC433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 03:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54EE064EC0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 03:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBKDHI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Feb 2021 22:07:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:57958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhBKDHH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 22:07:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C9364E2E;
        Thu, 11 Feb 2021 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613012786;
        bh=T95zpwNhmbI5C/Y3yzoaQbujINFDdaissul65TKmVbc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LogmMHTvL7RtJ8jHBDboQ0cANK9qOLCWsXFNT3j2o2pz/oxdOgJD+9F+gMJD4xkD0
         /w43iW6qrR8UALcJhIGbmdPwEWGy7fHJUSi6PU7zaiRamdWxhtuDfeZCzaCsuteLFR
         f7pD55EQJoPXM3l3+Wj9zx5t0b0S2EPEd2UBOJfw7tA53oKe2wsW3ELHPQI+vU0Upi
         nIBISEOgG6izgUgqZ5LpUYTdfwyVZKbAuzVG83vzV5K8kQf7KEDCJfMdePwJEPH7gj
         vhmwVaDy59Ot37TIvkefPAfxLOJOpriQmnGnSIJAJmupQEesbiJgR/IMInwDgeDgIh
         enGkU/mEOWafQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210119085546.725005-2-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com> <20210119085546.725005-2-jckuo@nvidia.com>
Subject: Re: [PATCH v6 01/15] clk: tegra: Add PLLE HW power sequencer control
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, kishon@ti.com, robh@kernel.org,
        thierry.reding@gmail.com
Date:   Wed, 10 Feb 2021 19:06:25 -0800
Message-ID: <161301278546.1254594.2076696450962679318@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting JC Kuo (2021-01-19 00:55:32)
> PLLE has a hardware power sequencer logic which is a state machine
> that can power on/off PLLE without any software intervention. The
> sequencer has two inputs, one from XUSB UPHY PLL and the other from
> SATA UPHY PLL. PLLE provides reference clock to XUSB and SATA UPHY
> PLLs. When both of the downstream PLLs are powered-off, PLLE hardware
> power sequencer will automatically power off PLLE for power saving.
>=20
> XUSB and SATA UPHY PLLs also have their own hardware power sequencer
> logic. XUSB UPHY PLL is shared between XUSB SuperSpeed ports and PCIE
> controllers. The XUSB UPHY PLL hardware power sequencer has inputs
> from XUSB and PCIE. When all of the XUSB SuperSpeed ports and PCIE
> controllers are in low power state, XUSB UPHY PLL hardware power
> sequencer automatically power off PLL and flags idle to PLLE hardware
> power sequencer. Similar applies to SATA UPHY PLL.
>=20
> PLLE hardware power sequencer has to be enabled after both downstream
> sequencers are enabled.
>=20
> This commit adds two helper functions:
> 1. tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
>    PLLE hardware sequencer at proper time.
>=20
> 2. tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
>    check whether PLLE hardware sequencer has been enabled or not.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
