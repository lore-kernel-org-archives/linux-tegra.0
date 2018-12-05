From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v5 0/3] Fixes for Tegra soctherm
Date: Wed, 5 Dec 2018 16:31:26 +0800
Message-ID: <56fd1fc8-f70f-2d86-6a05-799a7bd0ff7e@nvidia.com>
References: <1543816523-10525-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543816523-10525-1-git-send-email-wni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,
Does there have any comments on this serial?

Thanks.
Wei.

On 3/12/2018 1:55 PM, Wei Ni wrote:
> This series fixed some issues for Tegra soctherm
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
> Wei Ni (3):
>   thermal: tegra: remove unnecessary warnings
>   thermal: tegra: fix memory allocation
>   thermal: tegra: parse sensor id before sensor register
> 
>  drivers/thermal/tegra/soctherm.c | 51 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 5 deletions(-)
> 
