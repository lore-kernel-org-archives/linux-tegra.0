From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4] dmaengine: tegra210-adma: fix transfer failure
Date: Mon, 14 Oct 2019 12:41:12 +0530
Message-ID: <20191014071112.GC2654@vkoul-mobl>
References: <1568626513-16541-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568626513-16541-1-git-send-email-spujar@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, ldewangan@nvidia.com, thierry.reding@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 16-09-19, 15:05, Sameer Pujar wrote:
> >From Tegra186 onwards OUTSTANDING_REQUESTS field is added in channel
> configuration register(bits 7:4) which defines the maximum number of reads
> from the source and writes to the destination that may be outstanding at
> any given point of time. This field must be programmed with a value
> between 1 and 8. A value of 0 will prevent any transfers from happening.
> 
> Thus added 'has_outstanding_reqs' bool member in chip data structure and is
> set to false for Tegra210, since the field is not applicable. For Tegra186
> it is set to true and channel configuration is updated with maximum
> outstanding requests.

Applied, thanks

-- 
~Vinod
