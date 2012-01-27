From: "Bedia, Vaibhav" <vaibhav.bedia-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v1 3/3] ARM: tegra: cpuidle driver for tegra
Date: Fri, 27 Jan 2012 08:39:28 +0000
Message-ID: <B5906170F1614E41A8A28DE3B8D1214331791FA2@DBDE01.ent.ti.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
	<1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
	<B5906170F1614E41A8A28DE3B8D1214331791EA6@DBDE01.ent.ti.com>
 <CAMbhsRQ00Cm-wo9hL9jRfpUfATPZc+znNJu-EagK6qV0qRs4SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRQ00Cm-wo9hL9jRfpUfATPZc+znNJu-EagK6qV0qRs4SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2012 at 12:40:58, Colin Cross wrote:
> local_irq_enable() is required by the cpuidle call semantics.  See
> arch/arm/process.c, it has a 				WARN_ON(irqs_disabled()) after the
> idle function call.  The local_irq_disable() can and probably should
> be dropped, although a comment that the function is called with
> interrupts off and is expected to return with interrupts on would be
> helpful.
> 

Ah... I was too fixated on local_irq_disable() and local_irq_enable() in cpu_idle().
Thanks for clarifying.
