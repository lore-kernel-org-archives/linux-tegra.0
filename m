From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 2/5] ARM: DT: tegra114: Add i2c controller DT entry
Date: Mon, 11 Mar 2013 11:41:04 -0600
Message-ID: <513E1730.7040109@wwwdotorg.org>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com> <1362852678-13421-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362852678-13421-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pdeschrijver@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 03/09/2013 11:11 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has 5 i2c controllers. These controllers have
> additional feature/configurations to make it functional over
> Tegra30's i2c controller driver.
> 
> Add DT entry for i2c controllers and make it compatible with
> "nvidia,tegra114-i2c".

Hmm. We're missing a binding document for the Tegra I2C module! Can you
please submit a separate patch to add one. When you do, since the
Tegra114 nodes need just a "div-clk" clock, and the Tegra20/30 nodes
need both div-clk and fast-clk, please be sure to mention this in the
document. Thanks.
