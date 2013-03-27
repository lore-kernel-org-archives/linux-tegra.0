From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: unaligned access in part_efi.c
Date: Wed, 27 Mar 2013 12:23:22 -0600
Message-ID: <5153391A.1010201@wwwdotorg.org>
References: <19802419.J2rqQhB4h6@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19802419.J2rqQhB4h6@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Warren <twarren.nvidia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chang Hyun Park <heartinpiece-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/26/2013 02:42 PM, Marc Dietrich wrote:
> Hi,
> 
> access to part->start_sect in pmbr_part_valid() (form disk/part_efi.c) and 
> propably other positions/fields causes an unaligned access on ARM (tegra in my 
> case) and a uboot crash. This was introduced by commit fae2bf22 [1] which 
> changed le32_to_int (which is a byte access) to le32_to_cpu (which is a 32bit 
> access).

I can't reproduce this with latest u-boot-arm/master, which includes
that commit. Both "mmc dev N; mmc rescan ; mmcinfo" and "part list mmc
N" work fine for me with both DOS PT and GPT.

I did test this on a Tegra Seaboard which isn't identical to the AC100,
but the only practical difference is 512M vs 1G RAM, which seems
unlikely to cause this.

It'd help if you pointed out exactly which access causes the issue;
which piece of code is failing. The most likely issue is that some
memory buffer is assumed to be aligned to 4-bytes, but actually isn't.
To track that down, we'd need to know which code and which buffer. Also,
a disassembly of the problematic function would be useful.
