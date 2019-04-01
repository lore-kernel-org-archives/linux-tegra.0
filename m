From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 03/10] PCI: dwc: Move config space capability search API
Date: Mon, 1 Apr 2019 17:16:59 +0530
Message-ID: <5a438b16-53bc-dee3-ea9d-14048547dc29@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-4-git-send-email-vidyas@nvidia.com>
 <20190328123320.GA5518@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328123320.GA5518@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com, shawn.li
List-Id: linux-tegra@vger.kernel.org

On 3/28/2019 6:03 PM, Thierry Reding wrote:
> On Tue, Mar 26, 2019 at 08:43:20PM +0530, Vidya Sagar wrote:
>> move PCIe config space capability search API to common designware file
>> as this can be used by both host and ep mode codes.
>> It also adds extended capability search APIs.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware-ep.c | 37 +------------
>>   drivers/pci/controller/dwc/pcie-designware.c    | 73 +++++++++++++++++++++++++
>>   drivers/pci/controller/dwc/pcie-designware.h    |  3 +
>>   3 files changed, 78 insertions(+), 35 deletions(-)
> 
> Just out of curiosity: is there any reason why this driver needs to
> reimplement this? Couldn't this be made to work using the standard
> pci_find_next_capability() function?
> 
> Other than that it might be a good idea to split this into two patches,
> one that moves the existing functionality to the common code and another
> that adds the extra functionality.
> 
> Thierry
> 
pci_find_next_capability() API expects struct pci_dev * pointer and this can only
be used after PCIe devices got enumerated. APIs added in this patch solves the issue
of getting capability offsets before PCIe enumeration. FWIW, APIs in this patch
take struct dw_pcie * pointer as input.
As you suggested, I'll split this into two patches in my next series.
