From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] Add support for Nyan-big
Date: Thu, 8 Jan 2015 14:33:18 -0800
Message-ID: <CAEUnVG5pAWuOK5Sq4MQ3Xg-K14nQV-NKNSq2xkAQFkmiDFmjNg@mail.gmail.com>
References: <1417699911-17901-1-git-send-email-sjg@chromium.org>
 <CAAObsKAE6GKWNqp_3g0f=pc-b6WzBcAzDhD=TtfrtgwQfHVAQA@mail.gmail.com>
 <CAPnjgZ2MSt6JJNf_8PDG-NtXhmg3reiUqQaBUMLNfR4Hbc37yA@mail.gmail.com> <CAAObsKCBKT0_K+FWrfDBJPfVuJecjo9_arJx8Xok3ictKcv9=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKCBKT0_K+FWrfDBJPfVuJecjo9_arJx8Xok3ictKcv9=w@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 7, 2015 at 11:54 PM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
> On 7 January 2015 at 17:27, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Hi Tomeu,
>>
>> On 7 January 2015 at 06:02, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>>>
>>> On 4 December 2014 at 14:31, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> > Add support for Tegra124 Nyan-big. Pinmux is based on norrin with a single
>>> > change for the reset GPIO.
>>>
>>> Hi Simon,
>>>
>>> do you have a similar patch for the blaze?
>>>
>>> Thanks,
>>>
>>> Tomeu
>>
>> No I don't sorry. I suppose it is similar but I'm not sure who did the
>> pinmux for it.
>
> I have found some non-trivial differences when comparing the pinmux
> programming for the two boards in the chromeos kernel, that's why I
> would prefer if we had the complete data in tegra-pinmux-scripts.

The differences between Big and Blaze are small.  Four pins I think.
What differences were you seeing?

>
> Dylan, Rhyland, git-blame points to both of you, do you have the
> spreadsheet for the blaze or know who could have it?

We didn't derive the pinmux from a spreadsheet for Big or Blaze.  Big
was so similar to Norrin that the few changes were made manually.

Thanks for looking at this!

Dylan

>
> Thanks,
>
> Tomeu
