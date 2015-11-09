From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/8] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Mon, 9 Nov 2015 09:29:58 +0530
Message-ID: <CABb+yY0TcdUOHXBAzg4HMAEdi6Hmusi_s9+C6qcriR1odA7hGg@mail.gmail.com>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
	<1446465323-9493-3-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446465323-9493-3-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 2, 2015 at 5:25 PM, Martyn Welch
<martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> The Tegra xHCI controller's firmware communicates requests to the host
> processor through a mailbox interface.  While there is only a single
> physical channel, messages sent by the controller can be divided
> into two groups: those intended for the PHY driver and those intended
> for the host-controller driver.  The requesting driver is assigned
> one of two virtual channels when the single physical channel is
> requested.  All incoming messages are sent to both virtual channels.
>
IIRC Andrew wanted to redo the driver and in fact asked me to not pick it.
