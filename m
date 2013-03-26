From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: unaligned access in part_efi.c
Date: Tue, 26 Mar 2013 21:42:40 +0100
Message-ID: <19802419.J2rqQhB4h6@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Warren <twarren.nvidia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Chang Hyun Park <heartinpiece-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

access to part->start_sect in pmbr_part_valid() (form disk/part_efi.c) and 
propably other positions/fields causes an unaligned access on ARM (tegra in my 
case) and a uboot crash. This was introduced by commit fae2bf22 [1] which 
changed le32_to_int (which is a byte access) to le32_to_cpu (which is a 32bit 
access).

I'm not sure how to fix this as I'm not very familar with this kind of 
problems. Any help?

Thanks!

Marc

[1] gpt: The leXX_to_int() calls replaced with ones defined at <compiler.h>
