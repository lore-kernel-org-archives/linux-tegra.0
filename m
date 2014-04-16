From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH V3 0/7] Re-enable jtag function for Tegra124
Date: Wed, 16 Apr 2014 10:08:10 +0800
Message-ID: <E3E235BA220CA845AF2C1512C13F2662E4BD8E0BE0@HKMAIL02.nvidia.com>
References: <E3E235BA220CA845AF2C1512C13F2662E4BD53E9D4@HKMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E3E235BA220CA845AF2C1512C13F2662E4BD53E9D4-jYPH5V5jAeRDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Re-send in text format.

Thanks Stephen,

Please add a tagged release created for it.

Best Regards,
Penny

-----Original Message----- 
From: Stephen Warren [swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
Received: 星期三, 16 4月 2014, 2:16
To: Penny Chiu [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]; Stephen Warren [swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]
Subject: Re: [cbootimage PATCH V3 0/7] Re-enable jtag function for Tegra124
On 04/11/2014 03:50 AM, Penny Chiu wrote:
> This patch series is used to update BCT configs to re-enable jtag function
> for Tegra124.
> 
> Since the secure jtag is disabled by default once SECURITY_MODE fuse is
> blown. BOOTROM will re-enable secure jtag function if BCT has
> SecureJTAGControl=1 and a matching chip UID included.
> 
> After applying these changes, cbootimage can access jtag control and chip uid
> fields. It can also read the BCT data from pre-built image, update the BCT
> configs based on config file, and generate a new image file.

Thanks for the revisions. I have applied the whole series, and pushed it
to github.

Do you need a tagged release created?
