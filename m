From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: kernel-next on jetson tx2 - boot fail
Date: Fri, 9 Feb 2018 14:34:14 +0000
Message-ID: <67ed5aea-450e-0db4-a2b0-acf1baebfd22@nvidia.com>
References: <CAFCWPPK8jvXVOL6W-NMpj9aveWQAAv33BoFbipmhEKOCte0sKw@mail.gmail.com>
 <4787c6dc-c6d3-4879-a3d6-1e48868d304b@nvidia.com>
 <5e4c1aef-1af9-857e-3509-b36a71454d6e@kapsi.fi>
 <269318eb-6b5f-70ec-dbbc-f280d6105441@wwwdotorg.org>
 <CAFCWPPLm=3=Dta70bU+1F3w2Ob97aR7RD1pnbfsDXKHbyqd+5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFCWPPLm=3=Dta70bU+1F3w2Ob97aR7RD1pnbfsDXKHbyqd+5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 09/02/18 09:16, Milan Buška wrote:
> Hi all,
> 
> 2018-02-08 16:20 GMT+00:00 Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>:
>> On 02/08/2018 05:53 AM, Mikko Perttunen wrote:
>>>
>>> One issue is that most of the persistent labeling schemes require an
>>> initrd to interpret them. I'm using a super-simple initrd to just find the
>>> first proper-looking partition and mount that, maybe I should put it
>>> somewhere..
>>
>>
>> PARTUUID is interpreted directly by the kernel. (filesystem) UUID= does
>> require an initrd to map (but it's not complex if you put the blkid tool in
>> there and a shell, I believe).
> 
> Output blkid on my device
> 
> /dev/sda1: LABEL="ROOT-64" UUID="3d36c3b7-958d-4686-a265-83ded3e3f212"
> TYPE="ext4" PARTUUID="cee24d9e-2ec5-4551-8e39-406836c497c0"
> /dev/sda2: LABEL="HOME-64" UUID="c6255b12-6ad6-45f7-98bd-0ee816778c95"
> TYPE="ext4" PARTUUID="470b8920-7bbf-4175-b278-60463db0499b"
> /dev/sda3: LABEL="SWAP-64" UUID="a1f4730d-5851-4d27-a6f7-40f3beb9c204"
> TYPE="swap" PARTUUID="cc770a46-ec00-4383-9a6b-ce1758326011"
> /dev/sda4: LABEL="ROOTFS" UUID="79119161-c934-4ff9-9467-749941058279"
> TYPE="ext4" PARTUUID="daa9a0dd-254f-9940-a64a-766dcaca2379"
> /dev/mmcblk0: PTTYPE="gpt"
> /dev/mmcblk0p1: UUID="bcff77ba-f2a3-488d-98ef-45c931147717"
> TYPE="ext4" PARTLABEL="APP"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p2: PARTLABEL="mts-bootpack"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p3: PARTLABEL="cpu-bootloader"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p4: PARTLABEL="bootloader-dtb"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p5: PARTLABEL="secure-os"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p6: PARTLABEL="eks" PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p7: PARTLABEL="bpmp-fw"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p8: PARTLABEL="bpmp-fw-dtb"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p9: PARTLABEL="sce-fw"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p10: PARTLABEL="sc7" PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p11: PARTLABEL="FBNAME"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p12: PARTLABEL="BMP" PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p13: PARTLABEL="SOS" PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p14: PARTLABEL="kernel"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p15: PARTLABEL="kernel-dtb"
> PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p16: PARTLABEL="CAC" PARTUUID="00000000-0000-0000-0000-000000000000"
> /dev/mmcblk0p17: PARTLABEL="UDA" PARTUUID="00000000-0000-0000-0000-000000000000"
> 
> Because mmcblk0 is PARTUUID the same for all partitions, I have
> decided that this path does not lead.

182 /*
183  *      Convert a name into device number.  We accept the following variants:
184  *
185  *      1) <hex_major><hex_minor> device number in hexadecimal represents itself
186  *         no leading 0x, for example b302.
187  *      2) /dev/nfs represents Root_NFS (0xff)
188  *      3) /dev/<disk_name> represents the device number of disk
189  *      4) /dev/<disk_name><decimal> represents the device number
190  *         of partition - device number of disk plus the partition number
191  *      5) /dev/<disk_name>p<decimal> - same as the above, that form is
192  *         used when disk name of partitioned disk ends on a digit.
193  *      6) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
194  *         unique id of a partition if the partition table provides it.
195  *         The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
196  *         partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
197  *         filled hex representation of the 32-bit "NT disk signature", and PP
198  *         is a zero-filled hex representation of the 1-based partition number.
199  *      7) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
200  *         a partition with a known unique id.
201  *      8) <major>:<minor> major and minor number of the device separated by
202  *         a colon.

Doesn't option #7 work in this case?

Cheers
Jon

-- 
nvpublic
