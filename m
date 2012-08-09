From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/3] ARM: dt: tegra: cardhu: add entry for regulators
Date: Thu, 09 Aug 2012 11:30:28 -0600
Message-ID: <5023F3B4.8010402@wwwdotorg.org>
References: <1344510039-17754-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344510039-17754-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: olof@lixom.net, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/09/2012 05:00 AM, Laxman Dewangan wrote:
> This patch series add the PMIC and fixed regulators for 
> cardhu board. There is multiple versions of cardhu baord named
> as A01, A02, A03..and so on. Cardhu A01 and A03 are not supported.
> Cardhu A02 and A04 have different sets of GPIO for regualtors.
> The cardhu A04 is compatible for A05, A06 and A07 in GPIOs.
> This patch series split the cardhu dts file to cardhu-a02 and 
> carchu-a04 and then add entry for different fixed regualtors.

Thanks, applied the series to Tegra's for-3.7/dt branch.
