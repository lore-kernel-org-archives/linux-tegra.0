From: Erik Gilling <konkers@google.com>
Subject: Re: Tegra gpio driver: Need to configure pins in gpio
	mode/nontristate with gpio-request
Date: Thu, 5 May 2011 07:23:12 -0700
Message-ID: <BANLkTimxGs44zkVHm-ZNL5kXryAPy0ChYA@mail.gmail.com>
References: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1287716866=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068@BGMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

--===============1287716866==
Content-Type: multipart/alternative; boundary=20cf300fb159facfc204a2881c5d

--20cf300fb159facfc204a2881c5d
Content-Type: text/plain; charset=ISO-8859-1

GPIO and pinmuxing are two different things.  The GPIO api
docs explicitly state the gpio_request should take no affect ofther than
marking that GPIO as in use.

-Erik

On Thu, May 5, 2011 at 3:16 AM, Laxman Dewangan <ldewangan@nvidia.com>wrote:

> Hi All,
> When working on gpio driver for tegra, I found that gpio_request() does not
> make the corresponding soc pins to gpio mode. It still keeps the pins in
> SFIO mode.
> So we need to call two extra function along with gpio_request():
> Tegra_gpio_enable() and function for setting the pins in no non-tristate.
>
> Sue to this, the gpio sysfs interface does not work properly from user
> space /sys/class/gpio/.
> To make the pin in gpio mode fom user space, need to have changes in
> kernel.
>
> I think the gpio_request() should make the pins to gpio mode and make ready
> for use.
> Similarly gpio_free() should again put the pin into sfio mode with tristate
> disable.
>
> Please comment if there is any better way..
>
>
> Thanks,
> Laxman
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--20cf300fb159facfc204a2881c5d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

GPIO and pinmuxing are two different things. =A0The GPIO api docs=A0explici=
tly=A0state the gpio_request should take no affect ofther than marking that=
 GPIO as in use.<div><br></div><div>-Erik<br><br><div class=3D"gmail_quote"=
>On Thu, May 5, 2011 at 3:16 AM, Laxman Dewangan <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ldewangan@nvidia.com">ldewangan@nvidia.com</a>&gt;</span> wro=
te:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">Hi All,<br>
When working on gpio driver for tegra, I found that gpio_request() does not=
<br>
make the corresponding soc pins to gpio mode. It still keeps the pins in SF=
IO mode.<br>
So we need to call two extra function along with gpio_request():<br>
Tegra_gpio_enable() and function for setting the pins in no non-tristate.<b=
r>
<br>
Sue to this, the gpio sysfs interface does not work properly from user spac=
e /sys/class/gpio/.<br>
To make the pin in gpio mode fom user space, need to have changes in kernel=
.<br>
<br>
I think the gpio_request() should make the pins to gpio mode and make ready=
 for use.<br>
Similarly gpio_free() should again put the pin into sfio mode with tristate=
 disable.<br>
<br>
Please comment if there is any better way..<br>
<br>
<br>
Thanks,<br>
Laxman<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</blockquote></div><br></div>

--20cf300fb159facfc204a2881c5d--


--===============1287716866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1287716866==--
