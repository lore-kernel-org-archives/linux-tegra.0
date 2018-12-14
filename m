From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v6 0/4] Fixes for Tegra soctherm
Date: Fri, 14 Dec 2018 17:54:49 +0800
Message-ID: <74e77548-d10c-fd00-48c5-2b611529eaf5@nvidia.com>
References: <1544780993-20744-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544780993-20744-1-git-send-email-wni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Rui,
I moved get_trend() patch https://lkml.org/lkml/2018/11/20/643 in this
serial.
Since no more comments on these patches, will you take them?

Thanks.
Wei.

On 14/12/2018 5:49 PM, Wei Ni wrote:
> This series fixed some issues for Tegra soctherm,
> and add get_trend().
> 
> Main changes from v5:
> 1. Move the get_trend() patch https://lkml.org/lkml/2018/11/20/643
> into this serial.
> 
> Main changes from v4:
> 1. fixed for the parsing sensor id.
> 2. keep warning for missing critical trips.
> 
> Main changes from v3:
> 1. updated codes for parsing sensor id, per Thierry's comments
> 
> Main changes from v2:
> 1. add codes to parse sensor id to avoid registration
> failure.
> 
> Main changes from v1:
> 1. Acked by Thierry Reding <treding@nvidia.com> for the patch
> "thermal: tegra: fix memory allocation".
> 2. Print out the sensor name when register failed.
> 2. Remove patch "thermal: tegra: fix coverity defect"
> 
> Wei Ni (4):
>   thermal: tegra: remove unnecessary warnings
>   thermal: tegra: fix memory allocation
>   thermal: tegra: parse sensor id before sensor register
>   thermal: tegra: add get_trend ops
> 
>  drivers/thermal/tegra/soctherm.c | 85 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 80 insertions(+), 5 deletions(-)
> 
