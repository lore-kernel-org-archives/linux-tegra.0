From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/7] soc/tegra: pmc: Add new Tegra210 IO rails
Date: Tue, 12 Apr 2016 19:03:02 +0100
Message-ID: <570D3856.6050404@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-3-git-send-email-ldewangan@nvidia.com>
 <20160412152830.GB30211@ulmo.ba.sec> <570D297F.1080701@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <570D297F.1080701@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/04/16 17:59, Laxman Dewangan wrote:
> 
> On Tuesday 12 April 2016 08:58 PM, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, Apr 12, 2016 at 08:26:42PM +0530, Laxman Dewangan wrote:
>>> NVIDIA Tegra210 has extended the IO rails for new IO pads
>>> and added some new IO rails on top of its previous SoC.
>>>
>>> Add all supported IO rails from Tegra210 to the Tegra PMC header.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>> ---
>>>   include/soc/tegra/pmc.h | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
>>> index 07e332d..58fadc5 100644
>>> --- a/include/soc/tegra/pmc.h
>>> +++ b/include/soc/tegra/pmc.h
>>> @@ -90,22 +90,36 @@ int tegra_pmc_cpu_remove_clamping(unsigned int
>>> cpuid);
>>>   #define TEGRA_IO_RAIL_UART    14
>>>   #define TEGRA_IO_RAIL_BB    15
>>>   #define TEGRA_IO_RAIL_AUDIO    17
>>> +#define TEGRA_IO_RAIL_USB3    18
>>>   #define TEGRA_IO_RAIL_HSIC    19
>>>   #define TEGRA_IO_RAIL_COMP    22
>>> +#define TEGRA_IO_RAIL_DBG    25
>>> +#define TEGRA_IO_RAIL_DBG_NONAO    26
>>> +#define TEGRA_IO_RAIL_GPIO    27
>>>   #define TEGRA_IO_RAIL_HDMI    28
>>>   #define TEGRA_IO_RAIL_PEX_CNTRL    32
>>>   #define TEGRA_IO_RAIL_SDMMC1    33
>>>   #define TEGRA_IO_RAIL_SDMMC3    34
>>>   #define TEGRA_IO_RAIL_SDMMC4    35
>>> +#define TEGRA_IO_RAIL_EMMC    35
>>>   #define TEGRA_IO_RAIL_CAM    36
>>>   #define TEGRA_IO_RAIL_RES    37
>>> +#define TEGRA_IO_RAIL_EMMC2    37
>> We have a duplicate entry for 37 now. The _RES might have meant
>> "reserved", in which case maybe just replace it with the new symbolic
>> name?
> 
> OK, then make sense to replace RES with EMMC2.

Looking at the Tegra124 TRM it was reserved and so renaming makes sense
here. However, that also prompts the question how do we check to ensure
that the IO rail is valid for a given SoC?

Should we define a 'valid' mask for IO_DPD_STATUS and IO_DPD2_STATUS
registers in the SoC data so we can check if the rail is valid?

Cheers
Jon



