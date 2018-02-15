From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1?
Date: Thu, 15 Feb 2018 16:38:09 -0700
Message-ID: <2cb788e0-5d6e-ef54-9c8b-a082e1ffe42d@wwwdotorg.org>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ff3ffde-653c-ea50-490c-efcc6dccecc2-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/14/2018 06:51 PM, Andreas Färber wrote:
> Hello,
> 
> I would like to test the latest version of U-Boot on the Jetson TX1.
> 
> Unfortunately U-Boot is lacking a README that would explain how to do that:
 > ...

Here is some consolidated background on U-Boot on TX1:

In all cases, U-Boot uses a built-in DTB for its own driver 
initialization and other operation.

In T124 and earlier, it was possible to have a completely OSS boot 
process. So, U-Boot could be the only bootloader. In this case, part of 
U-Boot (the SPL) would run on the ARM7/AVP/COP, and part on the main CPU 
(CCPLEX). Details of all that are at:

https://http.download.nvidia.com/tegra-public-appnotes/index.html

With T210, the boot logic that runs on the ARM7/AVP/BPMP-Lite became 
more complex, so we elected to drop the U-Boot SPL and re-use the NVIDIA 
binary bootloader for the AVP/BPMP-Lite portion to avoid re-implementing 
it, leaving U-Boot to run solely on the CCPLEX, and dropping usage of 
U-Boot SPL.

In L4T r24 and earlier, U-Boot was 99.9% of the boot code that ran at 
EL2 or lower on the CCPLEX (ATF - ARM Trusted Firmware - would run at 
EL3). In this case, the other 0.1% of the code running at EL2 runs 
before U-Boot and passes to U-Boot some parameter block with details 
such as memory size, carveouts, etc. The L4T r24 T210 port of U-Boot 
parses this parameter block to determine RAM size, carveout size, etc., 
so is closely tied to this boot model. The upstream T210 port (as of 
today at least) ignores the parameter block, determines RAM size from HW 
registers, and hard-codes some overly-large carveout size to avoid 
trampling any carveout. In this r24 boot model, U-Boot (L4T downstream 
or upstream) loads a DTB from disk, does a little manipulation of it 
(e.g. fills in RAM size, kernel command-line), and passes it a kernel 
that it loads from disk.

With L4T r24, you can use the script bootloader/exec-uboot.sh to load 
and run a new U-Boot over the USB port's recovery protocol, without 
writing anything to flash. This is what my automated upstream U-Boot 
tester does for usptream branches for T210.

I won't discuss L4T r25/r26 since they weren't broadly distributed and 
had slightly different boot models, and discussing them would just be 
confusing.

With L4T r28, we aligned the T210 and T186 boot models. Now, cboot (an 
NVIDIA binary bootloader) always runs on the CCPLEX at EL2 (ATF still 
runs EL3) and performs most general system setup. cboot loads the 
"kernel" from a dedicated partition (which contains no filesystem). This 
kernel could actually be a Linux kernel, but L4T typically places U-Boot 
into this partition and hence chain-loads it. In this model, U-Boot 
receives a DTB from cboot, which is parsed by U-Boot to determine RAM 
size, carveout size, etc. For L4T, U-Boot passes this same DTB on to 
whatever kernel it loads and boots (with a couple minor modifications 
such as over-writing RAM size and kernel command-line). The advantage of 
passing on the DTB is that any DTB edits performed by cboot don't need 
to be re-implemnted by U-Boot. For upstream, people typically (always?) 
have U-Boot load a different DTB to pass to the kernel, since the DTB 
that cboot uses-and-passes-on must use some downstream-specific DT 
bindings/schema that are not appropriate to pass to an upstream kernel 
that uses upstream DT bindings. Only downstream L4T r28 U-Boot supports 
this boot model; upstream U-Boot is not written to accept and parse a 
DTB at runtime. You can control whether U-Boot passes on the DTB or 
loads a new one by (a) extlinux.conf: include a DTB statement or not, 
(b) in other scripts, by either loading a DTB in the script and passing 
that address to booti or passing the address of the cboot-supplied DTB 
to booti; U-Boot sets a variable to point to the cboot-supplied DTB 
making this easy. When running L4T r28, if you want update U-Boot, 
you'll need to flash the kernel partition (T210: LNX, T186: kernel) 
since that's where U-Boot is stored. Obviously L4T's r28 U-Boot release 
works with this model. I'd actually expect upstream to do so too, 
although that combination isn't actually tested; my automated upstream 
U-Boot tester still uses L4T r24 since that boot process is what the 
upstream T210 port was originally developed against. This may change if 
we switch upstream U-Boot to the new boot style.

With L4T r28, there is no bootloader/exec-uboot.sh script, so you must 
write any updated U-Boot to flash in order to test it.

For T186, this new boot model was all we ever supported; cboot is always 
used, U-Boot if uses is stored in the kernel partition, and upstream 
T186 U-Boot only supports the new L4T r28 boot model.

ATF and optionally a secure OS are part of "tos.img" in the L4T release, 
which gets flashed to the TOS partition on T210 and secure-os partition 
on T186. As Varun mentioned, there's a header format for this partition 
and you can use the script he linked in order to generate the header. I 
don't know of anyone using upstream ATF on T210 or T186.

Hopefully that addresses all the questions in this thread; if not let me 
know!
