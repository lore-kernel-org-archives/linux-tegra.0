From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Tegra gpio driver: Need to configure pins in gpio mode/nontristate
	with  gpio-request
Date: Thu, 5 May 2011 14:57:58 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD906B1331B056@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1523162151=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

--===============1523162151==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_96C9D994977DD0439FB6D3FE3B13DD906B1331B056BGMAIL01nvidi_"

--_000_96C9D994977DD0439FB6D3FE3B13DD906B1331B056BGMAIL01nvidi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
When working on gpio driver for tegra, I found that gpio_request() does not=
 make the corresponding soc pins to gpio mode. It still keeps the pins in S=
FIO mode.
So we need to call two extra function along with gpio_request():
Tegra_gpio_enable() and function for setting the pins in no non-tristate.

Sue to this, the gpio sysfs interface does not work properly from user spac=
e /sys/class/gpio/.
To make the pin in gpio mode fom user space, need to have changes in kernel=
.

Should be the gpio_request() should make the pins to gpio mode and make rea=
dy for use.
Similarly gpio_free() should again put the pin into sfio mode with tristate=
 disable.


Please review the above and provide feedback.

Thanks,
Laxman


--_000_96C9D994977DD0439FB6D3FE3B13DD906B1331B056BGMAIL01nvidi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri, sans-serif" size=3D"2">
<div>Hi All,</div>
<div>When working on gpio driver for tegra, I found that gpio_request() doe=
s not make the corresponding soc pins to gpio mode. It still keeps the pins=
 in SFIO mode.</div>
<div>So we need to call two extra function along with gpio_request():</div>
<div>Tegra_gpio_enable() and function for setting the pins in no non-trista=
te.</div>
<div>&nbsp;</div>
<div>Sue to this, the gpio sysfs interface does not work properly from user=
 space /sys/class/gpio/.</div>
<div>To make the pin in gpio mode fom user space, need to have changes in k=
ernel.</div>
<div>&nbsp;</div>
<div>Should be the gpio_request() should make the pins to gpio mode and mak=
e ready for use.</div>
<div>Similarly gpio_free() should again put the pin into sfio mode with tri=
state disable.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Please review the above and provide feedback.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Laxman</div>
<div>&nbsp;</div>
</font>
</body>
</html>

--_000_96C9D994977DD0439FB6D3FE3B13DD906B1331B056BGMAIL01nvidi_--


--===============1523162151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1523162151==--
