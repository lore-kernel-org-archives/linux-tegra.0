From: Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Wed, 27 May 2020 16:13:26 +1000
Message-ID: <20200527061326.GA531660@koala>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <20200517225510.GA205823@koala>
 <20200518024034.GL89269@dtor-ws>
 <513f25c0-7125-c564-0090-052d626fe508@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <513f25c0-7125-c564-0090-052d626fe508@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, linux-acpi@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
List-Id: linux-tegra@vger.kernel.org

Hi Andrzej,

On Fri, May 22, 2020 at 05:35:56PM +0200, Andrzej Pietrasiewicz wrote:
> Hi Hans, hi Dmitry,
> 
> W dniu 18.05.2020 o 04:40, Dmitry Torokhov pisze:
> > Hi Hans, Peter,
> > 
> > On Mon, May 18, 2020 at 08:55:10AM +1000, Peter Hutterer wrote:
> > > On Fri, May 15, 2020 at 08:19:10PM +0200, Hans de Goede wrote:
> > > > Hi Andrezj,
> > > > 
> 
> <snip>
> 
> > > 
> > > > I also noticed that you keep the device open (do not call the
> > > > input_device's close callback) when inhibited and just throw away
> > > > any events generated. This seems inefficient and may lead to
> > > > the internal state getting out of sync. What if a key is pressed
> > > > while inhibited and then the device is uninhibited while the key
> > > > is still pressed?  Now the press event is lost and userspace
> > > > querying the current state will see the pressed key as being
> > > > released.
> > 
> > This is a good point. We should look into signalling that some events
> > have been dropped (via EV_SYN/SYN_DROPPED) so that clients are aware of
> > it.
> > 
> 
> It seems to me that the situation Hans envisions is not possible,
> or will not be possible with a simple change. Let me explain.
> 
> For a start, let's recall that the input core prevents consecutive
> events of the same kind (type _and_ code _and_ value) from being
> delivered to handlers. The decision is made in input_get_disposition().
> For EV_KEY it is:
> 
> 		if (is_event_supported(code, dev->keybit, KEY_MAX)) {
> 
> 			/* auto-repeat bypasses state updates */
> 			if (value == 2) {
> 				disposition = INPUT_PASS_TO_HANDLERS;
> 				break;
> 			}
> 
> 			if (!!test_bit(code, dev->key) != !!value) {
> 
> 				__change_bit(code, dev->key);
> 				disposition = INPUT_PASS_TO_HANDLERS;
> 			}
> 		}

note that this isn't per-process state, userspace can get release events
after open() for keys it never got the press event for. Simple test:
type evtest<enter> and KEY_ENTER up is the first event you'll get.

But otherwise I agree with you that press/release should always be balanced
if input_dev_release_keys() is called on inhibit and with that autorepeat
snippet below. At least I couldn't come up with any combination of multiple
clients opening/closing/inhibiting that resulted in an unwanted release
event after uninhibit.

Cheers,
   Peter

> Let's now focus on value != 2 (events other than auto-repeat).
> The disposition changes from the default INPUT_IGNORE_EVENT to
> INPUT_PASS_TO_HANDLERS only when the event in question changes
> the current state: either by releasing a pressed key, or by
> pressing a released key. Subsequent releases of a released key
> or subsequent presses of a pressed key will be ignored.
>
> What Hans points out is the possibility of uninhibiting a device
> while its key is pressed and then releasing the key. First of all,
> during inhibiting input_dev_release_keys() is called, so input_dev's
> internal state will be cleared of all pressed keys. Then the device
> - after being uninhibited - all of a sudden produces a key release
> event. It will be ignored as per the "subsequent releases of a
> released key" case, so the handlers will not be passed an unmatched
> key release event. Assuming that passing an unmatched key release
> event was Hans's concern, in this case it seems impossible.
> 
> Now, the value of 2 (auto-repeat) needs some attention. There are two
> cases to consider: the device uses input core's software repeat or it
> uses its own (hardware) repeat.
> 
> Let's consider the first case. The timer which generates auto-repeat
> is only started on a key press event and only stopped on a key release
> event. As such, if any auto-repeat was in progress when inhibiting
> happened, it must have been stopped as per input_dev_release_keys().
> Then the key is pressed and held after the device has been inhibited,
> and the device is being uninhibited. Since it uses software auto-repeat,
> no events will be reported by the device until the key is released,
> and, as explained above, the release event will be ignored.
> 
> Let's consider the second case. The key is pressed and held after the
> device has been inhibited and the device is being uninhibited. The worst
> thing that can happen is unmatched key repeat events will start coming
> from the device. We must prevent them from reaching the handlers and
> ignore them instead. So I suggest something on the lines of:
> 
> if (is_event_supported(code, dev->keybit, KEY_MAX)) {
> 
> 			/* auto-repeat bypasses state updates */
> -			if (value == 2) {
> +			if (value == 2 && test_bit(code, dev->key)) {
> 				disposition = INPUT_PASS_TO_HANDLERS;
> 				break;
> 			}
> 
> The intended meaning is "ignore key repeat events if the key is not
> pressed".
> 
> With this small change I believe it is not possible to have neither
> unmatched release nor unmatched repeat being delivered to handlers.
> 
> Regards,
> 
> Andrzej
