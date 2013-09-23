From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/9] of/irq: Introduce __of_irq_to_resource()
Date: Mon, 23 Sep 2013 21:20:37 +0200
Message-ID: <CACRpkdadFct8iXSaRRQ3a2YQryfMjJwVaq+8wgWXS1Ymj3M_WA@mail.gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
	<1379320326-13241-6-git-send-email-treding@nvidia.com>
	<5237782B.3030804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5237782B.3030804@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 16, 2013 at 11:29 PM, Rob Herring <robherring2@gmail.com> wrote:
> On 09/16/2013 03:32 AM, Thierry Reding wrote:
>> This is a version of of_irq_to_resource() that propagates the precise
>> error code instead of returning 0 for all errors. It will be used in
>> subsequent patches to allow further propagation of error codes.
>>
>> To avoid code duplication, implement of_irq_to_resource() as a wrapper
>> around the new __of_irq_to_resource().
>
> I think the callers in this case are manageable to update as well.
> Several cases could simply use irq_of_parse_and_map instead as they just
> pass in a NULL resource.

I second this comment.

Yours,
Linus Walleij
