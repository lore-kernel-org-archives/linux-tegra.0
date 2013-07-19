From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 RFT] ARM: tegra: enable palmas device for dalmore
Date: Fri, 19 Jul 2013 09:33:09 -0600
Message-ID: <51E95C35.7060502@wwwdotorg.org>
References: <1374199992-27947-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374199992-27947-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: rklein@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/18/2013 08:13 PM, Laxman Dewangan wrote:
> Make the entry of Dalmore Power Management Unit device TPS65913
> in dalmore DTS file. The Palma driver support this device.
> 
> Enable following submodule of the TPS65913:
> - GPIO driver
> - RTC driver.
> - Power regulator driver.

OK, this version works fine. Applied to Tegra's for-3.12/dt branch.

> Changes from V2:
> - Made LDO9 as always ON for sd card functionality.

We really need to start hooking up the regulators to the SDHCI
controller nodes sometime soon... I let it slide here because it's at
least consistent with the regulators we already have in place on other
boards.
