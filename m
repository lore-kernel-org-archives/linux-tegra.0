From: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Tegra baseline test results for v3.19-rc4
Date: Fri, 20 Mar 2015 23:12:08 +0300
Message-ID: <CANLc0-aRLU5s+56hx_h37BaHJR_tn+42tZHpduLnLo8-Z+HfdA@mail.gmail.com>
References: <54B44605.1010200@nvidia.com> <CANLc0-aWQPhETG0NiNOg6qMnoZO+kPX83kroMW1vsYRW8-Spaw@mail.gmail.com>
 <54BC6A8B.7020700@nvidia.com> <CANLc0-aBpn_8pFMx+sSFbX35PU1f0SQ+PnuA4zSJRAMxOxzn_A@mail.gmail.com>
 <alpine.DEB.2.02.1503201824180.3475@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1503201824180.3475-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello Paul,
Great news. Thank you for your work, mainline tests very useful.
---
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom


On Fri, Mar 20, 2015 at 9:25 PM, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Misha
>
> On Mon, 19 Jan 2015, Misha Komarovsky wrote:
>
>> Hello Paul,
>> Thanks for info. Good to know its on your todo list. This will help to
>> notice tegra20 problems earlier.
>> Best Regards,
>> Misha Komarovskiy
>> zombahatgmaildotcom
>
> There's a Tegra20 Trimslice in the testbed now.  The plan is that,
> starting with v4.0-rc5, boot test results from that board should be
> visible in the test logs.
>
> thanks for speaking up,
>
> - Paul
>
>>
>>
>>
>> On Mon, Jan 19, 2015 at 5:23 AM, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > Hi Misha
>> >
>> > Sorry to hear that.  Adding Tegra20 is on my to-do list, but might take a
>> > while.
>> >
>> > - Paul
>> >
>> > On 01/18/2015 05:45 AM, Misha Komarovsky wrote:
>> >>
>> >> Hello Paul,
>> >> Is it possible to include any tegra20 target to your baseline tests?
>> >> 3.19 introduced couple boot stoppers for me with tegra_defcofig on
>> >> tegra20-paz00 hardware.
>> >>
>> >> On Tue, Jan 13, 2015 at 1:09 AM, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >> wrote:
>> >>>
>> >>> Here are some basic Tegra test results for Linux v3.19-rc4.
>> >>> Logs and other details at:
>> >>>
>> >>>
>> >>> http://nvt.pwsan.com/pub/linux/testlogs/test_v3.19-rc4/20150111130104/
>> >>>
>> >>>
>> >>> Test summary
>> >>> ------------
>> >>>
>> >>> Build: zImage:
>> >>>      Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig
>> >>>
>> >>> Boot to userspace: multi_v7_defconfig:
>> >>>      Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
>> >>>                     tegra30-beaver
>> >>>
>> >>> Boot to userspace: tegra_defconfig:
>> >>>      Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
>> >>>                     tegra30-beaver
>> >>>
>> >>>
>> >>> vmlinux object size
>> >>> (delta in bytes from test_v3.19-rc3
>> >>> (b1940cd21c0f4abdce101253e860feff547291b0)):
>> >>>     text     data      bss    total  kernel
>> >>>     +880     +120        0    +1000  multi_v7_defconfig
>> >>>     +448        0        0     +448  tegra_defconfig
>> >>>
>> >>>
>> >>> Boot-time memory difference
>> >>> (delta in bytes from test_v3.19-rc3
>> >>> (b1940cd21c0f4abdce101253e860feff547291b0))
>> >>>      avail    rsrvd     high    freed                board
>> >>> kconfig                  dtb
>> >>>          .        .        .      -4k tegra114-dalmore-a04
>> >>> multi_v7_defconfig     tegra114-dalmore
>> >>>          .        .        .        . tegra114-dalmore-a04
>> >>> tegra_defconfig     tegra114-dalmore
>> >>>          .        .        .      -4k  tegra124-jetson-tk1
>> >>> multi_v7_defconfig  tegra124-jetson-tk1
>> >>>          .        .        .        .  tegra124-jetson-tk1
>> >>> tegra_defconfig  tegra124-jetson-tk1
>> >>>          .        .        .      -4k       tegra30-beaver
>> >>> multi_v7_defconfig       tegra30-beaver
>> >>>          .        .        .        .       tegra30-beaver
>> >>> tegra_defconfig       tegra30-beaver
>> >>>
>> >>> --
>> >>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> >>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >>
>> >>
>> >>
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
> - Paul
