From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add pinmux controller to tegra124.dtsi
Date: Thu, 05 Dec 2013 16:16:02 -0700
Message-ID: <52A10932.1040903@wwwdotorg.org>
References: <1386241070-4350-1-git-send-email-ldewangan@nvidia.com> <1386241070-4350-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386241070-4350-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, thierry.reding@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/05/2013 03:57 AM, Laxman Dewangan wrote:
> The tegra124 pinmux controller is identical to tegra114 with
> removing some of existing pins from T114 and adding new pins.

I already sent this patch.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	pinmux: pinmux {

Note that the rules for DT node naming have changed recently. Node name
must include a unit address if the node includes a reg property, and not
include a unit address otherwise. So, that should be:

+	pinmux: pinmux@70000868 {

The patch I sent already does that.
