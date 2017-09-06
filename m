From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 3/8] usb: chipidea: Add support for Tegra20/30/114/124
Date: Wed, 6 Sep 2017 14:21:59 +0100
Message-ID: <d62d98ec-ef73-7bb2-720f-82155871613a@nvidia.com>
References: <cover.1502879077.git.digetx@gmail.com>
 <2b091105e45234dca93051862e76e711acf482cc.1502879078.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2b091105e45234dca93051862e76e711acf482cc.1502879078.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/08/17 11:32, Dmitry Osipenko wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> All of these Tegra SoC generations have a ChipIdea UDC IP block that can
> be used for device mode communication with a host. Implement rudimentary
> support that doesn't allow switching between host and device modes.
> 
> Tested-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: rebased patches and added DMA alignment quirk for Tegra20]
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>

Currently, I am seeing that system suspend on Tegra30/114/124 is broken
on -next (looks like it broke starting with next-20170823). Bisect shows
that is broke with this series and reverting this patch of top of tree
does workaround the problem.

Looking a bit deeper, it appears that the boards are hanging when the
set_phcd() function is called in the tegra phy driver to disable the phy
clock. This function is called by usb_phy_set_suspend() in the chipidea
driver.

Thierry, any thoughts?

Cheers
Jon

-- 
nvpublic
