From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 11/11] ARM: tegra: pcie: Add device tree support
Date: Fri, 09 Mar 2012 09:47:11 -0700
Message-ID: <4F5A340F.6080303@wwwdotorg.org>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de> <1331218291-16119-12-git-send-email-thierry.reding@avionic-design.de> <4F59253D.7070100@wwwdotorg.org> <20120309063115.GA25208@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120309063115.GA25208-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2012 11:31 PM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 03/08/2012 07:51 AM, Thierry Reding wrote:
>>> This commit adds support for instantiating the Tegra PCIe controller
>>> from a device tree.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>
>>> diff --git a/Documentation/devicetree/bindings/pci/tegra-pcie.txt b/Documentation/devicetree/bindings/pci/tegra-pcie.txt
>>
>>> +NVIDIA Tegra PCIe controller
>>> +
>>> +Required properties:
>>> +- compatible: "nvidia,tegra20-pcie"
>>> +- reg: physical base address and length of the controller's registers
>>> +- interrupts: the interrupt outputs of the controller
>>> +
>>> +Optional properties:
>>> +- pex-clk-supply: supply voltage for internal reference clock
>>> +- vdd-supply: power supply for controller (1.05V)
>>
>> Mark, Liam,
>>
>> Should those *-supply properties really be optional? I got the
>> impression talking to Mark in a different thread that all regulators
>> should exist, although their implementation may be via a fixed
>> regulator, with no GPIO, as determined by the board design.
> 
> If I read the TrimSlice code correctly, there is no regulator setup required
> to make PCIe work there presumably because they hardwire the proper voltages.

Yes. I believe that's exactly what the fixed regulator is for.

> On the other hand, maybe a better solution in this case would be to use the
> dummy regulator in those cases.

Mark indicated dummy regulators weren't the preferred mechanism:

http://lkml.org/lkml/2012/2/25/30
