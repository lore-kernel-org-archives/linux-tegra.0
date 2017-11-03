From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Fri, 3 Nov 2017 18:50:28 -0500
Message-ID: <0e96761d-a110-ff25-fa2e-319bedf3d8ac@ti.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <CACRpkdZaLtpEfx6C5cqHFMk11TXnHxp-sZ+T38PCf+Jh1B2BjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZaLtpEfx6C5cqHFMk11TXnHxp-sZ+T38PCf+Jh1B2BjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

hi Linus,

On 11/03/2017 05:50 PM, Linus Walleij wrote:
> On Thu, Nov 2, 2017 at 6:49 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> here's the latest series of patches that implement the tighter IRQ chip
>> integration. I've dropped the banked infrastructure for now as per the
>> discussion with Grygorii.
> 
> And I really liked that part.
> 
>> The first couple of patches are mostly preparatory work in order to
>> consolidate all IRQ chip related fields in a new structure and create
>> the base functionality for adding IRQ chips.
>>
>> After that, I've added the Tegra186 GPIO support patch that makes use of
>> the new tight integration.
>>
>> Changes in v6:
>> - rebased on latest linux-gpio devel branch
>> - one patch dropped due to rebase
> 
> I guess I will consider queueing them already for v4.15 if
> Torvalds churns out another -rc on sunday, I do not
> doubt that you will finish it as we have discussed with banks and
> all. If v4.14 is released on sunday let's queue this early for v4.16.

Can you see my reply?
https://lkml.org/lkml/2017/11/3/820

-- 
regards,
-grygorii
