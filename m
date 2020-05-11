From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: arm64: tegra186: bpmp: kernel crash while decompressing initrd
Date: Mon, 11 May 2020 10:17:58 -0600
Message-ID: <3a0c32ca-8475-a034-8c87-558441feca44@wwwdotorg.org>
References: <20200508084041.23366-1-ykaukab@suse.de>
 <e01aba39-1f81-de00-2f7e-dd7295baa7ed@arm.com>
 <20200511152330.GA1718@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200511152330.GA1718-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/11/20 9:23 AM, Mian Yousaf Kaukab wrote:
> On Mon, May 11, 2020 at 12:25:00PM +0100, Robin Murphy wrote:
>> On 2020-05-08 9:40 am, Mian Yousaf Kaukab wrote:
>>> I am seeing following kernel crash on Jetson TX2. Board is flashed with
>>> firmware bits from L4T R32.4.2 with upstream u-boot. Crash always
>>> happens while decompressing initrd. Initrd is approximately 80 MiB in
>>> size and compressed with xz (xz --check=crc32 --lzma2=dict=32MiB).
>>> Crash is not observed if the same initrd is compressed with gzip.
>>> [1] was a previous attempt to workaround the same issue.
>>>
...
>>>
>>> With some debugging aid ported from Nvidia downstream kernel [2] the
>>> actual cause was found:
>>>
>>> [    0.761525] Trying to unpack rootfs image as initramfs...
>>> [    2.955499] CPU0: SError: mpidr=0x80000100, esr=0xbf40c000
>>> [    2.955502] CPU1: SError: mpidr=0x80000000, esr=0xbe000000
>>> [    2.955505] CPU2: SError: mpidr=0x80000001, esr=0xbe000000
>>> [    2.955506] CPU3: SError: mpidr=0x80000101, esr=0xbf40c000
>>> [    2.955507] ROC:CCE Machine Check Error:
>>> [    2.955508] ROC:CCE Registers:
>>> [    2.955509]  STAT: 0xb400000000400415
>>> [    2.955510]  ADDR: 0x400c00e7a00c
>>> [    2.955511]  MSC1: 0x80ffc
>>> [    2.955512]  MSC2: 0x3900000000800
>>> [    2.955513] --------------------------------------
>>> [    2.955514] Decoded ROC:CCE Machine Check:
>>> [    2.955515]  Uncorrected (this is fatal)
>>> [    2.955516]  Error reporting enabled when error arrived
>>> [    2.955517]  Error Code = 0x415
>>> [    2.955518]  Poison Error
>>> [    2.955518]  Command = NCRd (0xc)
>>> [    2.955519]  Address Type = Non-Secure DRAM
>>> [    2.955521]  Address = 0x30039e80 -- 30000000.sysram + 0x39e80
>>> [    2.955521]  TLimit = 0x3ff
>>> [    2.955522]  Poison Error Mask = 0x80
>>> [    2.955523]  More Info = 0x800
>>> [    2.955524]  Timeout Info = 0x0
>>> [    2.955525]          Poison Info = 0x800
>>> [    2.955526]          Read Request failed GSC checks
>>> [    2.955527]  Source = L2_1 (A57) (0x1)
>>> [    2.955528]  TID = 0xe
>>>
>>> IIUC, there was read request for 0x30039e80 from EL1/2 which failed.
>>> This address falls in the sysram security aperture and hence a read
>>> from normal mode failed.
>>>
>>> sysram is mapped at 0x3000_0000 to 0x3004_ffff and is managed by the
>>> sram driver (drivers/misc/sram.c). There are two reserved pools for
>>> BPMP driver communication at 0x3004_e000 and 0x3004_f000 of 0x1000
>>> bytes each.
>>>
>>> sram driver maps complete 0x3000_0000 to 0x3004_ffff range as normal
>>> memory.
>
>> That's your problem. It's not really worth attempting to reason about, the
>> architecture says that anything mapped as Normal memory may be speculatively
>> accessed at any time, so no amount of second-guessing is going to save you
>> in general. Don't make stuff accessible to the kernel that it doesn't need
>> to access, and especially don't make stuff accessible to the kernel if
>> accessing it will kill the system.
>>
> I agree and [1] was an attempt in that direction. What I wonder here is that
> processor is speculating on an address range which kernel has never accessed.
> Is it correct behavior that cpu is speculating in EL1/EL2 on an address
> accessed in EL3?

That is indeed the way the ARM architecture is defined (at least the
version that this CPU implements; maybe other versions too), and this
certainly does happen in practice. I've seen this same kind of issue
arise in other cases too (see below). The only solution is to not map
memory as normal which isn't normal, so either (a) don't map it at all,
or (b) map it as some other type which can't be accessed speculatively.

Just as a related example, consider the following patch I had to make to
U-Boot to fix a similar issue that causes SError during boot:

> commit d40d69ee350b62af90c2b522e05cbb3eb5f27112
> Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Oct 10 09:50:55 2016 -0600
> 
>     ARM: tegra: reduce DRAM size mapped into MMU on ARM64
>     
>     ARM CPUs can architecturally (speculatively) prefetch completely arbitrary
>     normal memory locations, as defined by the current translation tables. The
>     current MMU configuration for 64-bit Tegras maps an extremely large range
>     of addresses as DRAM, well beyond the actual physical maximum DRAM window,
>     even though U-Boot only needs access to the first 2GB of DRAM; the Tegra
>     port of U-Boot deliberately limits itself to 2GB of RAM since some HW
>     modules on at least some 64-bit Tegra SoCs can only access a 32-bit
>     physical address space. This change reduces the amount of RAM mapped via
>     the MMU to disallow the CPU from ever speculatively accessing RAM that
>     U-Boot will definitely not access. This avoids the possibility of the HW
>     raising SError due to accesses to always-invalid physical addresses.
>     
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
