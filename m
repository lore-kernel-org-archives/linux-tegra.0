From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] ARM: tegra: dalmore: add dt node for TPS65090's regulators
Date: Wed, 20 Mar 2013 14:48:46 -0600
Message-ID: <514A20AE.9040604@wwwdotorg.org>
References: <1363787070-14801-1-git-send-email-ldewangan@nvidia.com> <1363787070-14801-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363787070-14801-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 07:44 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra114 platform, Dalmore, uses the TPS65090 as
> secondary PMICs which mainly act as voltage switch controlled
> by I2C communication.

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts

> @@ -747,4 +823,18 @@
>  		bus-width = <8>;
>  		status = "okay";
>  	};
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;

You need a blank line between the nodes there.

There a a number of typos and capitalization issues in the various
commit descriptions.
