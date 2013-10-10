From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/5] ARM: add basic support for Trusted Foundations
Date: Thu, 10 Oct 2013 15:28:43 -0700
Message-ID: <CAAVeFuKAm75TX6mz5n9Pu83+LCP74jPYD43UcA1eCh2SEwaChQ@mail.gmail.com>
References: <1380904635-18113-1-git-send-email-acourbot@nvidia.com>
 <1380904635-18113-2-git-send-email-acourbot@nvidia.com> <CAOesGMj74Pui1V5O7zxEipM5Hg6nboVTUCFuMY0c0aUh=wuu3Q@mail.gmail.com>
 <CAAVeFuLvHdUuDurqA_=tvxJonNP+RekotM_MuysQrJD0PUgcSQ@mail.gmail.com> <5257288E.6000704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5257288E.6000704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 10, 2013 at 3:22 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 10/10/2013 02:58 PM, Alexandre Courbot wrote:
>> On Wed, Oct 9, 2013 at 4:47 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>> On Fri, Oct 4, 2013 at 9:37 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> ...
>>> But do we really need to panic here? It's a PITA to debug since it'll
>>> be a very early panic. I'd rather have the system log errors in dmesg
>>> but continue booting with one cpu.
>>
>> Actually the first version of this series continued on one CPU if TF
>> support was missing (as secondary CPUs would simply fail to boot), but
>> IIRC Stephen advocated for the current behavior (panic) instead. I
>> agree such an early panic is hard to debug, especially considering
>> that most devices using TF (Tegra retail devices) do not even feature
>> a serial port.
>>
>> On the other hand, if we continue booting in these conditions the
>> system freezes as soon as cpuidle kicks in, so we won't be going very
>> far anyway. However the console is up when it happens.
>>
>> Maybe if there is a way to disable the kernel features TF is supposed
>> to manage (SMP & cpuidle at the moment) when registration fails, the
>> system could continue more gracefully (even if on one leg) and warn
>> the user about this condition. Stephen, can I have your thoughts on
>> this?
>
> If we can disable the features that rely on TF/secure-mode when support
> is missing, then doing that rather than panic is fine. We do something
> similar for PCIe on Tegra20, where LP2 cpuidle state must be disabled or
> PCIe interrupts won't work.
>
> I would be inclined to merge the patch as-is right now, since it's only
> enabling a new feature that won't see any regressions due to this panic,
> and then add the disable-other-features with a separate patch/series
> later. Does that seem reasonable?

According to Olof we should also be moving the DT node under
/firmware, so I guess another revision is in order to at least get
this part right.

3.12 also added a powered-down cpuidle state for Tegra which freezes
the system if TF is enabled as the firmware driver does not support
idle yet, but this can be fixed later.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
