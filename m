From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: NVFlash hangs when flashing U-Boot on Tegra2 board
Date: Mon, 23 Jul 2012 13:07:15 -0600
Message-ID: <500DA0E3.3080001@wwwdotorg.org>
References: <loom.20120723T101555-779@post.gmane.org> <500D1F5C.1060603@nvidia.com> <500D698B.3040405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <500D698B.3040405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/23/2012 09:11 AM, Nuno Santos wrote:
> Hi Alex
> 
> Thank you so much for your prompt response! It really help me understand
> what's going on! Based on your clarification, I was already able to
> flash u-boot on its own partition and have the device booting u-boot
> directly from flash.
> 
> Just one more thing. The next step is now to boot linux from u-boot.
> Ideally, I'd like to load the kernel from the Harmony board's nand flash
> using the "nboot" command. This command, however, is not available when
> I compile U-boot for Harmony and looking at U-boot's source code, there
> apparently no nand support for Tegra 2 based boards (at least I couldn't
> find any specific driver code). Do you know if this is actually the case?
> 
> Thank you again in advance!

(Mainline) U-Boot doesn't currently contain a driver for Tegra's NAND
controller. A driver does exist, and is in the process of being
upstreamed, it's just not there just yet.
