From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: as3722: Handle interrupts on suspend
Date: Fri, 20 Nov 2015 10:30:18 +0000
Message-ID: <20151120103018.GD3098@x1>
References: <1447942983-31810-1-git-send-email-jonathanh@nvidia.com>
 <564EF174.4020300@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <564EF174.4020300@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 20 Nov 2015, Jon Hunter wrote:

>=20
> On 19/11/15 14:23, Jon Hunter wrote:
> > The as3722 device is registered as an irqchip and the as3722-rtc in=
terrupt
> > is one of it's interrupt sources. When using the as3722-rtc as a wa=
ke-up
> > device from suspend, the following is seen:
> >=20
> >   PM: Syncing filesystems ... done.
> >   Freezing user space processes ... (elapsed 0.001 seconds) done.
> >   Freezing remaining freezable tasks ... (elapsed 0.001 seconds) do=
ne.
> >   Suspending console(s) (use no_console_suspend to debug)
> >   PM: suspend of devices complete after 161.119 msecs
> >   PM: late suspend of devices complete after 1.048 msecs
> >   PM: noirq suspend of devices complete after 0.756 msecs
> >   Disabling non-boot CPUs ...
> >   CPU1: shutdown
> >   CPU2: shutdown
> >   CPU3: shutdown
> >   Entering suspend state LP1
> >   Enabling non-boot CPUs ...
> >   CPU1 is up
> >   CPU2 is up
> >   CPU3 is up
> >   PM: noirq resume of devices complete after 0.487 msecs
> >   as3722 4-0040: Failed to read IRQ status: -16
> >   as3722 4-0040: Failed to read IRQ status: -16
> >   as3722 4-0040: Failed to read IRQ status: -16
> >   as3722 4-0040: Failed to read IRQ status: -16
> >   ...
> >=20
> > The reason why the as3722 interrupt status cannot be read is becaus=
e the
> > as3722 interrupt is not masked during suspend and when the as3722-r=
tc
> > interrupt occurs, to wake-up the device, the interrupt is seen befo=
re the
> > i2c controller has been resumed in order to read the as3722 interru=
pt
> > status.
> >=20
> > The as3722-rtc driver sets it's interrupt as a wake-up source durin=
g
> > suspend, which gets propagated to the parent as3722 interrupt. Howe=
ver,
> > the as3722-rtc driver cannot disable it's interrupt during suspend
> > otherwise we would never be woken up and so the as3722 must disable=
 it's
> > interrupt instead.
> >=20
> > Fix this by disabling the as3722 interrupt during suspend. To ensur=
e that
> > a wake-up event from the as3722 is not missing, enable the as3722 i=
nterrupt
> > as a wake-up source before disabling the interrupt on entering susp=
end.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >  drivers/mfd/as3722.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >=20
> > diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
> > index 924ea90494ae..8ee6e4008276 100644
> > --- a/drivers/mfd/as3722.c
> > +++ b/drivers/mfd/as3722.c
> > @@ -405,6 +405,8 @@ static int as3722_i2c_probe(struct i2c_client *=
i2c,
> >  		goto scrub;
> >  	}
> > =20
> > +	device_init_wakeup(as3722->dev, true);
> > +
> >  	dev_dbg(as3722->dev, "AS3722 core driver initialized successfully=
\n");
> >  	return 0;
> > =20
> > @@ -422,6 +424,28 @@ static int as3722_i2c_remove(struct i2c_client=
 *i2c)
> >  	return 0;
> >  }
> > =20
> > +static int as3722_i2c_suspend(struct device *dev)
> > +{
> > +	struct as3722 *as3722 =3D dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		enable_irq_wake(as3722->chip_irq);
> > +	disable_irq(as3722->chip_irq);
> > +
> > +	return 0;
> > +}
> > +
> > +static int as3722_i2c_resume(struct device *dev)
> > +{
> > +	struct as3722 *as3722 =3D dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		disable_irq_wake(as3722->chip_irq);
> > +	enable_irq(as3722->chip_irq);
>=20
> I just realised that I should enable the irq before disabling the wak=
eup
> here. I will fix that.
>=20
> I will wait to send out a V2 for a couple days in case there are any
> other comments.

Easier for everyone if you just resend.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
