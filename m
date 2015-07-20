From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Mon, 20 Jul 2015 16:19:32 -0600
Message-ID: <55AD73F4.2050502@wwwdotorg.org>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru> <1437424546-30405-5-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437424546-30405-5-git-send-email-danindrey@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Danin <danindrey@mail.ru>
Cc: devicetree@vger.kernel.org, devel@linuxdriverproject.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

On 07/20/2015 02:35 PM, Andrey Danin wrote:
> NVEC driver was reimplemented to use tegra i2c. Use common i2c bindings
> for NVEC node.

> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts

> +		nvec: nvec@45 {
> +			compatible = "nvidia,nvec-slave";
> +			reg = <0x45>;

I think you need to or in I2C_OWN_SLAVE_ADDRESS from 
<dt-bindings/i2c/i2c.h> here?
