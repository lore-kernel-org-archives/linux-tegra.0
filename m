From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/1] dma: tegra20-apb-dma: Staticize tegra_dma_prep_dma_cyclic
Date: Fri, 6 Sep 2013 17:56:17 +0530
Message-ID: <5229C9E9.6020001@nvidia.com>
References: <1378467982-30327-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378467982-30327-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>
List-Id: linux-tegra@vger.kernel.org

On Friday 06 September 2013 05:16 PM, Sachin Kamat wrote:
> tegra_dma_prep_dma_cyclic is referenced only in this file.
> Make it static.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>
Agree, looks good.

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
