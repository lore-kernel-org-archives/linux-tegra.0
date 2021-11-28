Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E160C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Nov 2021 01:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238710AbhK1B4w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 20:56:52 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:43976 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231414AbhK1Byv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 20:54:51 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1s0R03dpz9Y;
        Sun, 28 Nov 2021 02:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1638064295; bh=XXqu+b6UiD+MLKU5eInDuEC+rhZ5rl9bJiiowoQlAOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ONW8G5Q0veQMkJDnhs3MYmBnsUBSZjxGDMFQCEmycQJtMQagThCcxzy7Q04sudKBr
         qKAuJkhRkgOIFPHR7kmftaI2ahi78VIHesJvVDOGF75wcaGjFAILjuFP9v0Jdhw7pM
         M9RXhBq+nAuHbgOsmS8F7faj5DM6SGZo56EqUT7aYW2CArz6TdVyHxm2LBu8D0Idhd
         DYAeaUQSDrjvow4isHIHn1zcvF+cgOxz3rHgnirTgKkrNySz4ZnMKxbqy+Nrq9TK8w
         81wijopMIYtmfr7uFjf0ioRRNZlAR4X1+WZOui+HBNnfFR2TsVJNfNTlVimje1AQtl
         083bRJXJ38VNA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Sun, 28 Nov 2021 02:51:33 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] ARM: tegra: Add device-tree for ASUS
 Transformer Prime TF201
Message-ID: <YaLgpb2hQGzQXrej@qmqm.qmqm.pl>
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211127142327.17692-6-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Nov 27, 2021 at 05:23:18PM +0300, Dmitry Osipenko wrote:
> From: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> Add device-tree for ASUS Transformer Prime TF201, which is NVIDIA
> Tegra30-based tablet device.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |    1 +
>  .../boot/dts/tegra30-asus-lvds-display.dtsi   |   46 +
>  arch/arm/boot/dts/tegra30-asus-tf201.dts      |  623 ++++++
>  .../dts/tegra30-asus-transformer-common.dtsi  | 1741 +++++++++++++++++
>  4 files changed, 2411 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30-asus-tf201.dts
>  create mode 100644 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi

I think the common.dtsi is combined from all the DT authors, so they all
should be mentioned in the co-developed/signed-off lines. (Or maybe just
split the common part out if you want to be more specific in assigning
credits?)


> +	i2c@7000c400 {
> +		/* Atmel MXT768E touchscreen */
> +		touchscreen@4d {
[...]
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;
[...]

Nit: This could use 'interrupts-extended' as it's more readable, I think.
(There are similar cases in other DTs.)

> +	uartb: serial@70006040 {
> +		compatible = "nvidia,tegra30-hsuart";
[...]

I wonder why isn't this in the tegra30.dtsi? The DT shouldn't select a
driver - it should only describe the hardware.

Best Regards
Micha³ Miros³aw
