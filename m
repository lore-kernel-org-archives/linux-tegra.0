From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: tegra: dts: add sflash controller dt entry
Date: Tue, 13 Nov 2012 12:13:18 -0700
Message-ID: <50A29BCE.5050005@wwwdotorg.org>
References: <1352783021-25393-1-git-send-email-ldewangan@nvidia.com> <1352783021-25393-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352783021-25393-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/12/2012 10:03 PM, Laxman Dewangan wrote:
> Nvidia's Tegra20 have the SPI (SFLASH) controller to
> interface with spi flash device which is used for system
> boot. Add DT entry for this controller.

Thanks, applied to Tegra's for-3.8/dt branch.
