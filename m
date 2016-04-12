From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/7] soc/tegra: pmc: Add new Tegra210 IO rails
Date: Tue, 12 Apr 2016 23:27:29 +0530
Message-ID: <570D3709.9030109@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-3-git-send-email-ldewangan@nvidia.com> <20160412152830.GB30211@ulmo.ba.sec> <570D297F.1080701@nvidia.com> <570D3856.6050404@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <570D3856.6050404@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 12 April 2016 11:33 PM, Jon Hunter wrote:
> On 12/04/16 17:59, Laxman Dewangan wrote:
>> On Tuesday 12 April 2016 08:58 PM, Thierry Reding wrote:
>>> * PGP Signed by an unknown key
>>>
>>> On Tue, Apr 12, 2016 at 08:26:42PM +0530, Laxman Dewangan wrote:
>>>> +#define TEGRA_IO_RAIL_EMMC    35
>>>>    #define TEGRA_IO_RAIL_CAM    36
>>>>    #define TEGRA_IO_RAIL_RES    37
>>>> +#define TEGRA_IO_RAIL_EMMC2    37
>>> We have a duplicate entry for 37 now. The _RES might have meant
>>> "reserved", in which case maybe just replace it with the new symbolic
>>> name?
>> OK, then make sense to replace RES with EMMC2.
> Looking at the Tegra124 TRM it was reserved and so renaming makes sense
> here. However, that also prompts the question how do we check to ensure
> that the IO rail is valid for a given SoC?
>
> Should we define a 'valid' mask for IO_DPD_STATUS and IO_DPD2_STATUS
> registers in the SoC data so we can check if the rail is valid?
>

Yes, that is good idea.
Infact, we should decouple  RAIL_ID with the bit location of register.
This will help on mapping any rail ID to SoC specific bit location and 
need not to worry if bit location of rail get changed on any generation. 
Local lookup table from ID to bit location can make validation as well 
as the decoupling.
