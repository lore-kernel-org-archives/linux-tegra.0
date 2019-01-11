From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH 2/2] regulator: max77620: disable notifier events for FPS
 rails
Date: Fri, 11 Jan 2019 21:35:05 +0800
Message-ID: <161783bb-2589-c1ae-7efd-1b95f8b8b887@nvidia.com>
References: <20190110041117.8216-1-markz@nvidia.com>
 <20190110041117.8216-2-markz@nvidia.com>
 <20190110120707.GD9541@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110120707.GD9541@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 1/10/2019 8:07 PM, Mark Brown wrote:
> On Thu, Jan 10, 2019 at 12:11:17PM +0800, Mark Zhang wrote:
> 
>> +		/* there is no SW control for rails which are part of FPS
>> +		 * set always no contraint to true to avoid regulator
>> +		 * enable/disable notification
>> +		 */
>> +		if (pmic->reg_pdata[id].active_fps_src != MAX77620_FPS_SRC_NONE)
>> +			rdev->constraints->always_on = true;
> 
> A driver should never modify the constraints, you should register a
> different set of operations without an enable operation instead and let
> the framework handle this.

Oh right, today I checked the codes based on your suggestion so I think we don't need this patch now. We can find another way to fix our issue without touching the framework constraints. Thanks.

Mark

> 
