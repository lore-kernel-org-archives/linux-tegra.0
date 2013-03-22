From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: tegra: check the clk_prepare_enable() return value
Date: Fri, 22 Mar 2013 10:31:14 +0100
Message-ID: <20130322093114.GB8240@the-dreams.de>
References: <1363361648-10326-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363361648-10326-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, khali@linux-fr.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 15, 2013 at 09:04:08PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra SoC allows read/write of controller register only
> if controller clock is enabled. System hangs if read/write happens
> to registers without enabling clock.
> 
> clk_prepare_enable() can be fail due to unknown reason and hence
> adding check for return value of this function. If this function
> success then only access register otherwise return to caller with
> error.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Applied to for-current, thanks!
