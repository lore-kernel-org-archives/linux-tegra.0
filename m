From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add AHB driver
Date: Tue, 24 Apr 2012 13:49:22 -0600
Message-ID: <4F9703C2.50002@wwwdotorg.org>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com> <20120424121619.GF8444@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120424121619.GF8444-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/24/2012 06:16 AM, Felipe Balbi wrote:
> On Tue, Apr 24, 2012 at 03:05:14PM +0300, Hiroshi DOYU wrote:
>> The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
>> High-performance Bus (AHB) architecture.
...
>> +static int __init tegra_ahb_init(void)
>> +{
>> +	return platform_driver_register(&tegra_ahb_driver);
>> +}
>> +postcore_initcall(tegra_ahb_init);
>> +
>> +static void __exit tegra_ahb_exit(void)
>> +{
>> +	platform_driver_unregister(&tegra_ahb_driver);
>> +}
>> +module_exit(tegra_ahb_exit);
> 
> please use module_platform_driver();

That won't work for a postcore_initcall.
