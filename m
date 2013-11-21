From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 0/7] ARM: support for Trusted Foundations secure monitor
Date: Thu, 21 Nov 2013 11:48:54 -0700
Message-ID: <528E5596.7090606@wwwdotorg.org>
References: <1383819106-1400-1-git-send-email-acourbot@nvidia.com>	<52828EF5.6090909@wwwdotorg.org>	<CAOesGMhatp9ZQr=eTCtQ_9a_E9LXKdTCzJd+P7Sy9Ut9wtvnsA@mail.gmail.com>	<5282E068.1070608@nvidia.com> <CAOesGMgcvTFD4u9b7T5HNhuJe_PQyV25Ei++v8hG8AsY_rOdyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgcvTFD4u9b7T5HNhuJe_PQyV25Ei++v8hG8AsY_rOdyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

(Russell, a question for you at the bottom)

On 11/13/2013 10:57 AM, Olof Johansson wrote:
> On Tue, Nov 12, 2013 at 6:14 PM, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 11/13/2013 05:38 AM, Olof Johansson wrote:
...
>>> I pinged Russell, and he brought up the fact that there were earlier
>>> requests to move it to drivers/firmware. It would make sense to try to
>>> get that done before merging, especially if you anticipate someone
>>> using TF on 64-bit platforms.
>>
>> IIRC when we discussed this point your last comment was as follows:
> 
> Touche. :) Thanks for the reminder.
> 
>> On Tue, Oct 29, 2013 at 6:55 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>> I think we can probably merge this under arch/arm now, and when we
>>> figure out what needs to be common with ARM64 we can move it out to a
>>> good location. It might be that mostly just a header file with ABI
>>> conventions needs to be shared, not actual implementation, for
>>> example.
>>
>> So I thought we agreed on that. If in the end we prefer to move the ARM
>> firmware interface into drivers/firmware, I'm fine with that too (Tomasz
>> also confirmed he would be ok with it) but I wonder if that would not be
>> somehow premature.
...
> Well, as I already said I'm ok with things going into arch/arm to
> start with, as long as Russell is.
...

Russell, the patch Alex sent to move firmware_ops into drivers/firmware
was rejected, so I don't think we can update this series to move the
code there instead.

So, are you OK with merging this series as-is, in arch/arm/firmware? If
you could ack the patch/series to indicate that, it would be awesome.
Thanks.
