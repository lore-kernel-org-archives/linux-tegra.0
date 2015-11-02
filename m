From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC 0/8] Add support for NVIDIA Tegra XUSB
Date: Mon, 2 Nov 2015 09:27:33 -0800
Message-ID: <CAL1qeaGMXBiYU+EwBp9kRWKVSdtF5A5xaG1c-5fj+DmFSu1c5g@mail.gmail.com>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Martyn,

On Mon, Nov 2, 2015 at 3:55 AM, Martyn Welch
<martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> This series is based on commits that can be found in the git tree here:
>
> https://github.com/thierryreding/linux/commits/staging/xhci
>
> I have included the patches I've used from that tree as patches 1-5.
>
> The above patches were submitted for review back in May:
>
> https://lkml.org/lkml/2015/5/4/574
>
> The approach taken in these patches was deemed not appropriate (treating
> the XUSB as a MFD).
>
> In patch 6 I add the bindings based in those submitted for review here
> (with a few modifications currently required by the driver):
>
> https://www.spinics.net/lists/linux-usb/msg130940.html
>
> I have included my changes to the original patch series in patch 7. With
> these modifications the patch series builds and works, but is rather hacky.
> Devices for the mailbox driver and xHCI driver are now created in the xusb
> driver (still under the mfd directory for now - it will be moved before
> this series is submitted properly). As the child devices use
> infrastructure which expects the device to be associated with a of_node,
> it has been necessary to point the child device at the parents of_node
> where this is needed. This approach did not seem viable for the mailbox
> API, so to get that working the child device node was pointed to the
> parents of_node (in tegra_xusb_add_device). The unfortunate side effect of
> this is that upon device creation the parents probe routine gets called...
>
> Not good.
>
> Patch 8 attempts to resolve this. When passing the parents device node to
> the mailbox API, the mailbox's receive callback was raising errors as
> that function is looking for the drvdata stored in the child's device node,
> but getting the parents. This patch jumps though a few hoops to get to the
> child's device node.

After my last submission, we had a discussion about the mailbox and
decided not to use the mailbox framework and instead use a private API
between the xHCI driver and the XUSB_PADCTL driver.

> Unfortunately, whilst the receive callback seems to be getting the right
> drvdata, USB3 devices are being enumerated as USB2 devices rather than
> USB3 devices, so something is clearly not right.

Tegra124?  Tegra210?  Which board?

Thanks,
Andrew
