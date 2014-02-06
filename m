From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 3/6] misc: fuse: Add efuse driver for Tegra
Date: Thu, 06 Feb 2014 09:45:53 -0700
Message-ID: <52F3BC41.1030901@wwwdotorg.org>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com> <1390952176-30402-4-git-send-email-pdeschrijver@nvidia.com> <52F28DE2.1040207@wwwdotorg.org> <20140206091114.GK19389@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140206091114.GK19389-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/06/2014 02:11 AM, Peter De Schrijver wrote:
> On Wed, Feb 05, 2014 at 08:15:46PM +0100, Stephen Warren wrote:
>> On 01/28/2014 04:36 PM, Peter De Schrijver wrote:
>>> Implement fuse driver for Tegra20, Tegra30, Tegra114 and Tegra124.

>>> diff --git a/Documentation/ABI/testing/sysfs-driver-tegra-fuse b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
>>> +What:		/sys/devices/*/<our-device>/fuse
>>> +Date:		December 2013
>>> +Contact:	Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> +Description:	read-only access to the efuses on Tegra20, Tegra30, Tegra114
>>> +		and Tegra124 SoC's from NVIDIA. The efuses contain write once
>>> +		data programmed at the factory.
>>> +Users:		any user space application which wants to read the efuses on
>>> +		Tegra SoC's
>>
>> Surely this file should describe the format of the file, since that's
>> part of the ABI too, right?
>>
> 
> Part of the fuse data is ODM defined so possibly board specific.

I didn't mean the interpretation of which fuses mean what semantically,
but rather the data format of the file. IIRC looking at the code, it's
just a binary dump of the fuses, but it might be worth spelling out that
it's a byte-oriented binary file, with fuse 0 in bit 0 of byte 0 etc.?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
