From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Input: tegra-kbc - add default chromeos map
Date: Thu, 29 Dec 2011 01:47:34 -0800
Message-ID: <CAOesGMj=7P-AktX0DyNXncPKCgfXEVHJreMVEu_L+v+CGxgHYQ@mail.gmail.com>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
	<1325053170-6984-3-git-send-email-olof@lixom.net>
	<20111228065013.GB29273@core.coreip.homeip.net>
	<CAOesGMheQqYjpDRaf6TTce2YEcD4hkTzS2JTdoCe3ue6+dBhDQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17755DC8D0@HQMAIL01.nvidia.com>
	<CAOesGMi6CpVVjUS4EoXbtxdw=Wj8G2_+SFzvqp1DP_mpjCoNVA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17755DC8D9@HQMAIL01.nvidia.com>
	<CAOesGMh=MESRSs0YeFJpf__E7FNmPY4zdNjz7hBqMuiWbUJsow@mail.gmail.com>
	<20111229094106.GB3397@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111229094106.GB3397-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Simon Glass (sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org)" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 29, 2011 at 1:41 AM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Dec 28, 2011 at 11:13:50PM -0800, Olof Johansson wrote:
>> On Wed, Dec 28, 2011 at 10:58 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Olof Johansson wrote at Wednesday, December 28, 2011 11:42 PM:
>> >> On Wed, Dec 28, 2011 at 10:06 PM, Stephen Warren <swarren@nvidia.=
com> wrote:
>> >> > Olof Johansson wrote at Wednesday, December 28, 2011 12:33 AM:
>> >> >> On Tue, Dec 27, 2011 at 10:50 PM, Dmitry Torokhov
>> >> >> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> >> > On Tue, Dec 27, 2011 at 10:19:30PM -0800, Olof Johansson wro=
te:
>> >> >> >> This adds a simple way to specify the ChromeOS-specific key=
board map
>> >> >> >> instead of the "standard" map that is used on other Tegra d=
evices such
>> >> >> >> as Harmony-with-keyboard and Seaboard.
>> >> >> >>
>> >> >> >> I expect the number of different keyboard layouts to be qui=
te limited,
>> >> >> >> and not many should be added over time. So instead of encod=
ing the layout
>> >> >> >> in the device tree, with all the can of worms that entails =
w.r.t. agreeing
>> >> >> >> on a suitable binding, just add a property to specify that =
this is the
>> >> >> >> map to be used, and include it in the driver.
>> >> >> >>
>> >> >> >> If, over time, the number of mappings increase, the binding=
 can be
>> >> >> >> updated to include a custom map as a new property, without =
having to
>> >> >> >> worry about backwards compatibility on existing devices.
>> >> >> >>
>> >> >> >
>> >> >> > I'd rather we did not make shortcuts and did the proper DT b=
inding.
>> >> >> > Samsung folks want the similar thing so making a generic DT =
keymap
>> >> >> > parser and using it in the driver would be the best way.
>> >> >>
>> >> >> Ok, fair point. I found the last posted version of the samsung=
 driver
>> >> >> in my archives so I'll continue the discussion there (see sepa=
rate
>> >> >> followup there).
>> >> >
>> >> > I agree here. Simon Glass has posted some patches to U-Boot to =
add the
>> >> > Tegra KBC driver including DT bindings. Can you please co-ordin=
ate with
>> >> > him to ensure the bindings you're proposing for the kernel matc=
h those
>> >> > he's proposing for U-Boot; from memory, I don't think they are =
so far.
>> >> > Also, we need to work out the issue of the kernel needing just =
the base
>> >> > and function-modified keymap, but U-Boot needing a shift- and c=
trl-
>> >> > modified keymap since there's no input layer handling shift/ctr=
l in
>> >> > U-Boot.
>> >>
>> >> I answered this in the other email; since the modifier keymaps do=
n't
>> >> actually describe hardware functionality but instead software
>> >> remappings, it should be done in u-boot, and the device tree bind=
ing
>> >> should be focused on describing the hardware.
>> >
>> > For function/Fn, I think representing that in DT makes sense; ther=
e's
>> > no simple/standard mapping that any driver could implement to tran=
slate
>> > a raw keypress to an fn-keypress; the labeling is completely board=
-
>> > specific, and the Fn key is really multi-plexing two completely di=
fferent
>> > keys onto a single physical key (on my x86 laptop, I have a single=
 key
>> > for both Insert and Delete, differentiating by using the Fn key).
>>
>> I'm torn. The analogy here is more about localized keyboards than
>> anything else, and the solution there is to handle it in higher laye=
rs
>> of the input stack.
>>
>> I could be OK with _one_ additional optional keymap for the fn
>> modifier, but I think it's a slippery slope. I know Rakesh got
>> pushback when he originally tried to present the hardware that way i=
n
>> the =A0platform data, so I guess we might get pushback there now as
>> well. Dmitry?
>
> I think having separate Fn map is OK since, as Stephen correctly
> mentioned, it usually emulates as Fn works in AT keyboards, i.e.
> completely hidden by the firmware. Also the set of keys produced by F=
n
> is usually "control"-like and requiring keymaps would stop clients
> listening on /dev/input/eventX from recognizing them.

Alright, I'll revise the bindings (and make room for an optional
linux,fn-keymap property) tomorrow morning.

[...]

> The Shift, Ctrl and other modifiers, on the other hand, should be don=
e
> in userspace so that standard locale-specific keymap could be loaded =
and
> used.

Alright. Now we just have to rope in Simon into agreement as well and
we'll be all set. He's back from his vacation next week.


-Olof
