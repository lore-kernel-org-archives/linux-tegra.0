From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: config: tegra: enable T114 SPI
Date: Fri, 17 May 2013 17:54:50 -0600
Message-ID: <5196C34A.9000303@wwwdotorg.org>
References: <1365594483-20651-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365594483-20651-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/10/2013 05:48 AM, Laxman Dewangan wrote:
> Nvidia Tegra114 has the new spi controller whose driver
> is not compatible with older SoCs. The new driver is added
> for Tegra114 spi controller.

I have applied this to (squashed it into) Tegra's for-3.11/defconfig branch.
