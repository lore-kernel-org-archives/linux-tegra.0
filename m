From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V7 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Tue, 24 May 2016 11:48:51 +0100
Message-ID: <57443193.5010900@nvidia.com>
References: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
 <1463755530-20941-4-git-send-email-ldewangan@nvidia.com>
 <5742C773.6080609@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5742C773.6080609@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 23/05/16 10:03, Jon Hunter wrote:
> 
> On 20/05/16 15:45, Laxman Dewangan wrote:
>> The IO pins of Tegra SoCs are grouped for common control of IO
>> interface like setting voltage signal levels and power state of
>> the interface. The group is generally referred as IO pads. The
>> power state and voltage control of IO pins can be done at IO pads
>> level.
>>
>> Tegra generation SoC supports the power down of IO pads when it
>> is not used even in the active state of system. This saves power
>> from that IO interface. Also it supports multiple voltage level
>> in IO pins for interfacing on some of pads. The IO pad voltage is
>> automatically detected till T124, hence SW need not to configure
>> this. But from T210, the automatically detection logic has been
>> removed, hence SW need to explicitly set the IO pad voltage into
>> IO pad configuration registers.
>>
>> Add support to set the power states and voltage level of the IO pads
>> from client driver. The implementation for the APIs are in generic
>> which is applicable for all generation os Tegra SoC.
>>
>> IO pads ID and information of bit field for power state and voltage
>> level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
>> driver is modified to use the new APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> Thanks. I will defer to Thierry on how this should be organised for
> merging but I am happy with the code. There is one minor typo below, but
> otherwise ...
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

I have tested this on a Tegra124 Nyan Big and verified that the SOR IO
pads are turning on and off and no errors are seen. I have also boot
tested this series on our upstream test farm and not seen any
regressions. So ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon
