From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/2] i2c: tegra: I2_M_NOSTART functionality not supported
 in Tegra20
Date: Mon, 20 Aug 2012 11:15:31 -0600
Message-ID: <503270B3.7000007@wwwdotorg.org>
References: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: khali@linux-fr.org, w.sang@pengutronix.de, swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/18/2012 01:17 PM, Laxman Dewangan wrote:
> Tegra20 i2c controller does not support the continue transfer
> which implements the I2C_M_NOSTART functionality of i2c
> protocol mangling.
> Removing the I2C_M_NOSTART functionality support for Tegra20.

Thanks, applied the series to Tegra's for-3.7/drivers-i2c branch.

Note that I had to fix up patch 1 to remove const on the tegra*_i2c_hw
variable declarations to avoid compiler warnings when assigning pointers
into tegra_i2c_of_match[].data.
