From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v3.19-rc4
Date: Sun, 18 Jan 2015 19:23:07 -0700
Message-ID: <54BC6A8B.7020700@nvidia.com>
References: <54B44605.1010200@nvidia.com>
 <CANLc0-aWQPhETG0NiNOg6qMnoZO+kPX83kroMW1vsYRW8-Spaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLc0-aWQPhETG0NiNOg6qMnoZO+kPX83kroMW1vsYRW8-Spaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Misha Komarovsky <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Misha

Sorry to hear that.  Adding Tegra20 is on my to-do list, but might take 
a while.

- Paul

On 01/18/2015 05:45 AM, Misha Komarovsky wrote:
> Hello Paul,
> Is it possible to include any tegra20 target to your baseline tests?
> 3.19 introduced couple boot stoppers for me with tegra_defcofig on
> tegra20-paz00 hardware.
>
> On Tue, Jan 13, 2015 at 1:09 AM, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Here are some basic Tegra test results for Linux v3.19-rc4.
>> Logs and other details at:
>>
>>      http://nvt.pwsan.com/pub/linux/testlogs/test_v3.19-rc4/20150111130104/
>>
>>
>> Test summary
>> ------------
>>
>> Build: zImage:
>>      Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig
>>
>> Boot to userspace: multi_v7_defconfig:
>>      Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
>>                     tegra30-beaver
>>
>> Boot to userspace: tegra_defconfig:
>>      Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
>>                     tegra30-beaver
>>
>>
>> vmlinux object size
>> (delta in bytes from test_v3.19-rc3
>> (b1940cd21c0f4abdce101253e860feff547291b0)):
>>     text     data      bss    total  kernel
>>     +880     +120        0    +1000  multi_v7_defconfig
>>     +448        0        0     +448  tegra_defconfig
>>
>>
>> Boot-time memory difference
>> (delta in bytes from test_v3.19-rc3
>> (b1940cd21c0f4abdce101253e860feff547291b0))
>>      avail    rsrvd     high    freed                board
>> kconfig                  dtb
>>          .        .        .      -4k tegra114-dalmore-a04
>> multi_v7_defconfig     tegra114-dalmore
>>          .        .        .        . tegra114-dalmore-a04
>> tegra_defconfig     tegra114-dalmore
>>          .        .        .      -4k  tegra124-jetson-tk1
>> multi_v7_defconfig  tegra124-jetson-tk1
>>          .        .        .        .  tegra124-jetson-tk1
>> tegra_defconfig  tegra124-jetson-tk1
>>          .        .        .      -4k       tegra30-beaver
>> multi_v7_defconfig       tegra30-beaver
>>          .        .        .        .       tegra30-beaver
>> tegra_defconfig       tegra30-beaver
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
