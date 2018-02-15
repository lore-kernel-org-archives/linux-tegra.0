From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1?
Date: Thu, 15 Feb 2018 16:12:28 +0100
Message-ID: <71bf7527-3fb7-293f-8a1c-63ce74882649@suse.de>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
 <0247bb39-1f53-5c45-4d37-247813b53b96@nvidia.com>
 <8d80b0d3-eaed-b1ab-02c9-86f81ac4b7fa@suse.de>
 <33de1065-1372-282c-9646-30a63729e08e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <33de1065-1372-282c-9646-30a63729e08e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

Am 15.02.2018 um 15:01 schrieb Jon Hunter:
> On 15/02/18 12:32, Andreas Färber wrote:
>> Am 15.02.2018 um 10:22 schrieb Jon Hunter:
>>> On 15/02/18 01:51, Andreas Färber wrote:
>>>> I would like to test the latest version of U-Boot on the Jetson TX1.
>> [...]
>>>> Here's what I have tried:
>>>>
>>>> $ sudo ./flash.sh p2371-2180-devkit mmcblk0p1
>>> This should work. Which u-boot binary are you copying and where are you
>>> copying it?
>>>
>>> I copy the u-boot-dtb.bin over u-boot.bin in the L4T directory
>>> Linux_for_Tegra/bootloader/t186ref/p2771-0000/500/u-boot.bin.
>>
>> I downloaded the .rpm from
>> https://build.opensuse.org/package/show/hardware:boot/u-boot-p2371-2180
>> extracting all of u-boot, u-boot.bin, u-boot.dtb and u-boot-dtb.bin to
>> bootloader/t210ref/p2371-2180/ - and as described it makes a difference
>> in that it then ceases to boot to a U-Boot prompt.
> 
> Sorry, looks like I mixed TX1 and TX2. I see you are using TX1. However,
> I believe you are still booting the wrong u-boot file.
> 
> If you look at the p2371-2180-devkit.conf you will see that it has ...
> 
>  DFLT_KERNEL_IMAGE="bootloader/${target_board}/p2371-2180/u-boot.bin
> 
> For using the upstream u-boot, we need to use the u-boot-dtb.bin and not
> the u-boot.bin. So you can either ...
> 
> 1. Update the p2371-2180-devkit.conf to use the u-boot-dtb.bin that you
> copied.
> 2. Move the u-boot-dtb.bin from your rpm to
> bootloader/t210ref/p2371-2180/u-boot.bin.

Both in the Nvidia tarball and in our upstream based package builds,
u-boot.bin and u-boot-dtb.bin are identical. Since some time
u-boot-dtb.bin gets copied over as u-boot.bin for consistency upstream.

Should this work with the vanilla upstream files, or do they need any
headers or signatures or something?

Do any of you have that upstream version booting successfully, or might
it be an upstream U-Boot regression? I was so far assuming it's a user
error, so haven't tried bisecting yet.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
