From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Linux hangs on Tegra 2 / U-Boot board
Date: Tue, 24 Jul 2012 09:59:51 -0600
Message-ID: <500EC677.5040309@wwwdotorg.org>
References: <loom.20120724T152735-115@post.gmane.org> <20120724140547.GA27999@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120724140547.GA27999-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/24/2012 08:05 AM, Thierry Reding wrote:
> On Tue, Jul 24, 2012 at 01:32:59PM +0000, Nuno Santos wrote:
>> Hi
>>=20
>> As I explained in a previous post, I have a Tegra2 based board
>> (Harmony) and (thanks to your help) I successfully managed to
>> flash and boot U-Boot.
>>=20
>> However, I=E2=80=99ve been trying to boot Linux from U-Boot but to n=
o
>> avail. Once the device runs U-boot, I load a Linux image into
>> memory over TFTP, run the command =E2=80=9Cbootm=E2=80=9D, and then =
Linux
>> immediately hangs after printing message =E2=80=9CStarting kernel ..=
=2E".
>>=20
>> I=E2=80=99ve tried multiple suggestions I=E2=80=99ve seen online: de=
fining linux
>> console boot in the =E2=80=9Cbootargs=E2=80=9D parameter in case it =
is a console
>> misconfiguration, recompile the kernel with CONFIG_DEBUG_LL to
>> diagnose the problem, and check the machine id (by providing
>> machine id 0xAAB in the environment var =E2=80=9Cmachid=E2=80=9D). I=
n all these
>> attempts there is no change whatsoever in the output.
>=20
> You need to pass earlyprintk in bootargs to see early debug output=20
> (CONFIG_DEBUG_LL). Also make sure that you've flashed with the
> correct ODMDATA set so the output goes to the correct UART.

Also, you need an appropriate Kconfig option to select which debug
UART to use. CONFIG_TEGRA_DEBUG_UART_AUTO_ODMDATA should hopefully
work fine, assuming your ODMDATA contains the correct UART setting
(e.g. 0x300d8011 should work).

>> I=E2=80=99d be really grateful if someone could give me a hand on th=
is.
>> So, here=E2=80=99s the details.
>>=20
>> 1. I=E2=80=99m using the kernel from
>> git://nv-tegra.nvidia.com/linux-2.6.git, pulled today and
>> configured as indicated in the doc (make tegra_defconfig); the
>> compilation also creates a uImage for U-Boot. I=E2=80=99m using the
>> latest version of U-Boot, compiled locally using the standard
>> procedure.
>=20
> It might help to try and run the upstream kernel just to check
> that everything works. I believe the NVIDIA downstream kernels
> currently don't boot properly when run from the upstream U-Boot.
> But I may be mistaken.

Upstream U-Boot has primarily (perhaps even only) been tested with an
upstream Linux kernel. Equally, our downstream kernels have mostly
only been tested with downstream fastboot, and partially with
downstream U-Boot. The upshot of this is that downstream kernels
incorrectly assume that the bootloader initializes a lot more stuff
(e.g. clocks). You will likely have much more luck booting an upstream
kernel, at least initially in order to get the process working.
