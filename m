From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: dt: tegra: add bindings of power management
 configurations for PMC
Date: Mon, 11 Mar 2013 14:51:37 -0600
Message-ID: <513E43D9.9060109@wwwdotorg.org>
References: <1362397241-5786-1-git-send-email-josephl@nvidia.com>  <51363F67.8040200@wwwdotorg.org> <1362654973.1890.28.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362654973.1890.28.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/07/2013 04:16 AM, Joseph Lo wrote:
> On Wed, 2013-03-06 at 02:54 +0800, Stephen Warren wrote:
>> On 03/04/2013 04:40 AM, Joseph Lo wrote:
>>> The PMC mostly controls the entry and exit of the system from different
>>> sleep modes. Different platform or system may have different configurations.
>>> The power management configurations of PMC is represented as some properties.
>>> The system needs to define the properties when the system supports deep sleep
>>> mode (i.e. suspend).
>>
>> One overall question here: For LP0, the idea is that the bootloader
>> provides the AVP boot code, puts it in RAM, passes the address to the
>> kernel, which then arranges for that code to be executed when the system
>> resumes from LP0. Why does the bootloader have to provide the code? Why
>> can't the AVP code simply be part of the kernel, just like e.g. the main
>> CPU's hotplug/secondary-power-on/power-saving reset vector is part of
>> the kernel? If we did that, it'd remove any need for bootloader support
>> for LP0 - the kernel would manage it entirely internally. That seems
>> much simpler.
> 
> Yes, I had exactly the same question before.

I think the downstream discussion we had concluded that we need to keep
doing this, so we do need the lp0-vec property in DT.

The reason is that LP0 vector code is sometimes encrypted, and the
kernel can't perform that encryption, and hence can't provide the code
itself - the code must be given to the kernel.
