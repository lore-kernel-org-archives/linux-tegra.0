From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] ARM: tegra: trimslice: enable PCIe when booting
 from device tree
Date: Tue, 22 May 2012 10:18:25 -0600
Message-ID: <4FBBBC51.1080800@wwwdotorg.org>
References: <1337289674-18581-1-git-send-email-swarren@wwwdotorg.org> <4FBB67A0.9010606@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBB67A0.9010606-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/22/2012 04:17 AM, Ben Dooks wrote:
> On 17/05/12 22:21, Stephen Warren wrote:
>> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> There currently aren't bindings for the Tegra PCIe controller. Work on
>> this is in progress, but not yet complete. Manually initialize PCIe when
>> booting from device tree, in order to bring DT support to the same
>> feature level as board files, which will in turn allow board files to be
>> deprecated.
>>
>> PCIe hosts the wired Ethernet controller on TrimSlice.
>>
>> To support this, add infra-structure to board-dt-tegra20.c for board-
>> specific initialization code. Once device tree support for the relevant
>> features is in place, this code will be removed.
>>
>> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

>> +++ b/arch/arm/mach-tegra/board-dt-tegra20.c

>> +#ifdef CONFIG_MACH_TRIMSLICE
>> +static void __init trimslice_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = tegra_pcie_init(true, true);
>> +    if (ret)
>> +        pr_err("tegra_pci_init() failed: %d\n", ret);
>> +}
>> +#endif
> 
> Given the size of some of these functions, is it worth even
> bothering with an #ifdef around them, especially as they are
> marked init.

The TrimSlice init function doesn't pull in anything beyond the raw
driver itself, but the Harmony and Paz00 functions do. I made everything
ifdef'd for consistency.

> How about having some sort of standard pcie binding for the pcie
> part?

Thierry Redding is working on a standardized binding and converting the
driver to a platform driver. As soon as that's complete and checked in,
we can remove some of these custom init functions.
