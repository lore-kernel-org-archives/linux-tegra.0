From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/4] pinctrl: Add NVIDIA Tegra XUSB pad controller
 support
Date: Wed, 11 Jun 2014 15:06:37 -0600
Message-ID: <5398C4DD.6020509@wwwdotorg.org>
References: <1402398708-10722-1-git-send-email-thierry.reding@gmail.com>	<1402398708-10722-2-git-send-email-thierry.reding@gmail.com> <CAL1qeaGKUGjSzriDGptR+h23+bS3ZWuStz6koPURCstkFbEjNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaGKUGjSzriDGptR+h23+bS3ZWuStz6koPURCstkFbEjNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/11/2014 02:23 PM, Andrew Bresticker wrote:
> On Tue, Jun 10, 2014 at 4:11 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The XUSB pad controller found on NVIDIA Tegra SoCs provides several pads
>> that lanes can be assigned to in order to support a variety of interface
>> options: USB 2.0, USB 3.0, PCIe and SATA.
>>
>> In addition to the pin controller used to assign lanes to pads two PHYs
>> are exposed to allow the bricks for PCIe and SATA to be powered up and
>> down by PCIe and SATA drivers.

>> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c

>> +static int tegra_xusb_padctl_pinconf_group_set(struct pinctrl_dev *pinctrl,
>> +                                              unsigned int group,
>> +                                              unsigned long *configs,
>> +                                              unsigned int num_configs)

>> +       for (i = 0; i < num_configs; i++) {
>> +               param = TEGRA_XUSB_PADCTL_UNPACK_PARAM(configs[i]);
>> +               value = TEGRA_XUSB_PADCTL_UNPACK_VALUE(configs[i]);
>> +
>> +               switch (param) {
>> +               case TEGRA_XUSB_PADCTL_IDDQ:
>> +                       value = padctl_readl(padctl, lane->offset);
> 
> This overwrites the configuration value - probably want to use a
> separate variable for the register value.

It'd be nice to trim what you quote so that people don't have to wade
through hundreds of lines of code to find a 2-line comment. It's easily
missed.
