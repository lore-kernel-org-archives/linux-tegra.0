From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Mon, 6 Nov 2017 14:22:22 +0100
Message-ID: <CACRpkda888GdPdH_qkeyA64hukyqxryc1uvHWEab92PR32Xt_g@mail.gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <CACRpkdZaLtpEfx6C5cqHFMk11TXnHxp-sZ+T38PCf+Jh1B2BjQ@mail.gmail.com> <0e96761d-a110-ff25-fa2e-319bedf3d8ac@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <0e96761d-a110-ff25-fa2e-319bedf3d8ac@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 4, 2017 at 12:50 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 11/03/2017 05:50 PM, Linus Walleij wrote:

>> I guess I will consider queueing them already for v4.15 if
>> Torvalds churns out another -rc on sunday, I do not
>> doubt that you will finish it as we have discussed with banks and
>> all. If v4.14 is released on sunday let's queue this early for v4.16.
>
> Can you see my reply?
> https://lkml.org/lkml/2017/11/3/820

Yes so I was considering queueing patches 1-9 with your ACK so
Thierry can get his patch stack down and focus on the add-on
stuff at the end of the series.

Thierry, does it sound reasonable?

Linus Walleij
