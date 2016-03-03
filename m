From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V2] dma: tegra: don't open code of_device_get_match_data()
Date: Thu, 3 Mar 2016 21:30:21 +0530
Message-ID: <20160303160021.GV11154@localhost>
References: <1456928966-1192-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456928966-1192-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: dan.j.williams@intel.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 02, 2016 at 07:59:26PM +0530, Laxman Dewangan wrote:
> Use of_device_get_match_data() for getting matched data
> instead of implementing this locally.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> ---
> Changes form V1:
> - Found that it is possible to move of_device_id table to down
>   where this is used i.e. just above the platform driver structure.
>   Make this change on V2.

But that is just noise and not relevant to the title which patch says. If
you want to do this code move please send that separately. I have picked v1
for now

-- 
~Vinod
