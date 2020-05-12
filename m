From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
Date: Tue, 12 May 2020 16:59:53 -0400
Message-ID: <CAMavQKJtbha_o==X+MX6GmjfAMYvdLyubvCFg48Tbn1mdgo40w@mail.gmail.com>
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com> <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
 <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com> <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
 <736ad1d2-4a28-87e8-62f7-28a5582c9fcf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <736ad1d2-4a28-87e8-62f7-28a5582c9fcf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "dbasehore ." <dbasehore@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel <linux-kernel@vger.kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 16, 2020 at 7:03 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 15.04.2020 00:32, dbasehore . =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Apr 14, 2020 at 2:18 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> 14.04.2020 22:32, dbasehore . =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Hi Dmitry, sorry for the late reply.
> >>>
> >>> On Sun, Mar 8, 2020 at 12:25 PM Dmitry Osipenko <digetx@gmail.com> wr=
ote:
> >>>>
> >>>> 06.03.2020 03:21, Derek Basehore =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> This adds the plumbing for reading panel rotation from the devicetr=
ee
> >>>>> and sets up adding a panel property for the panel orientation on
> >>>>> Mediatek SoCs when a rotation is present.
> >>>>
> >>>> Hello Derek and everyone,
> >>>>
> >>>> I'm looking at adding display rotation support to NVIDIA Tegra DRM
> >>>> driver because some devices have display panel physically mounted
> >>>> upside-down, and thus, display controller's scan-out needs to be rot=
ated
> >>>> by 180=C2=B0 in this case.
> >>>>
> >>>> Derek, yours panel-rotation patches add support for assigning panel'=
s
> >>>> orientation to the connector, but then only primary display plane
> >>>> receives rotation value in [1], while rotation needs to be applied t=
o
> >>>> all available overlay/cursor planes and this should happen in other
> >>>> places than [1] as well.
> >>>
> >>> This is intended. We don't correct the output in the kernel. We
> >>> instead rely on notifying userspace that the panel is rotated, then w=
e
> >>> handle it there.
> >>>
> >>>>
> >>>> [1] drm_client_modeset_commit_atomic()
> >>>>
> >>>> Please also note that in a case of the scan-out rotation, plane's
> >>>> coordinates need to be changed in accordance to the display's rotati=
on.
> >>>>
> >>>> I looked briefly through the DRM code and my understanding that the =
DRM
> >>>> core currently doesn't support use-case where scan-out needs to rota=
ted
> >>>> based on a panel's orientation, correct? Is it the use-case you're
> >>>> working on for the Mediatek driver?
> >>>
> >>> Yes, we rely on userspace to rotate the output. The major reason for
> >>> this is because there may not be a "free" hardware rotation that can
> >>> be applied to the overlay. Sean Paul and others also preferred that
> >>> userspace control what is output to the screen instead of the kernel
> >>> taking care of it. This code just adds the drm property to the panel.
> >>>
> >>
> >> Could you please explain what that userspace is?
> >
> > This was added for Chrome OS, which uses its own graphics stack,
> > Ozone, instead of Xorg.
> >
>
> Thank you very much for the clarification.
>
> It's probably not a big problem for something monolithic and customized
> like ChromeOS to issue a software update in order to take into account
> all specifics of a particular device, but this doesn't work nicely for a
> generic software, like a usual Linux distro.
>
> >> AFAIK, things like Xorg modesetting don't support that orientation pro=
perty.
>
> In my case it's not only the display panel which is upside-down, but
> also the touchscreen. Hence both display output and touchscreen input
> need to be rotated at once, otherwise you'll end up with either display
> or input being upside-down.
>
> The 180=C2=B0 rotation should be free on NVIDIA Tegra. There are no known
> limitations for the planes and BSP kernel video driver handles the
> plane's coordinates/framebuffer rotation within the driver.
>
> The kernel's input subsystem allows us to transparently (for userspace)
> remap the touchscreen input (by specifying generic touchscreen
> device-tree properties), while this is not the case for the DRM subsystem=
.
>
> @Thierry, @Sean, @Daniel, could you please help me to understand how a
> coordinated display / input rotation could be implemented, making the
> rotation transparent to the user (i.e. avoiding xorg.conf hacking and
> etc)? It should be nice if display's output could be flipped within the
> DRM driver, hiding this fact from userspace.

I think the right thing to do is to fix userspace to respect this
property, since that has the most communal benefit.

However(!!) if you don't want to do that, how about inspecting the
info->panel_orientation value after drm_panel_attach in tegra driver
and then adjusting rotation values in the driver. Of course, you
wouldn't want to expose the panel orientation property since you don't
want userspaces to be double-rotating on you, but it's optional so
you'd be fine.

>
> Will it be okay if we'll add a transparent-rotation support specifically
> to the Tegra DRM driver? For example if device-tree contains
> nvidia,display-flip-y property, then the Tegra DRM driver will take care
> of rotating coordinates/framebuffer of the display planes.

I don't think this is necessary, but it also wouldn't really be
appropriate to put software attributes into devicetree anyways.

Sean
