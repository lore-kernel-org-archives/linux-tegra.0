From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: NVFlash hangs when flashing U-Boot on Tegra2 board
Date: Mon, 23 Jul 2012 18:54:36 +0900
Message-ID: <500D1F5C.1060603@nvidia.com>
References: <loom.20120723T101555-779@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <loom.20120723T101555-779-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Nuno,

On Mon 23 Jul 2012 05:45:09 PM JST, Nuno Santos wrote:
> Hi
>
> I have a Tegra2 based board (Harmony) running Linux. It is currently booting
> using the fastboot.bin bootloader shipped with NVIDIA's SDK Developer Kit, but
> I need to replace it for U-Boot, because U-Boot is open source.
>
> So far I've been able to successfully deploy U-Boot on the device using nvflash
> and U-Boot actually runs. However, nvflash hangs waiting for the bootloader to
> finish initializing and therefore flashing won't happen. Apparently nvflash is
> expecting the bootloader to follow some protocol, which U-Boot apparently
> is not aware of.
>
> I'd really appreciate any help on this and I'm sorry in advance if this is not
> the right forum to publish this question. It has been really hard to find
> information on the web about this. Furthermore, I haven't been able to find
> nvflash source code anywhere, which could help tremendously to investigate
> what's going on; if at least someone could point me to where I can download
> I'd be deeply grateful.
>
> So, this is what I'm using to flash the bootloader:
>
> sudo ./nvflash --bct flash.bct --setbct --configfile flash.cfg --create
>      --bl u-boot-dtb.bin --go

If I understand correctly, you are giving the wrong parameter to --bl. 
--bl is the bootloader that is used to interpret the commands sent by 
nvflash and create the layout described in flash.cfg. Therefore you want 
to use the bootloader that is provided in your BSP as argument to --bl, 
and modify flash.cfg to write u-boot to the right partition of your 
flash memory. Then I guess you will have the expected result.

With your current command you are indeed running U-boot from nvflash, 
but it is never written to flash memory and cannot understand the 
commands that nvflash tries to send it.

Hope this helps,
Alex.
