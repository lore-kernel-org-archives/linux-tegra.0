From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v7 4/5] ARM: tegra: Add efuse and apbmisc bindings
Date: Thu, 05 Jun 2014 12:41:55 -0600
Message-ID: <5390B9F3.8030108@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401973754-19701-5-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2014 07:09 AM, Peter De Schrijver wrote:
> Add efuse and apbmisc bindings for Tegra20, Tegra30, Tegra114 and Tegra124.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +	apbmisc@70000800 {
> +		compatible = "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc";

Is the Tegra114 APBMISC register layout 100% a backwards-compatible
superset of that in Tegra20? For both registers the code currently uses
*and* all possible registers the code could ever use? Since the APB MISC
is a bit of a dumping ground for random registers, that feels unlikely,
but perhaps it's possible.
