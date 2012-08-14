From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] i2c: tegra: I2_M_NOSTART functionality not supported
 in Tegra20
Date: Tue, 14 Aug 2012 10:49:00 -0600
Message-ID: <502A817C.4000601@wwwdotorg.org>
References: <1344935949-26709-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344935949-26709-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, w.sang@pengutronix.de
Cc: khali@linux-fr.org, swarren@nvidia.com, olof@lixom.net, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/14/2012 03:19 AM, Laxman Dewangan wrote:
> Tegra20 i2c controller does not support the continue transfer
> which implements the I2C_M_NOSTART functionality of i2c
> protocol mangling.
> Removing the I2C_M_NOSTART functionality for Tegra20.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reported-by: Stephen Warren <swarren@nvidia.com>

Tested-by: Stephen Warren <swarren@wwwdotorg.org>

Note that if I take Laxman's I2C driver clock patches through the Tegra
tree, and Wolfram takes this patch through the I2C tree, there will be a
very slight conflict, since adjacent lines are touched. However, the
resolution is simple and obvious, so I think that's fine.
