From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1?
Date: Thu, 15 Feb 2018 09:22:41 +0000
Message-ID: <0247bb39-1f53-5c45-4d37-247813b53b96@nvidia.com>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ff3ffde-653c-ea50-490c-efcc6dccecc2-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 15/02/18 01:51, Andreas Färber wrote:
> Hello,
> 
> I would like to test the latest version of U-Boot on the Jetson TX1.
> 
> Unfortunately U-Boot is lacking a README that would explain how to do that:
> 
> http://git.denx.de/?p=u-boot.git;a=tree;f=board/nvidia/p2371-2180;h=097fb9aaec8abd522b7b8382e5c4169f5ea8f691;hb=HEAD
> 
> 
> I understand that the Jetson TK1's Python based
> https://github.com/NVIDIA/tegra-uboot-flasher-scripts
> have never been updated for Tegra X1.
> 
> That leaves L4T Jetson TX1 Driver Package, latest version being R28.1.0.
> 
> Here's what I have tried:
> 
> $ sudo ./flash.sh p2371-2180-devkit mmcblk0p1
This should work. Which u-boot binary are you copying and where are you
copying it?

I copy the u-boot-dtb.bin over u-boot.bin in the L4T directory
Linux_for_Tegra/bootloader/t186ref/p2771-0000/500/u-boot.bin.

Cheers
Jon

-- 
nvpublic
