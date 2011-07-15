From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: tegra: remove copy-and-pasted usb platform data
	from boards
Date: Fri, 15 Jul 2011 21:40:41 +0200
Message-ID: <201107152140.42122.heiko@sntech.de>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
	<201107151155.56495.heiko@sntech.de>
	<CAMbhsRTxAwKJ7qiK=_BAMc3Y1x_WHF7WHrm_54o-sYLBb1zzng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMbhsRTxAwKJ7qiK=_BAMc3Y1x_WHF7WHrm_54o-sYLBb1zzng@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, Mike Rapoport <mike@compulab.co.il>, linux-arm-kernel@lists.infradead.org, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

Am Freitag 15 Juli 2011, 18:45:53 schrieb Colin Cross:
> On Fri, Jul 15, 2011 at 2:55 AM, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Freitag, 15. Juli 2011, 11:13:48 schrieb Marc Dietrich:
> >> see comment for PATCH 1/2
> >> =

> >> Am Sun, 10 Jul 2011 15:19:34 -0700
> >> =

> >> schrieb Colin Cross <ccross@android.com>:
> >> > trimslice and paz00 both have functionally identical platform
> >> > data for the tegra-ehci driver.  Move the platform data into
> >> > devices.c, and remove it from all the board files.
> >> > =

> >> > Signed-off-by: Colin Cross <ccross@android.com>
> >> =

> >> Acked-By: Marc Dietrich <marvin24@gmx.de>
> >> =

> >> > ---
> >> > =

> >> >  arch/arm/mach-tegra/board-paz00.c     |   26
> >> > =

> >> > =

> >> > =

> >> > -static struct tegra_ulpi_config ulpi_phy_config =3D {
> >> > -           .reset_gpio =3D TEGRA_ULPI_RST,
> >> > -           .clk =3D "cdev2",
> >> > -};
> >> > -
> >> > -static struct tegra_ehci_platform_data tegra_ehci_pdata[] =3D {
> >> > -           [0] =3D {
> >> > -                   .operating_mode =3D TEGRA_USB_OTG,
> >> > -                   .power_down_on_bus_suspend =3D 1,
> >> > -           },
> >> > -           [1] =3D {
> >> > -                   .phy_config =3D &ulpi_phy_config,
> >> > -                   .operating_mode =3D TEGRA_USB_HOST,
> >> > -                   .power_down_on_bus_suspend =3D 1,
> >> > -           },
> >> > -           [2] =3D {
> >> > -                   .operating_mode =3D TEGRA_USB_HOST,
> >> > -                   .power_down_on_bus_suspend =3D 1,
> >> > -           },
> >> > -};
> > =

> > I'm not sure about this.
> > =

> > For paz00 tegra_ehci3_device also leads to an external usb port. With
> > power_down_on_bus_suspend =3D 1 hotplugging usb devices doesn't work (as
> > the bus might be suspended at the time).
> > =

> > From the initial commit message of ehci-tegra on android.git.kernel.org:
> > "For additional power saving, the driver supports powering down the
> > phy on bus suspend when it is used, for example, to connect an internal
> > device that use an out-of-band remote wakeup mechanism (e.g. a gpio)."
> > =

> > So my guess was, that the correct handling of this was setting
> > power_down_on_bus_suspend to 0 - which did fix the problem.
> > =

> > With this data moving to devices.c, setting this would also change the
> > trimslice behaviour which would be a problem.
> > =

> > In the end I'm not sure if setting power_down_on_bus_suspend to 0 is the
> > correct solution to the hotplug problem or if a better solution exists.
> > =

> > Thanks
> > Heiko
> =

> Can you or someone else test if power_down_on_bus_suspend is causing a
> problem?  If it is, I'll change the default in devices.c to
> power_down_on_bus_suspend=3D0, and devices that want
> power_down_on_bus_suspend=3D1 will have to set it.

With power_down_on_bus_suspend =3D 1, paz00 fails to recognize newly attach=
ed =

devices, i.e. only devices connected during boot are accessible.
But it doesn't cause problems with the devices themselfs.

Am Freitag 15 Juli 2011, 20:30:18 schrieb Olof Johansson:
> (Note: I'll post a patch in a bit that keeps the IP clocked even if phy is
> powered down on bus suspend, since otherwise we don't get hotplug events
> for hub-less systems).
This might also fix the hotplug problem on paz00 *fingers crossed*.

Heiko
