From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: cpu clock change latency
Date: Tue, 27 Sep 2011 16:30:22 +0100
Message-ID: <20110927153021.GA16150@sirena.org.uk>
References: <201109231639.33651.marvin24@gmx.de>
 <CAMbhsRTiqLZ2bSefh-DnmDY0RB4JGkSmumh8Tt_7217BsHsa7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRTiqLZ2bSefh-DnmDY0RB4JGkSmumh8Tt_7217BsHsa7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 23, 2011 at 09:49:53AM -0700, Colin Cross wrote:

> cpu-tegra.c says latency is 300 uS because relocking the CPU pll has a
> udelay(300).  400 nS would just make the ondemand governor sample more
> often than it means to.  I doubt changing it to 400 uS makes any
> difference.

The interactive effect of a higher transition latency with ondemand can
be rather visible.

It's probably also worth mentioning that if there's regulators used for
voltage scaling the system really ought to be including latency for them
in the estimate, for voltage increases the regulator needs to be updated
prior to the SoC side starting off.
