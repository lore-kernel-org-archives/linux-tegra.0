From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: remove copy-and-pasted usb platform data
 from boards
Date: Fri, 15 Jul 2011 11:30:18 -0700
Message-ID: <20110715183018.GA3083@quad.lixom.net>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
 <1310336374-31727-2-git-send-email-ccross@android.com>
 <20110715111348.3ed0522a@ac100.localdomain>
 <201107151155.56495.heiko@sntech.de>
 <CAMbhsRTxAwKJ7qiK=_BAMc3Y1x_WHF7WHrm_54o-sYLBb1zzng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRTxAwKJ7qiK=_BAMc3Y1x_WHF7WHrm_54o-sYLBb1zzng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 15, 2011 at 09:45:53AM -0700, Colin Cross wrote:
> Can you or someone else test if power_down_on_bus_suspend is causing a
> problem?  If it is, I'll change the default in devices.c to
> power_down_on_bus_suspend=0, and devices that want
> power_down_on_bus_suspend=1 will have to set it.

Seaboard and derivatives have power_down_on_bus_suspend set, and does OK with
that. I suggest that paz00 overrides the value before device registration if
it has to. If the number of boards down the road that need it off exceeds
number of boards that need it on, it can always be flipped. This should come
from the device tree later anyway.

(Note: I'll post a patch in a bit that keeps the IP clocked even if phy is
powered down on bus suspend, since otherwise we don't get hotplug events for
hub-less systems).


-Olof
