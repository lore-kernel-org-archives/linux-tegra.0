From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Fri, 22 May 2020 17:35:56 +0200
Message-ID: <513f25c0-7125-c564-0090-052d626fe508@collabora.com>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <20200517225510.GA205823@koala> <20200518024034.GL89269@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200518024034.GL89269@dtor-ws>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Hutterer <peter.hutterer-Pf4JEFdB4epeoWH0uzbU5w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio
List-Id: linux-tegra@vger.kernel.org

Hi Hans, hi Dmitry,

W dniu 18.05.2020 o 04:40, Dmitry Torokhov pisze:
> Hi Hans, Peter,
> 
> On Mon, May 18, 2020 at 08:55:10AM +1000, Peter Hutterer wrote:
>> On Fri, May 15, 2020 at 08:19:10PM +0200, Hans de Goede wrote:
>>> Hi Andrezj,
>>>

<snip>

>>
>>> I also noticed that you keep the device open (do not call the
>>> input_device's close callback) when inhibited and just throw away
>>> any events generated. This seems inefficient and may lead to
>>> the internal state getting out of sync. What if a key is pressed
>>> while inhibited and then the device is uninhibited while the key
>>> is still pressed?  Now the press event is lost and userspace
>>> querying the current state will see the pressed key as being
>>> released.
> 
> This is a good point. We should look into signalling that some events
> have been dropped (via EV_SYN/SYN_DROPPED) so that clients are aware of
> it.
> 

It seems to me that the situation Hans envisions is not possible,
or will not be possible with a simple change. Let me explain.

For a start, let's recall that the input core prevents consecutive
events of the same kind (type _and_ code _and_ value) from being
delivered to handlers. The decision is made in input_get_disposition().
For EV_KEY it is:

		if (is_event_supported(code, dev->keybit, KEY_MAX)) {

			/* auto-repeat bypasses state updates */
			if (value == 2) {
				disposition = INPUT_PASS_TO_HANDLERS;
				break;
			}

			if (!!test_bit(code, dev->key) != !!value) {

				__change_bit(code, dev->key);
				disposition = INPUT_PASS_TO_HANDLERS;
			}
		}

Let's now focus on value != 2 (events other than auto-repeat).
The disposition changes from the default INPUT_IGNORE_EVENT to
INPUT_PASS_TO_HANDLERS only when the event in question changes
the current state: either by releasing a pressed key, or by
pressing a released key. Subsequent releases of a released key
or subsequent presses of a pressed key will be ignored.

What Hans points out is the possibility of uninhibiting a device
while its key is pressed and then releasing the key. First of all,
during inhibiting input_dev_release_keys() is called, so input_dev's
internal state will be cleared of all pressed keys. Then the device
- after being uninhibited - all of a sudden produces a key release
event. It will be ignored as per the "subsequent releases of a
released key" case, so the handlers will not be passed an unmatched
key release event. Assuming that passing an unmatched key release
event was Hans's concern, in this case it seems impossible.

Now, the value of 2 (auto-repeat) needs some attention. There are two
cases to consider: the device uses input core's software repeat or it
uses its own (hardware) repeat.

Let's consider the first case. The timer which generates auto-repeat
is only started on a key press event and only stopped on a key release
event. As such, if any auto-repeat was in progress when inhibiting
happened, it must have been stopped as per input_dev_release_keys().
Then the key is pressed and held after the device has been inhibited,
and the device is being uninhibited. Since it uses software auto-repeat,
no events will be reported by the device until the key is released,
and, as explained above, the release event will be ignored.

Let's consider the second case. The key is pressed and held after the
device has been inhibited and the device is being uninhibited. The worst
thing that can happen is unmatched key repeat events will start coming
from the device. We must prevent them from reaching the handlers and
ignore them instead. So I suggest something on the lines of:

if (is_event_supported(code, dev->keybit, KEY_MAX)) {

			/* auto-repeat bypasses state updates */
-			if (value == 2) {
+			if (value == 2 && test_bit(code, dev->key)) {
				disposition = INPUT_PASS_TO_HANDLERS;
				break;
			}

The intended meaning is "ignore key repeat events if the key is not
pressed".

With this small change I believe it is not possible to have neither
unmatched release nor unmatched repeat being delivered to handlers.

Regards,

Andrzej
