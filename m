From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 0/7] Support inhibiting input devices
Date: Wed, 10 Jun 2020 12:38:30 +0200
Message-ID: <CAJZ5v0hB2ra2K=dd9ZjVyy1V2b1PmFHm79uDO2HtHU1D_4YUbw@mail.gmail.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com> <964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Linux PM <linux-pm@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-input@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kuk
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 10, 2020 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> On 6/8/20 1:22 PM, Andrzej Pietrasiewicz wrote:
> > This is a quick respin of v3, with just two small changes, please see
> > the changelog below.
> >
> > Userspace might want to implement a policy to temporarily disregard input
> > from certain devices.
> >
> > An example use case is a convertible laptop, whose keyboard can be folded
> > under the screen to create tablet-like experience. The user then must hold
> > the laptop in such a way that it is difficult to avoid pressing the keyboard
> > keys. It is therefore desirable to temporarily disregard input from the
> > keyboard, until it is folded back. This obviously is a policy which should
> > be kept out of the kernel, but the kernel must provide suitable means to
> > implement such a policy.
>
> First of all sorry to start a somewhat new discussion about this
> while this patch set is also somewhat far along in the review process,
> but I believe what I discuss below needs to be taken into account.
>
> Yesterday I have been looking into why an Asus T101HA would not stay
> suspended when the LID is closed. The cause is that the USB HID multi-touch
> touchpad in the base of the device starts sending events when the screen
> gets close to the touchpad (so when the LID is fully closed) and these
> events are causing a wakeup from suspend. HID multi-touch devices
> do have a way to tell them to fully stop sending events, also disabling
> the USB remote wakeup the device is doing. The question is when to tell
> it to not send events though ...
>
> So now I've been thinking about how to fix this and I believe that there
> is some interaction between this problem and this patch-set.
>
> The problem I'm seeing on the T101HA is about wakeups, so the question
> which I want to discuss is:
>
> 1. How does inhibiting interact with enabling /
> disabling the device as a wakeup source ?
>
> 2. Since we have now made inhibiting equal open/close how does open/close
> interact with a device being a wakeup source ?
>
> And my own initial (to be discussed) answers to these questions:
>
> 1. It seems to me that when a device is inhibited it should not be a
> wakeup source, so where possible a input-device-driver should disable
> a device's wakeup capabilities on suspend if inhibited

If "inhibit" means "do not generate any events going forward", then
this must also cover wakeup events, so I agree.

> 2. This one is trickier I don't think we have really clearly specified
> any behavior here. The default behavior of most drivers seems to be
> using something like this in their suspend callback:
>
>          if (device_may_wakeup(dev))
>                  enable_irq_wake(data->irq);
>          else if (input->users)
>                  foo_stop_receiving_events(data);
>
> Since this is what most drivers seem to do I believe we should keep
> this as is and that we should just clearly document that if the
> input_device has users (has been opened) or not does not matter
> for its wakeup behavior.
>
> Combining these 2 answers leads to this new pseudo code template
> for an input-device's suspend method:
>
>         /*
>          * If inhibited we have already disabled events and
>          * we do NOT want to setup the device as wake source.
>          */
>         if (input->inhibited)
>                 return 0;
>
>          if (device_may_wakeup(dev))
>                  enable_irq_wake(data->irq);
>          else if (input->users)
>                  foo_stop_receiving_events(data);
>
> ###

Sounds reasonable to me.

> A different, but related issue is how to make devices actually use the
> new inhibit support on the builtin keyboard + touchpad when say the lid
> is closed.   Arguably this is an userspace problem, but it is a tricky
> one. Currently on most modern Linux distributions suspend-on-lid-close
> is handled by systemd-logind and most modern desktop-environments are
> happy to have logind handle this for them.
>
> But most knowledge about input devices and e.g. heurisitics to decide
> if a touchpad is internal or external are part of libinput. Now we could
> have libinput use the new inhibit support (1), but then when the lid
> closes we get race between whatever process is using libinput trying
> to inhibit the touchpad (which must be done before to suspend to disable
> it as wakeup source) and logind trying to suspend the system.
>
> One solution here would be to move the setting of the inhibit sysfs
> attr into logind, but that requires adding a whole bunch of extra
> knowledge to logind which does not really belong there IMHO.
>
> I've been thinking a bit about this and to me it seems that the kernel
> is in the ideal position to automatically inhibit some devices when
> some EV_SW transitions from 0->1 (and uninhibit again on 1->0). The
> issue here is to chose on which devices to enable this. I believe
> that the auto inhibit on some switches mechanism is best done inside
> the kernel (disabled by default) and then we can have a sysfs
> attr called auto_inhibit_ev_sw_mask which can be set to e.g.
> (1 << SW_LID) to make the kernel auto-inhibit the input-device whenever
> the lid is closed, or to ((1 << SW_LID) | (1 << SW_TABLET_MODE)) to
> inhibit both when the lid is closed or when switched to tablet mode.

I agree that the kernel is the right place to handle this, but it
requires some extra knowledge about dependencies between devices.

It'd be kind of like power resources in ACPI, so for each state of a
"master" device (in principle, there may be more states of it than
just two) there would be a list of "dependent" intput devices that
need to be inhibited when the "master" device goes into that state.

> This could then be combined with a userspace utility run from an
> udev rule which makes the actual decision what auto_inhibit_ev_sw_mask
> should be set for a given input device.
>
> This will put the mechanism for what we want inside the kernel and
> leaves the policy on which switches we want this for out of the
> kernel.
>
> Note adding this new auto_inhibit_ev_sw_mask sysfs attr falls
> somewhat outside the context of this patchset and could be done
> as a follow up to this patch-set. But I do believe that we need to
> figure out how (non ChromeOS) userspace can / will use the new inhibit
> interface before merging it.
