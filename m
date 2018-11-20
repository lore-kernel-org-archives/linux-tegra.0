From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v2 0/3] Fixes for Tegra soctherm
Date: Tue, 20 Nov 2018 15:06:01 +0800
Message-ID: <74076ba9-d563-b07e-5c52-23cc742d0449@nvidia.com>
References: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,
Do you have any comments on this serial?

Thanks.
Wei.

On 13/11/2018 6:06 PM, Wei Ni wrote:
> This series fixed some issues for Tegra soctherm
> 
> Main changes from v1:
> 1. Acked by Thierry Reding <treding@nvidia.com> for the patch
> "thermal: tegra: fix memory allocation".
> 2. Print out the sensor name when register failed.
> 2. Remove patch "thermal: tegra: fix coverity defect"
> 
> Wei Ni (3):
>   thermal: tegra: continue if sensor register fails
>   thermal: tegra: remove unnecessary warnings
>   thermal: tegra: fix memory allocation
> 
>  drivers/thermal/tegra/soctherm.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
