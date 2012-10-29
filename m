From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/4] ARM: tegra: dts: add slink controller dt entry
Date: Mon, 29 Oct 2012 12:21:28 -0600
Message-ID: <508EC928.7030900@wwwdotorg.org>
References: <1351531180-1652-1-git-send-email-ldewangan@nvidia.com> <1351531180-1652-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351531180-1652-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/29/2012 11:19 AM, Laxman Dewangan wrote:
> Add slink controller details in the dts file of
> Tegra20 and Tegra30.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> +	slink@7000d400 {

I think the node names should be spi@..., since the generic controller
type is SPI, even if NVIDIA happens to called the controllers SLINK and SBC.
