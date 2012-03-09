From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/11] ARM: tegra: pcie: Add MSI support
Date: Fri, 09 Mar 2012 09:45:22 -0700
Message-ID: <4F5A33A2.4000305@wwwdotorg.org>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de> <1331218291-16119-11-git-send-email-thierry.reding@avionic-design.de> <4F59213F.6070107@wwwdotorg.org> <20120309065004.GD25208@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120309065004.GD25208-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2012 11:50 PM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 03/08/2012 07:51 AM, Thierry Reding wrote:
>>> This commit adds support for message signaled interrupts to the Tegra
>>> PCIe controller.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>> ---
>>> This code is taken from the NVIDIA Vibrante kernel and therefore has no
>>> appropriate Signed-off-by from the original author. Maybe someone at
>>> NVIDIA can find out who wrote this code and maybe provide a proper
>>> Signed-off-by that I can add?
>>
>> I think if you look in:
>> git://nv-tegra.nvidia.com/linux-2.6.git android-tegra-2.6.36
>>
>> the following commits are what you're after:
>>
>> de7fd8768b32da66eaf4eaf58473c65f7a76808d
>> arm: tegra: pcie: enabling MSI support for pcie
>>
>> ac1f8310811c64a084511d2afc27f66334b31a81
>> ARM: tegra: pcie: fix return value from MSI irq routine
>>
>> Although the patch below only partially resembles those patches, I guess
>> because you've rewritten the code a lot to conform to the current kernel
>> APIs, clean stuff up, etc. Perhaps just saying "based on code by Krishna
>> Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>" is enough...
> 
> Yes, it is indeed a major rewrite because the original code had some
> peculiarities and FIXME that I thought wouldn't make it through the review
> anyway so I fixed them up.
> 
> I'll add some comment about the original authorship. There is no official
> Signed-off-by in the original commit. Do I still need one or is it enough to
> mention the original authors in the commit message and add keep my own
> Signed-off-by?

Yes, I think just mentioning the original code author in free-form text,
and including only your S-o-b sounds good to me.
