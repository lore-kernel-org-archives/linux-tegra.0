From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v1 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Wed, 25 Jun 2014 16:07:53 -0700
Message-ID: <CAL1qeaH+pfyJKQyS3=7M7C6QGFkm3r5ssDohur7KUwk2EXG2tA@mail.gmail.com>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>
	<1403072180-4944-3-git-send-email-abrestic@chromium.org>
	<53AB46E0.5010908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53AB46E0.5010908@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 25, 2014 at 3:02 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
>> The Tegra XHCI controller communicates requests to the host through
>> a mailbox interface.  Host drivers which can handle these requests,
>> such as the Tegra XUSB pad controller driver and upcoming Tegra XHCI
>> host controller driver, can send messages and register to be notified
>> of incoming messages.
>
>> diff --git a/include/linux/tegra-xusb-mbox.h b/include/linux/tegra-xusb-mbox.h
>
>> +extern int tegra_xusb_mbox_register_notifier(struct tegra_xusb_mbox *mbox,
>> +                                          struct notifier_block *nb);
>> +extern void tegra_xusb_mbox_unregister_notifier(struct tegra_xusb_mbox *mbox,
>> +                                             struct notifier_block *nb);
>> +extern int tegra_xusb_mbox_send(struct tegra_xusb_mbox *mbox,
>> +                             enum tegra_xusb_mbox_cmd cmd, u32 data);
>> +extern struct tegra_xusb_mbox *
>> +tegra_xusb_mbox_lookup_by_phandle(struct device_node *np, const char *prop);
>
> This seems to use a custom API. I've seen mention of a mailbox
> subsystem, and I assume that has a standardized API. Should this driver
> implement that instead?

All the mailbox drivers currently use a custom API, but there is
indeed a patch series floating around to create a generic mailbox
framework, though it hasn't landed in -next yet.  I can take a look at
how this driver would fit into that framework.
