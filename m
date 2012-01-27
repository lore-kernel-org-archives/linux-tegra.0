From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM: tegra: cpuidle driver for tegra
Date: Thu, 26 Jan 2012 23:10:58 -0800
Message-ID: <CAMbhsRQ00Cm-wo9hL9jRfpUfATPZc+znNJu-EagK6qV0qRs4SA@mail.gmail.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
	<1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
	<B5906170F1614E41A8A28DE3B8D1214331791EA6@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B5906170F1614E41A8A28DE3B8D1214331791EA6-Er742YJ7I/eIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Bedia, Vaibhav" <vaibhav.bedia-l0cyMroinI0@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 10:59 PM, Bedia, Vaibhav <vaibhav.bedia-l0cyMroinI0@public.gmane.org>=
 wrote:
> On Thu, Jan 26, 2012 at 21:52:03, Peter De Schrijver wrote:
> [...]
>> +static int tegra_idle_enter_lp3(struct cpuidle_device *dev,
>> + =A0 =A0 struct cpuidle_driver *drv, int index)
>> +{
>> + =A0 =A0 ktime_t enter, exit;
>> + =A0 =A0 s64 us;
>> +
>> + =A0 =A0 local_irq_disable();
>> + =A0 =A0 local_fiq_disable();
>> +
>> + =A0 =A0 enter =3D ktime_get();
>> +
>> + =A0 =A0 tegra_cpu_wfi();
>> +
>> + =A0 =A0 exit =3D ktime_sub(ktime_get(), enter);
>> + =A0 =A0 us =3D ktime_to_us(exit);
>> +
>> + =A0 =A0 local_fiq_enable();
>> + =A0 =A0 local_irq_enable();
>> +
>> + =A0 =A0 dev->last_residency =3D us;
>> +
>> + =A0 =A0 return index;
>> +}
>
> You can probably drop local_irq_disable() and local_irq_enable().

local_irq_enable() is required by the cpuidle call semantics.  See
arch/arm/process.c, it has a 				WARN_ON(irqs_disabled()) after the
idle function call.  The local_irq_disable() can and probably should
be dropped, although a comment that the function is called with
interrupts off and is expected to return with interrupts on would be
helpful.
