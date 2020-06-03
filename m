From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Wed, 3 Jun 2020 19:38:02 +0200
Message-ID: <681abc14-ef0f-ff15-68ed-944b2f96bdaf@redhat.com>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
 <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
 <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
 <f674ba4f-bd83-0877-c730-5dc6ea09ae4b@redhat.com>
 <2d224833-3a7e-bc7c-af15-1f803f466697@collabora.com>
 <aa2ce2ab-e5bc-9cb4-8b53-c1ef9348b646@redhat.com>
 <20200527063430.GJ89269@dtor-ws>
 <88f939cd-1518-d516-59f2-8f627a6a70d2@collabora.com>
 <20200602175241.GO89269@dtor-ws>
 <82e9f2ab-a16e-51ee-1413-bedf0122026a@collabora.com>
 <8f97d2e1-497a-495d-bc82-f46dbeba440c@redhat.com>
 <fb5bee72-6a75-88aa-8157-75f07c491eeb@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <fb5bee72-6a75-88aa-8157-75f07c491eeb@collabora.com>
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-acpi@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP
List-Id: linux-tegra@vger.kernel.org

Hi,

On 6/3/20 3:07 PM, Andrzej Pietrasiewicz wrote:
> Hi Hans, hi Dmitry,

<snip>

> I'm taking one step back and looking at the ->open() and ->close()
> driver callbacks. They are called from input_open_device() and
> input_close_device(), respectively:
> 
> input_open_device():
> "This function should be called by input handlers when they
> want to start receive events from given input device."
> 
> ->open() callback:
> "this method is called when the very first user calls
> input_open_device(). The driver must prepare the device to start
> generating events (start polling thread, request an IRQ, submit
> URB, etc.)"
> 
> input_close_device():
> "This function should be called by input handlers when they
> want to stop receive events from given input device."
> 
> ->close() callback:
> "this method is called when the very last user calls
> input_close_device()"
> 
> It seems to me that the callback names do not reflect their
> purpose: their meaning is not to "open" or to "close" but to
> give drivers a chance to control when they start or stop
> providing events to the input core.
> 
> What would you say about changing the callbacks' names?
> I'd envsion: ->provide_events() instead of ->open() and
> ->stop_events() instead of ->close(). Of course drivers can
> exploit the fact of knowing that nobody wants any events
> from them and do whatever they consider appropriate, for
> example go into a low power mode - but the latter is beyond
> the scope of the input subsystem and is driver-specific.

I don't have much of an opinion on changing the names,
to me open/close have always means start/stop receiving
events. This follows the everything is a file philosophy,
e.g. you can also not really "open" a serial port,
yet opening /dev/ttyS0 will activate the receive IRQ
of the UART, etc. So maybe we just need to make the
docs clearer rather then do the rename?  Doing the
rename is certainly going to cause a lot of churn.

Anyways as said, I don't have much of an opinion,
so I'll leave commenting (more) on this to Dmitry.

> With such a naming change in mind let's consider inhibiting.
> We want to be able to control when to disregard events from
> a given device. It makes sense to do it at device level, otherwise
> such an operation would have to be invoked in all associated
> handlers (those that have an open handle associating them with
> the device in question). But of course we can do better than
> merely ignoring the events received: we can tell the drivers
> that we don't want any events from them, and later, at uninhibit
> time, tell them to start providing the events again. Conceptually,
> the two operations (provide or don't provide envents) are exactly
> the same thing we want to be happening at input_open_device() and
> input_close_device() time. To me, changing the names of
> ->open() and ->close() exposes this fact very well.
> 
> Consequently, ->inhibit() and ->uninhibit() won't be needed,
> and drivers which already implement ->provide_events() (formerly
> ->open()) and ->stop_events() (formerly ->close()) will receive
> full inhibit/uninhibit support for free (subject to how well they
> implement ->provide_events()/->stop_events()). Unless we can come
> up with what the drivers might be doing on top of ->stop_events()
> and ->provide_events() when inhibiting/uninhibiting, but it seems
> to me we can't. Can we?

Right. I'm happy that you've come to see that both on open/close
and on inhibit/uninhibit we want to "start receiving events" and
"stop receiving events", so that we only need one set of callbacks.

> Optionally ->close() (only the callback, not input_close_device())
> can be made return a value, just as Hans suggests. The value
> can be ignored in input_close_device() but used in input_inhibit().
> No strong opinion here, though. (btw it seems to me that
> input_inhibit() should be renamed to input_inhibit_device()).

Ack.

Regards,

Hans
