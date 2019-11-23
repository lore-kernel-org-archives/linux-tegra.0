From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4.4 000/159] 4.4.203-stable review
Date: Sat, 23 Nov 2019 07:46:29 -0800
Message-ID: <a5d68f07-5f9a-2809-404d-bcd8ca593d70@roeck-us.net>
References: <20191122100704.194776704@linuxfoundation.org>
 <f0f505ae-5113-1abd-d4f7-0c3535c83de4@nvidia.com>
 <20191122133931.GA2033651@kroah.com> <20191122134131.GA2050590@kroah.com>
 <20191122134627.GB2050590@kroah.com>
 <9f976044-2dbc-6c19-11e7-210cd7ab35ea@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <9f976044-2dbc-6c19-11e7-210cd7ab35ea@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/22/19 6:48 AM, Jon Hunter wrote:

[ ... ]

> Error: arch/arm/boot/dts/omap5-board-common.dtsi:636.1-6 Label or path dwc3 not found
> FATAL ERROR: Syntax error parsing input tree
> scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap5-igep0050.dtb' failed
> make[1]: *** [arch/arm/boot/dts/omap5-igep0050.dtb] Error 1
> arch/arm/Makefile:338: recipe for target 'dtbs' failed
> make: *** [dtbs] Error 2
> 
> 
> This is caused by the following commit ...
> 
> commit d0abc07b3d752cbe2a8d315f662c53c772caed0f
> Author: H. Nikolaus Schaller <hns@goldelico.com>
> Date:   Fri Sep 28 17:54:00 2018 +0200
> 
>      ARM: dts: omap5: enable OTG role for DWC3 controller
> 

On top of the breakage caused by this patch, I would also argue
that it is not a bug fix and should not have been included
in the first place.

The dwc3 label was added with commit 4c387984618fe ("ARM: dts: omap5:
Add l4 interconnect hierarchy and ti-sysc data"). Given the size of
that patch, I highly doubt that a backport to 4.4 would work.

Guenter
