From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: kernel-next on jetson tx2 - boot fail
Date: Fri, 9 Feb 2018 09:40:43 -0700
Message-ID: <11a1774d-aad0-9b12-5051-a6f85c84e3a3@wwwdotorg.org>
References: <CAFCWPPK8jvXVOL6W-NMpj9aveWQAAv33BoFbipmhEKOCte0sKw@mail.gmail.com>
 <4787c6dc-c6d3-4879-a3d6-1e48868d304b@nvidia.com>
 <5e4c1aef-1af9-857e-3509-b36a71454d6e@kapsi.fi>
 <269318eb-6b5f-70ec-dbbc-f280d6105441@wwwdotorg.org>
 <CAFCWPPLm=3=Dta70bU+1F3w2Ob97aR7RD1pnbfsDXKHbyqd+5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFCWPPLm=3=Dta70bU+1F3w2Ob97aR7RD1pnbfsDXKHbyqd+5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/09/2018 02:16 AM, Milan Buška wrote:
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

Ah yes, this is a known issue in the partition table created by L4T on 
eMMC. As you noticed, you won't have that issue for other storage. 
Perhaps there's a way to edit the partition UUID on eMMC after-the-fact 
and assign new UUIDs.
