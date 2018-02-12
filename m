From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Jetson TX2 and serial console
Date: Mon, 12 Feb 2018 17:39:14 +0000
Message-ID: <CAFCWPPLsFit2xL8YCEAV2AQPLSg6C27Jzetw9JvThfwuePUp8g@mail.gmail.com>
References: <CAFCWPPKe6LW1+Uu40tGz4jzYwHY6MvU2D79HauWxRHOentVq3A@mail.gmail.com>
 <4e6b2e2a-af20-3bf3-149c-497584b17212@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4e6b2e2a-af20-3bf3-149c-497584b17212-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

Use
USB to TTL Serial Cable - Debug / Console Cable for Raspberry Pi

Jetson TX2 J21 Pin 8 (UART 1 TXD) =E2=86=92 Cable RXD (White Wire)
Jetson TX2 J21 Pin 10 (UART 1 RXD) =E2=86=92 Cable TXD (Green Wire)
Jetson TX2 J21 Pin 9 (GND) =E2=86=92 Cable GND (Black Wire)

host PC over usb connected via /dev/ttyUSB0 minicom

L4T yes use
./flash.sh jetson-tx2 mmcblk0p1 and config file for setup extlinux.conf

Something I'm wrong with.
ttyS0? inittab? extlinux.conf line ADD?

TX2 OS Crux    Host PC OS Crux

After boot TX2 on host PC
I will be shown (tail)
hostname: ishi
font: default
keyboard: us
INIT: Entering runlevel: 2
starting services: sysklogd lo net firewall crond gpm saslauthd
Here's my problem.
  =EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD     =EF=BF=BD  =
=EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=BF=BD  =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD =
=EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
and here I'm done

Again, I am sorry to be burdening this mailing list with stupid questions

Regards

Milan

2018-02-12 8:20 GMT+00:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>
> On 09/02/18 18:41, Milan Bu=C5=A1ka wrote:
>> Hi Jon,
>>
>> Is there any way to control tx2 via the serial interface?
>> Every time I run the minicom, it stops before the bash prompt.
>> I mean to communicate with tx2 with the computer on which the minicom ru=
ns.
>
> Yes that should work. I always use the serial interface. What userspace
> are you using? If you are using the L4T userspace it should work.
>
> Jon
>
> --
> nvpublic



--=20
---------------------------------------------------------------------------=
-
Remember, no question is too stupid and no problem
          too small--We've all been beginners
