From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] arm: tegra124: remove commas from unit addresses
Date: Fri, 27 May 2016 12:35:12 -0600
Message-ID: <57489360.1030300@wwwdotorg.org>
References: <1464366471-23832-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464366471-23832-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 05/27/2016 10:27 AM, Marcel Ziswiler wrote:
> Remove commas from unit addresses as suggested by Rob Herring upon me
> posting initial Apalis TK1 support:
>
> http://article.gmane.org/gmane.linux.ports.tegra/26608

> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts

> -	gpu@0,57000000 {
> +	gpu@57000000 {
>   		/*
>   		 * Node left disabled on purpose - the bootloader will enable
>   		 * it after having set the VPR up

The last time a similar patch was proposed[1], I pointed out that U-Boot 
uses the node name to enable the node, so this change will break GPU 
functionality on this board. U-Boot has since been updated to find the 
node to enable using compatible value rather than hard-coding the node 
name, but this doesn't help people with existing bootloader binaries; 
kernel changes shouldn't force them to upgrade the bootloader. I think 
the DT node names are part of the ABI and shouldn't be changed. We can 
fix this for completely new SoCs, but not existing SoCs.

[1] http://www.spinics.net/lists/devicetree/msg122164.html "[PATCH] ARM: 
tegra: Remove 0, prefix from unit-addresses".
