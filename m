From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: use devm_clk_*() helpers
Date: Tue, 12 Mar 2019 15:24:55 +0000
Message-ID: <7598abfe-ae1a-61d2-e4d2-c95dc78c9697@nvidia.com>
References: <1552401352-30043-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552401352-30043-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, dan.j.williams@intel.com, vkoul@kernel.org
Cc: treding@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/03/2019 14:35, Sameer Pujar wrote:
> Usage of pm_clk_*() results in non-zero prepare_count for clocks and hence
> module clocks remain ON always. This is not desired as it will leak power
> unncessarily. This patch replaces pm_clk_*() with devm_clk_*() interface.

Technically, this is not true for all devices. The actual problem here
is that for some Tegra devices that use the BPMP co-processor to manage
clocks, the clock are actually enabled during the prepare-phase and
hence when using the pm-clocks framework they are never disabled for
these devices. However, this is not the case for Tegra210 which does not
use the BPMP for managing clocks.

It maybe worth highlighting the fact the BPMP has to enable clocks
during the prepare phase because calls to the BPMP are always blocking.

> This helps to keep refcounts balanced when device is not in use and runtime
> PM callbacks help to enable or disable clocks. System suspend/resume calls
> can use pm_runtime_force_suspend/resume.

I think that this last bit should be a separate patch as it has nothing
to do with the $subject.

Cheers
Jon

-- 
nvpublic
