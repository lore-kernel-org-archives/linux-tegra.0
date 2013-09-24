From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/9] irqdomain: Introduce __irq_create_mapping()
Date: Tue, 24 Sep 2013 14:20:44 +0200
Message-ID: <CACRpkdZMM9RUkRCWG0mYbF9PL-fOdDncpY05xG3F5BF55hn5ug@mail.gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
	<1379320326-13241-3-git-send-email-treding@nvidia.com>
	<CACRpkdYo8knzZ+Z-tc7fyEGwX5bt4RvMU3TR3k3UrOj0KRJocw@mail.gmail.com>
	<20130923202935.GA5216@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20130923202935.GA5216@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 23, 2013 at 10:29 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Sep 23, 2013 at 09:14:30PM +0200, Linus Walleij wrote:

>> I think it is better to first go over the call sites and make them
>> all handle negative return numbers rather than pushing the
>> obscure __interface.
(...)
>
> Well, the problem is that the current patch changes the signature of the
> function as well, therefore the call sites will have to be updated all
> at once in a single patch to avoid build breakage.

Hm yeah OK I see the problem, but can we atleast avoid the
__thing? Like calling the new function irq_create_mapping_strict()
or whatever.

> Another alternative could be to change the signature in a way that does
> not break compatibility. For instance I think it could work out if we
> change this function to return int instead of unsigned int but keep the
> same semantics to begin with (return 0 on failure). Then update all call
> sites to handle potential negative errors and after that return negative
> error codes.

Hm that sounds like an attractive solution to me actually.

> That still wouldn't catch any callers introduced between
> the patch creation and application.

Such things happen all the time, just have to be attentive in
what goes into linux-next...

Another minor thing:

+static int __irq_create_mapping(struct irq_domain *domain,
+                               irq_hw_number_t hwirq, unsigned int *virqp)

Unless you can make a very good case for why there should
be a "v" in the beginning of virqp, then remove it and call it
"irqp" simply.

All Linux IRQs are virtual and we're already clearly separating
out those that are not by calling them "hwirq".

Yours,
Linus Walleij
