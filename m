From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Input: document inhibiting
Date: Wed, 17 Jun 2020 09:52:30 -0700
Message-ID: <8ebf502e-855d-6a6b-9c7b-d96d5e519d82@infradead.org>
References: <f9007f37-c526-5fa4-3188-a554d2434177@redhat.com>
 <20200617101822.8558-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200617101822.8558-1-andrzej.p@collabora.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel@collabora.com, Nick Dyer <nick@shmanahar.org>, Laxman Dewangan <ldewangan@nvidia.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Hutterer <peter.hutterer@redhat.com>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Len Brown <lenb@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Barry Song <baohua@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Thierry
List-Id: linux-tegra@vger.kernel.org

On 6/17/20 3:18 AM, Andrzej Pietrasiewicz wrote:
> Document inhibiting input devices and its relation to being
> a wakeup source.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> v1..v2:
> 
> - Addressed editorial comments from Randy
> - Added a paragraph by Hans
> 
>  Documentation/input/input-programming.rst | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/input/input-programming.rst b/Documentation/input/input-programming.rst
> index 45a4c6e05e39..7432315cc829 100644
> --- a/Documentation/input/input-programming.rst
> +++ b/Documentation/input/input-programming.rst
> @@ -164,6 +164,46 @@ disconnects. Calls to both callbacks are serialized.
>  The open() callback should return a 0 in case of success or any nonzero value
>  in case of failure. The close() callback (which is void) must always succeed.
>  
> +Inhibiting input devices
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Inhibiting a device means ignoring input events from it. As such it is about maintaining
> +relationships with input handlers - either already existing relationships, or relationships
> +to be established while the device is in inhibited state.
> +
> +If a device is inhibited, no input handler will receive events from it.
> +
> +The fact that nobody wants events from the device is exploited further, by calling device's
> +close() (if there are users) and open() (if there are users) on inhibit and uninhibit
> +operations, respectively. Indeed, the meaning of close() is to stop providing events
> +to the input core and that of open() is to start providing events to the input core.
> +
> +Calling the device's close() method on inhibit (if there are users) allows the driver
> +to save power. Either by directly powering down the device or by releasing the
> +runtime-pm reference it got in open() when the driver is using runtime-pm.
> +
> +Inhibiting and uninhibiting are orthogonal to opening and closing the device by input
> +handlers. Userspace might want to inhibit a device in anticipation before any handler is
> +positively matched against it.
> +
> +Inhibiting and uninhibiting are orthogonal to device's being a wakeup source, too. Being a
> +wakeup source plays a role when the system is sleeping, not when the system is operating.
> +How drivers should program their interaction between inhibiting, sleeping and being a wakeup
> +source is driver-specific.
> +
> +Taking the analogy with the network devices - bringing a network interface down doesn't mean
> +that it should be impossible be wake the system up on LAN through this interface. So, there
> +may be input drivers which should be considered wakeup sources even when inhibited. Actually,
> +in many I2C input devices their interrupt is declared a wakeup interrupt and its handling
> +happens in driver's core, which is not aware of input-specific inhibit (nor should it be).
> +Composite devices containing several interfaces can be inhibited on a per-interface basis and
> +e.g. inhibiting one interface shouldn't affect the device's capability of being a wakeup source.
> +
> +If a device is to be considered a wakeup source while inhibited, special care must be taken when
> +programming its suspend(), as it might need to call device's open(). Depending on what close()
> +means for the device in question, not opening() it before going to sleep might make it
> +impossible to provide any wakeup events. The device is going to sleep anyway.
> +
>  Basic event types
>  ~~~~~~~~~~~~~~~~~
>  
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
