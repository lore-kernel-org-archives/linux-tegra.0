From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [REGRESSION] drm/tegra: hdmi: tegra_hdmi_setup_audio: division
 by zero in kernel
Date: Mon, 11 Feb 2019 10:57:01 +0100
Message-ID: <0bed49114afa5cb847a1f897296f41171b812fbd.camel@toradex.com>
References: <87f8fd40b25e2842b547059a8d28295533e8c09c.camel@toradex.com>
 <20190211080007.GA923@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190211080007.GA923@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <treding@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alban.bedel@avionic-design.de" <alban.bedel@avionic-design.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry

On Mon, 2019-02-11 at 09:00 +0100, Thierry Reding wrote:
> What exactly was your setup like?

Setup was an Apalis T30 2GB V1.1B module on an Apalis Evaluation board
V1.1A with our 5.7 inch panel connected to parallel RGB as well as DVI-
D aka HDMI connected to a Philips BDM3270 screen. Via kernel command
line I forced regular VESA VGA as follows:

video=HDMI-A-1:640x480-16@60

> I think the only way that this could
> happen is if the sample_rate variable was 0, and I'm not sure how
> that
> could happen. I remember testing this on Beaver without ever seeing a
> crash, so I don't know what I overlooked.
> 
> Looking at the code it seems like the only way that it would happen
> is
> if the format structure was never initialized, and it seems like it
> actually is zeroed out and if nobody ever plays audio over HDMI it
> will
> remain that way. But that means that HDMI would always crash, and
> that
> is definitely not something that I've observed.
> 
> Can you specify what exactly your test case is and how I can
> reproduce?

I believe you once got such an Apalis T30 kit from us. I usually just
install our latest regular BSP e.g. 2.8b5 using the Toradex Easy
Installer [1] directly from the Internet then boot it up and scp the
mainline device tree (renamed) and kernel binary (compiled using
regular tegra_defconfig) to it e.g.:

scp arch/arm/boot/zImage root@<IP>:/media/mmcblk0p1/
scp arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dtb root@<IP>:/media/mmc
blk0p1/tegra30-apalis-eval.dtb

Note: U-Boot just expect a device tree by that name.

Note2: Once it runs mainline the eMMC will be mmcblk2 rather than
mmcblk0.

Upon reboot I stop in U-Boot changing the following arguments:

setenv stdout serial
setenv emmcargs ip=off root=/dev/mmcblk2p2 ro rootfstype=ext3 rootwait
setenv vidargs 'video=HDMI-A-1:640x480-16@60'
saveenv
reset

That should get it booting mainline. Once booted I rename the default
xorg.conf so it falls back to auto configuration using fbdev rather
then trying to use NVIDIA's proprietary downstream L4T Tegra X driver
which should then even get the LXDE up and running e.g.:

root@apalis-t30:~# mv /etc/X11/xorg.conf /etc/X11/xorg.conf.orig

Note3: For NVDIIA L4T R16.5 compatibility reason it runs ancient X.Org
X Server 1.14.7 which does not yet feature any modesetting driver.

However, the particular issue observed happens already during boot in
the kernel way before any user space is involved.

[1] 
https://developer.toradex.com/software/toradex-easy-installer#load-toradex-easy-installer

> Thierry

Cheers

Marcel
