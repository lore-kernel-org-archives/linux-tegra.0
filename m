From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Mon, 18 May 2020 12:48:11 +0200
Message-ID: <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <842b95bb-8391-5806-fe65-be64b02de122-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Barry
List-Id: linux-tegra@vger.kernel.org

Hi Hans,

W dniu 15.05.2020 o 20:19, Hans de Goede pisze:
> Hi Andrezj,
> 
> On 5/15/20 6:49 PM, Andrzej Pietrasiewicz wrote:
>> Userspace might want to implement a policy to temporarily disregard input
>> from certain devices, including not treating them as wakeup sources.
>>
>> An example use case is a laptop, whose keyboard can be folded under the
>> screen to create tablet-like experience. The user then must hold the laptop
>> in such a way that it is difficult to avoid pressing the keyboard keys. It
>> is therefore desirable to temporarily disregard input from the keyboard,
>> until it is folded back. This obviously is a policy which should be kept
>> out of the kernel, but the kernel must provide suitable means to implement
>> such a policy.
> 
> Actually libinput already binds together (inside libinput) SW_TABLET_MODE
> generating evdev nodes and e.g. internal keyboards on devices with 360°
> hinges for this reason. libinput simply closes the /dev/input/event#
> node when folded and re-opens it when the keyboard should become active
> again. Thus not only suppresses events but allows e.g. touchpads to
> enter runtime suspend mode which saves power. Typically closing the
> /dev/input/event# node will also disable the device as wakeup source.
> 
> So I wonder what this series actually adds for functionality for
> userspace which can not already be achieved this way?
> 
> I also noticed that you keep the device open (do not call the
> input_device's close callback) when inhibited and just throw away

I'm not sure if I understand you correctly, it is called:

+static inline void input_stop(struct input_dev *dev)
+{
+	if (dev->poller)
+		input_dev_poller_stop(dev->poller);
+	if (dev->close)
+		dev->close(dev);
                 ^^^^^^^^^^^^^^^^
+static int input_inhibit(struct input_dev *dev)
+{
+	int ret = 0;
+
+	mutex_lock(&dev->mutex);
+
+	if (dev->inhibited)
+		goto out;
+
+	if (dev->users) {
+		if (dev->inhibit) {
+			ret = dev->inhibit(dev);
+			if (ret)
+				goto out;
+		}
+		input_stop(dev);
                 ^^^^^^^^^^^^^^^^

It will not be called when dev->users is zero, but if it is zero,
then nobody has opened the device yet so there is nothing to close.

Andrzej
