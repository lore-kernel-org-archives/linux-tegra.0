Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2861CC433DB
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 19:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E838B64E9C
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 19:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhBHT3g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 14:29:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:40234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236292AbhBHT3K (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Feb 2021 14:29:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2888F64E85;
        Mon,  8 Feb 2021 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612812509;
        bh=FhPBn+xAIyaRb80jUQ/+VCEBlRmAWGAiuwuWeZKEAw0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bvWVE4rMtWiJ+5Ud0GaW89qsRs0OrwsT4pVsImCFxcf+ZGl5xFL/kVQwMynV0/qsn
         fclR22jSfKUskWjVUh7udHhdDkwgdXdy89bmlwijaMwPyxCB08UA26YfAP+1jjVJ1d
         lNMa9RrWLGYq8Ymzl+tr4eIxyhSNBAHktbh08HwConCJPU7Y04DyJVYrzOWRNSKADK
         HajbPDlcsrsFvysMhZ7i0kDiJZfwPVdTtFzG3V7I5v4CPBw352Y4ZhfTlHgbTJPcOo
         Eo9x8MG7nWkiAgshfrkn4HLquMYyfPKZ0SDOwrg1l1NKibDPlzEAd4eOs4Iy8z0KVY
         4xfWHl2o4XGrA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120073414.69208-2-jckuo@nvidia.com>
References: <20210120073414.69208-1-jckuo@nvidia.com> <20210120073414.69208-2-jckuo@nvidia.com>
Subject: Re: [PATCH v7 01/14] clk: tegra: Add PLLE HW power sequencer control
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org,
        JC Kuo <jckuo@nvidia.com>, Thierry Reding <treding@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, kishon@ti.com, mturquette@baylibre.com,
        robh@kernel.org, thierry.reding@gmail.com
Date:   Mon, 08 Feb 2021 11:28:27 -0800
Message-ID: <161281250769.76967.1356115606522577203@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting JC Kuo (2021-01-19 23:34:01)
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
