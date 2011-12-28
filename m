From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Input: tegra-kbc - add default chromeos map
Date: Tue, 27 Dec 2011 23:33:13 -0800
Message-ID: <CAOesGMheQqYjpDRaf6TTce2YEcD4hkTzS2JTdoCe3ue6+dBhDQ@mail.gmail.com>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
	<1325053170-6984-3-git-send-email-olof@lixom.net>
	<20111228065013.GB29273@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111228065013.GB29273-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Dec 27, 2011 at 10:50 PM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Dec 27, 2011 at 10:19:30PM -0800, Olof Johansson wrote:
>> This adds a simple way to specify the ChromeOS-specific keyboard map
>> instead of the "standard" map that is used on other Tegra devices such
>> as Harmony-with-keyboard and Seaboard.
>>
>> I expect the number of different keyboard layouts to be quite limited,
>> and not many should be added over time. So instead of encoding the layout
>> in the device tree, with all the can of worms that entails w.r.t. agreeing
>> on a suitable binding, just add a property to specify that this is the
>> map to be used, and include it in the driver.
>>
>> If, over time, the number of mappings increase, the binding can be
>> updated to include a custom map as a new property, without having to
>> worry about backwards compatibility on existing devices.
>>
>
> I'd rather we did not make shortcuts and did the proper DT binding.
> Samsung folks want the similar thing so making a generic DT keymap
> parser and using it in the driver would be the best way.

Ok, fair point. I found the last posted version of the samsung driver
in my archives so I'll continue the discussion there (see separate
followup there).

> Another option is to simply loading proper keymap by the early
> userspace.

I would prefer to do it in hardware, mostly because I don't want to
have to add the keymaps to all possible distros I'd be interested in
running on this hardware. :)


-Olof
