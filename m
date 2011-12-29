From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/2] Input: tegra-kbc - add default chromeos map
Date: Wed, 28 Dec 2011 22:06:41 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17755DC8D0@HQMAIL01.nvidia.com>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
	<1325053170-6984-3-git-send-email-olof@lixom.net>
	<20111228065013.GB29273@core.coreip.homeip.net>
 <CAOesGMheQqYjpDRaf6TTce2YEcD4hkTzS2JTdoCe3ue6+dBhDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMheQqYjpDRaf6TTce2YEcD4hkTzS2JTdoCe3ue6+dBhDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Simon Glass (sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org)" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, December 28, 2011 12:33 AM:
> On Tue, Dec 27, 2011 at 10:50 PM, Dmitry Torokhov
> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Dec 27, 2011 at 10:19:30PM -0800, Olof Johansson wrote:
> >> This adds a simple way to specify the ChromeOS-specific keyboard map
> >> instead of the "standard" map that is used on other Tegra devices such
> >> as Harmony-with-keyboard and Seaboard.
> >>
> >> I expect the number of different keyboard layouts to be quite limited,
> >> and not many should be added over time. So instead of encoding the layout
> >> in the device tree, with all the can of worms that entails w.r.t. agreeing
> >> on a suitable binding, just add a property to specify that this is the
> >> map to be used, and include it in the driver.
> >>
> >> If, over time, the number of mappings increase, the binding can be
> >> updated to include a custom map as a new property, without having to
> >> worry about backwards compatibility on existing devices.
> >>
> >
> > I'd rather we did not make shortcuts and did the proper DT binding.
> > Samsung folks want the similar thing so making a generic DT keymap
> > parser and using it in the driver would be the best way.
> 
> Ok, fair point. I found the last posted version of the samsung driver
> in my archives so I'll continue the discussion there (see separate
> followup there).

I agree here. Simon Glass has posted some patches to U-Boot to add the
Tegra KBC driver including DT bindings. Can you please co-ordinate with
him to ensure the bindings you're proposing for the kernel match those
he's proposing for U-Boot; from memory, I don't think they are so far.
Also, we need to work out the issue of the kernel needing just the base
and function-modified keymap, but U-Boot needing a shift- and ctrl-
modified keymap since there's no input layer handling shift/ctrl in
U-Boot. I'd prefer that the DT binding be encoded as:

matrix -> keycode for base
matrix -> keycode for function-modified

With the binding for those two defined by either the Tegra KBC binding or
a generic matrix KBC binding.

keycode -> keycode for shift-modified
keycode -> keycode for ctrl-modified

With the binding for those two defined by some kind of generic modifier
mapping binding, so it could feed into the input layer on Linux, although
in U-Boot, the Tegra KBC driver would have to handle it itself, since
there's nowhere else to handle it.

-- 
nvpublic
