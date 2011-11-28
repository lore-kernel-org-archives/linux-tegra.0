From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: GPIO/IRQ expander cannot map interrupt
Date: Mon, 28 Nov 2011 12:01:11 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAF8B7@HQMAIL01.nvidia.com>
References: <20111125104511.GA16748@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111125104511.GA16748-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Friday, November 25, 2011 3:45 AM:
> The following is an extract from a device tree of a Tegra2-based board I'm
> working on:
> 
[swarren: Abbreviated the DT during quoting]
> 	i2c@7000c000 {
> 		keypad1: sx8634@2b {
> 			interrupt-parent = <&gpioext>;
> 			interrupts = <2>;
> 		gpioext: gpio-ad8p@41 {
> 			gpio-controller;
> 			#gpio-cells = <2>;
> 			interrupt-controller;
> 			#interrupt-cells = <1>;
> 	i2c@7000c400 {
> 		keypad2: sx8634@2b {
> 			interrupt-parent = <&gpioext>;
> 			interrupts = <3>;
> 
> So basically I have a GPIO/IRQ expander on the first I2C bus (gpioext) to
> which the two keypad (sx8634) chips are connected. They use GPIOs 2 and 3 of
> the expander as interrupts.
> 
> This all seems to work partially: the gpioext is properly detected as parent
> for both keypad controllers during I2C device registration. Within the
> gpio-ad8p driver I register an IRQ domain (using irq_domain_add_simple()) in
> order to allow the OF code to properly map the IRQs for the controller's
> children.
> 
> The problem, however, is that the keypad I2C devices are registered before the
> gpioext device is probed, which results in a situation where the IRQs cannot
> be mapped because the gpioext device hasn't had a chance to register the IRQ
> domain yet.

I believe this is something that the forthcoming "deferred probing"
mechanism will solve. This isn't in place yet. I /think/ it's one of the
things that Grant Likely is working on getting going during his sabattical,
so hopefully there will be some patches you can try out soon.

-- 
nvpublic
