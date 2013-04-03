From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: 3.8 config file for CARMA card
Date: Wed, 03 Apr 2013 15:35:03 -0600
Message-ID: <515CA087.6020805@wwwdotorg.org>
References: <E61DA4A8-CD86-4F01-B8CF-D1D0D32F1C12@aotera.org> <20130402113618.GE18519@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130402113618.GE18519-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Spencer Cheng <spencer-cggpePV8Dd8dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 05:36 AM, Peter De Schrijver wrote:
> (added linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org)
> 
> Hello,
> 
>> Hello Peter,
>>
>> Apologies if you are the wrong person to ask. Since you submitted the patch for Tegra 3 support, I thought I try asking you since I can't seem to find any answers elsewhere.
>>
>> I am looking for a working .config file for the CARMA dev board so I can bring the CARMA cards that I have (7) up to a more current kernel version. I've tried to start from /proc/config.gz which is a 3.1 config file but the resultant kernel compiled on the card won't boot on the CARMA cards. Thanks in advance for any help you can provide.
> 
> Unfortunately we don't have support for the carma dev board upstream yet. Also PCIe support is still missing from upstream, although I expect that to change in the near future. 

Spencer, which 3.8 kernel are you attempting to use?

As Peter mentioned, we don't support CARMA upstream at the moment.
However, in theory, you should simply need to write a device tree file
to enable the upstream kernel to boot on CARMA.

(arch/arm/configs/)tegra_defconfig is the .config file for Tegra in the
upstream kernel. It should enable pretty much anything Tegra-related,
and should be suitable for your use once you've written a CARMA device tree.

You might also want to consider porting upstream U-Boot, and creating a
configuration file for cbootimage-configs:

http://nv-tegra.nvidia.com/gitweb/?p=tools/tegra-cbootimage-configs.git;a=summary

so that you can use a completely Open-Source flashing process.
