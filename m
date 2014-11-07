From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: kernel: Copy register_persistent_clock() to arm64
 source subtree
Date: Thu, 06 Nov 2014 21:16:03 -0700
Message-ID: <545C4783.8070506@nvidia.com>
References: <1415319665-21701-1-git-send-email-anatol.pomozov@gmail.com> <CAOMFOmXDqhwCk1pRf_9yGycboMqt-ZE33y=kZrhbqXOjVcrxYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMFOmXDqhwCk1pRf_9yGycboMqt-ZE33y=kZrhbqXOjVcrxYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/06/2014 05:25 PM, Anatol Pomozov wrote:
> +Stephen
> 
> This patch is for tegra20_timer that uses register_persistent_clock().
> I did not find any way to share the same arch code for arm/arm64.
> 
> Actually this register_persistent_clock() does not look arm specific
> at all. Would it be better to move it somewhere outside of arch/?

No CC to linux-tegra@ or the other Tegra maintainers?

Yes, I think it'd be best not to have arch-specific APIs, or cut/paste
the same code into multiple places.
